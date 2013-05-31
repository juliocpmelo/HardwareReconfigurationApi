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

#include "gpio.h"
#include "xio.h"
#include "xparameters.h"
#include "memory_map.h"

void gpio_Write(unsigned int adr, unsigned int val)
{ 
// HACK FOR NOW!!
// IIC code written for inverted T pins on GPIO, so have to invert to work correctly!
unsigned int tempval;
  if (adr == GPIO_CTRL_REG) 
  {
    tempval = val & 0x00000003;  // preserve lower two bits
    tempval = ~tempval;          // invert lower two bits
    val = val & 0xFFFFFFFC;      // get rid of lower 2 bits in original
    val = val | tempval;         // add lower two bits back in to original
	val = val | 0x40;			 // Force on the GPIO control of IIC instead of the IIC Controller IP
  }
  // END OF HACK
  XIo_Out32(IIC_BASE_ADDRESS+adr, val);
}

unsigned int gpio_Read(unsigned int adr)
{
  unsigned int val;
  unsigned int tempval;

  val = XIo_In32(IIC_BASE_ADDRESS+adr);

  // HACK FOR NOW!!
  // IIC code written for inverted T pins on GPIO, so have to invert to work correctly!
  if (adr == GPIO_CTRL_REG) 
  {
    tempval = val & 0x00000003;  // preserve lower two bits
    tempval = ~tempval;          // invert lower two bits
    val = val & 0xFFFFFFFC;      // get rid of lower 2 bits in original
    val = val | tempval;         // add lower two bits back in to original
  }
  // END OF HACK
  return val;
}

