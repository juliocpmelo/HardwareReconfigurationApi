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

//  This file uses a two bit GPIO port to implement a IIC bus master device.
//    The gpio_iic code contained herein is designed to allow a flexible
//    implementation of IIC.  It provides a set of functions which higher level
//    IIC device specific drivers will use to implement their intended
//    functions.


#include "gpio_iic_low_level.h"
#include "gpio_iic.h"
#include "sleep.h"
#include "gpio.h"



/*---------------------------------------------------------------------------*/
/*   gpio_iic_set_pointer8  - function to write a 8 bit pointer byte         */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to write a the 8 bit pointer to the     */
/*         specified IIC device (based upon its address).  It must be        */
/*         followed by one of the following to complete the IIC cycle:       */
/*             gpio_write_data8 ();                                          */
/*             gpio_write_data16 ();                                         */
/*             gpio_read_data8 ();                                           */
/*             gpio_read_data16 ();                                          */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long long scl_data - 64 bit base constant for SCL        */
/*         unsigned long long sda_data - 64 bit base constant for SDA        */
/*         unsigned      long iic_dev_addr - 8 bit address of IIC device     */
/*         unsigned      long iic_pointer_reg - Which reg to talk to in dev  */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long gpio_iic_set_pointer8 (
     unsigned      long iic_dev_addr,
     unsigned      long iic_pointer_reg
     )
{
     unsigned long long iic_addr_temp;
     unsigned long long iic_pointer_temp;
     unsigned long long temp1;
     unsigned long long error;
     unsigned long long scl_data;
     unsigned long long sda_data;

     int shift_val = 20;
     // Set up initial values for the operation
     scl_data = SCL_SET_POINTER8;
     sda_data = SDA_SET_POINTER8;

     // Prepare the IIC Device Address field
     iic_addr_temp = convert_data_to_iic_dbl (iic_dev_addr, NUM_IIC_DEV_ADDR_BITS);
     iic_addr_temp = iic_addr_temp & 0x000000000000FFFFULL;
         // Now shift to correct posistion so can be ORd into sda_data;
     iic_addr_temp = iic_addr_temp << shift_val;


     // Prepare the IIC Pointer address field
     iic_pointer_temp = convert_data_to_iic_dbl (iic_pointer_reg, NUM_IIC_DATA_BITS_EQ_8);
     iic_pointer_temp  = iic_pointer_temp & 0x000000000000FFFFULL;
         // have to move it over two to leave room for the device's ACK
     iic_pointer_temp = iic_pointer_temp << 2;


     // Prepare the final IIC Device Address and Pointer address fields
     iic_pointer_temp = iic_addr_temp | iic_pointer_temp;
         // Now create the final sda_data
     sda_data = sda_data | iic_pointer_temp;


     // OK, lets talk to the IIC device
     temp1 = gpio_iic_talk (  scl_data,
                             ~scl_data,
                              sda_data,
                             ~sda_data,
                             64
                           );

     // Error check before we leave
     error = 0x0;
     if      (temp1 & 0x0000000000040000ULL)
       {
       // should never get here!
       error = GPIO_IIC_ADDR_ACK_ERR;
       }
     if (temp1 & 0x0000000000000001ULL)
       {
       // should never get here!
       error = error | GPIO_IIC_POINTER_ACK_ERR;
       }

     return (error);

}



