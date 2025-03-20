################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/src/SPI_W5500.c \
../Core/src/main.c \
../Core/src/rcc.c \
../Core/src/usart_dbg.c 

OBJS += \
./Core/src/SPI_W5500.o \
./Core/src/main.o \
./Core/src/rcc.o \
./Core/src/usart_dbg.o 

C_DEPS += \
./Core/src/SPI_W5500.d \
./Core/src/main.d \
./Core/src/rcc.d \
./Core/src/usart_dbg.d 


# Each subdirectory must supply rules for building sources it contributes
Core/src/%.o Core/src/%.su Core/src/%.cyclo: ../Core/src/%.c Core/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Core/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/CMSIS/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel/include" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Applications/W5500_Spi/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Applications/dp83848/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-src

clean-Core-2f-src:
	-$(RM) ./Core/src/SPI_W5500.cyclo ./Core/src/SPI_W5500.d ./Core/src/SPI_W5500.o ./Core/src/SPI_W5500.su ./Core/src/main.cyclo ./Core/src/main.d ./Core/src/main.o ./Core/src/main.su ./Core/src/rcc.cyclo ./Core/src/rcc.d ./Core/src/rcc.o ./Core/src/rcc.su ./Core/src/usart_dbg.cyclo ./Core/src/usart_dbg.d ./Core/src/usart_dbg.o ./Core/src/usart_dbg.su

.PHONY: clean-Core-2f-src

