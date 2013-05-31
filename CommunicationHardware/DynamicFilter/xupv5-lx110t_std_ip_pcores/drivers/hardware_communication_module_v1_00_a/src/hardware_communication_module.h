/*****************************************************************************
* Filename:          D:\Users\Julio\Downloads\Atlys_HDMI_PLB_demo\project/drivers/hardware_communication_module_v1_00_a/src/hardware_communication_module.h
* Version:           1.00.a
* Description:       hardware_communication_module Driver Header File
* Date:              Mon May 27 13:34:57 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef HARDWARE_COMMUNICATION_MODULE_H
#define HARDWARE_COMMUNICATION_MODULE_H

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
 */
#define HARDWARE_COMMUNICATION_MODULE_USER_SLV_SPACE_OFFSET (0x00000000)
#define HARDWARE_COMMUNICATION_MODULE_SLV_REG0_OFFSET (HARDWARE_COMMUNICATION_MODULE_USER_SLV_SPACE_OFFSET + 0x00000000)
#define HARDWARE_COMMUNICATION_MODULE_SLV_REG1_OFFSET (HARDWARE_COMMUNICATION_MODULE_USER_SLV_SPACE_OFFSET + 0x00000004)
#define HARDWARE_COMMUNICATION_MODULE_SLV_REG2_OFFSET (HARDWARE_COMMUNICATION_MODULE_USER_SLV_SPACE_OFFSET + 0x00000008)
#define HARDWARE_COMMUNICATION_MODULE_SLV_REG3_OFFSET (HARDWARE_COMMUNICATION_MODULE_USER_SLV_SPACE_OFFSET + 0x0000000C)
#define HARDWARE_COMMUNICATION_MODULE_SLV_REG4_OFFSET (HARDWARE_COMMUNICATION_MODULE_USER_SLV_SPACE_OFFSET + 0x00000010)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a HARDWARE_COMMUNICATION_MODULE register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the HARDWARE_COMMUNICATION_MODULE device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void HARDWARE_COMMUNICATION_MODULE_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define HARDWARE_COMMUNICATION_MODULE_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a HARDWARE_COMMUNICATION_MODULE register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the HARDWARE_COMMUNICATION_MODULE device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 HARDWARE_COMMUNICATION_MODULE_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define HARDWARE_COMMUNICATION_MODULE_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from HARDWARE_COMMUNICATION_MODULE user logic slave registers.
 *
 * @param   BaseAddress is the base address of the HARDWARE_COMMUNICATION_MODULE device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void HARDWARE_COMMUNICATION_MODULE_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 HARDWARE_COMMUNICATION_MODULE_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define HARDWARE_COMMUNICATION_MODULE_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HARDWARE_COMMUNICATION_MODULE_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HARDWARE_COMMUNICATION_MODULE_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HARDWARE_COMMUNICATION_MODULE_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HARDWARE_COMMUNICATION_MODULE_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HARDWARE_COMMUNICATION_MODULE_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HARDWARE_COMMUNICATION_MODULE_mWriteSlaveReg3(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HARDWARE_COMMUNICATION_MODULE_SLV_REG3_OFFSET) + (RegOffset), (Xuint32)(Value))
#define HARDWARE_COMMUNICATION_MODULE_mWriteSlaveReg4(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (HARDWARE_COMMUNICATION_MODULE_SLV_REG4_OFFSET) + (RegOffset), (Xuint32)(Value))

#define HARDWARE_COMMUNICATION_MODULE_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HARDWARE_COMMUNICATION_MODULE_SLV_REG0_OFFSET) + (RegOffset))
#define HARDWARE_COMMUNICATION_MODULE_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HARDWARE_COMMUNICATION_MODULE_SLV_REG1_OFFSET) + (RegOffset))
#define HARDWARE_COMMUNICATION_MODULE_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HARDWARE_COMMUNICATION_MODULE_SLV_REG2_OFFSET) + (RegOffset))
#define HARDWARE_COMMUNICATION_MODULE_mReadSlaveReg3(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HARDWARE_COMMUNICATION_MODULE_SLV_REG3_OFFSET) + (RegOffset))
#define HARDWARE_COMMUNICATION_MODULE_mReadSlaveReg4(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (HARDWARE_COMMUNICATION_MODULE_SLV_REG4_OFFSET) + (RegOffset))

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the HARDWARE_COMMUNICATION_MODULE instance to be worked on.
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
XStatus HARDWARE_COMMUNICATION_MODULE_SelfTest(void * baseaddr_p);

#endif /** HARDWARE_COMMUNICATION_MODULE_H */