/*---------------------------------------------------------------------------*/
/*   gpio_iic_set_pointer16  - function to write a 16 bit pointer byte       */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to write a the 16 bit pointer to the    */
/*         specified IIC device (based upon its address).  It must be        */
/*         followed by one of the following to complete the IIC cycle:       */
/*             gpio_write_data8 ();                                          */
/*             gpio_write_data16 ();                                         */
/*             gpio_read_data8 ();                                           */
/*             gpio_read_data16 ();                                          */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long long scl_data - 64 bit base constant for SCL        */
/*         unsigned long long sda_data - 64 bit base constant for SDA        */
/*         unsigned      long iic_dev_addr - 8 bit address of IIC device     */
/*         unsigned      long iic_pointer_reg - Which reg to talk to in dev  */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long gpio_iic_set_pointer16 (
     unsigned      long iic_dev_addr,
     unsigned      long iic_pointer_reg
     )
{
     unsigned long long iic_addr_temp;
     unsigned long long iic_pointer_temp;
     unsigned long long temp1;
     unsigned long long error;
     unsigned long long scl_data;
     unsigned long long sda_data;

     int shift_val = 38;
     // Set up initial values for the operation
     scl_data = SCL_SET_POINTER16;
     sda_data = SDA_SET_POINTER16;

     // Prepare the IIC Device Address field
     iic_addr_temp = convert_data_to_iic_dbl (iic_dev_addr, NUM_IIC_DEV_ADDR_BITS);
     iic_addr_temp = iic_addr_temp & 0x000000000000FFFFULL;
         // Now shift to correct posistion so can be ORd into sda_data;
     iic_addr_temp = iic_addr_temp << shift_val;


     // Prepare the IIC Pointer address field
     iic_pointer_temp = convert_data_to_iic_dbl (iic_pointer_reg, NUM_IIC_DATA_BITS_EQ_16);
     temp1  = iic_pointer_temp & 0x00000000FFFFFFFFULL;
         //  Get the upper "byte"
     temp1  = temp1  & 0x00000000FFFF0000ULL;
         // have to move it over two to leave room for the device's ACK
     temp1  = temp1 << 2;
         // have to clear the bits we just moved over for
     iic_pointer_temp = iic_pointer_temp & 0x000000000000FFFFULL;
         // combine together for final pointer bit pattern
     iic_pointer_temp = iic_pointer_temp | temp1;
         // Now shift to correct posistion so can be ORd
     iic_pointer_temp = iic_pointer_temp << 2;


     // Prepare the final IIC Device Address and Pointer address fields
     iic_pointer_temp = iic_addr_temp | iic_pointer_temp;
         // Now create the final sda_data
     sda_data = sda_data | iic_pointer_temp;


     // OK, lets talk to the IIC device
     temp1 = gpio_iic_talk (  scl_data,
                             ~scl_data,
                              sda_data,
                             ~sda_data,
                             64
                           );


     // Error check before we leave
     error = 0x0;
     if      (temp1 & 0x0000001000000000ULL)
       {
       // should never get here!
       error = GPIO_IIC_ADDR_ACK_ERR;
       }
     if (temp1 & 0x0000000000040000ULL)
       {
       // should never get here!
       error = error | GPIO_IIC_POINTER_ACK_ERR;
       }
     if (temp1 & 0x0000000000000001ULL)
       {
       // should never get here!
       error = error | GPIO_IIC_POINTER_ACK2_ERR;
       }

     return (error);

}



/*---------------------------------------------------------------------------*/
/*   gpio_iic_write_data8  - function to do write8 cycle after pointer set  */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to write a 8 bit value to the IIC bus   */
/*         once the proper IIC pointer address has been sent.  Note that the */
/*         pointer address must be sent first, or the code will do the wrong */
/*         things on the bus.  This function is designed to be called only   */
/*         by functions inside the iic.c file.                               */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long long scl_data - 64 bit base constant for SCL        */
/*         unsigned long long sda_data - 64 bit base constant for SDA        */
/*         unsigned      long data_2_write - 8 bit data to be written        */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long gpio_iic_write_data8 (
     unsigned      long data_2_write
     )
{
     unsigned long long temp;
     unsigned long long temp1;
     unsigned long long error;
     unsigned long long scl_data;
     unsigned long long sda_data;

     int shift_val = 48;
     // Set up initial values for the operation
     scl_data = SCL_WRITE_DATA8;
     sda_data = SDA_WRITE_DATA8;

     // Got to make the incoming data into the DBL to send to IIC
     temp = convert_data_to_iic_dbl (data_2_write, NUM_IIC_DATA_BITS_EQ_8);
     temp  = temp & 0x000000000000FFFFULL;
     // Now shift to correct posistion so can be ORd into sda_data;
     temp = temp << shift_val;

     sda_data = sda_data | temp;

     // OK, lets talk to the IIC device
     temp1 = gpio_iic_talk (  scl_data,
                             ~scl_data,
                              sda_data,
                             ~sda_data,
                             64
                           );


     // Error check before we leave
     error = 0x0;
     if      (temp1 & 0x0000400000000000ULL)
       {
       // should never get here!
       error = GPIO_IIC_WRITE8_ACK_ERR;
       }

     return (error);

}



