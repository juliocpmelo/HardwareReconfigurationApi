#include "BufferFunctions.h"

void BufferFunctions_writeInt(uint8_t *destBuf, int32_t value){

  destBuf[3] = (uint8_t) (value & 0x000000ff);
  destBuf[2] = (uint8_t) ((value & 0x0000ff00) >> 8);
  destBuf[1] = (uint8_t) ((value & 0x00ff0000) >> 16);
  destBuf[0] = (uint8_t) ((value & 0xff000000) >> 24);
}

uint32_t BufferFunctions_readInt(uint8_t *buff){
	uint32_t aux, retVal;
	retVal = buff[3];
	aux = buff[2];
	retVal |= aux<<8;
	aux = buff[1];
	retVal |= aux<<16;
	aux = buff[0];
	retVal |= aux<<24;
	return retVal;
}


