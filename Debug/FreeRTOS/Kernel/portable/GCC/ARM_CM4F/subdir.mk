################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FreeRTOS/Kernel/portable/GCC/ARM_CM4F/port.c 

OBJS += \
./FreeRTOS/Kernel/portable/GCC/ARM_CM4F/port.o 

C_DEPS += \
./FreeRTOS/Kernel/portable/GCC/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
FreeRTOS/Kernel/portable/GCC/ARM_CM4F/%.o FreeRTOS/Kernel/portable/GCC/ARM_CM4F/%.su FreeRTOS/Kernel/portable/GCC/ARM_CM4F/%.cyclo: ../FreeRTOS/Kernel/portable/GCC/ARM_CM4F/%.c FreeRTOS/Kernel/portable/GCC/ARM_CM4F/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Core/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/CMSIS/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel/include" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Applications/W5500_Spi/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Applications/dp83848/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-FreeRTOS-2f-Kernel-2f-portable-2f-GCC-2f-ARM_CM4F

clean-FreeRTOS-2f-Kernel-2f-portable-2f-GCC-2f-ARM_CM4F:
	-$(RM) ./FreeRTOS/Kernel/portable/GCC/ARM_CM4F/port.cyclo ./FreeRTOS/Kernel/portable/GCC/ARM_CM4F/port.d ./FreeRTOS/Kernel/portable/GCC/ARM_CM4F/port.o ./FreeRTOS/Kernel/portable/GCC/ARM_CM4F/port.su

.PHONY: clean-FreeRTOS-2f-Kernel-2f-portable-2f-GCC-2f-ARM_CM4F

