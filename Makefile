#includes do system-c

include Makefile.env

COMPONENT_NAME=hardwarereconfigurationapi

INCLUDES += -I$(CURDIR)/

#change here to fix dependances
ifeq ($(ARCH), linux)
INCLUDES += -I/usr/include/libxml2/ \
						-I$(CURDIR)/systemc-2.3.0/include \
						-I/usr/local/include/ \
						-I/usr/include

LDFLAGS= -L/usr/local/lib/ -liconv \
				 -L$(CURDIR)/systemc-2.3.0/lib-linux -lsystemc \
				 -L/usr/lib/x86_64-linux-gnu/ -lxml2 \
				 -L/usr/lib/ -lz
else #cygwin or windows environment
LIBS_HOME= $(CURDIR)

INCLUDES += -I$(LIBS_HOME)/libxml2-2.7.8.win32/include \
						-I$(LIBS_HOME)/systemc-2.3.0/include \
						-I$(LIBS_HOME)/iconv-1.9.2.win32/include/ \
						-I$(LIBS_HOME)/zlib-1.2.5/include/ 

LDFLAGS= -L$(LIBS_HOME)/iconv-1.9.2.win32/lib -liconv \
				 -L$(LIBS_HOME)/systemc-2.3.0/lib-cygwin -lsystemc \
				 -L$(LIBS_HOME)/libxml2-2.7.8.win32/bin/ -lxml2 \
				 -L$(LIBS_HOME)/zlib-1.2.5/bin -lz 

endif


CFLAGS=-Wall -fPIC -ggdb $(INCLUDES)
CPPFLAGS=$(CFLAGS)

FOLDERS=CommunicationModule \
				CommunicationHardware

OBJS=$(shell find -name '*.o')


ifeq ($(ARCH), linux)
lib/lib$(COMPONENT_NAME).so: 
	@mkdir -p lib
	$(CXX) -shared -ggdb -o $@ $(OBJS) $(LDFLAGS) -lpthread -lm

lib: lib/lib$(COMPONENT_NAME).so

clean_lib:
	rm -f lib/lib$(COMPONENT_NAME).so 
else #cygwin
lib/lib$(COMPONENT_NAME).dll: 
	@mkdir -p lib
	$(CXX) -shared -ggdb -o $@ $(OBJS) $(LDFLAGS) -lpthread -lm

lib: $(OBJS) lib/lib$(COMPONENT_NAME).dll

clean_lib:
	rm -f lib/lib$(COMPONENT_NAME).dll
endif

test:
	 @$(MAKE) -C tests executable

.PHONY: lib test

all:: lib test

clean:: clean_lib
	@$(MAKE) -C tests clean

	


