
ifeq ($(ARCH), arm)
  CC=arm-linux-gnueabihf-gcc
  CXX=arm-linux-gnueabihf-g++
  AR=arm-linux-gnueabihf-ar
else
  CC=gcc
  CXX=g++
  AR=ar
endif
CFLAGS = -g

#optional flags
ENABLE_DYNAMIC_HARDWARE=yes


#main file from the project
MAIN_FILE=ArduPlane_Mod.ino




projectInoFiles=$(shell find ./ -maxdepth 1 -name '*.ino' ! -name "$(MAIN_FILE)" | sort) #only need to sort because of Ardupilot compilation
projectPdeFiles+=$(shell find ./ -maxdepth 1 -name '*.pde' ! -name "$(MAIN_FILE)" | sort) #only need to sort because of Ardupilot compilation
HEADERS=$(shell find ./ -maxdepth 1 -name '*.h')


ifeq ( $(findstring .ino, $(MAIN_FILE)), '')
  projectSrcs=preprocessed_src/$(MAIN_FILE:.pde=.cpp)  #.pde main file
  MAIN_EXECUTABLE=$(MAIN_FILE:.pde=)
  MAIN_FILE_CPP=$(MAIN_FILE:.pde=.cpp)
else
  projectSrcs=preprocessed_src/$(MAIN_FILE:.ino=.cpp)  #.ino main file
  MAIN_EXECUTABLE=$(MAIN_FILE:.ino=)
  MAIN_FILE_CPP=$(MAIN_FILE:.ino=.cpp)
endif

projectHeaders=$(foreach header, $(HEADERS), preprocessed_src/$(header))

ARDUINO_SRCS=$(MAIN_FILE) $(projectPdeFiles) $(projectInoFiles)

OBJS=$(projectSrcs:%.cpp=%.o)


# Sketch source files
# copy from ardupilot/mk/sketch_sources.mk
SRCSUFFIXES = *.cpp *.c *.S
SKETCHPDESRCS  := $(wildcard ./*.pde ./*.ino)
SKETCHSRCS     := $(wildcard $(addprefix ./,$(SRCSUFFIXES)))

SEXPR = 's/^[[:space:]]*\#include[[:space:]][<\"]([^>\"./]+).*$$/\1/p'
LIBTOKENS        :=    $(sort $(shell cat $(SKETCHPDESRCS) $(SKETCHSRCS) | sed -nre $(SEXPR)))
LIBRARY_DIRS :=      $(wildcard $(addprefix ./libraries/,$(LIBTOKENS)))
#copy end

LIBRARY_DIRS += libraries/AP_HAL/utility #hardcoded, since I have found no reference in the main file for it
ifeq ($(ENABLE_DYNAMIC_HARDWARE),yes)
  LIBRARY_DIRS += libraries/AP_DynamicHardware/DynamicHardwareModules/ArchitectureManager/ \
									libraries/AP_DynamicHardware/DynamicHardwareModules/CommunicationManager/ \
									libraries/AP_DynamicHardware/DynamicHardwareModules/ComponentRepresentation/ \
									libraries/AP_DynamicHardware/DynamicHardwareModules/ReconfigurationManager/ \
									libraries/AP_DynamicHardware/DynamicHardwareModules/Util
endif


#LIBRARY_DIRS=$(shell find ./libraries -maxdepth 1 -type d ! -wholename './libraries')
LIBRARY_SRCS_CPP=$(foreach library,$(LIBRARY_DIRS), $(shell find $(library) -maxdepth 1 -name '*.cpp'))
LIBRARY_SRCS_C=$(foreach library,$(LIBRARY_DIRS), $(shell find $(library) -maxdepth 1 -name '*.c'))
LIBRARY_SRCS=$(LIBRARY_SRCS_CPP) $(LIBRARY_SRCS_C)
LIBRARY_HEADERS=$(foreach library,$(LIBRARY_DIRS), $(shell find $(library) -maxdepth 1 -name '*.h'))
LIBRARY_OBJS_CPP=$(foreach file, $(LIBRARY_SRCS_CPP), preprocessed_src/$(file:.cpp=.o))
LIBRARY_OBJS_C=$(foreach file, $(LIBRARY_SRCS_C), preprocessed_src/$(file:.c=.o))
LIBRARY_OBJS=$(LIBRARY_OBJS_CPP) $(LIBRARY_OBJS_C)
SKETCH_LIBRARY=preprocessed_src/libraries/sketch_libraries.a

INCLUDES=$(LIBRARY_DIRS:%=-I%)

DEFINES=-DCONFIG_HAL_BOARD=HAL_BOARD_LINUX -DDONT_WAIT_GCS -DSKETCHNAME=ArduPlane_Mod 


ifeq ($(ENABLE_DYNAMIC_HARDWARE),yes)

  DEFINES+=-DENABLE_DYNAMIC_HARDWARE
  INCLUDES+=-Ilibraries/AP_DynamicHardware/DynamicHardwareModules

endif

all: preprocessed_src $(projectHeaders) $(projectSrcs) $(MAIN_EXECUTABLE)

#creates the preprocess dir
preprocessed_src:
	$(foreach dir_, $(LIBRARY_DIRS), $(shell mkdir -p ./preprocessed_src/$(dir_)))

#copies the headers to the preprocessing dir
preprocessed_src/%.h: %.h
	cp $< preprocessed_src

#compile te main executable
$(MAIN_EXECUTABLE): preprocessed_src/$(MAIN_FILE_CPP) $(SKETCH_LIBRARY) 
	$(CXX) $(CFLAGS) $(DEFINES) $(INCLUDES) $(projectSrcs) -o $@ $(SKETCH_LIBRARY) -lrt -lpthread 

#preprocess the ino files to create suitable .cpp files
preprocessed_src/$(MAIN_FILE_CPP): preprocessed_src/$(MAIN_FILE)
	ino preproc $< -o $@


#merges the ino and pde files together, Main file first, the others doesnt matter
preprocessed_src/$(MAIN_FILE): $(ARDUINO_SRCS)
	$(shell if [ -f $@ ]; then rm -rf $@; fi )
	$(foreach file_, $(ARDUINO_SRCS), $(shell echo "#line 1 \"$(file_)\"" >> $@ && cat $(file_) >> $@))


#compiles each library file to a .o
$(LIBRARY_OBJS_CPP) : preprocessed_src/%.o : %.cpp
	$(CXX) $(CFLAGS) $(DEFINES) $(INCLUDES) -c $< -o $@

$(LIBRARY_OBJS_C) : preprocessed_src/%.o : %.c
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) -c $< -o $@

#groups each library file in a static library
$(SKETCH_LIBRARY): $(LIBRARY_OBJS)
	$(AR) rcs $@ $(LIBRARY_OBJS)




clean:
	rm -rf preprocessed_src

debug:
	echo $(SKETCHLIBS)	

.PHONY: debug
