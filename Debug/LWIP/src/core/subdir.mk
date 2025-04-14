################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LWIP/src/core/altcp.c \
../LWIP/src/core/altcp_alloc.c \
../LWIP/src/core/altcp_tcp.c \
../LWIP/src/core/def.c \
../LWIP/src/core/dns.c \
../LWIP/src/core/inet_chksum.c \
../LWIP/src/core/init.c \
../LWIP/src/core/ip.c \
../LWIP/src/core/mem.c \
../LWIP/src/core/memp.c \
../LWIP/src/core/netif.c \
../LWIP/src/core/pbuf.c \
../LWIP/src/core/raw.c \
../LWIP/src/core/stats.c \
../LWIP/src/core/sys.c \
../LWIP/src/core/tcp.c \
../LWIP/src/core/tcp_in.c \
../LWIP/src/core/tcp_out.c \
../LWIP/src/core/timeouts.c \
../LWIP/src/core/udp.c 

OBJS += \
./LWIP/src/core/altcp.o \
./LWIP/src/core/altcp_alloc.o \
./LWIP/src/core/altcp_tcp.o \
./LWIP/src/core/def.o \
./LWIP/src/core/dns.o \
./LWIP/src/core/inet_chksum.o \
./LWIP/src/core/init.o \
./LWIP/src/core/ip.o \
./LWIP/src/core/mem.o \
./LWIP/src/core/memp.o \
./LWIP/src/core/netif.o \
./LWIP/src/core/pbuf.o \
./LWIP/src/core/raw.o \
./LWIP/src/core/stats.o \
./LWIP/src/core/sys.o \
./LWIP/src/core/tcp.o \
./LWIP/src/core/tcp_in.o \
./LWIP/src/core/tcp_out.o \
./LWIP/src/core/timeouts.o \
./LWIP/src/core/udp.o 

C_DEPS += \
./LWIP/src/core/altcp.d \
./LWIP/src/core/altcp_alloc.d \
./LWIP/src/core/altcp_tcp.d \
./LWIP/src/core/def.d \
./LWIP/src/core/dns.d \
./LWIP/src/core/inet_chksum.d \
./LWIP/src/core/init.d \
./LWIP/src/core/ip.d \
./LWIP/src/core/mem.d \
./LWIP/src/core/memp.d \
./LWIP/src/core/netif.d \
./LWIP/src/core/pbuf.d \
./LWIP/src/core/raw.d \
./LWIP/src/core/stats.d \
./LWIP/src/core/sys.d \
./LWIP/src/core/tcp.d \
./LWIP/src/core/tcp_in.d \
./LWIP/src/core/tcp_out.d \
./LWIP/src/core/timeouts.d \
./LWIP/src/core/udp.d 


# Each subdirectory must supply rules for building sources it contributes
LWIP/src/core/%.o LWIP/src/core/%.su LWIP/src/core/%.cyclo: ../LWIP/src/core/%.c LWIP/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"/home/ganibllo/STM_/F407_vet6/Core/inc" -I"/home/ganibllo/STM_/F407_vet6/CMSIS/inc" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/include" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"/home/ganibllo/STM_/F407_vet6/Applications/W5500_Spi/inc" -I"/home/ganibllo/STM_/F407_vet6/Applications/dp83848/inc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/stdc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/arpa" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/net" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/sys" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/apps" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/priv" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/prot" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif/ppp" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system/arch" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/ascii" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/functions" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/include" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/port" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/rtu" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/tcp" -I"/home/ganibllo/STM_/F407_vet6/LWIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-LWIP-2f-src-2f-core

clean-LWIP-2f-src-2f-core:
	-$(RM) ./LWIP/src/core/altcp.cyclo ./LWIP/src/core/altcp.d ./LWIP/src/core/altcp.o ./LWIP/src/core/altcp.su ./LWIP/src/core/altcp_alloc.cyclo ./LWIP/src/core/altcp_alloc.d ./LWIP/src/core/altcp_alloc.o ./LWIP/src/core/altcp_alloc.su ./LWIP/src/core/altcp_tcp.cyclo ./LWIP/src/core/altcp_tcp.d ./LWIP/src/core/altcp_tcp.o ./LWIP/src/core/altcp_tcp.su ./LWIP/src/core/def.cyclo ./LWIP/src/core/def.d ./LWIP/src/core/def.o ./LWIP/src/core/def.su ./LWIP/src/core/dns.cyclo ./LWIP/src/core/dns.d ./LWIP/src/core/dns.o ./LWIP/src/core/dns.su ./LWIP/src/core/inet_chksum.cyclo ./LWIP/src/core/inet_chksum.d ./LWIP/src/core/inet_chksum.o ./LWIP/src/core/inet_chksum.su ./LWIP/src/core/init.cyclo ./LWIP/src/core/init.d ./LWIP/src/core/init.o ./LWIP/src/core/init.su ./LWIP/src/core/ip.cyclo ./LWIP/src/core/ip.d ./LWIP/src/core/ip.o ./LWIP/src/core/ip.su ./LWIP/src/core/mem.cyclo ./LWIP/src/core/mem.d ./LWIP/src/core/mem.o ./LWIP/src/core/mem.su ./LWIP/src/core/memp.cyclo ./LWIP/src/core/memp.d ./LWIP/src/core/memp.o ./LWIP/src/core/memp.su ./LWIP/src/core/netif.cyclo ./LWIP/src/core/netif.d ./LWIP/src/core/netif.o ./LWIP/src/core/netif.su ./LWIP/src/core/pbuf.cyclo ./LWIP/src/core/pbuf.d ./LWIP/src/core/pbuf.o ./LWIP/src/core/pbuf.su ./LWIP/src/core/raw.cyclo ./LWIP/src/core/raw.d ./LWIP/src/core/raw.o ./LWIP/src/core/raw.su ./LWIP/src/core/stats.cyclo ./LWIP/src/core/stats.d ./LWIP/src/core/stats.o ./LWIP/src/core/stats.su ./LWIP/src/core/sys.cyclo ./LWIP/src/core/sys.d ./LWIP/src/core/sys.o ./LWIP/src/core/sys.su ./LWIP/src/core/tcp.cyclo ./LWIP/src/core/tcp.d ./LWIP/src/core/tcp.o ./LWIP/src/core/tcp.su ./LWIP/src/core/tcp_in.cyclo ./LWIP/src/core/tcp_in.d ./LWIP/src/core/tcp_in.o ./LWIP/src/core/tcp_in.su ./LWIP/src/core/tcp_out.cyclo ./LWIP/src/core/tcp_out.d ./LWIP/src/core/tcp_out.o ./LWIP/src/core/tcp_out.su ./LWIP/src/core/timeouts.cyclo ./LWIP/src/core/timeouts.d ./LWIP/src/core/timeouts.o ./LWIP/src/core/timeouts.su ./LWIP/src/core/udp.cyclo ./LWIP/src/core/udp.d ./LWIP/src/core/udp.o ./LWIP/src/core/udp.su

.PHONY: clean-LWIP-2f-src-2f-core

