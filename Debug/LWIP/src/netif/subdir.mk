################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LWIP/src/netif/bridgeif.c \
../LWIP/src/netif/bridgeif_fdb.c \
../LWIP/src/netif/ethernet.c \
../LWIP/src/netif/lowpan6.c \
../LWIP/src/netif/lowpan6_ble.c \
../LWIP/src/netif/lowpan6_common.c \
../LWIP/src/netif/slipif.c \
../LWIP/src/netif/zepif.c 

OBJS += \
./LWIP/src/netif/bridgeif.o \
./LWIP/src/netif/bridgeif_fdb.o \
./LWIP/src/netif/ethernet.o \
./LWIP/src/netif/lowpan6.o \
./LWIP/src/netif/lowpan6_ble.o \
./LWIP/src/netif/lowpan6_common.o \
./LWIP/src/netif/slipif.o \
./LWIP/src/netif/zepif.o 

C_DEPS += \
./LWIP/src/netif/bridgeif.d \
./LWIP/src/netif/bridgeif_fdb.d \
./LWIP/src/netif/ethernet.d \
./LWIP/src/netif/lowpan6.d \
./LWIP/src/netif/lowpan6_ble.d \
./LWIP/src/netif/lowpan6_common.d \
./LWIP/src/netif/slipif.d \
./LWIP/src/netif/zepif.d 


# Each subdirectory must supply rules for building sources it contributes
LWIP/src/netif/%.o LWIP/src/netif/%.su LWIP/src/netif/%.cyclo: ../LWIP/src/netif/%.c LWIP/src/netif/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"/home/ganibllo/STM_/F407_vet6/Core/inc" -I"/home/ganibllo/STM_/F407_vet6/CMSIS/inc" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/include" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"/home/ganibllo/STM_/F407_vet6/Applications/W5500_Spi/inc" -I"/home/ganibllo/STM_/F407_vet6/Applications/dp83848/inc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/stdc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/arpa" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/net" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/sys" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/apps" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/priv" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/prot" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif/ppp" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system/arch" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/ascii" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/functions" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/include" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/port" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/rtu" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/tcp" -I"/home/ganibllo/STM_/F407_vet6/LWIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-LWIP-2f-src-2f-netif

clean-LWIP-2f-src-2f-netif:
	-$(RM) ./LWIP/src/netif/bridgeif.cyclo ./LWIP/src/netif/bridgeif.d ./LWIP/src/netif/bridgeif.o ./LWIP/src/netif/bridgeif.su ./LWIP/src/netif/bridgeif_fdb.cyclo ./LWIP/src/netif/bridgeif_fdb.d ./LWIP/src/netif/bridgeif_fdb.o ./LWIP/src/netif/bridgeif_fdb.su ./LWIP/src/netif/ethernet.cyclo ./LWIP/src/netif/ethernet.d ./LWIP/src/netif/ethernet.o ./LWIP/src/netif/ethernet.su ./LWIP/src/netif/lowpan6.cyclo ./LWIP/src/netif/lowpan6.d ./LWIP/src/netif/lowpan6.o ./LWIP/src/netif/lowpan6.su ./LWIP/src/netif/lowpan6_ble.cyclo ./LWIP/src/netif/lowpan6_ble.d ./LWIP/src/netif/lowpan6_ble.o ./LWIP/src/netif/lowpan6_ble.su ./LWIP/src/netif/lowpan6_common.cyclo ./LWIP/src/netif/lowpan6_common.d ./LWIP/src/netif/lowpan6_common.o ./LWIP/src/netif/lowpan6_common.su ./LWIP/src/netif/slipif.cyclo ./LWIP/src/netif/slipif.d ./LWIP/src/netif/slipif.o ./LWIP/src/netif/slipif.su ./LWIP/src/netif/zepif.cyclo ./LWIP/src/netif/zepif.d ./LWIP/src/netif/zepif.o ./LWIP/src/netif/zepif.su

.PHONY: clean-LWIP-2f-src-2f-netif

