/*****************************************************************************
* Filename:          D:\Users\Julio\Downloads\Atlys_HDMI_PLB_demo\project/drivers/vmodcam_v1_00_a/src/vmodcam.h
* Version:           1.00.a
* Description:       vmodcam Driver Header File
* Date:              Thu Apr 25 10:47:50 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef VMODCAM_H
#define VMODCAM_H

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
 */
#define VMODCAM_USER_SLV_SPACE_OFFSET (0x00000000)
#define VMODCAM_SLV_REG0_OFFSET (VMODCAM_USER_SLV_SPACE_OFFSET + 0x00000000)
#define VMODCAM_SLV_REG1_OFFSET (VMODCAM_USER_SLV_SPACE_OFFSET + 0x00000004)
#define VMODCAM_SLV_REG2_OFFSET (VMODCAM_USER_SLV_SPACE_OFFSET + 0x00000008)
#define VMODCAM_SLV_REG3_OFFSET (VMODCAM_USER_SLV_SPACE_OFFSET + 0x0000000C)
#define VMODCAM_SLV_REG4_OFFSET (VMODCAM_USER_SLV_SPACE_OFFSET + 0x00000010)
#define VMODCAM_SLV_REG5_OFFSET (VMODCAM_USER_SLV_SPACE_OFFSET + 0x00000014)
#define VMODCAM_SLV_REG6_OFFSET (VMODCAM_USER_SLV_SPACE_OFFSET + 0x00000018)
#define VMODCAM_SLV_REG7_OFFSET (VMODCAM_USER_SLV_SPACE_OFFSET + 0x0000001C)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a VMODCAM register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the VMODCAM device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void VMODCAM_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define VMODCAM_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a VMODCAM register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the VMODCAM device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 VMODCAM_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define VMODCAM_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from VMODCAM user logic slave registers.
 *
 * @param   BaseAddress is the base address of the VMODCAM device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void VMODCAM_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 VMODCAM_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define VMODCAM_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (VMODCAM_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))
#define VMODCAM_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (VMODCAM_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define VMODCAM_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (VMODCAM_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))
#define VMODCAM_mWriteSlaveReg3(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (VMODCAM_SLV_REG3_OFFSET) + (RegOffset), (Xuint32)(Value))
#define VMODCAM_mWriteSlaveReg4(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (VMODCAM_SLV_REG4_OFFSET) + (RegOffset), (Xuint32)(Value))
#define VMODCAM_mWriteSlaveReg5(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (VMODCAM_SLV_REG5_OFFSET) + (RegOffset), (Xuint32)(Value))
#define VMODCAM_mWriteSlaveReg6(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (VMODCAM_SLV_REG6_OFFSET) + (RegOffset), (Xuint32)(Value))
#define VMODCAM_mWriteSlaveReg7(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (VMODCAM_SLV_REG7_OFFSET) + (RegOffset), (Xuint32)(Value))

#define VMODCAM_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (VMODCAM_SLV_REG0_OFFSET) + (RegOffset))
#define VMODCAM_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (VMODCAM_SLV_REG1_OFFSET) + (RegOffset))
#define VMODCAM_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (VMODCAM_SLV_REG2_OFFSET) + (RegOffset))
#define VMODCAM_mReadSlaveReg3(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (VMODCAM_SLV_REG3_OFFSET) + (RegOffset))
#define VMODCAM_mReadSlaveReg4(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (VMODCAM_SLV_REG4_OFFSET) + (RegOffset))
#define VMODCAM_mReadSlaveReg5(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (VMODCAM_SLV_REG5_OFFSET) + (RegOffset))
#define VMODCAM_mReadSlaveReg6(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (VMODCAM_SLV_REG6_OFFSET) + (RegOffset))
#define VMODCAM_mReadSlaveReg7(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (VMODCAM_SLV_REG7_OFFSET) + (RegOffset))

/**
 *
 * Write/Read 32 bit value to/from VMODCAM user logic memory (BRAM).
 *
 * @param   Address is the memory address of the VMODCAM device.
 * @param   Data is the value written to user logic memory.
 *
 * @return  The data from the user logic memory.
 *
 * @note
 * C-style signature:
 * 	void VMODCAM_mWriteMemory(Xuint32 Address, Xuint32 Data)
 * 	Xuint32 VMODCAM_mReadMemory(Xuint32 Address)
 *
 */
#define VMODCAM_mWriteMemory(Address, Data) \
 	Xil_Out32(Address, (Xuint32)(Data))
#define VMODCAM_mReadMemory(Address) \
 	Xil_In32(Address)

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the VMODCAM instance to be worked on.
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
XStatus VMODCAM_SelfTest(void * baseaddr_p);

#endif /** VMODCAM_H */
