################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LWIP/src/api/api_lib.c \
../LWIP/src/api/api_msg.c \
../LWIP/src/api/err.c \
../LWIP/src/api/if_api.c \
../LWIP/src/api/netbuf.c \
../LWIP/src/api/netdb.c \
../LWIP/src/api/netifapi.c \
../LWIP/src/api/sockets.c \
../LWIP/src/api/tcpip.c 

OBJS += \
./LWIP/src/api/api_lib.o \
./LWIP/src/api/api_msg.o \
./LWIP/src/api/err.o \
./LWIP/src/api/if_api.o \
./LWIP/src/api/netbuf.o \
./LWIP/src/api/netdb.o \
./LWIP/src/api/netifapi.o \
./LWIP/src/api/sockets.o \
./LWIP/src/api/tcpip.o 

C_DEPS += \
./LWIP/src/api/api_lib.d \
./LWIP/src/api/api_msg.d \
./LWIP/src/api/err.d \
./LWIP/src/api/if_api.d \
./LWIP/src/api/netbuf.d \
./LWIP/src/api/netdb.d \
./LWIP/src/api/netifapi.d \
./LWIP/src/api/sockets.d \
./LWIP/src/api/tcpip.d 


# Each subdirectory must supply rules for building sources it contributes
LWIP/src/api/%.o LWIP/src/api/%.su LWIP/src/api/%.cyclo: ../LWIP/src/api/%.c LWIP/src/api/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"/home/ganibllo/STM_/F407_vet6/Core/inc" -I"/home/ganibllo/STM_/F407_vet6/CMSIS/inc" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/include" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"/home/ganibllo/STM_/F407_vet6/Applications/W5500_Spi/inc" -I"/home/ganibllo/STM_/F407_vet6/Applications/dp83848/inc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/stdc" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/arpa" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/net" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/compat/posix/sys" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/apps" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/priv" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/lwip/prot" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/netif/ppp" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system" -I"/home/ganibllo/STM_/F407_vet6/LWIP/include/system/arch" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/ascii" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/functions" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/include" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/port" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/rtu" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/tcp" -I"/home/ganibllo/STM_/F407_vet6/LWIP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-LWIP-2f-src-2f-api

clean-LWIP-2f-src-2f-api:
	-$(RM) ./LWIP/src/api/api_lib.cyclo ./LWIP/src/api/api_lib.d ./LWIP/src/api/api_lib.o ./LWIP/src/api/api_lib.su ./LWIP/src/api/api_msg.cyclo ./LWIP/src/api/api_msg.d ./LWIP/src/api/api_msg.o ./LWIP/src/api/api_msg.su ./LWIP/src/api/err.cyclo ./LWIP/src/api/err.d ./LWIP/src/api/err.o ./LWIP/src/api/err.su ./LWIP/src/api/if_api.cyclo ./LWIP/src/api/if_api.d ./LWIP/src/api/if_api.o ./LWIP/src/api/if_api.su ./LWIP/src/api/netbuf.cyclo ./LWIP/src/api/netbuf.d ./LWIP/src/api/netbuf.o ./LWIP/src/api/netbuf.su ./LWIP/src/api/netdb.cyclo ./LWIP/src/api/netdb.d ./LWIP/src/api/netdb.o ./LWIP/src/api/netdb.su ./LWIP/src/api/netifapi.cyclo ./LWIP/src/api/netifapi.d ./LWIP/src/api/netifapi.o ./LWIP/src/api/netifapi.su ./LWIP/src/api/sockets.cyclo ./LWIP/src/api/sockets.d ./LWIP/src/api/sockets.o ./LWIP/src/api/sockets.su ./LWIP/src/api/tcpip.cyclo ./LWIP/src/api/tcpip.d ./LWIP/src/api/tcpip.o ./LWIP/src/api/tcpip.su

.PHONY: clean-LWIP-2f-src-2f-api