/*---------------------------------------------------------------------------*/
/*   gpio_iic_write_data16  - function to do write16 cycle after pointer set */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to write a 16 bit value to the IIC bus  */
/*         once the proper IIC pointer address has been sent.  Note that the */
/*         pointer address must be sent first, or the code will do the wrong */
/*         things on the bus.  This function is designed to be called only   */
/*         by functions inside the iic.c file.                               */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long long scl_data - 64 bit base constant for SCL        */
/*         unsigned long long sda_data - 64 bit base constant for SDA        */
/*         unsigned      long data_2_write - 16 bit data to be written       */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long gpio_iic_write_data16 (
     unsigned      long data_2_write
     )
{
     unsigned long long temp;
     unsigned long long temp1;
     unsigned long long error;
     unsigned long long scl_data;
     unsigned long long sda_data;

     int test = 30;
     // Set up initial values for the operation
     scl_data = SCL_WRITE_DATA16;
     sda_data = SDA_WRITE_DATA16;

     // Got to make the incoming data into the DBL to send to IIC
     temp = convert_data_to_iic_dbl (data_2_write, NUM_IIC_DATA_BITS_EQ_16);
     temp  = temp & 0x00000000FFFFFFFFULL;
     //  Get the upper "byte"
     temp1 = temp & 0x00000000FFFF0000ULL;
     // have to move it over two to leave room for the device's ACK
     temp1 = temp1 << 2;
     // have to clean the old bits we just moved
     temp = temp & 0x000000000000FFFFULL;
     // Put the word back together now
     temp = temp | temp1;
     // Now shift to correct posistion so can be ORd into sda_data;
     temp = temp << test;

     sda_data = sda_data | temp;

     // OK, lets talk to the IIC device
     temp1 = gpio_iic_talk (  scl_data,
                             ~scl_data,
                              sda_data,
                             ~sda_data,
                             64
                           );


     // Error check before we leave
     error = 0x0;
     if      (temp1 & 0x0000400000000000ULL)
       {
       // should never get here!
       error = GPIO_IIC_WRITE16_FIRST_ACK_ERR;
       }
     if (temp1 & 0x0000000010000000ULL)
       {
       // should never get here!
       error = error | GPIO_IIC_WRITE16_SECOND_ACK_ERR;
       }

     return (error);
}



/*---------------------------------------------------------------------------*/
/*   gpio_iic_read_data8  - function to do read cycle after pointer set      */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to read a 16 bit value from the IIC bus */
/*         once the proper IIC pointer address has been sent.  Note that the */
/*         pointer address must be sent first, or the code will do the wrong */
/*         things on the bus.  This function is designed to be called only   */
/*         by functions inside the iic.c file.                               */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long long scl_data - 64 bit base constant for SCL        */
/*         unsigned long long sda_data - 64 bit base constant for SDA        */
/*         unsigned      long iic_dev_addr - 8 bit address of IIC device     */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - 8 bit value out, right justified    */
/*                                       leaves bit62 set if no Address ACK  */
/*                                       from the device during address      */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long gpio_iic_read_data8 (
     unsigned      long iic_dev_addr
     )
{
     unsigned long long temp;
     unsigned long long data_out;
     unsigned long long scl_data;
     unsigned long long sda_data;

     int shift_val = 46;
     // Set up initial values for the operation
     scl_data = SCL_READ_DATA8;
     sda_data = SDA_READ_DATA8;

     // Generate the final correct SDA data, based upon which IIC Address we want
     //  NOTE:  This assumes the eight bit address for now; will need to alter to allow for 11 bit
     temp = convert_data_to_iic_dbl( (unsigned long long) iic_dev_addr, NUM_IIC_DEV_ADDR_BITS );
     temp = temp << shift_val;

     sda_data = sda_data | temp;

     // OK, lets talk to the IIC device
     data_out = gpio_iic_talk (  scl_data,
                                ~scl_data,
                                 sda_data,
                                ~sda_data,
                                64
                              );

     // Now convert the data to usable form
     temp = data_out;

     // Check to see that the Addr ACK was received
     if (data_out & 0x0000100000000000ULL)
       {
        // If we're here, we have a problem!
        return (data_out | GPIO_IIC_READ_ADDR_ACK_ERR);
       }
     else
       {
       data_out = convert_read8_to_8 (temp);
       return (data_out);
       }



}



