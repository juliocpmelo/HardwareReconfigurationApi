################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../hdmi_demo.c \
../platform.c 

OBJS += \
./hdmi_demo.o \
./platform.o 

C_DEPS += \
./hdmi_demo.d \
./platform.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo Building file: $<
	@echo Invoking: MicroBlaze gcc compiler
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -Wl,--no-relax -I../../standalone_bsp_0/microblaze_0/include -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.40.b -mno-xl-soft-mul -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo Finished building: $<
	@echo ' '


