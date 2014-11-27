#includes do system-c

include environment.mk

COMPONENT_NAME=hardwarereconfigurationapi

INCLUDES += -I$(CURDIR)/

#change here to fix dependances
ifeq ($(ARCH), cygwin) #generic for cygwin
LIBS_HOME= $(CURDIR)

INCLUDES += -I$(LIBS_HOME)/libxml2-2.7.8.win32/include \
						-I$(LIBS_HOME)/systemc-2.3.0/include \
						-I$(LIBS_HOME)/iconv-1.9.2.win32/include/ \
						-I$(LIBS_HOME)/zlib-1.2.5/include/ 

LDFLAGS= -L$(LIBS_HOME)/iconv-1.9.2.win32/lib -liconv \
				 -L$(LIBS_HOME)/systemc-2.3.0/lib-cygwin -lsystemc \
				 -L$(LIBS_HOME)/libxml2-2.7.8.win32/bin/ -lxml2 \
				 -L$(LIBS_HOME)/zlib-1.2.5/bin -lz 

else #linux @julio labptop
ARCH=linux
INCLUDES += -I/usr/include/libxml2/ \
						-I$(CURDIR)/systemc-2.3.0/include \
						-I/usr/local/include/ \
						-I/usr/include

LDFLAGS= -L/usr/local/lib/  \
				 -L$(CURDIR)/systemc-2.3.0/lib-linux -lsystemc \
				 -L/usr/lib/x86_64-linux-gnu/ -lxml2 
endif


CFLAGS=-Wall -fPIC -ggdb 
CPPFLAGS=$(CFLAGS)

SRC_FOLDERS=$(CURDIR) \
						 CommunicationModule \
						 CommunicationHardware \
						 Util

LIB_NAME=lib$(COMPONENT_NAME).so
LIB_FLAGS=-shared

test:
	 $(MAKE) -C tests executable

all:: library test

clean:: clean_library
	$(MAKE) -C tests clean