/*---------------------------------------------------------------------------*/
/*   gpio_iic_read_data16  - function to do read cycle after pointer set     */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to read a 16 bit value from the IIC bus */
/*         once the proper IIC pointer address has been sent.  Note that the */
/*         pointer address must be sent first, or the code will do the wrong */
/*         things on the bus.  This function is designed to be called only   */
/*         by functions inside the iic.c file.                               */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long long scl_data - 64 bit base constant for SCL        */
/*         unsigned long long sda_data - 64 bit base constant for SDA        */
/*         unsigned      long iic_dev_addr - 8 bit address of IIC device     */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - 16 bit value out, right justified   */
/*                                       leaves bit62 set if no Address ACK  */
/*                                       from the device during address      */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long gpio_iic_read_data16 (
     unsigned      long iic_dev_addr
     )
{
     unsigned long long temp;
     unsigned long long data_out;
     unsigned long long scl_data;
     unsigned long long sda_data;
	 unsigned      long real_data_out;

     int shift_val = 46;
     // Set up initial values for the operation
     scl_data = SCL_READ_DATA16;
     sda_data = SDA_READ_DATA16;

     // Generate the final correct SDA data, based upon which IIC Address we want
     //  NOTE:  This assumes the eight bit address for now; will need to alter to allow for 11 bit
     temp = convert_data_to_iic_dbl( (unsigned long long) iic_dev_addr, NUM_IIC_DEV_ADDR_BITS );
     temp = temp << shift_val;

     sda_data = sda_data | temp;

     // OK, lets talk to the IIC device
     data_out = gpio_iic_talk (  scl_data,
                                ~scl_data,
                                 sda_data,
                                ~sda_data,
                                64
                              );
     data_out = data_out & 0x00003FFFF3FFFC00ULL;

     // Now convert the data to usable form
     temp = data_out;

     // Check to see that the Addr ACK was received
     if (data_out & 0x0000100000000000ULL)
       {
        // If we're here, we have a problem!
        return (data_out | GPIO_IIC_READ_ADDR_ACK_ERR);
       }
     else
       {
       data_out = convert_read16_to_16 (temp);
	   real_data_out = (unsigned long) data_out;
       return (real_data_out);
       }
}


/*---------------------------------------------------------------------------*/

/*   convert_data_to_iic_dbl - function converts n bits to IIC doubled bits  */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to convert the input data to a 32 bit   */
/*         IIC based data.  It basically turns the n bit value into a 32     */
/*         bit value where each bit was duplicated twice from the 16 bit     */
/*         value.  It will leave returned value in the following form:       */
/*                                                                           */
/*           Bit Num in                                                      */
/*          ---------------------------------------------------------------- */
/*          6666555555555544444444443333333333222222222211111111110000000000 */
/*          3210987654321098765432109876543210987654321098765432109876543210 */
/*          ---------------------------------------------------------------- */
/*          ................................DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD */
/*                                          11111111111199887766554433221100 */
/*                                          554433221100                     */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long long sda_data_in - 64 bit value to convert from     */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - 64 bit value with doubled data      */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long convert_data_to_iic_dbl (
     unsigned      long data_in,
     int                num_bits_to_convert
     )
{
     unsigned      long mask1    = 0x1;
     unsigned long long mask2    = 0x3;
     unsigned long long data_out = 0x0;
     int i;

     for (i = 0; i < num_bits_to_convert; i++)
     {
       if (mask1 & data_in)
         {
           data_out = data_out | mask2;
         }
       mask2 = mask2 << 2;
       mask1 = mask1 << 1;
    }
      return (data_out);
}



