/*****************************************************************************
* Filename:          D:\Users\Julio\Downloads\Atlys_HDMI_PLB_demo\project/drivers/hdmi_out_v1_01_a/src/hdmi_out.h
* Version:           1.01.a
* Description:       hdmi_out Driver Header File
* Date:              Mon Apr 29 10:59:59 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef HDMI_OUT_H
#define HDMI_OUT_H

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
#define HDMI_OUT_USER_SLV_SPACE_OFFSET (0x00000000)
#define HDMI_OUT_SLV_REG0_OFFSET (HDMI_OUT_USER_SLV_SPACE_OFFSET + 0x00000000)
#define HDMI_OUT_SLV_REG1_OFFSET (HDMI_OUT_USER_SLV_SPACE_OFFSET + 0x00000004)
#define HDMI_OUT_SLV_REG2_OFFSET (HDMI_OUT_USER_SLV_SPACE_OFFSET + 0x00000008)
#define HDMI_OUT_SLV_REG3_OFFSET (HDMI_OUT_USER_SLV_SPACE_OFFSET + 0x0000000C)
#define HDMI_OUT_SLV_REG4_OFFSET (HDMI_OUT_USER_SLV_SPACE_OFFSET + 0x00000010)
#define HDMI_OUT_SLV_REG5_OFFSET (HDMI_OUT_USER_SLV_SPACE_OFFSET + 0x00000014)
#define HDMI_OUT_SLV_REG6_OFFSET (HDMI_OUT_USER_SLV_SPACE_OFFSET + 0x00000018)
#define HDMI_OUT_SLV_REG7_OFFSET (HDMI_OUT_USER_SLV_SPACE_OFFSET + 0x0000001C)
#define HDMI_OUT_SLV_REG8_OFFSET (HDMI_OUT_USER_SLV_SPACE_OFFSET + 0x00000020)
#define HDMI_OUT_SLV_REG9_OFFSET (HDMI_OUT_USER_SLV_SPACE_OFFSET + 0x00000024)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a HDMI_OUT register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the HDMI_OUT device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void HDMI_OUT_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define HDMI_OUT_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a HDMI_OUT register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the HDMI_OUT device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 HDMI_OUT_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define HDMI_OUT_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from HDMI_OUT user logic slave registers.
 *
 * @param   BaseAddress is the base address of the HDMI_OUT device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void HDMI_OUT_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 HDMI_OUT_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define HDMI_OUT_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HDMI_OUT_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HDMI_OUT_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HDMI_OUT_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HDMI_OUT_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HDMI_OUT_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HDMI_OUT_mWriteSlaveReg3(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HDMI_OUT_SLV_REG3_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HDMI_OUT_mWriteSlaveReg4(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HDMI_OUT_SLV_REG4_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HDMI_OUT_mWriteSlaveReg5(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HDMI_OUT_SLV_REG5_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HDMI_OUT_mWriteSlaveReg6(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HDMI_OUT_SLV_REG6_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HDMI_OUT_mWriteSlaveReg7(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HDMI_OUT_SLV_REG7_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HDMI_OUT_mWriteSlaveReg8(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HDMI_OUT_SLV_REG8_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HDMI_OUT_mWriteSlaveReg9(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HDMI_OUT_SLV_REG9_OFFSET) + (RegOffset), (Xuint32)(Value))

#define HDMI_OUT_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HDMI_OUT_SLV_REG0_OFFSET) + (RegOffset))
#define HDMI_OUT_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HDMI_OUT_SLV_REG1_OFFSET) + (RegOffset))
#define HDMI_OUT_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HDMI_OUT_SLV_REG2_OFFSET) + (RegOffset))
#define HDMI_OUT_mReadSlaveReg3(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HDMI_OUT_SLV_REG3_OFFSET) + (RegOffset))
#define HDMI_OUT_mReadSlaveReg4(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HDMI_OUT_SLV_REG4_OFFSET) + (RegOffset))
#define HDMI_OUT_mReadSlaveReg5(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HDMI_OUT_SLV_REG5_OFFSET) + (RegOffset))
#define HDMI_OUT_mReadSlaveReg6(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HDMI_OUT_SLV_REG6_OFFSET) + (RegOffset))
#define HDMI_OUT_mReadSlaveReg7(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HDMI_OUT_SLV_REG7_OFFSET) + (RegOffset))
#define HDMI_OUT_mReadSlaveReg8(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HDMI_OUT_SLV_REG8_OFFSET) + (RegOffset))
#define HDMI_OUT_mReadSlaveReg9(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HDMI_OUT_SLV_REG9_OFFSET) + (RegOffset))

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the HDMI_OUT instance to be worked on.
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
XStatus HDMI_OUT_SelfTest(void * baseaddr_p);

#endif /** HDMI_OUT_H */
