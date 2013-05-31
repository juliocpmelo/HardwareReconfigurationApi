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

//  This file is the higher level "driver" for the GPIO based IIC interface.
//  It uses the gpio_iic_low_level.c (.h) files for talking to the GPIO HW
//  These sets of functions are intended to be called by device specific code.
//  For example, LM76.c (.h) or MT24LC32A.c (.h)

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


#include "gpio_iic.h"
#include "gpio_iic_low_level.h"


/*---------------------------------------------------------------------------*/
/*   GPIO_IIC_Device_A8P8D8_Write - Writes byte to IIC dev w/ 8 bit pointer  */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to cause a byte write cycle to the IIC  */
/*         device specified by the input parameters.                         */
/*                                                                           */
/*         The operation commences by calling two different functions, one   */
/*         to set the address and pointer and another to write the actual    */
/*         data.                                                             */
/*                                                                           */
/*         Actual steps of function:                                         */
/*            set_pointer8                                                   */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*            write8                                                         */
/*               8 bit IIC Device data (written)                             */
/*               ACK from Device                                             */
/*               STOP                                                        */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long iic_device_addr -  8 bit Address of the IIC Device  */
/*         unsigned long iic_pointer_addr - 8 bit Pointer addr of the device */
/*         unsigned long iic_data2write -  8 bit data to be written to dev   */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long GPIO_IIC_Device_A8P8D8_Write (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr,
    unsigned long iic_data2write
    )
{
    unsigned long long data_out;
    unsigned long long ptr_err;

    // Send the address and pointer to specified device
    ptr_err  =  gpio_iic_set_pointer8 (
                                        iic_device_addr,
                                        iic_pointer_addr
                                      );

    // Send the 8 bit write data to previously specified device
    data_out =   gpio_iic_write_data8 (
                                        iic_data2write
                                      );

    // Merge any errors and report to next level up
    data_out = data_out | ptr_err;

    return (data_out);

}



/*---------------------------------------------------------------------------*/
/*   GPIO_IIC_Device_A8P8D8_Read - Reads byte from IIC dev w/ 8 bit pointer  */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to cause a byte read cycle to the IIC   */
/*         device specified by the input parameters.                         */
/*                                                                           */
/*         The operation commences by calling two different functions, one   */
/*         to set the address and pointer and another to read the actual     */
/*         data.                                                             */
/*                                                                           */
/*         Actual steps of function:                                         */
/*            set_pointer8                                                   */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*            read8                                                          */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Device data (read)                                */
/*               NACK by Master                                              */
/*               STOP                                                        */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long iic_device_addr -  8 bit Address of the IIC Device  */
/*         unsigned long iic_pointer_addr - 8 bit Pointer addr of the device */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                       lower 8 bits contain data read back */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long GPIO_IIC_Device_A8P8D8_Read (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr
    )
{
    unsigned long long data_out;
    unsigned long long ptr_err;

    // Send the address and pointer to specified device
    ptr_err  =  gpio_iic_set_pointer8 (
                                        iic_device_addr,
                                        iic_pointer_addr
                                      );

    // Send the 8 bit write data to previously specified device
    data_out =   gpio_iic_read_data8 (
                                        iic_device_addr+1
                                      );

    // Merge any errors and report to next level up
    data_out = data_out | ptr_err;

    return (data_out);

}



/*---------------------------------------------------------------------------*/
/*   GPIO_IIC_Device_A8P8D16_Write - Writes 16 bits to IIC dev w/ 8 bit Ptr  */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to cause a byte write cycle to the IIC  */
/*         device specified by the input parameters.                         */
/*                                                                           */
/*         The operation commences by calling two different functions, one   */
/*         to set the address and pointer and another to write the actual    */
/*         data.                                                             */
/*                                                                           */
/*         Actual steps of function:                                         */
/*            set_pointer8                                                   */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*            write16                                                        */
/*               8 bit IIC Device data (written)                             */
/*               ACK from Device                                             */
/*               8 bit IIC Device data (written)                             */
/*               ACK from Device                                             */
/*               STOP                                                        */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long iic_device_addr -  8 bit Address of the IIC Device  */
/*         unsigned long iic_pointer_addr - 8 bit Pointer addr of the device */
/*         unsigned long iic_data2write -  16 bit data to be written to dev  */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long GPIO_IIC_Device_A8P8D16_Write (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr,
    unsigned long iic_data2write
    )
{
    unsigned long long data_out;
    unsigned long long ptr_err;

    // Send the address and pointer to specified device
    ptr_err  =  gpio_iic_set_pointer8 (
                                        iic_device_addr,
                                        iic_pointer_addr
                                      );

    // Send the 8 bit write data to previously specified device
    data_out =   gpio_iic_write_data16 (
                                        iic_data2write
                                      );

    // Merge any errors and report to next level up
    data_out = data_out | ptr_err;

    return (data_out);

}



