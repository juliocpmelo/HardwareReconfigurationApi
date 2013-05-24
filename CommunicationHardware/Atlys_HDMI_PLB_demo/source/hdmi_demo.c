/************************************************************************/
/*																		*/
/*	hdmi_demo.c	--	HDMI Demo Main Program								*/
/*																		*/
/************************************************************************/
/*	Author: Sam Bobrowicz												*/
/*	Copyright 2011, Digilent Inc.										*/
/************************************************************************/
/*  Module Description: 												*/
/*																		*/
/*	This program demonstrates the video processing capabilities of the  */
/*  Atlys Development Board. The onboard push buttons provide the 		*/
/*  following functionality to the user:								*/
/*																		*/
/*  BTNC � Start/Stop recording data into the frame buffer from the 	*/
/*		   input video source. A newly attached device will always be in*/
/*		   the Stop state. When in the Start state, the data present in */
/*		   the frame buffer is constantly being overwritten by new data */
/*		   from the video source.										*/
/*	BTNR � Print a test pattern to the frame buffer. The program should */
/*		   be in the stop state in order to view the pattern before it  */
/*		   is overwritten.												*/
/*	BTND � Invert the data in the frame buffer. The program should be in*/
/*		   the stop state in order to view the inverted frame before it */
/*		   is overwritten.												*/
/*	BTNL � Print the width and height of the input source frame over 	*/
/*		   UART. A width of 0 and height of 1 means that no video data 	*/
/*		   is being received.											*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/* 																		*/
/*		10/31/2011(SamB): Created										*/
/*																		*/
/************************************************************************/


/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include <stdio.h>
#include "platform.h"  //Contains Cache initializing function
#include "xparameters.h"  //The hardware configuration describing constants
#include "xgpio.h"	//GPIO API functions
#include "xintc.h"	//Interrupt Controller API functions
#include "xil_io.h"	//Contains the Xil_Out32 and Xil_In32 functions
#include "mb_interface.h" //Contains the functions for registering the
						  //interrupt controller with the microblaze MP
#include "hdmi_demo.h"

/* ------------------------------------------------------------ */
/*				XPAR Constants									*/
/* ------------------------------------------------------------ */
/* All constants used from xparameters.h are located here so 	*/
/* that they may be easily accessed.							*/
/**/

#define IIC_BASEADDR XPAR_IIC_0_BASEADDR
#define BTNS_BASEADDR XPAR_PUSH_BUTTONS_5BITS_BASEADDR
#define BTNS_DEVICE_ID XPAR_PUSH_BUTTONS_5BITS_DEVICE_ID
#define INTC_DEVICE_ID XPAR_INTC_0_DEVICE_ID
#define BTNS_IRPT_ID XPAR_XPS_INTC_0_PUSH_BUTTONS_5BITS_IP2INTC_IRPT_INTR
#define IIC_IRPT_ID XPAR_XPS_INTC_0_XPS_IIC_0_IIC2INTC_IRPT_INTR
#define HDMIIN_BASEADDR XPAR_HDMI_IN_0_BASEADDR

/* ------------------------------------------------------------ */
/*				Global Variables								*/
/* ------------------------------------------------------------ */

volatile u32 lBtnStateOld;
volatile int ibEdid;
volatile int lDeBncCnt;

/* ------------------------------------------------------------ */
/*				Procedure Definitions							*/
/* ------------------------------------------------------------ */

int main()
{
    init_platform();

    static XGpio pshBtns;
    static XIntc intCtrl;

    ibEdid = 0;
    lBtnStateOld = 0x00000000;
    lDeBncCnt = lDeBncCntMax;

    /*
     * Initialize the hdmi_in core by setting the framebuffer
     * base address and the line stride. The line stride is the number
     * of pixels (each being 2 bytes) between each line in the memory
     * space.
     */
    Xil_Out32(HDMIIN_BASEADDR + bHdmiInLS, lLineStride);
    Xil_Out32(HDMIIN_BASEADDR + bHdmiInADR, pFrame);

	/*
	 *Initialize the driver structs for the Push button and interrupt cores.
	 *This allows the API functions to be used with these cores.
	 */
	XGpio_Initialize(&pshBtns, BTNS_DEVICE_ID);
	XIntc_Initialize(&intCtrl, INTC_DEVICE_ID);

	/*
	 * Connect the function PushBtnHandler to the interrupt controller so that
	 * it is called whenever the Push button GPIO core signals an interrupt.
	 */
	XIntc_Connect(&intCtrl, BTNS_IRPT_ID, PushBtnHandler, &pshBtns);

	/*
	 * Connect the function IicHandler to the interrupt controller so that
	 * it is called whenever the IIC core signals an interrupt.
	 */
	XIntc_Connect(&intCtrl, IIC_IRPT_ID, IicHandler, NULL);

	/*
	 * Enable both interrupts at the interrupt controller
	 */
	XIntc_Enable(&intCtrl, BTNS_IRPT_ID);
	XIntc_Enable(&intCtrl, IIC_IRPT_ID);

	/*
	 * Register the interrupt controller with the microblaze
	 * processor and then start the Interrupt controller so that it begins
	 * listening to the push buttons and IIC core for triggers.
	 */
	microblaze_register_handler(XIntc_DeviceInterruptHandler, INTC_DEVICE_ID);
	microblaze_enable_interrupts();
	XIntc_Start(&intCtrl, XIN_REAL_MODE);

	/*
	 * Enable the push button GPIO core to begin sending interrupts to the
	 * interrupt controller in response to changes in the button states
	 */
	XGpio_InterruptEnable(&pshBtns, lBtnChannel);
	XGpio_InterruptGlobalEnable(&pshBtns);

	/*
	 * Enable the IIC core to begin sending interrupts to the
	 * interrupt controller.
	 */
	Xil_Out32(IIC_BASEADDR + bIicIER, 0x00000026);  //Enable AAS, TxFifo empty
	                                                //and Tx done interrupts
	Xil_Out32(IIC_BASEADDR + bIicADR, 0x000000A0);  //Set slave address for E-DDC
	Xil_Out32(IIC_BASEADDR + bIicGIE, 0x80000000);  //Enable global interrupts
	Xil_Out32(IIC_BASEADDR + bIicCR, 0x00000001);   //Enable IIC core

	while (1)
	{
		/*
		 * This loop helps to debounce Stop/Start button presses
		 */
		while (lDeBncCnt < lDeBncCntMax)
		{
			lDeBncCnt++;
		}
	}

    return 0;
}

