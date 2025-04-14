################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FreeRTOS/Kernel/portable/MemMang/heap_4.c 

OBJS += \
./FreeRTOS/Kernel/portable/MemMang/heap_4.o 

C_DEPS += \
./FreeRTOS/Kernel/portable/MemMang/heap_4.d 


# Each subdirectory must supply rules for building sources it contributes
FreeRTOS/Kernel/portable/MemMang/%.o FreeRTOS/Kernel/portable/MemMang/%.su: ../FreeRTOS/Kernel/portable/MemMang/%.c FreeRTOS/Kernel/portable/MemMang/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"C:/STM_Proj/F407_vet6/Core/inc" -I"C:/STM_Proj/F407_vet6/CMSIS/inc" -I"C:/STM_Proj/F407_vet6/FreeRTOS" -I"C:/STM_Proj/F407_vet6/FreeRTOS/Kernel" -I"C:/STM_Proj/F407_vet6/FreeRTOS/Kernel/include" -I"C:/STM_Proj/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"C:/STM_Proj/F407_vet6/Applications/W5500_Spi/inc" -I"C:/STM_Proj/F407_vet6/Applications/dp83848/inc" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/ascii" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/functions" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/include" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/port" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/rtu" -I"C:/STM_Proj/F407_vet6/ModbusRTU485/tcp" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-FreeRTOS-2f-Kernel-2f-portable-2f-MemMang

clean-FreeRTOS-2f-Kernel-2f-portable-2f-MemMang:
	-$(RM) ./FreeRTOS/Kernel/portable/MemMang/heap_4.d ./FreeRTOS/Kernel/portable/MemMang/heap_4.o ./FreeRTOS/Kernel/portable/MemMang/heap_4.su

.PHONY: clean-FreeRTOS-2f-Kernel-2f-portable-2f-MemMang