/*---------------------------------------------------------------------------*/
/*   convert_read8_to_8  - function to convert doubled IIC data to 8 bits    */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to convert the data returned from the   */
/*         gpio_iic_talk function into a 8 bit value that is right side      */
/*         justified.  It is up to the caller to look in the appropriate of  */
/*         the 8 bits to determine signed aspects of the numbers.  This is   */
/*         is because some devices use 7 bit signed numbers, etc.            */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long long sda_data_in - 64 bit value to convert from     */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - 8 bit value out, right justified    */
/*                                       leaves bit62 set if no Address ACK  */
/*                                       from the device during address      */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long convert_read8_to_8 (
     unsigned long long sda_data_in
     )
{
     unsigned long long temp;
     unsigned      long data_out = 0x0;


     unsigned long long mask1; // every bit access
     unsigned long long mask2; // every other bit access
     int                i;

     // Check that we received the ACK from the address
     if ( ~sda_data_in & 0x0000100000000000ULL )
       {
         // we got an address ack, do go process 8 bit data
         // Clear off all but data bits
         sda_data_in = sda_data_in & 0x0000055550000000ULL;
         // shift the data "bytes" down by 28 bits so true LSB of data is in real LSB.
         sda_data_in = sda_data_in >> 28;

             // sda_data_in now consists of data in the following form:
             //           Bit Num in
             //   ----------------------------------------------------------------
             //   6666555555555544444444443333333333222222222211111111110000000000
             //   3210987654321098765432109876543210987654321098765432109876543210
             //   ----------------------------------------------------------------
             //   .................................................D.D.D.D.D.D.D.D
             //                                                    7 6 5 4 3 2 1 0


         // now construct the 8 bit data from the 16 bit "sparsed" data (xBxB...xB, B=valid bit)
         mask1 = 0x2;
         mask2 = 0x4;

         for (i = 0; i < 8; i++)
           {
             // check to see if the bit is set
             temp = sda_data_in & mask2;
             if     (temp) sda_data_in = sda_data_in |   mask1;   // yes, write a 1 to the data
               else        sda_data_in = sda_data_in & (~mask1);  // no,  write a 0 to the data

             // Manipulate the masks so data is correctly oriented
             mask2 = mask2 << 2; // shift by two to read  bits
             mask1 = mask1 << 1; // shift by one to write bits
           }
          // Ok, lets send the final data
          data_out = sda_data_in & 0x000000FF;  // data_out now is final
       }
     else  // if we got here, we didn't get Adr ACK from device
       {
          data_out = data_out | GPIO_IIC_READ_ADDR_ACK_ERR;  // set MSB of data_out if ACK error
       }
  return (data_out);
}



/*---------------------------------------------------------------------------*/
/*   convert_read16_to_16  - function to convert doubled IIC data to 16 bits */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to convert the data returned from the   */
/*         gpio_iic_talk function into a 16 bit value that is right side     */
/*         justified.  It is up to the caller to look in the appropriate of  */
/*         the 16 bits to determine signed aspects of the numbers.  This is  */
/*         is because some devices use 13 bit signed numbers, etc.           */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long long sda_data_in - 64 bit value to convert from     */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned      long data_out - 16 bit value out, right justified   */
/*                                       leaves bit62 set if no Address ACK  */
/*                                       from the device during address      */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long convert_read16_to_16 (
     unsigned long long sda_data_in
     )
{
     unsigned long long temp;
     unsigned      long data_out = 0x0;

     unsigned long long mask1; // every bit access
     unsigned long long mask2; // every other bit access
     int                i;

     // Check that we received the ACK from the address
     if ( ~sda_data_in & 0x0000100000000000ULL )
       {
         // we got an address ack, do go process 16 bit data
         // Clear off all but data bits
         sda_data_in = sda_data_in & 0x0000055551555400ULL;
         // copy the high eight bits to temp
         temp =        sda_data_in & 0x0000055550000000ULL;
         // shift bits down by two to eliminate the master ACK between D8 and D7
         temp = temp >> 2;
         // Clean off the old upper bits in original value
         sda_data_in = sda_data_in & 0x0000000001555400ULL;
         // Put both "bytes" together now ('OR' in the upper byte in correct place)
         sda_data_in = sda_data_in | temp;
         // shift the data "bytes" down by 10 bits so true LSB of data is in real LSB.
         sda_data_in = sda_data_in >> 10;

             // sda_data_in now consists of data in the following form:
             //           Bit Num in
             //   ----------------------------------------------------------------
             //   6666555555555544444444443333333333222222222211111111110000000000
             //   3210987654321098765432109876543210987654321098765432109876543210
             //   ----------------------------------------------------------------
             //   .................................D.D.D.D.D.D.D.D.D.D.D.D.D.D.D.D
             //                                    1 1 1 1 1 1 9 8 7 6 5 4 3 2 1 0
             //                                    5 4 3 2 1 0

         // now construct the 16 bit data from the 32 bit "sparsed" data (xBxB...xB, B=valid bit)
         mask1 = 0x2;
         mask2 = 0x4;

         for (i = 0; i < 16; i++)
           {
             // check to see if the bit is set
             temp = sda_data_in & mask2;
             if     (temp) sda_data_in = sda_data_in |   mask1;   // yes, write a 1 to the data
               else        sda_data_in = sda_data_in & (~mask1);  // no,  write a 0 to the data

             // Manipulate the masks so data is correctly oriented
             mask2 = mask2 << 2; // shift by two to read  bits
             mask1 = mask1 << 1; // shift by one to write bits
           }
          // Ok, lets send the final data
          data_out = sda_data_in & 0x0000FFFF;  // data_out now is final
       }
     else  // if we got here, we didn't get Adr ACK from device
       {
          data_out = data_out | GPIO_IIC_READ_ADDR_ACK_ERR;  // set MSB of data_out if ACK error
       }
  return (data_out);
}



