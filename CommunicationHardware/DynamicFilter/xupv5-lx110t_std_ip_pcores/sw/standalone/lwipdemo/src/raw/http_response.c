#include <string.h>

#include "mfs_config.h"
#include "lwip/inet.h"

#include "webserver.h"

char *notfound_header = 
	"<html> \
	<head> \
		<title>404</title> \
  		<style type=\"text/css\"> \
		div#request {background: #eeeeee} \
		</style> \
	</head> \
	<body> \
	<h1>404 Page Not Found</h1> \
	<div id=\"request\">";

char *notfound_footer = 
	"</div> \
	</body> \
	</html>";

/* dynamically generate 404 response:
 *	this inserts the original request string in betwween the notfound_header & footer strings
 */
int do_404(struct tcp_pcb *pcb, char *req, int rlen)
{
	int len, hlen;
	int BUFSIZE = 1024;
	char buf[BUFSIZE];
	err_t err;

	len = strlen(notfound_header) + strlen(notfound_footer) + rlen;

	hlen = generate_http_header(buf, "html", len);

	if (tcp_sndbuf(pcb) < hlen) {
		xil_printf("cannot send 404 message, tcp_sndbuf = %d bytes, message length = %d bytes\n\r",
				tcp_sndbuf(pcb), hlen);
		return -1;
	}
	if ((err = tcp_write(pcb, buf, hlen, 1)) != ERR_OK) {
		xil_printf("%s: error (%d) writing 404 http header\n\r", __FUNCTION__, err);
		return -1;
	}
	tcp_write(pcb, notfound_header, strlen(notfound_header), 1);
	tcp_write(pcb, req, rlen, 1);
	tcp_write(pcb, notfound_footer, strlen(notfound_footer), 1);

	return 0;
}

int do_http_post(struct tcp_pcb *pcb, char *req, int rlen) 
{
	int BUFSIZE = 1024;
	unsigned char buf[BUFSIZE];
	int len, n;
        char *p;

	if (is_cmd_led(req)) {
                n = toggle_leds();
		len = generate_http_header(buf, "js", 1);
                p = buf + len;
                *p++ = n?'1':'0';
                *p = 0;
		len++;
		xil_printf("http POST: ledstatus: %x\n\r", n);
	} else if (is_cmd_switch(req)) {
                unsigned s = get_switch_state();
                int n_switches = 8;
		char *json_response = "{\"status\":\"10101011\"}";

                xil_printf("http POST: switch state: %x\n\r", s);
		len = generate_http_header(buf, "js", n_switches);
		//len = generate_http_header(buf, "js", strlen(json_response));
                p = buf + len;
#if 1
                for (n = 0; n < n_switches; n++, p++) {
                        *p = '0' + (s & 0x1);
                        s >>= 1;
                }
                *p = 0;

                len += n_switches;
#else
		strcpy(p, json_response);
		len += strlen(json_response);
#endif
	}

	if (tcp_write(pcb, buf, len, 1) != ERR_OK) {
		xil_printf("error writing http POST response to socket\n\r");
		xil_printf("http header = %s\n\r", buf);
		return -1;
	}

	return 0;
}

/* respond for a file GET request */
int do_http_get(struct tcp_pcb *pcb, char *req, int rlen)
{
	int BUFSIZE = 1024;
	char filename[MAX_FILENAME];
	unsigned char buf[BUFSIZE];
	int fsize, hlen, n;
	int fd;
	char *fext;
	err_t err;

	/* determine file name */
	extract_file_name(filename, req, rlen, MAX_FILENAME);

	/* respond with 404 if not present */
	if (mfs_exists_file(filename) == 0) {
		xil_printf("requested file %s not found, returning 404\n\r", filename);
		do_404(pcb, req, rlen);
		return -1;
	}

	/* respond with correct file */

	/* debug statement on UART */
        xil_printf("http GET: %s\n\r", filename);

	/* get a pointer to file extension */
	fext = get_file_extension(filename);

	fd = mfs_file_open(filename, MFS_MODE_READ);

	/* obtain file size, 
	 * note that lseek with offset 0, MFS_SEEK_END does not move file pointer */
	fsize = mfs_file_lseek(fd, 0, MFS_SEEK_END);

	/* write the http headers */
	hlen = generate_http_header(buf, fext, fsize);
	if ((err = tcp_write(pcb, buf, hlen, 1)) != ERR_OK) {
		xil_printf("error (%d) writing http header to socket\n\r", err);
		xil_printf("attempted to write #bytes = %d, tcp_sndbuf = %d\n\r", hlen, tcp_sndbuf(pcb));
		xil_printf("http header = %s\n\r", buf);
		return -1;
	}

	/* now write the file */
	while (fsize) {
		int w, sndbuf;
		sndbuf = tcp_sndbuf(pcb);
		
		if (sndbuf < BUFSIZE) {
			/* not enough space in sndbuf, so send remaining bytes when there is space */
			/* this is done by storing the fd in as part of the tcp_arg, so that the sent 
			   callback handler knows to send data */
			http_arg *a = (http_arg *)pcb->callback_arg;
			a->fd = fd;
			a->fsize = fsize;
			return;
		}

		n = mfs_file_read(fd, buf, BUFSIZE);

		if ((err = tcp_write(pcb, buf, n, 1)) != ERR_OK) {
			xil_printf("error writing file (%s) to socket, remaining unwritten bytes = %d\n\r",
					filename, fsize - n);
			xil_printf("attempted to lwip_write %d bytes, tcp write error = %d\n\r", n, err);
			break;
		}

		fsize -= n;
	}

	mfs_file_close(fd);

	return 0;
}

enum http_req_type { HTTP_GET, HTTP_POST, HTTP_UNKNOWN };
enum http_req_type decode_http_request(char *req, int l)
{
	char *get_str = "GET";
	char *post_str = "POST";

	if (!strncmp(req, get_str, strlen(get_str)))
		return HTTP_GET;

	if (!strncmp(req, post_str, strlen(post_str)))
		return HTTP_POST;

	return HTTP_UNKNOWN;
}

/* generate and write out an appropriate response for the http request */
/* 	this assumes that tcp_sndbuf is high enough to send atleast 1 packet */
int generate_response(struct tcp_pcb *pcb, char *http_req, int http_req_len)
{
	enum http_req_type request_type = decode_http_request(http_req, http_req_len);

	switch(request_type) {
	case HTTP_GET:
		return do_http_get(pcb, http_req, http_req_len);
	case HTTP_POST:
		return do_http_post(pcb, http_req, http_req_len);
	default:
		return do_404(pcb, http_req, http_req_len);
	}
}
