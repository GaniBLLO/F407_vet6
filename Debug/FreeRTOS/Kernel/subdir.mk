################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FreeRTOS/Kernel/croutine.c \
../FreeRTOS/Kernel/event_groups.c \
../FreeRTOS/Kernel/list.c \
../FreeRTOS/Kernel/queue.c \
../FreeRTOS/Kernel/stream_buffer.c \
../FreeRTOS/Kernel/tasks.c \
../FreeRTOS/Kernel/timers.c 

OBJS += \
./FreeRTOS/Kernel/croutine.o \
./FreeRTOS/Kernel/event_groups.o \
./FreeRTOS/Kernel/list.o \
./FreeRTOS/Kernel/queue.o \
./FreeRTOS/Kernel/stream_buffer.o \
./FreeRTOS/Kernel/tasks.o \
./FreeRTOS/Kernel/timers.o 

C_DEPS += \
./FreeRTOS/Kernel/croutine.d \
./FreeRTOS/Kernel/event_groups.d \
./FreeRTOS/Kernel/list.d \
./FreeRTOS/Kernel/queue.d \
./FreeRTOS/Kernel/stream_buffer.d \
./FreeRTOS/Kernel/tasks.d \
./FreeRTOS/Kernel/timers.d 


# Each subdirectory must supply rules for building sources it contributes
FreeRTOS/Kernel/%.o FreeRTOS/Kernel/%.su FreeRTOS/Kernel/%.cyclo: ../FreeRTOS/Kernel/%.c FreeRTOS/Kernel/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F407VETx -c -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Core/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/CMSIS/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel/include" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/FreeRTOS/Kernel/portable/GCC/ARM_CM4F" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Applications/W5500_Spi/inc" -I"C:/Users/User/Downloads/Telegram Desktop/F407_Vet/F407_Vet/Applications/dp83848/inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-FreeRTOS-2f-Kernel

clean-FreeRTOS-2f-Kernel:
	-$(RM) ./FreeRTOS/Kernel/croutine.cyclo ./FreeRTOS/Kernel/croutine.d ./FreeRTOS/Kernel/croutine.o ./FreeRTOS/Kernel/croutine.su ./FreeRTOS/Kernel/event_groups.cyclo ./FreeRTOS/Kernel/event_groups.d ./FreeRTOS/Kernel/event_groups.o ./FreeRTOS/Kernel/event_groups.su ./FreeRTOS/Kernel/list.cyclo ./FreeRTOS/Kernel/list.d ./FreeRTOS/Kernel/list.o ./FreeRTOS/Kernel/list.su ./FreeRTOS/Kernel/queue.cyclo ./FreeRTOS/Kernel/queue.d ./FreeRTOS/Kernel/queue.o ./FreeRTOS/Kernel/queue.su ./FreeRTOS/Kernel/stream_buffer.cyclo ./FreeRTOS/Kernel/stream_buffer.d ./FreeRTOS/Kernel/stream_buffer.o ./FreeRTOS/Kernel/stream_buffer.su ./FreeRTOS/Kernel/tasks.cyclo ./FreeRTOS/Kernel/tasks.d ./FreeRTOS/Kernel/tasks.o ./FreeRTOS/Kernel/tasks.su ./FreeRTOS/Kernel/timers.cyclo ./FreeRTOS/Kernel/timers.d ./FreeRTOS/Kernel/timers.o ./FreeRTOS/Kernel/timers.su

.PHONY: clean-FreeRTOS-2f-Kernel