/*---------------------------------------------------------------------------*/
/*   gpio_iic_talk    - function that acts as IIC Master Device on GPIO pins */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to generically output the IIC bits to   */
/*         the GPIO.  It uses a 64 bit constant, and begins by outputing the */
/*         MSB of each constant.  This is done so that what is looked at on  */
/*         paper in binary form, or on a scope trace will look just like the */
/*         data sheet for the device.  This function does no error checking. */
/*         Error checking is to be contextualy performed on the data that is */
/*         returned by this function.                                        */
/*                                                                           */
/*         The SDA data is "1/2" clock ahead of the SCL data.  This is to    */
/*         properly allow for start and stop bits in the overall frame.      */
/*         The constants are sent down to the GPIO O and T pins, and are     */
/*         collected from the I pin of the SDA pin.  At this time, slave     */
/*         IIC accesses are not permitted.                                   */
/*                                                                           */
/*         This function assumes that bit 0 of the GPIO is the SCL pin and   */
/*         that bit 1 of the GPIO is the SDA pin.                            */
/*                                                                           */
/*         This function was built to be generic so that it can flexible for */
/*         and further IIC operations which are not yet forseen.             */
/*                                                                           */
/*         IMPORTANT NOTE:  This function ALWAYS leaves the SCL and SDA pins */
/*         in the threestate condition (High-z) when completed.  This will   */
/*         generally mean that they will be pulled high, even if last bit in */
/*         the shift is low.  This is important if back-2-back operations    */
/*         are desired with this function.  Plan ahead!                      */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long long scl_data - 64 bit value of GPIO0.Output        */
/*         unsigned long long scl_dir  - 64 bit value of GPIO0.threestate    */
/*                                       1 = driven, 0 = threestate          */
/*         unsigned long long sda_data - 64 bit value of GPIO1.Output        */
/*         unsigned long long sda_dir  - 64 bit value of GPIO1.threestate    */
/*                                       1 = driven, 0 = threestate          */
/*         int       num_bits_to_send  - # of bits of the 64 to send,        */
/*                                       counting from the MSB as first bit  */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_returned - 64 bit constant that reads any */
/*                                            bit from SDA that was not      */
/*                                            written by the function.  This */
/*                                            allows for ACK, NACK and data  */
/*                                            read detections.               */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long gpio_iic_talk (
    unsigned long long scl_data,
    unsigned long long scl_dir,
    unsigned long long sda_data,
    unsigned long long sda_dir,
    int                num_bits_to_send
    )
{
    int i;
    unsigned long long bitmask       = 0x8000000000000000ULL; // must be set at bit63 before starting
    unsigned      long gpio_ctrl     = 0x0;                // must be clear before starting
    unsigned      long gpio_data     = 0x0;                // must be clear before starting
    unsigned      long temp          = 0x0;                // must be clear before starting
    unsigned long long data_returned = 0x0;                // must be clear before starting


    // save original contents of GPIO so are not disturbed by our actions!
    gpio_ctrl = gpio_Read(GPIO_CTRL_REG);
    gpio_data = gpio_Read(GPIO_DATA_REG);
    gpio_ctrl = gpio_ctrl & 0xFFFFFFFD; // clear two LSBs, preserve the rest
    gpio_data = gpio_data & 0xFFFFFFFD; // clear two LSBs, preserve the rest

    for (i = 0; i < num_bits_to_send; i++)
    {

    /*  Begin data phase of SDA and SCL outputting */
    /* ------------------------------------------- */

        // this transaction writes a SDA data bit and maintains the SCL data bit
        if (bitmask & sda_dir)
        {
            // checking the actual GPIO data that's being written
            if     (bitmask & sda_data) gpio_data = gpio_data | 0x02;
              else                      gpio_data = gpio_data & 0xFFFFFFFD;
            gpio_Write(GPIO_DATA_REG, gpio_data);
        }
        else // this transaction is a read, remember the data off the bus
        {
            temp = gpio_Read(GPIO_DATA_REG);
            if (temp & 0x02) data_returned = data_returned | bitmask;  // keep the read data
        }

        // prepare the direction for data phase  (Send last to avoid glitches on SDA/SCL)
        if     (bitmask & sda_dir) gpio_ctrl = gpio_ctrl | 0x02;
          else                     gpio_ctrl = gpio_ctrl & 0xFFFFFFFD;
        // write the SDA and SCL dir pins -- note first time thru SCL dir will be 0 (high-z)
        gpio_Write(GPIO_CTRL_REG, gpio_ctrl);

        // wait for ~5us before letting the code go on; times the IIC bus speed
        usleep(5);  // WARNING this routine doesn't guarantee exact time!!!


    /*  Begin clock phase of SDA and SCL outputting */
    /* -------------------------------------------- */

       // this transaction writes a clock bit
        if (bitmask & scl_dir)
        {
           // checking the actual data that's being written
            if     (bitmask & scl_data) gpio_data = gpio_data | 0x01;
              else                      gpio_data = gpio_data & 0xFFFFFFFE;
            gpio_Write(GPIO_DATA_REG, gpio_data);
        }

        // prepare the direction for clock phase  (Send last to avoid glitches on SDA/SCL)
        if     (bitmask & scl_dir) gpio_ctrl = gpio_ctrl | 0x01;
          else                     gpio_ctrl = gpio_ctrl & 0xFFFFFFFE;
        gpio_Write(GPIO_CTRL_REG, gpio_ctrl);

        // wait for ~5us before letting the code go on; times the IIC bus speed
        usleep(5);  // WARNING this routine doesn't guarantee exact time!!!

        // bump the bitmask down to left side for next bit (towards LSB)
        bitmask = bitmask >> 1;

     }

     // force SCL and SDA back to high Z
     //gpio_Write(GPIO_CTRL_REG, gpio_ctrl & 0xFFFFFFFC);

     return (data_returned);  // this contains the SDA data "read" from the bus when not driven by us
}



