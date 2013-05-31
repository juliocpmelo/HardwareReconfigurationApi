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

#include "xenv_standalone.h"
#include "xparameters.h"

#include "netif/xadapter.h"
#include "xuartns550_l.h"
#include "memory_map.h"


/************************** Constant Definitions *****************************/

#define ESCAPE          0x1b

static void echo(void)
{
  int c;
  do {
    c = getchar();
    if ((char) c == '\r')
      putchar((int) '\n');
    putchar(c);
  } while (c != ESCAPE);
}

/* specify the base address of the MAC we are using */
#ifdef XPAR_ETHERNET_MAC_BASEADDR
#define EMAC_BASEADDR  XPAR_ETHERNET_MAC_BASEADDR
#elif XPAR_LLTEMAC_0_BASEADDR 
#define EMAC_BASEADDR  XPAR_LLTEMAC_0_BASEADDR 
#else
#error "Design needs to have at least one MAC"
#endif

/* list of applications to be included */
#define APP_WEBSERVER
#define APP_ECHOSERVER
#define APP_TFTPSERVER

void
print_ip(char *msg, struct ip_addr *ip) 
{
	print(msg);
	xil_printf("%d.%d.%d.%d\n\r", ip4_addr1(ip), ip4_addr2(ip), 
			ip4_addr3(ip), ip4_addr4(ip));
}

void
print_ip_settings(struct ip_addr *ip, struct ip_addr *mask, struct ip_addr *gw)
{

	print_ip("Board IP: ", ip);
	print_ip("Netmask : ", mask);
	print_ip("Gateway : ", gw);
}

int main()
{
#ifdef __MICROBLAZE__
	microblaze_init_icache_range(0, XPAR_MICROBLAZE_0_CACHE_BYTE_SIZE);
	microblaze_init_dcache_range(0, XPAR_MICROBLAZE_0_DCACHE_BYTE_SIZE);

	microblaze_enable_exceptions();
#endif

	/* enable caches */
	XCACHE_ENABLE_ICACHE();
	XCACHE_ENABLE_DCACHE();


    XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
    XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);

	xilkernel_main();
}

//void xemacif_input_thread();
void web_application_thread();
void echo_application_thread();
void tftpserver_application_thread();
//void network_thread();

struct netif server_netif;

int network_thread()
{
	struct netif *netif;
	struct ip_addr ipaddr, netmask, gw;

	/* the mac address of the board. this should be unique per board */
	unsigned char mac_ethernet_address[] = { 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };

	netif = &server_netif;

	/* initliaze IP addresses to be used */
	IP4_ADDR(&ipaddr,  192, 168,   1, 10);
	IP4_ADDR(&netmask, 255, 255, 255,  0);
	IP4_ADDR(&gw,      192, 168,   1,  1);

	/* print out IP settings of the board */
	print_ip_settings(&ipaddr, &netmask, &gw);
	print("\n\r");

	/* print all application headers */
#ifdef APP_WEBSERVER
	print_web_app_header();
#endif
#ifdef APP_ECHOSERVER
	print_echo_app_header();
#endif
#ifdef APP_TFTPSERVER
	print_tftpserver_app_header();
#endif

	print("\n\r\n\r");

  	/* Add network interface to the netif_list, and set it as default */
	if (!xemac_add(netif, &ipaddr, &netmask, &gw, mac_ethernet_address, EMAC_BASEADDR)) {
		xil_printf("Error adding N/W interface\n\r");
		return -1;
	}
	netif_set_default(netif);

	/* specify that the network if is up */
	netif_set_up(netif);

	/* start packet receive thread - required for lwIP operation */
	//32768 is the value of PTHREAD_STACK_SIZE in Xilkernel. please refer to Answer #31838 on xilinx website. By Walkie
  	sys_thread_new("xemacif_input_thread",(void(*)(void*))xemacif_input_thread, netif,4096, DEFAULT_THREAD_PRIO);
	//sys_thread_new("NT",xemacif_input_thread, netif,32768, DEFAULT_THREAD_PRIO);

#if defined(APP_WEBSERVER) || defined(APP_TFTPSERVER)
	/* initialize file system layer (MFS) 
	 * this is used only by the web & TFTP servers 
	 */
	platform_init_fs();
#endif

	/* now we can start application threads */

#ifdef APP_WEBSERVER
	/* start webserver thread */
  	sys_thread_new("web",web_application_thread, 0, 4096, DEFAULT_THREAD_PRIO);
#endif

#ifdef APP_ECHOSERVER
	/* start echo server thread */
  	sys_thread_new("echo",echo_application_thread, 0, 4096, DEFAULT_THREAD_PRIO);
#endif

#ifdef APP_TFTPSERVER
	/* start tftp server thread */
  	sys_thread_new("tftp",tftpserver_application_thread, 0, 4096, DEFAULT_THREAD_PRIO);
#endif

	return 0;
}

int main_thread()
{
	/* initialize lwIP before calling sys_thread_new */
	lwip_init();

	/* any thread using lwIP should be created using sys_thread_new */
  	sys_thread_new("network", network_thread, NULL, 4096, DEFAULT_THREAD_PRIO);
}
