################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Applications/W5500_Spi/src/dhcp.c \
../Applications/W5500_Spi/src/loopback.c \
../Applications/W5500_Spi/src/socket.c \
../Applications/W5500_Spi/src/w5500.c \
../Applications/W5500_Spi/src/w5500_host_config.c \
../Applications/W5500_Spi/src/w5500_phy.c \
../Applications/W5500_Spi/src/wizchip_conf.c 

OBJS += \
./Applications/W5500_Spi/src/dhcp.o \
./Applications/W5500_Spi/src/loopback.o \
./Applications/W5500_Spi/src/socket.o \
./Applications/W5500_Spi/src/w5500.o \
./Applications/W5500_Spi/src/w5500_host_config.o \
./Applications/W5500_Spi/src/w5500_phy.o \
./Applications/W5500_Spi/src/wizchip_conf.o 

C_DEPS += \
./Applications/W5500_Spi/src/dhcp.d \
./Applications/W5500_Spi/src/loopback.d \
./Applications/W5500_Spi/src/socket.d \
./Applications/W5500_Spi/src/w5500.d \
./Applications/W5500_Spi/src/w5500_host_config.d \
./Applications/W5500_Spi/src/w5500_phy.d \
./Applications/W5500_Spi/src/wizchip_conf.d 


# Each subdirectory must supply rules for building sources it contributes
Applications/W5500_Spi/src/%.o Applications/W5500_Spi/src/%.su Applications/W5500_Spi/src/%.cyclo: ../Applications/W5500_Spi/src/%.c Applications/W5500_Spi/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"/home/ganibllo/STM_/F407_vet6/Core/inc" -I"/home/ganibllo/STM_/F407_vet6/CMSIS/inc" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/include" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"/home/ganibllo/STM_/F407_vet6/Applications/W5500_Spi/inc" -I"/home/ganibllo/STM_/F407_vet6/Applications/dp83848/inc" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/ascii" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/functions" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/include" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/port" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/rtu" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/tcp" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Applications-2f-W5500_Spi-2f-src

clean-Applications-2f-W5500_Spi-2f-src:
	-$(RM) ./Applications/W5500_Spi/src/dhcp.cyclo ./Applications/W5500_Spi/src/dhcp.d ./Applications/W5500_Spi/src/dhcp.o ./Applications/W5500_Spi/src/dhcp.su ./Applications/W5500_Spi/src/loopback.cyclo ./Applications/W5500_Spi/src/loopback.d ./Applications/W5500_Spi/src/loopback.o ./Applications/W5500_Spi/src/loopback.su ./Applications/W5500_Spi/src/socket.cyclo ./Applications/W5500_Spi/src/socket.d ./Applications/W5500_Spi/src/socket.o ./Applications/W5500_Spi/src/socket.su ./Applications/W5500_Spi/src/w5500.cyclo ./Applications/W5500_Spi/src/w5500.d ./Applications/W5500_Spi/src/w5500.o ./Applications/W5500_Spi/src/w5500.su ./Applications/W5500_Spi/src/w5500_host_config.cyclo ./Applications/W5500_Spi/src/w5500_host_config.d ./Applications/W5500_Spi/src/w5500_host_config.o ./Applications/W5500_Spi/src/w5500_host_config.su ./Applications/W5500_Spi/src/w5500_phy.cyclo ./Applications/W5500_Spi/src/w5500_phy.d ./Applications/W5500_Spi/src/w5500_phy.o ./Applications/W5500_Spi/src/w5500_phy.su ./Applications/W5500_Spi/src/wizchip_conf.cyclo ./Applications/W5500_Spi/src/wizchip_conf.d ./Applications/W5500_Spi/src/wizchip_conf.o ./Applications/W5500_Spi/src/wizchip_conf.su

.PHONY: clean-Applications-2f-W5500_Spi-2f-src

