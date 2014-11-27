
#include "BufferFunctions.h"
#include <string.h>

int Util::readInt(uint8_t *buf){
  int retVal = buf[3];
  int aux = buf[2];
  retVal = retVal | aux << 8;
  aux = buf[1] ;
  retVal = retVal | aux << 16;
  aux = buf[0];
  retVal = retVal | aux << 24;
  return retVal;
}


int Util::readInt_bigEndian(uint8_t *buf){
  int retVal = buf[0];
  int aux = buf[1];
  retVal = retVal | aux << 8;
  aux = buf[2] ;
  retVal = retVal | aux << 16;
  aux = buf[3];
  retVal = retVal | aux << 24;
  return retVal;
}

void Util::writeInt(unsigned char *destBuf, int value){

  destBuf[3] = (unsigned char) (value & 0x000000ff);
  destBuf[2] = (unsigned char) ((value & 0x0000ff00) >> 8);
  destBuf[1] = (unsigned char) ((value & 0x00ff0000) >> 16);
  destBuf[0] = (unsigned char) ((value & 0xff000000) >> 24);
}

uint8_t* Util::concatBuffers(uint8_t *bufferA, int bufferAsize, uint8_t *bufferB, int bufferBsize){

	uint8_t *retBuffer = new uint8_t[bufferAsize + bufferBsize];
	memcpy(retBuffer, bufferA, bufferAsize);
	memcpy(retBuffer + bufferAsize, bufferB, bufferBsize);
	return retBuffer;
}

