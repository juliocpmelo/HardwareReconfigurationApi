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

#include "DynamicHardwareModules/ArchitectureManager.h"

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
#define HDMIOUT_BASEADDR XPAR_HDMI_OUT_0_BASEADDR
#define VIDEO_FILTER_BASEADDR XPAR_SIMPLE_VIDEO_FILTER_0_BASEADDR

/*video filter*/
#define videoFilter_pixelIn 0x00
#define videoFilter_xAccess 0x04
#define videoFilter_yAccess 0x08
#define videoFilter_options 0x0C
#define videoFilter_pixelYOut 0x10
#define videoFilter_pixelXOut 0x14

#define baseAddrReg 0x00
#define lineStrideReg 0x04
#define loadDefaultValuesReg 0x08
#define lineBufferX 0x0C
#define lineBufferY 0x10
#define lineBufferPixelIn 0x14
#define lineBufferPixelOut 0x18
//#define baseAddrEq 0x10
//#define baseAddrEq 0x10



/* ------------------------------------------------------------ */
/*				Global Variables								*/
/* ------------------------------------------------------------ */

volatile u32 lBtnStateOld;
volatile int ibEdid;
volatile int lDeBncCnt;

ArchitectureManager *architectureManager;

/* ------------------------------------------------------------ */
/*				Procedure Definitions							*/
/* ------------------------------------------------------------ */