/***	IicHandler
**
**	Parameters:
**		CallBackRef - Pointer to NULL
**
**	Return Value:
**		None
**
**	Errors:
**		None
**
**	Description:
**		This function is connected to the interrupt handler such that it is
**		called whenever an interrupt is triggered by the IIC core. It is
**		designed to behave like a monitor on an E-DDC interface. It outputs
**		the data held in rgbEdid as its EDID.
*/
void IicHandler(void *CallBackRef)
{
	if ((Xil_In32(IIC_BASEADDR + bIicISR) & bitAasFlag))
	{
		Xil_In32(IIC_BASEADDR + bIicRX);  //Clear the receive FIFO
	}
	if ((Xil_In32(IIC_BASEADDR + bIicISR) & bitTxEmptyFlag))
	{
		while(((Xil_In32(IIC_BASEADDR + bIicTXOCY) & 0x0000000F) < 15) &&
			  (ibEdid < 128))
		{
			Xil_Out32(IIC_BASEADDR + bIicTX, 0x000000FF & rgbEdid[ibEdid]);
			ibEdid++;
		}
	}
	if (Xil_In32(IIC_BASEADDR + bIicISR) & bitTxDoneFlag)
	{
		ibEdid = 0;
	}

	/*
	 * Clear Interrupt Status Register in IIC core
	 */
	Xil_Out32(IIC_BASEADDR + bIicISR, Xil_In32(IIC_BASEADDR + bIicISR));
}

/***	PushBtnHandler
**
**	Parameters:
**		CallBackRef - Pointer to the push button struct (pshBtns) initialized
**		in main.
**
**	Return Value:
**		None
**
**	Errors:
**		None
**
**	Description:
**		This function is connected to the interrupt handler such that it is
**		called whenever an interrupt is triggered by the push buttons. It
**		responds to button presses by either stopping/starting the input
**		feed, printing a test pattern, inverting the framebuffer, or outputting
**		the input frame dimensions over UART.
*/
void PushBtnHandler(void *CallBackRef)
{
	XGpio *pPushBtn = (XGpio *)CallBackRef;
	u32 lBtnStateNew = XGpio_DiscreteRead(pPushBtn, lBtnChannel);
	u32 lBtnChanges = lBtnStateNew ^ lBtnStateOld;
	int xcoi;
	int ycoi;
	u16 wColor;

	lBtnStateOld = lBtnStateNew;
	/*
	 * Stop/Start Video feed into framebuffer
	 */
	if (lDeBncCnt >= lDeBncCntMax)
	{
		if ((lBtnChanges & bitBtnC) && (lBtnStateNew & bitBtnC))
		{
			Xil_Out32(HDMIIN_BASEADDR + bHdmiInLS, lLineStride);
			Xil_Out32(HDMIIN_BASEADDR + bHdmiInADR, pFrame);
			Xil_Out32(HDMIIN_BASEADDR + bHdmiInCR, (Xil_In32(HDMIIN_BASEADDR + bHdmiInCR) ^ bitHdmiEn));
			lDeBncCnt = 0;
		}
	}
	/*
	 * Invert screen
	 */
	if ((lBtnChanges & bitBtnD) && (lBtnStateNew & bitBtnD))
	{
		for(xcoi = 0; xcoi<xcoFrameMax; xcoi++)
		{
			for(ycoi = 0; ycoi<ycoFrameMax; ycoi++)
			{
				Xil_Out16(pFrame + ycoi*(lLineStride*2) + xcoi*2,
						  ~(Xil_In16(pFrame + ycoi*(lLineStride*2) + xcoi*2)));
			}
		}
	}
	/*
	 * Print Test Bars
	 */
	if ((lBtnChanges & bitBtnR) && (lBtnStateNew & bitBtnR))
	{
		for(xcoi = 0; xcoi<xcoFrameMax; xcoi++)
		{
			for(ycoi = 0; ycoi<ycoFrameMax; ycoi++)
			{
				wColor = 0x0001 << (xcoi / (xcoFrameMax / 16));
				Xil_Out16(pFrame + ycoi*(lLineStride*2) + xcoi*2, wColor);
			}
		}
	}
	/*
	 * Output Frame dimensions
	 */
	if ((lBtnChanges & bitBtnL) && (lBtnStateNew & bitBtnL))
	{
		xil_printf("\n\rInput Frame Width = %d\n\rInput Frame Height = %d\n\r",
				Xil_In32(HDMIIN_BASEADDR + bHdmiInFW),
				1 + Xil_In32(HDMIIN_BASEADDR + bHdmiInFH));
	}

	XGpio_InterruptClear(pPushBtn, lBtnChannel);
}
