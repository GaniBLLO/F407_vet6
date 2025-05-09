################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/src/ETH.c \
../Core/src/SPI_W5500.c \
../Core/src/bootloader.c \
../Core/src/main.c \
../Core/src/rcc.c \
../Core/src/rtc.c \
../Core/src/usart_dbg.c 

OBJS += \
./Core/src/ETH.o \
./Core/src/SPI_W5500.o \
./Core/src/bootloader.o \
./Core/src/main.o \
./Core/src/rcc.o \
./Core/src/rtc.o \
./Core/src/usart_dbg.o 

C_DEPS += \
./Core/src/ETH.d \
./Core/src/SPI_W5500.d \
./Core/src/bootloader.d \
./Core/src/main.d \
./Core/src/rcc.d \
./Core/src/rtc.d \
./Core/src/usart_dbg.d 


# Each subdirectory must supply rules for building sources it contributes
Core/src/%.o Core/src/%.su Core/src/%.cyclo: ../Core/src/%.c Core/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"/home/ganibllo/STM_/F407_vet6/Core/inc" -I"/home/ganibllo/STM_/F407_vet6/CMSIS/inc" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/include" -I"/home/ganibllo/STM_/F407_vet6/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"/home/ganibllo/STM_/F407_vet6/Applications/W5500_Spi/inc" -I"/home/ganibllo/STM_/F407_vet6/Applications/dp83848/inc" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/ascii" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/functions" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/include" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/port" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/rtu" -I"/home/ganibllo/STM_/F407_vet6/ModbusRTU485/tcp" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-src

clean-Core-2f-src:
	-$(RM) ./Core/src/ETH.cyclo ./Core/src/ETH.d ./Core/src/ETH.o ./Core/src/ETH.su ./Core/src/SPI_W5500.cyclo ./Core/src/SPI_W5500.d ./Core/src/SPI_W5500.o ./Core/src/SPI_W5500.su ./Core/src/bootloader.cyclo ./Core/src/bootloader.d ./Core/src/bootloader.o ./Core/src/bootloader.su ./Core/src/main.cyclo ./Core/src/main.d ./Core/src/main.o ./Core/src/main.su ./Core/src/rcc.cyclo ./Core/src/rcc.d ./Core/src/rcc.o ./Core/src/rcc.su ./Core/src/rtc.cyclo ./Core/src/rtc.d ./Core/src/rtc.o ./Core/src/rtc.su ./Core/src/usart_dbg.cyclo ./Core/src/usart_dbg.d ./Core/src/usart_dbg.o ./Core/src/usart_dbg.su

.PHONY: clean-Core-2f-src

