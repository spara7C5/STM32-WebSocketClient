################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../my_web_socket/ppp/chap.c \
../my_web_socket/ppp/ipcp.c \
../my_web_socket/ppp/ipv6cp.c \
../my_web_socket/ppp/lcp.c \
../my_web_socket/ppp/pap.c \
../my_web_socket/ppp/ppp.c \
../my_web_socket/ppp/ppp_debug.c \
../my_web_socket/ppp/ppp_fsm.c \
../my_web_socket/ppp/ppp_hdlc.c \
../my_web_socket/ppp/ppp_misc.c 

OBJS += \
./my_web_socket/ppp/chap.o \
./my_web_socket/ppp/ipcp.o \
./my_web_socket/ppp/ipv6cp.o \
./my_web_socket/ppp/lcp.o \
./my_web_socket/ppp/pap.o \
./my_web_socket/ppp/ppp.o \
./my_web_socket/ppp/ppp_debug.o \
./my_web_socket/ppp/ppp_fsm.o \
./my_web_socket/ppp/ppp_hdlc.o \
./my_web_socket/ppp/ppp_misc.o 

C_DEPS += \
./my_web_socket/ppp/chap.d \
./my_web_socket/ppp/ipcp.d \
./my_web_socket/ppp/ipv6cp.d \
./my_web_socket/ppp/lcp.d \
./my_web_socket/ppp/pap.d \
./my_web_socket/ppp/ppp.d \
./my_web_socket/ppp/ppp_debug.d \
./my_web_socket/ppp/ppp_fsm.d \
./my_web_socket/ppp/ppp_hdlc.d \
./my_web_socket/ppp/ppp_misc.d 


# Each subdirectory must supply rules for building sources it contributes
my_web_socket/ppp/chap.o: ../my_web_socket/ppp/chap.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/ppp/chap.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/ppp/ipcp.o: ../my_web_socket/ppp/ipcp.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/ppp/ipcp.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/ppp/ipv6cp.o: ../my_web_socket/ppp/ipv6cp.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/ppp/ipv6cp.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/ppp/lcp.o: ../my_web_socket/ppp/lcp.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/ppp/lcp.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/ppp/pap.o: ../my_web_socket/ppp/pap.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/ppp/pap.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/ppp/ppp.o: ../my_web_socket/ppp/ppp.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/ppp/ppp.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/ppp/ppp_debug.o: ../my_web_socket/ppp/ppp_debug.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/ppp/ppp_debug.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/ppp/ppp_fsm.o: ../my_web_socket/ppp/ppp_fsm.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/ppp/ppp_fsm.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/ppp/ppp_hdlc.o: ../my_web_socket/ppp/ppp_hdlc.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/ppp/ppp_hdlc.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
my_web_socket/ppp/ppp_misc.o: ../my_web_socket/ppp/ppp_misc.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/ppp/ppp_misc.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

