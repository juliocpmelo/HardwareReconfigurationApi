
#include "FileFunctions.h"
#include <fstream>

using namespace std;

uint8_t* Util::getFileBytes(std::string filename){
	
	ifstream file (filename.c_str(), ios::in|ios::binary|ios::ate);

	int size = file.tellg();
	uint8_t *memblock = new uint8_t[size];

	file.seekg (0, ios::beg);
	file.read ((char*)memblock, size);
	file.close();

	return memblock;
}

int Util::getFileSize(std::string filename){

	std::ifstream in(filename.c_str(), std::ifstream::ate | std::ifstream::binary);
	return in.tellg();
}
