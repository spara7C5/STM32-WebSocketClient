################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../my_web_socket/encoding/asn1.c \
../my_web_socket/encoding/base64.c \
../my_web_socket/encoding/oid.c 

OBJS += \
./my_web_socket/encoding/asn1.o \
./my_web_socket/encoding/base64.o \
./my_web_socket/encoding/oid.o 

C_DEPS += \
./my_web_socket/encoding/asn1.d \
./my_web_socket/encoding/base64.d \
./my_web_socket/encoding/oid.d 


# Each subdirectory must supply rules for building sources it contributes
my_web_socket/encoding/asn1.o: ../my_web_socket/encoding/asn1.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/encoding/asn1.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/encoding/base64.o: ../my_web_socket/encoding/base64.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/encoding/base64.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/encoding/oid.o: ../my_web_socket/encoding/oid.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/encoding/oid.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

