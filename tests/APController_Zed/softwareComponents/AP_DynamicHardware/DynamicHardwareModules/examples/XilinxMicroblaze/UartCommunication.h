#ifndef UartCommunication_h
#define UartCommunication_h

/***************************** Include Files *********************************/

#include "xparameters.h"
#include "xuartlite.h"
#include "xintc.h"
#include "xil_exception.h"

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define UARTLITE_DEVICE_ID      XPAR_UARTLITE_1_DEVICE_ID
#define INTC_DEVICE_ID          XPAR_INTC_0_DEVICE_ID
#define UARTLITE_INT_IRQ_ID     XPAR_XPS_INTC_0_XPS_UARTLITE_0_INTERRUPT_INTR

/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/

int UartLiteIntrExample(u16 DeviceId);

int UartLitePolledExample(u16 DeviceId);

int SetupInterruptSystem(XUartLite *UartLitePtr);

void SendHandler(void *CallBackRef, unsigned int EventData);

void RecvHandler(void *CallBackRef, unsigned int EventData);

#endif //UartCommunication_h
