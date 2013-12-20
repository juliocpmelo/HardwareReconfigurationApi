#includes do system-c

include Makefile.env

COMPONENT_NAME=hardwarereconfigurationapi

CFLAGS=-Wall -fPIC -ggdb $(INCLUDES)
CPPFLAGS=$(CFLAGS)

FOLDERS=CommunicationModule \
				CommunicationHardware

all: $(OBJS)
	$(foreach dir, $(FOLDERS), $(MAKE) -C $(dir);)

lib:
	@mkdir -p lib && echo $(SRCS)
	$(CXX) -shared -ggdb -o lib/lib$(COMPONENT_NAME).dll $(OBJS) $(LDFLAGS) -lpthread -lm

cleanobjs:
	rm -f $(OBJS)

clean: cleanobjs
	  rm -f lib/$(COMPONENT_NAME).so lib/lib$(COMPONENT_NAME).dll

distclean: clean
	rm -rf lib


