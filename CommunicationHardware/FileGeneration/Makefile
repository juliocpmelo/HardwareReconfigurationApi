
EXECUTABLE_NAME=configurationFilesGenerator
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
						-I../../systemc-2.3.0/include \
						-I../../ \
						-I../ \
						-I/usr/local/include/ \
						-I/usr/include

LDFLAGS= -L/usr/local/lib/  \
				 -L../../systemc-2.3.0/lib-linux -lsystemc \
				 -L/usr/lib/x86_64-linux-gnu/ -lxml2 \
				 -L../../lib -lhardwarereconfigurationapi
endif


CPPFLAGS=-Wall -fPIC $(INCLUDES)

SRCS=$(shell find -name '*.cpp')
OBJS=$(SRCS:.cpp=.o)

all: $(OBJS) executable

executable:
	@mkdir -p bin
	  $(CXX) -o bin/$(EXECUTABLE_NAME) $(OBJS) $(LDFLAGS) -lpthread -lm

cleanobjs:
	rm -f $(OBJS)

clean: cleanobjs
	  rm -f $(EXECUTABLE_NAME)

distclean: clean
	  rm -f $(EXECUTABLE_NAME)

