/*
 * Copyright (c) 2007 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/* webserver.c: An example Webserver application using the RAW API 
 *	This program serves web pages resident on Xilinx Memory File
 * System (MFS) using lwIP's RAW API. Use of RAW API implies that the
 * webserver is blazingly fast, but the design is not obvious since a
 * lot of the work happens in asynchronous callback functions.
 *
 * The webserver works as follows:
 *	- on every accepted connection, only 1 read is performed to
 * identify the file requested. Further reads are avoided by sending 
 * a "Connection: close" in the HTTP response header, as well as setting 
 * the callback function to NULL on that pcb
 *	- the read determines what file needs to be set (by parsing 
 * "GET / HTTP/1.1" request
 *	- once the file to be sent is determined, tcp_write is called
 * in chunks of size tcp_sndbuf() until the whole file is sent
 *
 */

#include <stdio.h>
#include <string.h>

#include <lwip/err.h>
#include <lwip/tcp.h>

#include "webserver.h"


char *html_header = "HTTP/1.1 200 OK\r\nContent-type: text/html\r\nContent-length: %d\r\nConnection: Close\r\n\r\n%s";
char *html_page = "<html>Hello World!</html>";
char html_buf[1500];

/* static variables controlling debug printf's in this file */
static int g_webserver_debug = 0;

int transfer_data() {
	return 0;
}

err_t sent_callback(void *arg, struct tcp_pcb *tpcb, u16_t len)
{
	int BUFSIZE = 1024, sndbuf, n;
	char buf[BUFSIZE];
	http_arg *a = (http_arg*)arg;

	if (g_webserver_debug)
		xil_printf("%d (%d): S%d..\n\r", a?a->count:0, tpcb->state, len);

	if (tpcb->state > ESTABLISHED) {
		if (a) {
			pfree_arg(a);
			a = NULL;
		}
		tcp_close(tpcb);
	}

	if (a->fd == -1 || a->fsize <= 0) /* no more data to be sent */
		return ERR_OK;

	/* read more data out of the file and send it */
	sndbuf = tcp_sndbuf(tpcb);
	if (sndbuf < BUFSIZE)
		return ERR_OK;

	n = mfs_file_read(a->fd, buf, BUFSIZE);
	tcp_write(tpcb, buf, n, 1);
	a->fsize -= n;

	if (a->fsize == 0) {
		mfs_file_close(a->fd);
		a->fd = 0;
	}

	return ERR_OK;
}

err_t recv_callback(void *arg, struct tcp_pcb *tpcb,
                               struct pbuf *p, err_t err)
{
	http_arg *a = (http_arg*)arg;

	if (g_webserver_debug)
		xil_printf("%d (%d): R%d %d..\n\r", a?a->count:0, tpcb->state, p->len, p->tot_len);

	/* do not read the packet if we are not in ESTABLISHED state */
	if (tpcb->state >= 5 && tpcb->state <= 8) {
		if (a) {
			pfree_arg(a);
			a = NULL;
		}
		tcp_close(tpcb);
		return;
	} else if (tpcb->state > 8) {
		return;
	}

	/* acknowledge that we've read the payload */
	tcp_recved(tpcb, p->len);

	/* read and decipher the request */
	/* this function takes care of generating a request, sending it, 
	 *	and closing the connection if all data can been sent. If 
	 *	not, then it sets up the appropriate arguments to the sent
	 *	callback handler.
	 */
	generate_response(tpcb, p->payload, p->len);

	/* free received packet */
	pbuf_free(p);

	return ERR_OK;
}

err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	/* keep a count of connection # */
	tcp_arg(newpcb, (void*)palloc_arg());

	tcp_recv(newpcb, recv_callback);
	tcp_sent(newpcb, sent_callback);

	return ERR_OK;
}

int start_application()
{
	struct tcp_pcb *pcb;
	err_t err;

	/* initialize file system layer */
	platform_init_fs();

	/* initialize devices */
	platform_init_gpios();

	/* create new TCP PCB structure */
	pcb = tcp_new();
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}
	
	/* bind to http port 80 */
	err = tcp_bind(pcb, IP_ADDR_ANY, 80);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port 80: err = %d\n\r", err);
		return -2;
	}

	/* we do not need any arguments to the first callback */
	tcp_arg(pcb, NULL);

	/* listen for connections */
	pcb = tcp_listen(pcb);
	if (!pcb) {
		xil_printf("Out of memory while tcp_listen\n\r");
		return -3;
	}

	/* specify callback to use for incoming connections */
	tcp_accept(pcb, accept_callback);

	/* create the html buffer that will be sent */
	sprintf(html_buf, html_header, strlen(html_page), html_page);

	xil_printf("web server started\n\r");

	return 0;
}

void print_app_header()
{
	xil_printf("\n\r\n\r-----lwIP test WebServer ------\n\r");
	xil_printf("Open up your favorite browser and type: \n\r");
	xil_printf("http://192.168.1.10\n\r");
}
