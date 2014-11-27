#global variables

ifndef INCLUDES
export INCLUDES
endif

ifndef LDFLAGS 
export LDFLAGS
endif

ifndef LIB_OBJS
export LIB_OBJS
endif

CFLAGS=-Wall -fPIC -ggdb $(INCLUDES)

CPPFLAGS=$(CFLAGS)

#folders that are added here will be compiled together within the
#executable rule.
SRC_FOLDERS=

#foldes added here will be visited through a make -C $folder command
#thus they will need a internal makefile to continue the recursive process
SUB_DIRS=

SRCS=$(foreach dir_, $(SRC_FOLDERS), $(shell find $(dir_) -maxdepth 1 -name '*.cpp'))

LOCAL_OBJS=$(SRCS:.cpp=.o)

BINDIR=bin

EXECUTABLE=foo

EXECUTABLE_FULL=$(BINDIR)/$(EXECUTABLE)

LIB_NAME=libbar.so

LIBDIR=lib

LIB_FULL=$(LIBDIR)/$(LIB_NAME)

#SECONDEXPANSION allows me to define the rules and use then afterwards,
#though it's not possible to use it into the rule definition, it is useful
#since I wont need to add the file ate the end of the current makefile in order
#get rid of the anoying dependency (with variables) processing problem.

#using enable the not override of rules, thus any "all::" in Makefiles
#that include this one will be called after this one is completed

.SECONDEXPANSION:
all:: $$(LOCAL_OBJS) sub_dirs

clean:: cleanobjs

cleanobjs: clean_sub_dirs
	rm -f $(LOCAL_OBJS)

clean_sub_dirs:
	$(foreach dir, $(FOLDERS), $(MAKE) -C $(dir) cleanobjs;)


distclean:: clean_executable clean_library clean_dirs

clean_dirs:
	$(shell rm -rf $(LIBDIR) $(BINDIR))

%.o : %.cpp 
	$(CXX) $(CPPFLAGS) $(DEFINES) $(INCLUDES) -c $< -o $@

.SECONDEXPANSION:
executable: $$(LOCAL_OBJS) $$(BINDIR) sub_dirs 
	$(shell mkdir -p $(BINDIR))
	$(CXX) $(CPPFLAGS) $(INCLUDES) $(LOCAL_OBJS) -o $(EXECUTABLE_FULL) $(LDFLAGS)

.SECONDEXPANSION:
library: $$(LOCAL_OBJS) $$(LIBDIR) sub_dirs
	$(shell mkdir -p $(LIBDIR))
	$(CXX) $(LIB_FLAGS) $(CPPFLAGS) $(INCLUDES) $(LOCAL_OBJS) -o $(LIB_FULL) $(LDFLAGS)

sub_dirs:
	$(foreach dir, $(SUB_DIRS), $(MAKE) -C $(dir);)	

	
clean_executable:
	rm -f $(EXECUTABLE_FULL)

clean_library:
	rm -f $(LIB_FULL)

debug_lib:
	@echo "lib objs $(LIB_OBJS)"

debug:
	@echo "compile $(SRCS) to $(LOCAL_OBJS)"

.PHONY: debug sub_dirs clean_sub_dirs
