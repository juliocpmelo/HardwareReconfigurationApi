*******************************************************************************
** Copyright © 2008, Xilinx, Inc. 
** This design is confidential and proprietary of Xilinx, Inc.
** All Rights Reserved.
*******************************************************************************
**   ____  ____ 
**  /   /\/   / 
** /___/  \  /   Vendor: Xilinx 
** \   \   \/    Version: 1.0
**  \   \        Filename: lwipdemo_readme.txt 
**  /   /         
** /___/   /\     
** \   \  /  \ 
**  \___\/\___\ 
** 
**Device: 
**Purpose:
**Reference: 
**   
*******************************************************************************
**
**  Disclaimer: LIMITED WARRANTY AND DISCLAIMER. These designs are
**              provided to you "as is." Xilinx and its licensors make and you
**              receive no warranties or conditions, express, implied,
**              statutory or otherwise, and Xilinx specifically disclaims any
**              implied warranties of merchantability, noninfringement, or

**              fitness for a particular purpose. Xilinx does not warrant that
**              the functions contained in these designs will meet your
**              requirements, or that the operation of these designs will be
**              uninterrupted or error free, or that defects in the Designs
**              will be corrected. Furthermore, Xilinx does not warrant or
**              make any representations regarding use or the results of the
**              use of the designs in terms of correctness, accuracy,
**              reliability, or otherwise.
**
**              LIMITATION OF LIABILITY. In no event will Xilinx or its
**              licensors be liable for any loss of data, lost profits, cost
**              or procurement of substitute goods or services, or for any
**              special, incidental, consequential, or indirect damages
**              arising from the use or operation of the designs or
**              accompanying documentation, however caused and on any theory
**              of liability. This limitation will apply even if Xilinx
**              has been advised of the possibility of such damage. This
**              limitation shall apply notwithstanding the failure of the
**              essential purpose of any limited remedies herein.
**
*******************************************************************************

Application: lwipdemo 
---------------------
The LwIP demonstration is based on the Embedded Development Kit (EDK) port of 
the open source lightweight IP (lwIP) TCP/IP stack.  LwIP provides an easy way
to add TCP/IP-based networking to an embedded system using either a raw API
for performance or a sockets style API for ease of use.

The lwip_v3_00_a library in EDK is based on the open source lwIP 1.2.0 stack and
provides adapters for the xps_ethernetlite and xps_ll_temac Xilinx Ethernet MAC
cores.  The EDK OS and Libraries Document Collection (oslib_rm.pdf) provides
more details on using the lwIP networking library. 

Networking functionality using lwIP can be demonstrated using the provided
reference designs derived from a Base System Builder (BSB) generated design.

ml505_std_ip_pcores.zip               # Sockets and Raw mode lwIP - GMII PHY interface
ml505_std_ip_pcores_sgmii.zip         # Sockets and Raw mode lwIP - SGMII PHY interface

1. Connect the Host PC to the ML505 (J1 header) using a PC-IV or
   Platform USB JTAG cable

2. Connect the Host PC serial port to the ML505 serial port using a null
   modem cable and launch a terminal program on the Host (e.g. TeraTerm)
   with the settings: 9600 baud, 8-N-1, No flow control

3. Note your existing Host PC network settings

4. Set Host PC address to 192.168.1.1 with subnet mask 255.255.255.0 
   Note: Ensure the PC is set for 10 Mbps, 100 Mbps, or 1000 Mbps

5. Connect Ethernet cable (straight or crossover) from Host to ML505
   Note: The ML505 Ethernet PHY chip has an auto-crossover feature
         The lwIP application code sets the ML505 IP address to 192.168.1.10

6. Power-up the board 

7. Unzip one of the lwIP designs (ml505_std_ip_pcores.zip used here)
   Note: The software application used with the sockets designs is named
         lwipdemo.elf, whereas the software application used with the
         raw designs is webserver.elf

8. Launch XPS and open the ML505 EDK project (ml505_bsb_system.xmp)

9. Launch a Shell window using XPS menu selection: Project > Launch EDK Shell

10. Download bitstream in shell window by typing: impact -batch etc/download.cmd

11. XPS menu selection: Debug > Launch XMD

12. At XMD% prompt type: rst

13. At XMD% prompt type: dow -data sw/standalone/lwipdemo/image.mfs 0x8a400000
    Note: This downloads a pre-built memory file system into the ZBT SRAM

14. At XMD% prompt type: cd microblaze_0/code

15. At XMD% prompt type: dow lwipdemo.elf
    Note: For a raw mode project use webserver.elf 

16. At XMD% prompt type: con

17. Launch a web browser on the host and open URL http://192.168.1.10
    Note: You may need to turn off your browser's proxy and specify a
          direct connection to the Internet in your browser options

18. On the Xilinx Web Server Demo page that now appears in the web browser,
    Press the "Toggle LEDs" button to turn on/off the GPIO LEDs 1 through 8 

19. Change the GPIO DIP switch (SW8) settings on the ML505 and observe that the
    DIP switch state shown on the web page changes by pressing the
    "Update Status" button

20. Click on the link in the Documentation section to find out more about the
    EDK lwIP library

21. Verify ping responses by opening a DOS Command Shell on the PC Host and
    typing: ping 192.168.1.10

22. Exit from XMD, close the EDK shell, and exit from EDK

23. Restore your previous browser and network settings


Serial Port Output: (For Sockets mode project's lwipdemo.elf)
-------------------------------------------------------------
Board IP: 192.168.1.10
Netmask : 255.255.255.0
Gateway : 192.168.1.1



-----lwIP test WebServer ------
Open up your favorite browser and type:
http://192.168.1.10

-----lwIP echo server ------
You can connect to the echo server @ port 7


-----lwIP TFTP Server ------
Upload or download files from the Memory File System to your localhost
e.g.: upload from WinXP host to the board:
           tftp -i 192.168.1.10 PUT source [destination]


auto-negotiated link speed: 1000
Memory File System  System initialized



Serial Port Output: (For Raw mode project's webserver.elf)
----------------------------------------------------------
platform_setup_interrupts


-----lwIP test WebServer ------
Open up your favorite browser and type:
http://192.168.1.10
Board IP: 192.168.1.10
Netmask : 255.255.255.0
Gateway : 192.168.1.1
auto-negotiated link speed: 1000
Memory File System initialized
web server started

