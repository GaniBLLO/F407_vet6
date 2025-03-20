################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Applications/dp83848/src/dp83848.c 

OBJS += \
./Applications/dp83848/src/dp83848.o 

C_DEPS += \
./Applications/dp83848/src/dp83848.d 


# Each subdirectory must supply rules for building sources it contributes
Applications/dp83848/src/%.o Applications/dp83848/src/%.su Applications/dp83848/src/%.cyclo: ../Applications/dp83848/src/%.c Applications/dp83848/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Core/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/CMSIS/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel/include" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Applications/W5500_Spi/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Applications/dp83848/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Applications-2f-dp83848-2f-src

clean-Applications-2f-dp83848-2f-src:
	-$(RM) ./Applications/dp83848/src/dp83848.cyclo ./Applications/dp83848/src/dp83848.d ./Applications/dp83848/src/dp83848.o ./Applications/dp83848/src/dp83848.su

.PHONY: clean-Applications-2f-dp83848-2f-src

