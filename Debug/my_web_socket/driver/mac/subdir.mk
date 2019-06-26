################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../my_web_socket/driver/mac/stm32f7xx_eth_driver.c 

OBJS += \
./my_web_socket/driver/mac/stm32f7xx_eth_driver.o 

C_DEPS += \
./my_web_socket/driver/mac/stm32f7xx_eth_driver.d 


# Each subdirectory must supply rules for building sources it contributes
my_web_socket/driver/mac/stm32f7xx_eth_driver.o: ../my_web_socket/driver/mac/stm32f7xx_eth_driver.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F746xx -DDEBUG -c -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Inc -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/common" -I"E:/Users/StefanoParacchino/STM32CubeIDE/workspace_1.0.1/NUCLEO-WebSocket/my_web_socket_Head/cyclone_ssl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"my_web_socket/driver/mac/stm32f7xx_eth_driver.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