/*---------------------------------------------------------------------------*/
/*   GPIO_IIC_Device_A8P8D16_Read - Reads 16 bits from IIC dev w/ 8 bit Ptr  */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to cause a byte read cycle to the IIC   */
/*         device specified by the input parameters.                         */
/*                                                                           */
/*         The operation commences by calling two different functions, one   */
/*         to set the address and pointer and another to read the actual     */
/*         data.                                                             */
/*                                                                           */
/*         Actual steps of function:                                         */
/*            set_pointer8                                                   */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*            read16                                                         */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Device data (read)                                */
/*               ACK by Master                                               */
/*               8 bit IIC Device data (read)                                */
/*               NACK by Master                                              */
/*               STOP                                                        */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long iic_device_addr -  8 bit Address of the IIC Device  */
/*         unsigned long iic_pointer_addr - 8 bit Pointer addr of the device */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                       low 16 bits contain data read back  */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long GPIO_IIC_Device_A8P8D16_Read (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr
    )
{
    unsigned long long data_out;
    unsigned long long ptr_err;

    // Send the address and pointer to specified device
    ptr_err  =  gpio_iic_set_pointer8 (
                                        iic_device_addr,
                                        iic_pointer_addr
                                      );

    // Send the 8 bit write data to previously specified device
    data_out =   gpio_iic_read_data16 (
                                        iic_device_addr+1
                                      );

    // Merge any errors and report to next level up
    data_out = data_out | ptr_err;

    return (data_out);

}



/*---------------------------------------------------------------------------*/
/*   GPIO_IIC_Device_A8P16D8_Write - Writes byte to IIC dev w/ 16 bit Ptr    */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to cause a byte write cycle to the IIC  */
/*         device specified by the input parameters.                         */
/*                                                                           */
/*         The operation commences by calling two different functions, one   */
/*         to set the address and pointer and another to write the actual    */
/*         data.                                                             */
/*                                                                           */
/*         Actual steps of function:                                         */
/*            set_pointer8                                                   */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*            write8                                                         */
/*               8 bit IIC Device data (written)                             */
/*               ACK from Device                                             */
/*               STOP                                                        */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long iic_device_addr -  8 bit Address of the IIC Device  */
/*         unsigned long iic_pointer_addr - 16 bit Pointer addr of the dev   */
/*         unsigned long iic_data2write -  8 bit data to be written to dev   */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long GPIO_IIC_Device_A8P16D8_Write (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr,
    unsigned long iic_data2write
    )
{
    unsigned long long data_out;
    unsigned long long ptr_err;

    // Send the address and pointer to specified device
    ptr_err  =  gpio_iic_set_pointer16 (
                                        iic_device_addr,
                                        iic_pointer_addr
                                      );

    // Send the 8 bit write data to previously specified device
    data_out =   gpio_iic_write_data8 (
                                        iic_data2write
                                      );

    // Merge any errors and report to next level up
    data_out = data_out | ptr_err;

    return (data_out);

}



/*---------------------------------------------------------------------------*/
/*   GPIO_IIC_Device_A8P16D8_Read - Reads byte from IIC dev w/ 16 bit Ptr    */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to cause a byte read cycle to the IIC   */
/*         device specified by the input parameters.                         */
/*                                                                           */
/*         The operation commences by calling two different functions, one   */
/*         to set the address and pointer and another to read the actual     */
/*         data.                                                             */
/*                                                                           */
/*         Actual steps of function:                                         */
/*            set_pointer8                                                   */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*            read8                                                          */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Device data (read)                                */
/*               NACK by Master                                              */
/*               STOP                                                        */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long iic_device_addr -  8 bit Address of the IIC Device  */
/*         unsigned long iic_pointer_addr - 16 bit Pointer addr of the dev   */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                       lower 8 bits contain data read back */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long GPIO_IIC_Device_A8P16D8_Read (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr
    )
{
    unsigned long long data_out;
    unsigned long long ptr_err;

    // Send the address and pointer to specified device
    ptr_err  =  gpio_iic_set_pointer16 (
                                        iic_device_addr,
                                        iic_pointer_addr
                                      );
    // Send the 8 bit write data to previously specified device
    data_out =   gpio_iic_read_data8 (
                                        iic_device_addr+1
                                      );


    // Merge any errors and report to next level up
    data_out = data_out | ptr_err;

    return (data_out);

}



