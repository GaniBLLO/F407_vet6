################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ModbusRTU485/ascii/mbascii.c 

OBJS += \
./ModbusRTU485/ascii/mbascii.o 

C_DEPS += \
./ModbusRTU485/ascii/mbascii.d 


# Each subdirectory must supply rules for building sources it contributes
ModbusRTU485/ascii/%.o ModbusRTU485/ascii/%.su: ../ModbusRTU485/ascii/%.c ModbusRTU485/ascii/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"C:/STM_Proj/F407_vet6/Core/inc" -I"C:/STM_Proj/F407_vet6/CMSIS/inc" -I"C:/STM_Proj/F407_vet6/FreeRTOS" -I"C:/STM_Proj/F407_vet6/FreeRTOS/Kernel" -I"C:/STM_Proj/F407_vet6/FreeRTOS/Kernel/include" -I"C:/STM_Proj/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"C:/STM_Proj/F407_vet6/Applications/W5500_Spi/inc" -I"C:/STM_Proj/F407_vet6/Applications/dp83848/inc" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/ascii" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/functions" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/include" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/port" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/rtu" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/tcp" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-ModbusRTU485-2f-ascii

clean-ModbusRTU485-2f-ascii:
	-$(RM) ./ModbusRTU485/ascii/mbascii.d ./ModbusRTU485/ascii/mbascii.o ./ModbusRTU485/ascii/mbascii.su

.PHONY: clean-ModbusRTU485-2f-ascii

