################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LWIP/src/netif/ppp/polarssl/arc4.c \
../LWIP/src/netif/ppp/polarssl/des.c \
../LWIP/src/netif/ppp/polarssl/md4.c \
../LWIP/src/netif/ppp/polarssl/md5.c \
../LWIP/src/netif/ppp/polarssl/sha1.c 

OBJS += \
./LWIP/src/netif/ppp/polarssl/arc4.o \
./LWIP/src/netif/ppp/polarssl/des.o \
./LWIP/src/netif/ppp/polarssl/md4.o \
./LWIP/src/netif/ppp/polarssl/md5.o \
./LWIP/src/netif/ppp/polarssl/sha1.o 

C_DEPS += \
./LWIP/src/netif/ppp/polarssl/arc4.d \
./LWIP/src/netif/ppp/polarssl/des.d \
./LWIP/src/netif/ppp/polarssl/md4.d \
./LWIP/src/netif/ppp/polarssl/md5.d \
./LWIP/src/netif/ppp/polarssl/sha1.d 


# Each subdirectory must supply rules for building sources it contributes
LWIP/src/netif/ppp/polarssl/%.o LWIP/src/netif/ppp/polarssl/%.su LWIP/src/netif/ppp/polarssl/%.cyclo: ../LWIP/src/netif/ppp/polarssl/%.c LWIP/src/netif/ppp/polarssl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"/home/ganibllo/STM_/F407_vet6/Core/inc" -I"/home/ganibllo/STM_/F407_vet6/CMSIS/inc" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/include" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"/home/ganibllo/STM_/F407_vet6/Applications/W5500_Spi/inc" -I"/home/ganibllo/STM_/F407_vet6/Applications/dp83848/inc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/stdc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/arpa" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/net" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/sys" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/apps" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/priv" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/prot" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif/ppp" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system/arch" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/ascii" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/functions" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/include" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/port" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/rtu" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/tcp" -I"/home/ganibllo/STM_/F407_vet6/LWIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-LWIP-2f-src-2f-netif-2f-ppp-2f-polarssl

clean-LWIP-2f-src-2f-netif-2f-ppp-2f-polarssl:
	-$(RM) ./LWIP/src/netif/ppp/polarssl/arc4.cyclo ./LWIP/src/netif/ppp/polarssl/arc4.d ./LWIP/src/netif/ppp/polarssl/arc4.o ./LWIP/src/netif/ppp/polarssl/arc4.su ./LWIP/src/netif/ppp/polarssl/des.cyclo ./LWIP/src/netif/ppp/polarssl/des.d ./LWIP/src/netif/ppp/polarssl/des.o ./LWIP/src/netif/ppp/polarssl/des.su ./LWIP/src/netif/ppp/polarssl/md4.cyclo ./LWIP/src/netif/ppp/polarssl/md4.d ./LWIP/src/netif/ppp/polarssl/md4.o ./LWIP/src/netif/ppp/polarssl/md4.su ./LWIP/src/netif/ppp/polarssl/md5.cyclo ./LWIP/src/netif/ppp/polarssl/md5.d ./LWIP/src/netif/ppp/polarssl/md5.o ./LWIP/src/netif/ppp/polarssl/md5.su ./LWIP/src/netif/ppp/polarssl/sha1.cyclo ./LWIP/src/netif/ppp/polarssl/sha1.d ./LWIP/src/netif/ppp/polarssl/sha1.o ./LWIP/src/netif/ppp/polarssl/sha1.su

.PHONY: clean-LWIP-2f-src-2f-netif-2f-ppp-2f-polarssl

