################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../my_web_socket/web_socket/web_socket.c \
../my_web_socket/web_socket/web_socket_auth.c \
../my_web_socket/web_socket/web_socket_frame.c \
../my_web_socket/web_socket/web_socket_misc.c \
../my_web_socket/web_socket/web_socket_transport.c 

OBJS += \
./my_web_socket/web_socket/web_socket.o \
./my_web_socket/web_socket/web_socket_auth.o \
./my_web_socket/web_socket/web_socket_frame.o \
./my_web_socket/web_socket/web_socket_misc.o \
./my_web_socket/web_socket/web_socket_transport.o 

C_DEPS += \
./my_web_socket/web_socket/web_socket.d \
./my_web_socket/web_socket/web_socket_auth.d \
./my_web_socket/web_socket/web_socket_frame.d \
./my_web_socket/web_socket/web_socket_misc.d \
./my_web_socket/web_socket/web_socket_transport.d 


# Each subdirectory must supply rules for building sources it contributes
my_web_socket/web_socket/web_socket.o: ../my_web_socket/web_socket/web_socket.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/web_socket/web_socket.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/web_socket/web_socket_auth.o: ../my_web_socket/web_socket/web_socket_auth.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/web_socket/web_socket_auth.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/web_socket/web_socket_frame.o: ../my_web_socket/web_socket/web_socket_frame.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/web_socket/web_socket_frame.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/web_socket/web_socket_misc.o: ../my_web_socket/web_socket/web_socket_misc.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/web_socket/web_socket_misc.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/web_socket/web_socket_transport.o: ../my_web_socket/web_socket/web_socket_transport.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/web_socket/web_socket_transport.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

