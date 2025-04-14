################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ModbusRTU485/functions/mbfunccoils.c \
../ModbusRTU485/functions/mbfuncdiag.c \
../ModbusRTU485/functions/mbfuncdisc.c \
../ModbusRTU485/functions/mbfuncholding.c \
../ModbusRTU485/functions/mbfuncinput.c \
../ModbusRTU485/functions/mbfuncother.c \
../ModbusRTU485/functions/mbutils.c 

OBJS += \
./ModbusRTU485/functions/mbfunccoils.o \
./ModbusRTU485/functions/mbfuncdiag.o \
./ModbusRTU485/functions/mbfuncdisc.o \
./ModbusRTU485/functions/mbfuncholding.o \
./ModbusRTU485/functions/mbfuncinput.o \
./ModbusRTU485/functions/mbfuncother.o \
./ModbusRTU485/functions/mbutils.o 

C_DEPS += \
./ModbusRTU485/functions/mbfunccoils.d \
./ModbusRTU485/functions/mbfuncdiag.d \
./ModbusRTU485/functions/mbfuncdisc.d \
./ModbusRTU485/functions/mbfuncholding.d \
./ModbusRTU485/functions/mbfuncinput.d \
./ModbusRTU485/functions/mbfuncother.d \
./ModbusRTU485/functions/mbutils.d 


# Each subdirectory must supply rules for building sources it contributes
ModbusRTU485/functions/%.o ModbusRTU485/functions/%.su ModbusRTU485/functions/%.cyclo: ../ModbusRTU485/functions/%.c ModbusRTU485/functions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"/home/ganibllo/STM_/F407_vet6/Core/inc" -I"/home/ganibllo/STM_/F407_vet6/CMSIS/inc" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/include" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"/home/ganibllo/STM_/F407_vet6/Applications/W5500_Spi/inc" -I"/home/ganibllo/STM_/F407_vet6/Applications/dp83848/inc" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/ascii" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/functions" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/include" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/port" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/rtu" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/tcp" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-ModbusRTU485-2f-functions

clean-ModbusRTU485-2f-functions:
	-$(RM) ./ModbusRTU485/functions/mbfunccoils.cyclo ./ModbusRTU485/functions/mbfunccoils.d ./ModbusRTU485/functions/mbfunccoils.o ./ModbusRTU485/functions/mbfunccoils.su ./ModbusRTU485/functions/mbfuncdiag.cyclo ./ModbusRTU485/functions/mbfuncdiag.d ./ModbusRTU485/functions/mbfuncdiag.o ./ModbusRTU485/functions/mbfuncdiag.su ./ModbusRTU485/functions/mbfuncdisc.cyclo ./ModbusRTU485/functions/mbfuncdisc.d ./ModbusRTU485/functions/mbfuncdisc.o ./ModbusRTU485/functions/mbfuncdisc.su ./ModbusRTU485/functions/mbfuncholding.cyclo ./ModbusRTU485/functions/mbfuncholding.d ./ModbusRTU485/functions/mbfuncholding.o ./ModbusRTU485/functions/mbfuncholding.su ./ModbusRTU485/functions/mbfuncinput.cyclo ./ModbusRTU485/functions/mbfuncinput.d ./ModbusRTU485/functions/mbfuncinput.o ./ModbusRTU485/functions/mbfuncinput.su ./ModbusRTU485/functions/mbfuncother.cyclo ./ModbusRTU485/functions/mbfuncother.d ./ModbusRTU485/functions/mbfuncother.o ./ModbusRTU485/functions/mbfuncother.su ./ModbusRTU485/functions/mbutils.cyclo ./ModbusRTU485/functions/mbutils.d ./ModbusRTU485/functions/mbutils.o ./ModbusRTU485/functions/mbutils.su

.PHONY: clean-ModbusRTU485-2f-functions

