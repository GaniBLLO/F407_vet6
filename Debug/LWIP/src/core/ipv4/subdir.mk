################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LWIP/src/core/ipv4/acd.c \
../LWIP/src/core/ipv4/autoip.c \
../LWIP/src/core/ipv4/dhcp.c \
../LWIP/src/core/ipv4/etharp.c \
../LWIP/src/core/ipv4/icmp.c \
../LWIP/src/core/ipv4/igmp.c \
../LWIP/src/core/ipv4/ip4.c \
../LWIP/src/core/ipv4/ip4_addr.c \
../LWIP/src/core/ipv4/ip4_frag.c 

OBJS += \
./LWIP/src/core/ipv4/acd.o \
./LWIP/src/core/ipv4/autoip.o \
./LWIP/src/core/ipv4/dhcp.o \
./LWIP/src/core/ipv4/etharp.o \
./LWIP/src/core/ipv4/icmp.o \
./LWIP/src/core/ipv4/igmp.o \
./LWIP/src/core/ipv4/ip4.o \
./LWIP/src/core/ipv4/ip4_addr.o \
./LWIP/src/core/ipv4/ip4_frag.o 

C_DEPS += \
./LWIP/src/core/ipv4/acd.d \
./LWIP/src/core/ipv4/autoip.d \
./LWIP/src/core/ipv4/dhcp.d \
./LWIP/src/core/ipv4/etharp.d \
./LWIP/src/core/ipv4/icmp.d \
./LWIP/src/core/ipv4/igmp.d \
./LWIP/src/core/ipv4/ip4.d \
./LWIP/src/core/ipv4/ip4_addr.d \
./LWIP/src/core/ipv4/ip4_frag.d 


# Each subdirectory must supply rules for building sources it contributes
LWIP/src/core/ipv4/%.o LWIP/src/core/ipv4/%.su LWIP/src/core/ipv4/%.cyclo: ../LWIP/src/core/ipv4/%.c LWIP/src/core/ipv4/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"/home/ganibllo/STM_/F407_vet6/Core/inc" -I"/home/ganibllo/STM_/F407_vet6/CMSIS/inc" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/include" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"/home/ganibllo/STM_/F407_vet6/Applications/W5500_Spi/inc" -I"/home/ganibllo/STM_/F407_vet6/Applications/dp83848/inc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/stdc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/arpa" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/net" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/sys" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/apps" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/priv" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/prot" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif/ppp" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system/arch" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/ascii" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/functions" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/include" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/port" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/rtu" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/tcp" -I"/home/ganibllo/STM_/F407_vet6/LWIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-LWIP-2f-src-2f-core-2f-ipv4

clean-LWIP-2f-src-2f-core-2f-ipv4:
	-$(RM) ./LWIP/src/core/ipv4/acd.cyclo ./LWIP/src/core/ipv4/acd.d ./LWIP/src/core/ipv4/acd.o ./LWIP/src/core/ipv4/acd.su ./LWIP/src/core/ipv4/autoip.cyclo ./LWIP/src/core/ipv4/autoip.d ./LWIP/src/core/ipv4/autoip.o ./LWIP/src/core/ipv4/autoip.su ./LWIP/src/core/ipv4/dhcp.cyclo ./LWIP/src/core/ipv4/dhcp.d ./LWIP/src/core/ipv4/dhcp.o ./LWIP/src/core/ipv4/dhcp.su ./LWIP/src/core/ipv4/etharp.cyclo ./LWIP/src/core/ipv4/etharp.d ./LWIP/src/core/ipv4/etharp.o ./LWIP/src/core/ipv4/etharp.su ./LWIP/src/core/ipv4/icmp.cyclo ./LWIP/src/core/ipv4/icmp.d ./LWIP/src/core/ipv4/icmp.o ./LWIP/src/core/ipv4/icmp.su ./LWIP/src/core/ipv4/igmp.cyclo ./LWIP/src/core/ipv4/igmp.d ./LWIP/src/core/ipv4/igmp.o ./LWIP/src/core/ipv4/igmp.su ./LWIP/src/core/ipv4/ip4.cyclo ./LWIP/src/core/ipv4/ip4.d ./LWIP/src/core/ipv4/ip4.o ./LWIP/src/core/ipv4/ip4.su ./LWIP/src/core/ipv4/ip4_addr.cyclo ./LWIP/src/core/ipv4/ip4_addr.d ./LWIP/src/core/ipv4/ip4_addr.o ./LWIP/src/core/ipv4/ip4_addr.su ./LWIP/src/core/ipv4/ip4_frag.cyclo ./LWIP/src/core/ipv4/ip4_frag.d ./LWIP/src/core/ipv4/ip4_frag.o ./LWIP/src/core/ipv4/ip4_frag.su

.PHONY: clean-LWIP-2f-src-2f-core-2f-ipv4

