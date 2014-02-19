#includes do system-c

include Makefile.env

LIBS_HOME= $(CURDIR)

COMPONENT_NAME=hardwarereconfigurationapi

export INCLUDES=	-I$(CURDIR)/ \
									-I$(LIBS_HOME)/libxml2-2.7.8.win32/include \
									-I$(LIBS_HOME)/systemc-2.3.0/include \
									-I$(LIBS_HOME)/iconv-1.9.2.win32/include/ \
									-I$(LIBS_HOME)/zlib-1.2.5/include/ \
									-I$(LIBS_HOME)/systemc-2.3.0/include/

#libs do system-c
LDFLAGS= -L$(LIBS_HOME)/iconv-1.9.2.win32/lib -liconv \
				 -L$(LIBS_HOME)/systemc-2.3.0/lib-cygwin -lsystemc \
				 -L$(LIBS_HOME)/libxml2-2.7.8.win32/bin/ -lxml2 \
				 -L$(LIBS_HOME)/zlib-1.2.5/bin -lz 


CFLAGS=-Wall -fPIC -ggdb $(INCLUDES)
CPPFLAGS=$(CFLAGS)

FOLDERS=CommunicationModule \
				CommunicationHardware

OBJS=$(shell find -name '*.o')

lib:
	@mkdir -p lib
	$(CXX) -shared -ggdb -o lib/lib$(COMPONENT_NAME).so $(OBJS) $(LDFLAGS) -lpthread -lm


