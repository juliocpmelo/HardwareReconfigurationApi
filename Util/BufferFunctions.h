#ifndef BufferFunctions_h
#define BufferFunctions_h
#include <stdint.h>

namespace Util{
/**
 * \brief reads the first 4 bytes in buf and coverts then as the first
 * for bytes of a int value, using the little endian format. Thus buf[0] is the
 * msb and buf[3] is the lsb.
 **/
int readInt(uint8_t *buf);

/**
 * \brief reads the first 4 bytes in buf and coverts then as the first
 * for bytes of a int value, using the big endian format. Thus buf[3] is the
 * msb and buf[0] is the lsb.
 **/
int readInt_bigEndian(uint8_t *buf);

/**
 * \brief writes the bytes of value into buf using little endian format. Thus buf[0] is the
 * msb and buf[3] is the lsb.
 **/
void writeInt(unsigned char *destBuf, int value);

uint8_t* concatBuffers(uint8_t *bufferA, int bufferAsize, uint8_t *bufferB, int bufferBsize);

}

#endif //BufferFunctions_h