int main()
{
	xil_printf("\n\rRunning\n\r");
    init_platform();

    static XGpio pshBtns;
    static XIntc intCtrl;

    ibEdid = 0;
    lBtnStateOld = 0x00000000;
    lDeBncCnt = lDeBncCntMax;

    xil_printf("\n\rRunning\n\r");

    Xil_Out32(HDMIOUT_BASEADDR + loadDefaultValuesReg, 0x00000000);// write 1 to the enable defaults
	//Xil_Out32(HDMIOUT_BASEADDR + 0x08, 0x80000000);
	//Xil_Out32(HDMIOUT_BASEADDR + 0xc, 0xFFFFFFFF);
	u32  pFrameAux = 0, lineStrideAux = 0;

	int i = 0;
	for(i = 0; i <= 31; i ++){ // change indianess of pframe and lineStride
		pFrameAux = pFrameAux | (((pFrame >> i) & 0x1) << (31-i));
		lineStrideAux = lineStrideAux | (((lLineStride >> i) & 0x1) << (31-i));
	}
		//pFrameAux =   (pFrame << 24 & 0xFF000000) | (pFrame << 8 & 0xFF0000) | (pFrame >> 8 & 0xFF00) | (pFrame >> 24 & 0xFF);
		//lineStrideAux = (lLineStride << 24 & 0xFF000000) | (lLineStride << 8 & 0xFF0000) | (lLineStride >> 8 & 0xFF00) | (lLineStride >> 24 & 0xFF);
	//}
	//pFrameAux =
	Xil_Out32(HDMIOUT_BASEADDR + baseAddrReg, pFrame); // write base address in reg0
	Xil_Out32(HDMIOUT_BASEADDR + lineStrideReg, lLineStride); // line stride in reg1, could be wrong because of endianess

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

int count = 0;




void PushBtnHandler(void *CallBackRef)
{
	XGpio *pPushBtn = (XGpio *)CallBackRef;
	u32 lBtnStateNew = XGpio_DiscreteRead(pPushBtn, lBtnChannel);
	u32 lBtnChanges = lBtnStateNew ^ lBtnStateOld;
	int xcoi;
	int ycoi;
	u16 wColor;
	u32 storedColor;
	u8 wColorR, wColorG, wColorB;

	HardwareComponent *videoProcessingHardware;
	videoProcessingHardware = architectureManager->getHardwareComponent(architectureManager,"sobel_wrapper_inst");

	lBtnStateOld = lBtnStateNew;


	//Xil_Out32(HDMIOUT_BASEADDR + 0x04, lLineStride);
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
		/*if (count == 0){
			for(xcoi = 0; xcoi<xcoFrameMax; xcoi++)
			{
				for(ycoi = 0; ycoi<ycoFrameMax; ycoi++)
				{
					wColor = 0x0001 << (xcoi / (xcoFrameMax / 16));
					Xil_Out16(pFrame + ycoi*(lLineStride*2) + xcoi*2, 0xf000);
				}
			}
		}
		else if (count == 1){*/
			xil_printf("\n\rfilling screen\n\r");
			for(xcoi = 0; xcoi<xcoFrameMax; xcoi++)
			{
				for(ycoi = 0; ycoi<ycoFrameMax; ycoi++)
				{
					if (xcoi < 128 && ycoi <128){
						wColorR = imagePattern[ycoi][xcoi][0];
						wColorG = imagePattern[ycoi][xcoi][1];
						wColorB = imagePattern[ycoi][xcoi][2];
						wColor = (wColorR & 0xF8) >> 3;
						wColor = wColor | ((wColorG & 0xE0) << 3);
						wColor = wColor | ((wColorG & 0x1C) << 3);
						wColor = wColor | ((wColorB & 0xF8) << 8);

						storedColor = 					  wColorB & 0xF8;
						storedColor = (storedColor << 8)|(wColorG & 0xFC);
						storedColor = (storedColor << 8)|(wColorR & 0xF8);


						Xil_Out16(pFrame + ycoi*(lLineStride*2) + xcoi*2, wColor);
					}
					else{
						wColor = 0x0001 << (xcoi / (xcoFrameMax / 16));
						Xil_Out16(pFrame + ycoi*(lLineStride*2) + xcoi*2, 0xf00f);
					}
				}
			}
	}
	/*
	 * Output Frame dimensions
	 */
	u8 optionLB;
	u32 option;
	if ((lBtnChanges & bitBtnL) && (lBtnStateNew & bitBtnL))
	{
		if (count == 0){
			xil_printf("\n\rTest Store Mode \n\r");

			for(ycoi = 0; ycoi<3; ycoi++)
			{

				for(xcoi = 0; xcoi<128; xcoi++)
				{


					wColorR = imagePattern[ycoi][xcoi][0];
					wColorG = imagePattern[ycoi][xcoi][1];
					wColorB = imagePattern[ycoi][xcoi][2];
					/*
					wColor = (wColorR & 0xF8) >> 3;
					wColor = wColor | ((wColorG & 0xE0) << 3);
					wColor = wColor | ((wColorG & 0x1C) << 3);
					wColor = wColor | ((wColorB & 0xF8) << 8);*/

					/*without api begin*/
//					Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_pixelIn, (wColorR << 16 | wColorG <<8 | wColorB));
//					Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_yAccess, ycoi);
//					Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_xAccess, xcoi);
//
//					optionLB = 0x05;
//					option = 0 | (optionLB);
//					Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_options, option);
//
//					while (Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_options) & 0x10); //wait idle
//
//
//					optionLB = 0x04; // access - avoid data to be overwritten
//					option = 0 | (optionLB);
//					Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_options, option);
//					while (Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_options) & 0x10); //wait idle
					/*without api end*/


					/*with api beigin*/
					videoProcessingHardware->setPortValue(videoProcessingHardware,"pixel", (wColorR << 16 | wColorG <<8 | wColorB));
					videoProcessingHardware->setPortValue(videoProcessingHardware,"x", xcoi);
					videoProcessingHardware->setPortValue(videoProcessingHardware,"y", ycoi);

					optionLB = 0x05;
					option = 0 | (optionLB);
					videoProcessingHardware->setPortValue(videoProcessingHardware,"mode", option);

					while (videoProcessingHardware->getPortValue(videoProcessingHardware,"ap_idle")); //wait idle

					optionLB = 0x04; // access - avoid data to be overwritten
					option = 0 | (optionLB);
					videoProcessingHardware->setPortValue(videoProcessingHardware,"mode", option);
					while (videoProcessingHardware->getPortValue(videoProcessingHardware,"ap_idle"));
					/*with api end*/


				}
			}
			xil_printf("\n\rTest Store Mode End\n\r");
//
				/*xil_printf("\n\rstatus values %d \n\r ", Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_options));
				while (Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_options) & 0x10); //wait idle

				feed pixel and address

				xcoi = 3;
				wColorR = imagePattern[0][xcoi][0];
				wColorG = imagePattern[0][xcoi][1];
				wColorB = imagePattern[0][xcoi][2];
				wColor = (wColorR & 0xF8) >> 3;
				wColor = wColor | ((wColorG & 0xE0) << 3);
				wColor = wColor | ((wColorG & 0x1C) << 3);
				wColor = wColor | ((wColorB & 0xF8) << 8);

				Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_pixelIn, wColor);
				Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_yAccess, 0);
				Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_xAccess, xcoi);


				optionLB = 0x05; // store
				option = 0 | (optionLB);
				Xil_Out32(HDMIOUT_BASEADDR + videoFilter_options, option);

				xil_printf("\n\rstatus values %d \n\r ", Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_options));
				xil_printf("\n\rstored pixel(%d ,%d) = %d \n\r ", xcoi, ycoi, wColor);
				while (Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_options) & 0x10); //wait idle

				optionLB = 0x06; // access - avoid data to be overwritten
				option = 0 | (optionLB);
				Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_options, option);*/
		//		Xil_Out32(HDMIOUT_BASEADDR + loadDefaultValuesReg, option);
			//	while (Xil_In32(HDMIOUT_BASEADDR + loadDefaultValuesReg) & 0x80); //wait idle
				//optionLB = 0x00; // store
				//option = 0 | (optionLB << 3);
				//Xil_Out32(HDMIOUT_BASEADDR + loadDefaultValuesReg, 0x00); //clear start
				//while (!(Xil_In32(HDMIOUT_BASEADDR + loadDefaultValuesReg) & 0x80)); //wait idle

				//while (1)
			//	xil_printf("\n\rstatus values %d \n\r ", Xil_In32(HDMIOUT_BASEADDR + loadDefaultValuesReg));
			//	xil_printf("\n\rPixel %d %d Data %d Stored\n\r", 0, xcoi, wColor);




			//	xil_printf("\n\rstatus values %d \n\r ", Xil_In32(HDMIOUT_BASEADDR + loadDefaultValuesReg));
			//	xil_printf("\n\rPixel %d %d Data %d Stored\n\r", 0, xcoi, wColor);

				//Xil_Out32(HDMIOUT_BASEADDR + lineBufferPixelIn, wColor);

		}
		else if (count == 1){
			xil_printf("\n\rTest Operating Mode\n\r");
			//u8 optionLB = 0x02; // access
			//u32 option = 0 | (optionLB << 3);
			//Xil_Out32(HDMIOUT_BASEADDR + loadDefaultValuesReg, option);

			//for(xcoi = 0; xcoi<xcoFrameMax; xcoi++)
			//{

				//optionLB = 0x02; // store
				//option = 0 | (optionLB << 3);
				//Xil_Out32(HDMIOUT_BASEADDR + loadDefaultValuesReg, option); //clear start

				/*without api begin*/
//			u8 optionLB = 0x06; // access | start
//			u32 option = 0 | (optionLB);
//
//			Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_options, option);
//			xil_printf("\n\rstatus values %d \n\r ", Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_options));
//			while (Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_options) & 0x10); //wait idle
//
//			for(xcoi = 1; xcoi<10; xcoi++){
//				Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_yAccess, 0);
//				Xil_Out32(VIDEO_FILTER_BASEADDR + videoFilter_xAccess, xcoi);
//				while (Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_options) & 0x10); //wait idle
//				//Xil_Out16((pFrame + ycoi*(lLineStride*2) + xcoi*2), Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_pixelYOut));
//				xil_printf("\n\rAccess Stored at (%d,%d) = %d, %d\n\r", xcoi, ycoi, Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_pixelYOut), Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_pixelXOut));
//			}
			/*without api end*/


			/*with api begin*/
			u8 optionLB = 0x06; // access | start
			u32 option = 0 | (optionLB);

			videoProcessingHardware->setPortValue(videoProcessingHardware,"mode", option);
			//xil_printf("\n\rstatus values %d \n\r ", videoProcessingHardware->getPortValue("mode"));
			while (videoProcessingHardware->getPortValue(videoProcessingHardware,"ap_idle")); //wait idle
			for(xcoi = 1; xcoi<10; xcoi++){
				videoProcessingHardware->setPortValue(videoProcessingHardware,"x", xcoi);
				videoProcessingHardware->setPortValue(videoProcessingHardware,"y", ycoi);
				while (videoProcessingHardware->getPortValue(videoProcessingHardware,"ap_idle")); //wait idle
				//Xil_Out16((pFrame + ycoi*(lLineStride*2) + xcoi*2), Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_pixelYOut));
				xil_printf("\n\rAccess Stored at (%d,%d) = %d, %d\n\r", xcoi, ycoi, videoProcessingHardware->getPortValue(videoProcessingHardware,"filteredPixelX"), videoProcessingHardware->getPortValue(videoProcessingHardware,"filteredPixelY"));

				//while (Xil_In32(VIDEO_FILTER_BASEADDR + videoFilter_options) & 0x10); //wait idle
			}
			/*with api end*/


			xil_printf("\n\rTest Access Mode End\n\r");
			//}
		}
		else if (count == 2){
			xil_printf("\n\rSwitching filter off \n\r");

		}

		count = (count + 1)%3;

	}

	XGpio_InterruptClear(pPushBtn, lBtnChannel);
}
