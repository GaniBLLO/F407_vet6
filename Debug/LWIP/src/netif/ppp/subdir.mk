################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LWIP/src/netif/ppp/auth.c \
../LWIP/src/netif/ppp/ccp.c \
../LWIP/src/netif/ppp/chap-md5.c \
../LWIP/src/netif/ppp/chap-new.c \
../LWIP/src/netif/ppp/chap_ms.c \
../LWIP/src/netif/ppp/demand.c \
../LWIP/src/netif/ppp/eap.c \
../LWIP/src/netif/ppp/ecp.c \
../LWIP/src/netif/ppp/eui64.c \
../LWIP/src/netif/ppp/fsm.c \
../LWIP/src/netif/ppp/ipcp.c \
../LWIP/src/netif/ppp/ipv6cp.c \
../LWIP/src/netif/ppp/lcp.c \
../LWIP/src/netif/ppp/magic.c \
../LWIP/src/netif/ppp/mppe.c \
../LWIP/src/netif/ppp/multilink.c \
../LWIP/src/netif/ppp/ppp.c \
../LWIP/src/netif/ppp/pppapi.c \
../LWIP/src/netif/ppp/pppcrypt.c \
../LWIP/src/netif/ppp/pppoe.c \
../LWIP/src/netif/ppp/pppol2tp.c \
../LWIP/src/netif/ppp/pppos.c \
../LWIP/src/netif/ppp/upap.c \
../LWIP/src/netif/ppp/utils.c \
../LWIP/src/netif/ppp/vj.c 

OBJS += \
./LWIP/src/netif/ppp/auth.o \
./LWIP/src/netif/ppp/ccp.o \
./LWIP/src/netif/ppp/chap-md5.o \
./LWIP/src/netif/ppp/chap-new.o \
./LWIP/src/netif/ppp/chap_ms.o \
./LWIP/src/netif/ppp/demand.o \
./LWIP/src/netif/ppp/eap.o \
./LWIP/src/netif/ppp/ecp.o \
./LWIP/src/netif/ppp/eui64.o \
./LWIP/src/netif/ppp/fsm.o \
./LWIP/src/netif/ppp/ipcp.o \
./LWIP/src/netif/ppp/ipv6cp.o \
./LWIP/src/netif/ppp/lcp.o \
./LWIP/src/netif/ppp/magic.o \
./LWIP/src/netif/ppp/mppe.o \
./LWIP/src/netif/ppp/multilink.o \
./LWIP/src/netif/ppp/ppp.o \
./LWIP/src/netif/ppp/pppapi.o \
./LWIP/src/netif/ppp/pppcrypt.o \
./LWIP/src/netif/ppp/pppoe.o \
./LWIP/src/netif/ppp/pppol2tp.o \
./LWIP/src/netif/ppp/pppos.o \
./LWIP/src/netif/ppp/upap.o \
./LWIP/src/netif/ppp/utils.o \
./LWIP/src/netif/ppp/vj.o 

C_DEPS += \
./LWIP/src/netif/ppp/auth.d \
./LWIP/src/netif/ppp/ccp.d \
./LWIP/src/netif/ppp/chap-md5.d \
./LWIP/src/netif/ppp/chap-new.d \
./LWIP/src/netif/ppp/chap_ms.d \
./LWIP/src/netif/ppp/demand.d \
./LWIP/src/netif/ppp/eap.d \
./LWIP/src/netif/ppp/ecp.d \
./LWIP/src/netif/ppp/eui64.d \
./LWIP/src/netif/ppp/fsm.d \
./LWIP/src/netif/ppp/ipcp.d \
./LWIP/src/netif/ppp/ipv6cp.d \
./LWIP/src/netif/ppp/lcp.d \
./LWIP/src/netif/ppp/magic.d \
./LWIP/src/netif/ppp/mppe.d \
./LWIP/src/netif/ppp/multilink.d \
./LWIP/src/netif/ppp/ppp.d \
./LWIP/src/netif/ppp/pppapi.d \
./LWIP/src/netif/ppp/pppcrypt.d \
./LWIP/src/netif/ppp/pppoe.d \
./LWIP/src/netif/ppp/pppol2tp.d \
./LWIP/src/netif/ppp/pppos.d \
./LWIP/src/netif/ppp/upap.d \
./LWIP/src/netif/ppp/utils.d \
./LWIP/src/netif/ppp/vj.d 


# Each subdirectory must supply rules for building sources it contributes
LWIP/src/netif/ppp/%.o LWIP/src/netif/ppp/%.su LWIP/src/netif/ppp/%.cyclo: ../LWIP/src/netif/ppp/%.c LWIP/src/netif/ppp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"/home/ganibllo/STM_/F407_vet6/Core/inc" -I"/home/ganibllo/STM_/F407_vet6/CMSIS/inc" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/include" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"/home/ganibllo/STM_/F407_vet6/Applications/W5500_Spi/inc" -I"/home/ganibllo/STM_/F407_vet6/Applications/dp83848/inc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/stdc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/arpa" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/net" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/sys" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/apps" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/priv" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/prot" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif/ppp" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system/arch" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/ascii" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/functions" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/include" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/port" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/rtu" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/tcp" -I"/home/ganibllo/STM_/F407_vet6/LWIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-LWIP-2f-src-2f-netif-2f-ppp

