#ifndef FileFunctions_h
#define FileFunctions_h

#include <iostream>
#include <stdint.h>

namespace Util{
uint8_t* getFileBytes(std::string filename);
int getFileSize(std::string filename);
}

#endif

