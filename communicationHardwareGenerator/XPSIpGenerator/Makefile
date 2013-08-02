
#includes required 
INCLUDES=-I../../ \
				 -I../../libxml2-2.7.8.win32/include \
				 -I../../systemc-2.3.0/include \
				 -I../../iconv-1.9.2.win32/include/ \
				 -I../../zlib-1.2.5/include/

COMPONENT_NAME=communicationHardwareGen

#libs required
LDFLAGS=-L../../systemc-2.3.0/lib-cygwin -lsystemc \
				-L../../iconv-1.9.2.win32/lib -liconv \
				-L../../libxml2-2.7.8.win32/bin/ -lxml2 \
				-L../../zlib-1.2.5/bin -lz \
				-L../../lib -lhardwarereconfigurationapi 

CPPFLAGS=-Wall -fPIC $(INCLUDES)

SRCS=$(shell find -name '*.cpp')
OBJS=$(SRCS:.cpp=.o)

all: $(OBJS) executable

executable:
	@mkdir -p bin
	  $(CXX) -o ./$(COMPONENT_NAME) $(OBJS) $(LDFLAGS) -lpthread -lm

cleanobjs:
	rm -f $(OBJS)

clean: cleanobjs
	  rm -f $(COMPONENT_NAME)

distclean: clean
	  rm -f $(COMPONENT_NAME)