clean-LWIP-2f-src-2f-netif-2f-ppp:
	-$(RM) ./LWIP/src/netif/ppp/auth.cyclo ./LWIP/src/netif/ppp/auth.d ./LWIP/src/netif/ppp/auth.o ./LWIP/src/netif/ppp/auth.su ./LWIP/src/netif/ppp/ccp.cyclo ./LWIP/src/netif/ppp/ccp.d ./LWIP/src/netif/ppp/ccp.o ./LWIP/src/netif/ppp/ccp.su ./LWIP/src/netif/ppp/chap-md5.cyclo ./LWIP/src/netif/ppp/chap-md5.d ./LWIP/src/netif/ppp/chap-md5.o ./LWIP/src/netif/ppp/chap-md5.su ./LWIP/src/netif/ppp/chap-new.cyclo ./LWIP/src/netif/ppp/chap-new.d ./LWIP/src/netif/ppp/chap-new.o ./LWIP/src/netif/ppp/chap-new.su ./LWIP/src/netif/ppp/chap_ms.cyclo ./LWIP/src/netif/ppp/chap_ms.d ./LWIP/src/netif/ppp/chap_ms.o ./LWIP/src/netif/ppp/chap_ms.su ./LWIP/src/netif/ppp/demand.cyclo ./LWIP/src/netif/ppp/demand.d ./LWIP/src/netif/ppp/demand.o ./LWIP/src/netif/ppp/demand.su ./LWIP/src/netif/ppp/eap.cyclo ./LWIP/src/netif/ppp/eap.d ./LWIP/src/netif/ppp/eap.o ./LWIP/src/netif/ppp/eap.su ./LWIP/src/netif/ppp/ecp.cyclo ./LWIP/src/netif/ppp/ecp.d ./LWIP/src/netif/ppp/ecp.o ./LWIP/src/netif/ppp/ecp.su ./LWIP/src/netif/ppp/eui64.cyclo ./LWIP/src/netif/ppp/eui64.d ./LWIP/src/netif/ppp/eui64.o ./LWIP/src/netif/ppp/eui64.su ./LWIP/src/netif/ppp/fsm.cyclo ./LWIP/src/netif/ppp/fsm.d ./LWIP/src/netif/ppp/fsm.o ./LWIP/src/netif/ppp/fsm.su ./LWIP/src/netif/ppp/ipcp.cyclo ./LWIP/src/netif/ppp/ipcp.d ./LWIP/src/netif/ppp/ipcp.o ./LWIP/src/netif/ppp/ipcp.su ./LWIP/src/netif/ppp/ipv6cp.cyclo ./LWIP/src/netif/ppp/ipv6cp.d ./LWIP/src/netif/ppp/ipv6cp.o ./LWIP/src/netif/ppp/ipv6cp.su ./LWIP/src/netif/ppp/lcp.cyclo ./LWIP/src/netif/ppp/lcp.d ./LWIP/src/netif/ppp/lcp.o ./LWIP/src/netif/ppp/lcp.su ./LWIP/src/netif/ppp/magic.cyclo ./LWIP/src/netif/ppp/magic.d ./LWIP/src/netif/ppp/magic.o ./LWIP/src/netif/ppp/magic.su ./LWIP/src/netif/ppp/mppe.cyclo ./LWIP/src/netif/ppp/mppe.d ./LWIP/src/netif/ppp/mppe.o ./LWIP/src/netif/ppp/mppe.su ./LWIP/src/netif/ppp/multilink.cyclo ./LWIP/src/netif/ppp/multilink.d ./LWIP/src/netif/ppp/multilink.o ./LWIP/src/netif/ppp/multilink.su ./LWIP/src/netif/ppp/ppp.cyclo ./LWIP/src/netif/ppp/ppp.d ./LWIP/src/netif/ppp/ppp.o ./LWIP/src/netif/ppp/ppp.su ./LWIP/src/netif/ppp/pppapi.cyclo ./LWIP/src/netif/ppp/pppapi.d ./LWIP/src/netif/ppp/pppapi.o ./LWIP/src/netif/ppp/pppapi.su ./LWIP/src/netif/ppp/pppcrypt.cyclo ./LWIP/src/netif/ppp/pppcrypt.d ./LWIP/src/netif/ppp/pppcrypt.o ./LWIP/src/netif/ppp/pppcrypt.su ./LWIP/src/netif/ppp/pppoe.cyclo ./LWIP/src/netif/ppp/pppoe.d ./LWIP/src/netif/ppp/pppoe.o ./LWIP/src/netif/ppp/pppoe.su ./LWIP/src/netif/ppp/pppol2tp.cyclo ./LWIP/src/netif/ppp/pppol2tp.d ./LWIP/src/netif/ppp/pppol2tp.o ./LWIP/src/netif/ppp/pppol2tp.su ./LWIP/src/netif/ppp/pppos.cyclo ./LWIP/src/netif/ppp/pppos.d ./LWIP/src/netif/ppp/pppos.o ./LWIP/src/netif/ppp/pppos.su ./LWIP/src/netif/ppp/upap.cyclo ./LWIP/src/netif/ppp/upap.d ./LWIP/src/netif/ppp/upap.o ./LWIP/src/netif/ppp/upap.su ./LWIP/src/netif/ppp/utils.cyclo ./LWIP/src/netif/ppp/utils.d ./LWIP/src/netif/ppp/utils.o ./LWIP/src/netif/ppp/utils.su ./LWIP/src/netif/ppp/vj.cyclo ./LWIP/src/netif/ppp/vj.d ./LWIP/src/netif/ppp/vj.o ./LWIP/src/netif/ppp/vj.su

.PHONY: clean-LWIP-2f-src-2f-netif-2f-ppp

