
#includes do system-c
INCLUDES=-I./libxml2-2.7.8.win32/include \
				 -I./systemc-2.3.0/include \
				 -I./iconv-1.9.2.win32/include/ \
				 -I./zlib-1.2.5/include/

COMPONENT_NAME=hardwarereconfigurationapi

#libs do system-c
LDFLAGS=-L./systemc-2.3.0/lib-cygwin -lsystemc \
				./libxml2-2.7.8.win32/lib/libxml2.lib \
				-L./iconv-1.9.2.win32/lib -liconv \
				./zlib-1.2.5/lib/zlib.lib

CPPFLAGS=-Wall -fPIC $(INCLUDES)

SRCS=$(shell find ./ -maxdepth 1 -name '*.cpp')
OBJS=$(SRCS:.cpp=.o)

all: $(OBJS) executable

executable:
	@mkdir -p lib && echo $(SRCS)
	  $(CXX) -shared -o lib/lib$(COMPONENT_NAME).dll $(OBJS) $(LDFLAGS) -lpthread -lm -ggdb

cleanobjs:
	rm -f $(OBJS)

clean: cleanobjs
	  rm -f lib/$(COMPONENT_NAME).so

distclean: clean
	  rm -f $(COMPONENT_NAME)

