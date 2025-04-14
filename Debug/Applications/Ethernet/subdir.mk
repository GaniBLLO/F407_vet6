################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Applications/Ethernet/ethernetif.c 

OBJS += \
./Applications/Ethernet/ethernetif.o 

C_DEPS += \
./Applications/Ethernet/ethernetif.d 


# Each subdirectory must supply rules for building sources it contributes
Applications/Ethernet/%.o Applications/Ethernet/%.su Applications/Ethernet/%.cyclo: ../Applications/Ethernet/%.c Applications/Ethernet/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"/home/ganibllo/STM_/F407_vet6/Core/inc" -I"/home/ganibllo/STM_/F407_vet6/CMSIS/inc" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/include" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"/home/ganibllo/STM_/F407_vet6/Applications/W5500_Spi/inc" -I"/home/ganibllo/STM_/F407_vet6/Applications/dp83848/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Applications-2f-Ethernet

clean-Applications-2f-Ethernet:
	-$(RM) ./Applications/Ethernet/ethernetif.cyclo ./Applications/Ethernet/ethernetif.d ./Applications/Ethernet/ethernetif.o ./Applications/Ethernet/ethernetif.su

.PHONY: clean-Applications-2f-Ethernet