/*---------------------------------------------------------------------------*/
/*   gpio_iic_bus_reset - Resets the devices on the IIC bus                  */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to cause all IIC devices to reset       */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         void                                                              */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_returned - 0, unless error                */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long gpio_iic_bus_reset (
    void
    )
{
    int i;
    unsigned      long gpio_ctrl     = 0x0;                // must be clear before starting
    unsigned      long gpio_data     = 0x0;                // must be clear before starting

      // preserve the original values
      gpio_data = gpio_Read(GPIO_DATA_REG);
      gpio_ctrl = gpio_Read(GPIO_DATA_REG);


      for (i = 0; i < 24; i++)
        {
          // Set up the clock and data lines for driving (data Phase)
          gpio_Write(GPIO_DATA_REG, ((0xFFFFFFFC & gpio_data)+0x3));  // set SDA and SCL
          gpio_Write(GPIO_CTRL_REG, ((0xFFFFFFFC & gpio_ctrl)));      // Set SDA SCL to Z
          usleep(5); // wait the clock out
          // Set up the clock and data lines for driving (clock Phase)
          gpio_Write(GPIO_DATA_REG, ((0xFFFFFFFC & gpio_data)+0x2));  // set SDA and SCL
          gpio_Write(GPIO_CTRL_REG, ((0xFFFFFFFC & gpio_ctrl)+0x1));  // Actually Drive SCL
          usleep(5); // wait the clock out
        }

    // force SCL and SDA back to high Z
    gpio_Write(GPIO_CTRL_REG, 0xFFFFFFFC & gpio_ctrl);

    return (0x0);
}
