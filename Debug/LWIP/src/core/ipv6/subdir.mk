################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LWIP/src/core/ipv6/dhcp6.c \
../LWIP/src/core/ipv6/ethip6.c \
../LWIP/src/core/ipv6/icmp6.c \
../LWIP/src/core/ipv6/inet6.c \
../LWIP/src/core/ipv6/ip6.c \
../LWIP/src/core/ipv6/ip6_addr.c \
../LWIP/src/core/ipv6/ip6_frag.c \
../LWIP/src/core/ipv6/mld6.c \
../LWIP/src/core/ipv6/nd6.c 

OBJS += \
./LWIP/src/core/ipv6/dhcp6.o \
./LWIP/src/core/ipv6/ethip6.o \
./LWIP/src/core/ipv6/icmp6.o \
./LWIP/src/core/ipv6/inet6.o \
./LWIP/src/core/ipv6/ip6.o \
./LWIP/src/core/ipv6/ip6_addr.o \
./LWIP/src/core/ipv6/ip6_frag.o \
./LWIP/src/core/ipv6/mld6.o \
./LWIP/src/core/ipv6/nd6.o 

C_DEPS += \
./LWIP/src/core/ipv6/dhcp6.d \
./LWIP/src/core/ipv6/ethip6.d \
./LWIP/src/core/ipv6/icmp6.d \
./LWIP/src/core/ipv6/inet6.d \
./LWIP/src/core/ipv6/ip6.d \
./LWIP/src/core/ipv6/ip6_addr.d \
./LWIP/src/core/ipv6/ip6_frag.d \
./LWIP/src/core/ipv6/mld6.d \
./LWIP/src/core/ipv6/nd6.d 


# Each subdirectory must supply rules for building sources it contributes
LWIP/src/core/ipv6/%.o LWIP/src/core/ipv6/%.su LWIP/src/core/ipv6/%.cyclo: ../LWIP/src/core/ipv6/%.c LWIP/src/core/ipv6/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"/home/ganibllo/STM_/F407_vet6/Core/inc" -I"/home/ganibllo/STM_/F407_vet6/CMSIS/inc" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/include" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"/home/ganibllo/STM_/F407_vet6/Applications/W5500_Spi/inc" -I"/home/ganibllo/STM_/F407_vet6/Applications/dp83848/inc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/stdc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/arpa" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/net" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/sys" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/apps" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/priv" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/prot" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif/ppp" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system/arch" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/ascii" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/functions" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/include" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/port" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/rtu" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/tcp" -I"/home/ganibllo/STM_/F407_vet6/LWIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-LWIP-2f-src-2f-core-2f-ipv6

clean-LWIP-2f-src-2f-core-2f-ipv6:
	-$(RM) ./LWIP/src/core/ipv6/dhcp6.cyclo ./LWIP/src/core/ipv6/dhcp6.d ./LWIP/src/core/ipv6/dhcp6.o ./LWIP/src/core/ipv6/dhcp6.su ./LWIP/src/core/ipv6/ethip6.cyclo ./LWIP/src/core/ipv6/ethip6.d ./LWIP/src/core/ipv6/ethip6.o ./LWIP/src/core/ipv6/ethip6.su ./LWIP/src/core/ipv6/icmp6.cyclo ./LWIP/src/core/ipv6/icmp6.d ./LWIP/src/core/ipv6/icmp6.o ./LWIP/src/core/ipv6/icmp6.su ./LWIP/src/core/ipv6/inet6.cyclo ./LWIP/src/core/ipv6/inet6.d ./LWIP/src/core/ipv6/inet6.o ./LWIP/src/core/ipv6/inet6.su ./LWIP/src/core/ipv6/ip6.cyclo ./LWIP/src/core/ipv6/ip6.d ./LWIP/src/core/ipv6/ip6.o ./LWIP/src/core/ipv6/ip6.su ./LWIP/src/core/ipv6/ip6_addr.cyclo ./LWIP/src/core/ipv6/ip6_addr.d ./LWIP/src/core/ipv6/ip6_addr.o ./LWIP/src/core/ipv6/ip6_addr.su ./LWIP/src/core/ipv6/ip6_frag.cyclo ./LWIP/src/core/ipv6/ip6_frag.d ./LWIP/src/core/ipv6/ip6_frag.o ./LWIP/src/core/ipv6/ip6_frag.su ./LWIP/src/core/ipv6/mld6.cyclo ./LWIP/src/core/ipv6/mld6.d ./LWIP/src/core/ipv6/mld6.o ./LWIP/src/core/ipv6/mld6.su ./LWIP/src/core/ipv6/nd6.cyclo ./LWIP/src/core/ipv6/nd6.d ./LWIP/src/core/ipv6/nd6.o ./LWIP/src/core/ipv6/nd6.su

.PHONY: clean-LWIP-2f-src-2f-core-2f-ipv6

