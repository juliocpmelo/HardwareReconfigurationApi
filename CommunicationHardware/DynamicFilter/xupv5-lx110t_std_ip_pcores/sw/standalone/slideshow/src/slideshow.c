/******************************************************************************
*
*       XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
*       AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND
*       SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,
*       OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
*       APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION
*       THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
*       AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
*       FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
*       WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
*       IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
*       REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
*       INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*       FOR A PARTICULAR PURPOSE.
*
*       (c) Copyright 2007 Xilinx Inc.
*       All rights reserved.
*
******************************************************************************/
 
/*
 *  Simple slideshow demo with read/write to Compact Flash
 *
 *    Reads images from: "a:\\image01.bmp", "a:\\image02.bmp", "a:\\image03.bmp", ...
 *    Stores images starting at IMAGE_BASEADDR
 *
*/

/***************************** Include Files *********************************/

#include "xio.h"
#include "sleep.h"
#include <sysace_stdio.h>
#include "xuartns550_l.h"
#include "xparameters.h"
#include "lcd.h"
#include "memory_map.h"

#ifdef PPC440CACHE
#include "xcache_l.h"
#endif

// Demo Parameters
#define IMAGE_BASEADDR  (DDR_BASEADDR + 0x0A000000)
#define IMAGE_MAXADDR   (IMAGE_BASEADDR + 0x02000000)

/* structs for bitmaps */
typedef struct {
   unsigned short int type;                 /* Magic identifier            */
   unsigned int size;                       /* File size in bytes          */
   unsigned short int reserved1, reserved2;
   unsigned int offset;                     /* Offset to image data, bytes */
} HEADER;

typedef struct {
   unsigned int size;               /* Header size in bytes      */
   int width,height;                /* Width and height of image */
   unsigned short int planes;       /* Number of color planes    */
   unsigned short int bits;         /* Bits per pixel            */
   unsigned int compression;        /* Compression type          */
   unsigned int imagesize;          /* Image size in bytes       */
   int xresolution,yresolution;     /* Pixels per meter          */
   unsigned int ncolors;            /* Number of colors          */
   unsigned int importantcolors;    /* Important colors          */
} INFOHEADER;

/* reads two bytes from file */
static unsigned short ReadUShort(SYSACE_FILE *fptr)
{
  unsigned char b0, b1;
  int numread;
  char readBuffer[2];

  numread = sysace_fread(readBuffer, 1, 2, fptr);

  b0 = readBuffer[0];
  b1 = readBuffer[1];

  return ((b1 << 8) | b0);
}

/* reads four bytes from file in little endian order */
static unsigned int ReadUIntLil(SYSACE_FILE *fptr)
{
  unsigned char b0, b1, b2, b3;
  int numread;
  char readBuffer[4];

  numread = sysace_fread(readBuffer, 1, 4, fptr);

  b0 = readBuffer[0];
  b1 = readBuffer[1];
  b2 = readBuffer[2];
  b3 = readBuffer[3];

  return ((((((b3 << 8) | b2) << 8) | b1) << 8) | b0);
}

/* opens and reads from CF a 640x480 bitmap file, placing it in memory at baseaddr in a format for the tft */
int read_image(char FileName[], int baseaddr)
{
  unsigned char readBuffer[1920];
  SYSACE_FILE *infile;
  int i, j, numread, temp, writeaddr;
  HEADER header;
  INFOHEADER infoheader;

  infile = sysace_fopen(FileName, "r");

  if(infile) {
    xil_printf("Reading file : %s\n\r", FileName);
    LCDPrintString ("Loading Slide:  ", &FileName[3]);

    /* Read and check the header */
    header.type = ReadUShort(infile);
    header.size = ReadUIntLil(infile);
    header.reserved1 = ReadUShort(infile);
    header.reserved2 = ReadUShort(infile);
    header.offset = ReadUIntLil(infile);

    infoheader.size = ReadUIntLil(infile);
    infoheader.width = ReadUIntLil(infile);
    infoheader.height = ReadUIntLil(infile);

    infoheader.planes = ReadUShort(infile);
    infoheader.bits = ReadUShort(infile);

    infoheader.compression = ReadUIntLil(infile);
    infoheader.imagesize = ReadUIntLil(infile);
    infoheader.xresolution = ReadUIntLil(infile);
    infoheader.yresolution = ReadUIntLil(infile);
    infoheader.ncolors = ReadUIntLil(infile);
    infoheader.importantcolors = ReadUIntLil(infile);

    /*
    xil_printf("ID is: %d, should be %d\n\r",header.type,'M'*256+'B');
    xil_printf("File size is %d bytes\n\r",header.size);
    xil_printf("Offset to image data is %d bytes\n\r",header.offset);

    xil_printf("Image size = %d x %d\n\r",infoheader.width,infoheader.height);
    xil_printf("Number of color planes is %d\n\r",infoheader.planes);
    xil_printf("Bits per pixel is %d\n\r",infoheader.bits);
    xil_printf("Compression type is %d\n\r",infoheader.compression);
    xil_printf("Number of colors is %d\n\r",infoheader.ncolors);
    xil_printf("Number of required colors is %d\n\r",infoheader.importantcolors);
    */

    /* Process the data */
    for (j=infoheader.height-1;j>=0;j--) {
      numread = sysace_fread(readBuffer, 1, 1920, infile);
      for (i=0;i<infoheader.width;i++) {
        temp = ((((readBuffer[i*3+2] << 8) | readBuffer[(i*3)+1]) << 8) | readBuffer[(i*3)]);
        writeaddr = baseaddr+(j*1024+i)*4;
        XIo_Out32(writeaddr, temp);
      }
    }
    sysace_fclose(infile);
    return 1;
  } else {
    return 0;
  }
}

