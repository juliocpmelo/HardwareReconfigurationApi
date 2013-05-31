/*******************************************************************************
*
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
*     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR
*     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION
*     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION
*     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS
*     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
*     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
*     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
*     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*     FOR A PARTICULAR PURPOSE.
*     
*     (c) Copyright 2007 Xilinx, Inc.
*     All rights reserved.
*
******************************************************************************/

//  This file uses a two bit GPIO port to implement a IIC bus master device.
//    The gpio_iic code contained herein is designed to allow a flexible
//    implementation of IIC.  It provides a set of functions which higher level
//    IIC device specific drivers will use to implement their intended
//    functions.


//  Summary of functions:
//    GPIO_IIC_Device_AxPxDx_Write :
//       IIC Device Write Op where
//          Ax is # of IIC Device Address bits (8 for now)
//          Px is # of IIC Pointer addr bits (8 or 16)
//          Dx is # of IIC Data bits to write (8 or 16)
//    GPIO_IIC_Device_AxPxDx_Read :
//       IIC Device Write Op where
//          Ax is # of IIC Device Address bits (8 for now)
//          Px is # of IIC Pointer addr bits (8 or 16)
//          Dx is # of IIC Data bits to read (8 or 16)
//    These eight functions could be written as one generic function with inputs
//    for each of these variables.  However, in the interests of making the code
//    more understanable and readable, it was chosen to make 8 distinct functions.

#ifndef GPIO_IIC_H
#define GPIO_IIC_H

// Error codes for return values
#define ERR_GPIO_IIC_NO_ADDR_ACK            0x1001
#define ERR_GPIO_IIC_NO_POINTER_ACK         0x2001
#define ERR_GPIO_IIC_NO_POINTER_ACK2        0x2002
#define ERR_GPIO_IIC_NO_WRITE16_FIRST_ACK   0x4011
#define ERR_GPIO_IIC_NO_WRITE16_SECOND_ACK  0x4012
#define ERR_GPIO_IIC_NO_WRITE8_ACK          0x4001
#define ERR_GPIO_IIC_NO_READ_ACK            0x4041


// Detection values for Errors
#define GPIO_IIC_ADDR_ACK_ERR            0x8000000000000000LL
#define GPIO_IIC_POINTER_ACK_ERR         0x4000000000000000LL
#define GPIO_IIC_POINTER_ACK2_ERR        0x2000000000000000LL
#define GPIO_IIC_WRITE16_FIRST_ACK_ERR   0x1000000000000000LL
#define GPIO_IIC_WRITE16_SECOND_ACK_ERR  0x0800000000000000LL
#define GPIO_IIC_WRITE8_ACK_ERR          0x0400000000000000LL
#define GPIO_IIC_READ_ADDR_ACK_ERR       0x0200000000000000LL

// Function Prototypes

unsigned long long GPIO_IIC_Device_A8P8D8_Write (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr,
    unsigned long iic_data2write
);

unsigned long long GPIO_IIC_Device_A8P8D8_Read (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr
);

unsigned long long GPIO_IIC_Device_A8P8D16_Write (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr,
    unsigned long iic_data2write
);

unsigned long long GPIO_IIC_Device_A8P8D16_Read (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr
);

unsigned long long GPIO_IIC_Device_A8P16D8_Write (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr,
    unsigned long iic_data2write
);

unsigned long long GPIO_IIC_Device_A8P16D8_Read (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr
);

unsigned long long GPIO_IIC_Device_A8P16D16_Write (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr,
    unsigned long iic_data2write
);

unsigned long long GPIO_IIC_Device_A8P16D16_Read (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr
);

unsigned short CheckForIIC_Error (
	unsigned long long errorVal
);

#endif
