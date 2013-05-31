################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../dviDriver/xtft.c \
../dviDriver/xtft_charcode.c \
../dviDriver/xtft_g.c \
../dviDriver/xtft_l.c 

OBJS += \
./dviDriver/xtft.o \
./dviDriver/xtft_charcode.o \
./dviDriver/xtft_g.o \
./dviDriver/xtft_l.o 

C_DEPS += \
./dviDriver/xtft.d \
./dviDriver/xtft_charcode.d \
./dviDriver/xtft_g.d \
./dviDriver/xtft_l.d 


# Each subdirectory must supply rules for building sources it contributes
dviDriver/%.o: ../dviDriver/%.c
	@echo Building file: $<
	@echo Invoking: MicroBlaze gcc compiler
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -Wl,--no-relax -I../../standalone_bsp_0/microblaze_0/include -mxl-pattern-compare -mcpu=v7.30.b -mno-xl-soft-mul -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo Finished building: $<
	@echo ' '