/* reads a series of images from CF: "image01.bmp", "image02.bmp", "image03.bmp", ... */
/* stores each in memory on consecutive 2MB boundaries starting at IMAGE_BASEADDR up to IMAGE_MAXADDR */
int get_images()
{
  char file[] = "a:\\image01.bmp";
  int baseaddr = IMAGE_BASEADDR;
  int count = 0;

  while(baseaddr < IMAGE_MAXADDR && read_image(file, baseaddr)) {
    if (file[9] == '9') {
      file[8]++;
      file[9] -= 9;
    } else {
      file[9]++;
    }
    baseaddr += 0x200000;
    count++;
  }

  return count;
}

/* infinite loop that fills fifos and handles button pushing */
void play_video(Xuint32 count) {
  unsigned int j;
  unsigned int temp;
  unsigned int tftptr;
  Xboolean button_n, button_e, button_s, button_w, button_c;
  Xboolean past_button_n, past_button_e, past_button_s, past_button_w, past_button_c;
  Xboolean paused = 0;

  tftptr = IMAGE_BASEADDR;
  past_button_n = 0;
  past_button_e = 0;
  past_button_s = 0;
  past_button_w = 0;
  past_button_c = 0;
  j = 0;

  while (1) {
    j += 4;
    // auto advance tft
    if ((j % 0x20000000 == 0) && (!paused)) {
      if (tftptr == IMAGE_BASEADDR+0x200000*(count-1)) tftptr = IMAGE_BASEADDR;
        else tftptr += 0x200000;
        XIo_Out32(TFT_BASEADDR, tftptr);
    }

    // check for button pushes
    if (j % 0x10000 == 0) {
      temp = XIo_In32(PUSHB_CWSEN_BASEADDR);
      button_n = (temp >> 0) & (0x00000001);
      button_e = (temp >> 1) & (0x00000001);
      button_s = (temp >> 2) & (0x00000001);
      button_w = (temp >> 3) & (0x00000001);
      button_c = (temp >> 4) & (0x00000001);

      if (button_e && !past_button_e) {
 	      if (tftptr == IMAGE_BASEADDR+0x200000*(count-1)) tftptr = IMAGE_BASEADDR;
        else tftptr += 0x200000;
        XIo_Out32(TFT_BASEADDR, tftptr);
      }
      if (button_w && !past_button_w) {
 	      if (tftptr == IMAGE_BASEADDR) tftptr = IMAGE_BASEADDR+0x200000*(count-1);
        else tftptr -= 0x200000;
        XIo_Out32(TFT_BASEADDR, tftptr);
      }
      if (button_c && !past_button_c) {
  	   paused = !paused;
      if (paused) LCDPrintString ("Slideshow Paused", "Resume= Button C");
      else LCDPrintString ("Slideshow Ready ", "VGA Active      ");
      }

      past_button_n = button_n;
      past_button_e = button_e;
      past_button_s = button_s;
      past_button_w = button_w;
      past_button_c = button_c;
    }
  }
}

int main()
{
  int count;

  #ifdef PPC440CACHE
  XCache_EnableICache(PPC440_ICACHE);
  XCache_EnableDCache(PPC440_DCACHE);
  #endif

  XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
  XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);

  /* initialize GPIO */
  //XIo_Out32(PUSHB_CWSEN_BASEADDR, 0x00000000);
  //XIo_Out32(GPIO_CONTROL, 0xFFFFFE00);

  /* print directions to LCD screen */
  LCDOn();
  LCDInit();

  /* get images */
  print("\nProgram running.\n\r");
  count = get_images();
  print("\n\rReads done\n\r");
  LCDPrintString ("Slideshow Ready ", "VGA Active      ");

  /* set TFT pointer */
  XIo_Out32(TFT_BASEADDR, IMAGE_BASEADDR);

  /* initialize and play video */
  play_video(count); // infinite loop
  #ifdef PPC440CACHE
  XCache_DisableDCache();
  XCache_DisableICache();
  #endif
  return 0;
}
