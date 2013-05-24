/************************************************************************/
/*																		*/
/*	hdmi_demo.h	--	Interface Declarations for hdmi_Demo.c				*/
/*																		*/
/************************************************************************/
/*	Author:	Sam Bobrowicz												*/
/*	Copyright 2011, Digilent Inc.										*/
/************************************************************************/
/*  File Description: 													*/
/*																		*/
/*	This Header file contains the interface and constant definitions	*/
/*	used by hdmi_demo.c. 												*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/* 																		*/
/*		10/31/2011(SamB): Created										*/
/*																		*/
/************************************************************************/

#ifndef HDMI_DEMO_H
#define HDMI_DEMO_H

/* ------------------------------------------------------------ */
/*					Constant Definitions						*/
/* ------------------------------------------------------------ */

#define lDeBncCntMax (XPAR_MICROBLAZE_0_FREQ / 75) //number of cycles to wait
#define lBtnChannel	1//GPIO channel of the push buttons

/*
 * These constants refer to the configuration of the hdmi_out core parameters.
 */
#define pFrame 0x49000000 //frame base address
#define xcoFrameMax 1280  //frame width
#define ycoFrameMax 720   //frame height
#define lLineStride 0x800  //line stride

/*
 * hdmi_in bit definitions
 */
#define bitHdmiEn 0x00000001

/*
 * IIC bit definitions
 */
#define bitAasFlag 0x00000020
#define bitTxEmptyFlag 0x00000004
#define bitTxDoneFlag 0x00000002

/*
 * Push Button bit definitions
 */
#define bitBtnC 0x00000010
#define bitBtnR 0x00000008
#define bitBtnD 0x00000004
#define bitBtnL 0x00000002
#define bitBtnU 0x00000001

/*
 * IIC Register offsets
 */
#define bIicGIE 0x001C
#define bIicISR 0x0020
#define bIicIER 0x0028
#define bIicCR  0x0100
#define bIicSR  0x0104
#define bIicTX  0x0108
#define bIicRX  0x010C
#define bIicADR 0x0110
#define bIicTXOCY 0x0114

/*
 * hdmi_in register offsets
 */
#define bHdmiInCR 0x00
#define bHdmiInSR 0x04
#define bHdmiInFW 0x08
#define bHdmiInFH 0x0C
#define bHdmiInLS 0x10
#define bHdmiInADR 0x14

/*
 * EDID array definition. Changing these values changes the EDID
 * packet that is sent over the E-DDC wires. It contains information on which
 * resolutions the device supports. Currently, this packet provides fairly
 * generic resolution support. Note that using resolutions with widths larger
 * than the line stride of the hdmi_output core results in a choppy picture.
 */
static const u8 rgbEdid[256] =
{0x00,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x00,0x11,0x27,0x00,0x00,0x00,0x00,0x00,0x00,
 0x2C,0x15,0x01,0x03,0x80,0x26,0x1E,0x78,0x2A,0xE5,0xC5,0xA4,0x56,0x4A,0x9C,0x23,
 0x12,0x50,0x54,0xBF,0xEF,0x80,0x8B,0xC0,0x95,0x00,0x95,0x0F,0x81,0x80,0x81,0x40,
 0x81,0xC0,0x71,0x4F,0x61,0x4F,0x6B,0x35,0xA0,0xF0,0x51,0x84,0x2A,0x30,0x60,0x98,
 0x36,0x00,0x78,0x2D,0x11,0x00,0x00,0x1C,0x00,0x00,0x00,0xFD,0x00,0x38,0x4B,0x1F,
 0x50,0x0E,0x0A,0x0A,0x20,0x20,0x20,0x20,0x20,0x20,0x00,0x00,0x00,0xFC,0x00,0x41,
 0x54,0x4C,0x59,0x53,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x00,0x00,0x00,0xFE,
 0x00,0x44,0x49,0x47,0x49,0x4C,0x45,0x4E,0x54,0x52,0x4F,0x43,0x4B,0x53,0x00,0x12};


/* ------------------------------------------------------------ */
/*					Procedure Declarations						*/
/* ------------------------------------------------------------ */

void PushBtnHandler(void *CallBackRef);
void IicHandler(void *CallBackRef);

/* ------------------------------------------------------------ */
#endif
