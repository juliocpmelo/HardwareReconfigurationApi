
#ifndef BufferFunctions_h
#define BufferFunctions_h
#include "Types.h"

/**
 * \brief writes the bytes of value into buf using little endian format. Thus buf[0] is the
 * msb and buf[3] is the lsb.
 **/
uint32_t BufferFunctions_readInt(uint8_t *buff);

/**
 * \brief reads an int from buffer using little endian format. Thus buf[0] is the
 * msb and buf[3] is the lsb.
 **/
void BufferFunctions_writeInt(uint8_t *destBuf, int32_t value);

#endif // BufferFunctions_h
