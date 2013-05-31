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

// The following defines are used by the gpio_iic driver to correctly control
//   the IIC bus.  Note that these are 64 bit numbers.  These are used to build
//   and IIC "player" in SW and / or HW.  There are two types of data, one for
//   the SCL pin and one for the SDA pin.  These values are also generic in that
//   IIC Address, pointer, and data are added in at later steps.  Since IIC is
//   an OpenDrain bus, only when a 0 is present in the bit is the output pin
//   driven to a low, else it floats high.  (This requires an external pullup
//   on the IIC bus, which is part of the specification)

#ifndef GPIO_IIC_LOW_LEVEL_H
#define GPIO_IIC_LOW_LEVEL_H

#define SCL_SET_POINTER8   0xFFFFFFEAAAAAAAAALL
#define SCL_SET_POINTER16  0xFFAAAAAAAAAAAAAALL
#define SCL_WRITE_DATA8    0xAAAABFFFFFFFFFFFLL
#define SCL_WRITE_DATA16   0xAAAAAAAAAFFFFFFFLL
#define SCL_READ_DATA8     0xAAAAAAAAABFFFFFFLL
#define SCL_READ_DATA16    0xAAAAAAAAAAAAAAFFLL

#define SDA_SET_POINTER8   0xFFFFFFE0000C0003LL
#define SDA_SET_POINTER16  0xFF800030000C0003LL
#define SDA_WRITE_DATA8    0x0000DFFFFFFFFFFFLL
#define SDA_WRITE_DATA16   0x0000C00037FFFFFFLL
#define SDA_READ_DATA8     0x80003FFFFDFFFFFFLL
#define SDA_READ_DATA16    0x80003FFFF3FFFF7FLL

#define NUM_IIC_DEV_ADDR_BITS 8
#define NUM_IIC_DATA_BITS_EQ_16 16
#define NUM_IIC_DATA_BITS_EQ_8 16


/*  Function Prototypes */
unsigned long long gpio_iic_set_pointer8 (
     unsigned      long iic_dev_addr,
     unsigned      long iic_pointer_reg
     );

unsigned long long gpio_iic_set_pointer16 (
     unsigned      long iic_dev_addr,
     unsigned      long iic_pointer_reg
     );

unsigned long long gpio_iic_write_data8 (
     unsigned      long data_2_write
     );

unsigned long long gpio_iic_write_data16 (
     unsigned      long data_2_write
     );

unsigned long long gpio_iic_read_data8 (
     unsigned      long iic_dev_addr
     );

unsigned      long gpio_iic_read_data16 (  // HACK HACK HACK
//unsigned long long gpio_iic_read_data16 (
     unsigned      long iic_dev_addr
     );

unsigned long long convert_data_to_iic_dbl (
     unsigned      long sda_data_in,
     int                num_bits_to_convert
	 );

unsigned long long convert_read8_to_8 (
     unsigned long long sda_data_in
     );

unsigned long long convert_read16_to_16 (
     unsigned long long sda_data_in
     );

unsigned long long gpio_iic_talk (
     unsigned long long scl_data,
     unsigned long long scl_dir,
     unsigned long long sda_data,
     unsigned long long sda_dir,
     int                num_bits_to_send
     );

unsigned long long gpio_iic_bus_reset (
     void
     );

#endif
