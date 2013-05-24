/*****************************************************************************
* Filename:          D:\Users\Julio\Downloads\Atlys_HDMI_PLB_demo\project/drivers/simple_video_filter_v1_00_a/src/simple_video_filter.h
* Version:           1.00.a
* Description:       simple_video_filter Driver Header File
* Date:              Fri Apr 26 16:22:05 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef SIMPLE_VIDEO_FILTER_H
#define SIMPLE_VIDEO_FILTER_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLV_REG0 : user logic slave module register 0
 * -- SLV_REG1 : user logic slave module register 1
 * -- SLV_REG2 : user logic slave module register 2
 * -- SLV_REG3 : user logic slave module register 3
 * -- SLV_REG4 : user logic slave module register 4
 * -- SLV_REG5 : user logic slave module register 5
 * -- SLV_REG6 : user logic slave module register 6
 * -- SLV_REG7 : user logic slave module register 7
 * -- SLV_REG8 : user logic slave module register 8
 * -- SLV_REG9 : user logic slave module register 9
 */
#define SIMPLE_VIDEO_FILTER_USER_SLV_SPACE_OFFSET (0x00000000)
#define SIMPLE_VIDEO_FILTER_SLV_REG0_OFFSET (SIMPLE_VIDEO_FILTER_USER_SLV_SPACE_OFFSET + 0x00000000)
#define SIMPLE_VIDEO_FILTER_SLV_REG1_OFFSET (SIMPLE_VIDEO_FILTER_USER_SLV_SPACE_OFFSET + 0x00000004)
#define SIMPLE_VIDEO_FILTER_SLV_REG2_OFFSET (SIMPLE_VIDEO_FILTER_USER_SLV_SPACE_OFFSET + 0x00000008)
#define SIMPLE_VIDEO_FILTER_SLV_REG3_OFFSET (SIMPLE_VIDEO_FILTER_USER_SLV_SPACE_OFFSET + 0x0000000C)
#define SIMPLE_VIDEO_FILTER_SLV_REG4_OFFSET (SIMPLE_VIDEO_FILTER_USER_SLV_SPACE_OFFSET + 0x00000010)
#define SIMPLE_VIDEO_FILTER_SLV_REG5_OFFSET (SIMPLE_VIDEO_FILTER_USER_SLV_SPACE_OFFSET + 0x00000014)
#define SIMPLE_VIDEO_FILTER_SLV_REG6_OFFSET (SIMPLE_VIDEO_FILTER_USER_SLV_SPACE_OFFSET + 0x00000018)
#define SIMPLE_VIDEO_FILTER_SLV_REG7_OFFSET (SIMPLE_VIDEO_FILTER_USER_SLV_SPACE_OFFSET + 0x0000001C)
#define SIMPLE_VIDEO_FILTER_SLV_REG8_OFFSET (SIMPLE_VIDEO_FILTER_USER_SLV_SPACE_OFFSET + 0x00000020)
#define SIMPLE_VIDEO_FILTER_SLV_REG9_OFFSET (SIMPLE_VIDEO_FILTER_USER_SLV_SPACE_OFFSET + 0x00000024)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a SIMPLE_VIDEO_FILTER register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the SIMPLE_VIDEO_FILTER device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void SIMPLE_VIDEO_FILTER_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define SIMPLE_VIDEO_FILTER_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a SIMPLE_VIDEO_FILTER register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the SIMPLE_VIDEO_FILTER device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 SIMPLE_VIDEO_FILTER_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define SIMPLE_VIDEO_FILTER_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from SIMPLE_VIDEO_FILTER user logic slave registers.
 *
 * @param   BaseAddress is the base address of the SIMPLE_VIDEO_FILTER device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void SIMPLE_VIDEO_FILTER_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 SIMPLE_VIDEO_FILTER_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define SIMPLE_VIDEO_FILTER_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SIMPLE_VIDEO_FILTER_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SIMPLE_VIDEO_FILTER_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SIMPLE_VIDEO_FILTER_mWriteSlaveReg3(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG3_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SIMPLE_VIDEO_FILTER_mWriteSlaveReg4(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG4_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SIMPLE_VIDEO_FILTER_mWriteSlaveReg5(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG5_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SIMPLE_VIDEO_FILTER_mWriteSlaveReg6(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG6_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SIMPLE_VIDEO_FILTER_mWriteSlaveReg7(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG7_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SIMPLE_VIDEO_FILTER_mWriteSlaveReg8(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG8_OFFSET) + (RegOffset), (Xuint32)(Value))
#define SIMPLE_VIDEO_FILTER_mWriteSlaveReg9(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG9_OFFSET) + (RegOffset), (Xuint32)(Value))

#define SIMPLE_VIDEO_FILTER_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG0_OFFSET) + (RegOffset))
#define SIMPLE_VIDEO_FILTER_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG1_OFFSET) + (RegOffset))
#define SIMPLE_VIDEO_FILTER_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG2_OFFSET) + (RegOffset))
#define SIMPLE_VIDEO_FILTER_mReadSlaveReg3(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG3_OFFSET) + (RegOffset))
#define SIMPLE_VIDEO_FILTER_mReadSlaveReg4(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG4_OFFSET) + (RegOffset))
#define SIMPLE_VIDEO_FILTER_mReadSlaveReg5(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG5_OFFSET) + (RegOffset))
#define SIMPLE_VIDEO_FILTER_mReadSlaveReg6(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG6_OFFSET) + (RegOffset))
#define SIMPLE_VIDEO_FILTER_mReadSlaveReg7(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG7_OFFSET) + (RegOffset))
#define SIMPLE_VIDEO_FILTER_mReadSlaveReg8(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG8_OFFSET) + (RegOffset))
#define SIMPLE_VIDEO_FILTER_mReadSlaveReg9(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (SIMPLE_VIDEO_FILTER_SLV_REG9_OFFSET) + (RegOffset))

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the SIMPLE_VIDEO_FILTER instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus SIMPLE_VIDEO_FILTER_SelfTest(void * baseaddr_p);

#endif /** SIMPLE_VIDEO_FILTER_H */