/*---------------------------------------------------------------------------*/
/*   GPIO_IIC_Device_A8P16D16_Write - Write 16 bits to IIC dev w/ 16 bit Ptr */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to cause a byte write cycle to the IIC  */
/*         device specified by the input parameters.                         */
/*                                                                           */
/*         The operation commences by calling two different functions, one   */
/*         to set the address and pointer and another to write the actual    */
/*         data.                                                             */
/*                                                                           */
/*         Actual steps of function:                                         */
/*            set_pointer8                                                   */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*            write16                                                        */
/*               8 bit IIC Device data (written)                             */
/*               ACK from Device                                             */
/*               8 bit IIC Device data (written)                             */
/*               ACK from Device                                             */
/*               STOP                                                        */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long iic_device_addr -  8 bit Address of the IIC Device  */
/*         unsigned long iic_pointer_addr - 16 bit Pointer addr of the dev   */
/*         unsigned long iic_data2write -  16 bit data to be written to dev  */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long GPIO_IIC_Device_A8P16D16_Write (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr,
    unsigned long iic_data2write
    )
{
    unsigned long long data_out;
    unsigned long long ptr_err;

    // Send the address and pointer to specified device
    ptr_err  =  gpio_iic_set_pointer16 (
                                        iic_device_addr,
                                        iic_pointer_addr
                                      );

    // Send the 8 bit write data to previously specified device
    data_out =   gpio_iic_write_data16 (
                                        iic_data2write
                                      );

    // Merge any errors and report to next level up
    data_out = data_out | ptr_err;

    return (data_out);

}



/*---------------------------------------------------------------------------*/
/*   GPIO_IIC_Device_A8P16D16_Read - Read 16 bits from IIC dev w/ 16 bit Ptr */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to cause a 16 bit read cycle to the IIC */
/*         device specified by the input parameters.                         */
/*                                                                           */
/*         The operation commences by calling two different functions, one   */
/*         to set the address and pointer and another to read the actual     */
/*         data.                                                             */
/*                                                                           */
/*         Actual steps of function:                                         */
/*            set_pointer8                                                   */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*               8 bit IIC Pointer address byte (also called "control")      */
/*               ACK from Device                                             */
/*            read16                                                         */
/*               START                                                       */
/*               8 bit IIC Device Address                                    */
/*               ACK from Device                                             */
/*               8 bit IIC Device data (read)                                */
/*               ACK by Master                                               */
/*               8 bit IIC Device data (read)                                */
/*               NACK by Master                                              */
/*               STOP                                                        */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long iic_device_addr -  8 bit Address of the IIC Device  */
/*         unsigned long iic_pointer_addr - 16 bit Pointer addr of the dev   */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         unsigned long long data_out - error value if upper bits are set   */
/*                                       low 16 bits contain data read back  */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long long GPIO_IIC_Device_A8P16D16_Read (
    unsigned long iic_device_addr,
    unsigned long iic_pointer_addr
    )
{
    unsigned long long data_out;
    unsigned long long ptr_err;

    // Send the address and pointer to specified device
    ptr_err  =  gpio_iic_set_pointer16 (
                                        iic_device_addr,
                                        iic_pointer_addr
                                      );

    // Send the 8 bit write data to previously specified device
    data_out =   gpio_iic_read_data16 (
                                        iic_device_addr+1
                                      );

    // Merge any errors and report to next level up
    data_out = data_out | ptr_err;

    return (data_out);

}


/*---------------------------------------------------------------------------*/
/*   CheckForIIC_Error - Checks to see if was an error                       */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function is designed to cause a 16 bit read cycle to the IIC */
/*---------------------------------------------------------------------------*/
unsigned short CheckForIIC_Error(
	unsigned long long errorVal
	)
{
    // Lets see if we were returned any errors
    if (errorVal & GPIO_IIC_ADDR_ACK_ERR)
      {
        // getting here means the device failed to ACK the IIC address
        //   is a likely indication that the device is not there
        return (ERR_GPIO_IIC_NO_ADDR_ACK);
      }
    else if (errorVal & GPIO_IIC_POINTER_ACK_ERR)
      {
        // getting here means the device failed to ACK the pointer byte
        //   is a likely indication that another device is conflicting this address
        return (ERR_GPIO_IIC_NO_POINTER_ACK);
      }
    else if (errorVal & GPIO_IIC_READ_ADDR_ACK_ERR)
      {
        // getting here means the device failed to ACK the data read byte
        //   is a likely indication that another device is conflicting this address
        return (ERR_GPIO_IIC_NO_READ_ACK);
      }

    return (0x0);
}
