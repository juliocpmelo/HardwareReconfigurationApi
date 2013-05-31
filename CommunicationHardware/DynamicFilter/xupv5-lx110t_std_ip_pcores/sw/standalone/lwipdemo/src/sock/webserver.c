/*
 * Copyright (c) 2008 Xilinx, Inc.  All rights reserved.
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

#include <stdio.h>
#include <string.h>

#include "xmk.h"
#include "lwip/inet.h"
#include "lwip/sockets.h"
#include "lwipopts.h"

#include "webserver.h"

/* thread spawned for each connection */
void 
process_http_request(int sd)
{
	int read_len;
	int RECV_BUF_SIZE = 600;                        /* http request size can be a max of RECV_BUF_SIZE */
	unsigned char recv_buf[RECV_BUF_SIZE];		/* since these buffers are allocated on the stack .. */
							/* .. care should be taken to ensure there are no overflows */
	
	/* read in the request */
	if ((read_len = read(sd, recv_buf, RECV_BUF_SIZE)) < 0)
		return;

	/* respond to request */
	generate_response(sd, recv_buf, read_len);

	/* close connection */
	close(sd);
}

/* http server */
int 
web_application_thread()
{
	int sock, new_sd;
	struct sockaddr_in address, remote;
	int size;

	/* initialize devices */
	platform_init_gpios();

	/* create a TCP socket */
	if ((sock = lwip_socket(AF_INET, SOCK_STREAM, 0)) < 0)
		return;

	/* bind to port 80 at any interface */
	address.sin_family = AF_INET;
	address.sin_port = htons(80);
	address.sin_addr.s_addr = INADDR_ANY;
	if (lwip_bind(sock, (struct sockaddr *)&address, sizeof (address)) < 0)
		return;

	/* listen for incoming connections */
	lwip_listen(sock, 5);

	size = sizeof(remote);
	while (1) {
		new_sd = lwip_accept(sock, (struct sockaddr *)&remote, (socklen_t *)&size);

		/* spawn a separate handler for each request */
		//sys_thread_new("httpd", (void(*)(void*))process_http_request
		sys_thread_new("httpd", (void(*)(void*))process_http_request, (void*)new_sd, 4096, DEFAULT_THREAD_PRIO);
	}
}

void 
print_web_app_header()
{
	xil_printf("\n\r\n\r-----lwIP test WebServer ------\n\r");
	xil_printf("Open up your favorite browser and type: \n\r");
	xil_printf("http://192.168.1.10\n\r");
}
