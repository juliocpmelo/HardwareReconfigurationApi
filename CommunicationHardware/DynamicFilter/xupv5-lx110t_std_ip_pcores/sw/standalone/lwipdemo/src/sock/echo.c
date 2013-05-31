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

#include "lwip/inet.h"
#include "lwip/sockets.h"
#include "lwipopts.h"

u16_t ECHO_PORT = 7;

void print_echo_app_header()
{
	xil_printf("\n\r-----lwIP echo server ------\n\r");
	xil_printf("You can connect to the echo server @ port %d\n\r", ECHO_PORT);
}

/* thread spawned for each connection */
void process_echo_request(int sd)
{
	int RECV_BUF_SIZE = 2048;
	unsigned char recv_buf[RECV_BUF_SIZE];
	int n, nwrote;

	xil_printf("echo server processing requests for sd: %d\n\r", sd);

	while (1) {
		/* read a max of RECV_BUF_SIZE bytes from socket */
		if ((n = read(sd, recv_buf, RECV_BUF_SIZE)) < 0) {
			xil_printf("%s: error reading from socket %d, closing socket\n\r", __FUNCTION__, sd);
			close(sd);
			return;
		}

		/* break if the recved message = "quit" */
		if (!strncmp(recv_buf, "quit", 4))
			break;

		/* handle request */
		if ((nwrote = write(sd, recv_buf, n)) < 0) {
			xil_printf("%s: ERROR responding to client echo request. recvlen = %d, respondlen = %d.\n\r", 
					__FUNCTION__, n, nwrote);
			xil_printf("Closing socket %d\n\r", sd);
			close(sd);
			return;
		}
	}
	
	/* close connection */
	close(sd);
}

void echo_application_thread()
{
	int sock, new_sd;
	struct sockaddr_in address, remote;
	int size;

	if ((sock = lwip_socket(AF_INET, SOCK_STREAM, 0)) < 0)
		return;

	address.sin_family = AF_INET;
	address.sin_port = htons(ECHO_PORT);
	address.sin_addr.s_addr = INADDR_ANY;

	if (lwip_bind(sock, (struct sockaddr *)&address, sizeof (address)) < 0)
		return;

	lwip_listen(sock, 5);

	size = sizeof(remote);

	while (1) {
		new_sd = lwip_accept(sock, (struct sockaddr *)&remote, (socklen_t *)&size);
		
		sys_thread_new("echo_server", process_echo_request, (void*)new_sd, 4096,DEFAULT_THREAD_PRIO);
	}
}
