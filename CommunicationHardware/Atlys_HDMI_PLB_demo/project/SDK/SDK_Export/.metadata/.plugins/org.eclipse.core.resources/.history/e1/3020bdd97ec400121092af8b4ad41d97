################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DynamicHardwareModules/ArchitectureManager.c \
../DynamicHardwareModules/CommunicationManager.c \
../DynamicHardwareModules/HardwareInterface.c \
../DynamicHardwareModules/HardwareReconfigurationModule.c 

OBJS += \
./DynamicHardwareModules/ArchitectureManager.o \
./DynamicHardwareModules/CommunicationManager.o \
./DynamicHardwareModules/HardwareInterface.o \
./DynamicHardwareModules/HardwareReconfigurationModule.o 

C_DEPS += \
./DynamicHardwareModules/ArchitectureManager.d \
./DynamicHardwareModules/CommunicationManager.d \
./DynamicHardwareModules/HardwareInterface.d \
./DynamicHardwareModules/HardwareReconfigurationModule.d 


# Each subdirectory must supply rules for building sources it contributes
DynamicHardwareModules/%.o: ../DynamicHardwareModules/%.c
	@echo Building file: $<
	@echo Invoking: MicroBlaze gcc compiler
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -Wl,--no-relax -I../../standalone_bsp_0/microblaze_0/include -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.40.b -mno-xl-soft-mul -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo Finished building: $<
	@echo ' '


