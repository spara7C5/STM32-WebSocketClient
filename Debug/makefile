################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include my_web_socket/xof/subdir.mk
-include my_web_socket/web_socket/subdir.mk
-include my_web_socket/snmp/subdir.mk
-include my_web_socket/rng/subdir.mk
-include my_web_socket/ppp/subdir.mk
-include my_web_socket/pkc/subdir.mk
-include my_web_socket/netbios/subdir.mk
-include my_web_socket/mpi/subdir.mk
-include my_web_socket/mibs/subdir.mk
-include my_web_socket/mdns/subdir.mk
-include my_web_socket/mac/subdir.mk
-include my_web_socket/kdf/subdir.mk
-include my_web_socket/ipv6/subdir.mk
-include my_web_socket/ipv4/subdir.mk
-include my_web_socket/hash/subdir.mk
-include my_web_socket/encoding/subdir.mk
-include my_web_socket/ecc/subdir.mk
-include my_web_socket/driver/phy/subdir.mk
-include my_web_socket/driver/mac/subdir.mk
-include my_web_socket/dns_sd/subdir.mk
-include my_web_socket/dns/subdir.mk
-include my_web_socket/dhcpv6/subdir.mk
-include my_web_socket/dhcp/subdir.mk
-include my_web_socket/cyclone_sll/subdir.mk
-include my_web_socket/core/subdir.mk
-include my_web_socket/common/subdir.mk
-include my_web_socket/cipher_mode/subdir.mk
-include my_web_socket/cipher/subdir.mk
-include my_web_socket/certificate/subdir.mk
-include my_web_socket/aead/subdir.mk
-include my_web_socket/subdir.mk
-include Startup/subdir.mk
-include Src/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/subdir.mk
-include Drivers/STM32F7xx_HAL_Driver/Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
NUCLEO-WebSocket.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
NUCLEO-WebSocket.list \


# All Target
all: NUCLEO-WebSocket.elf secondary-outputs

# Tool invocations
NUCLEO-WebSocket.elf: $(OBJS) $(USER_OBJS) E:\Users\StefanoParacchino\STM32CubeIDE\workspace_1.0.1\NUCLEO-WebSocket\STM32F746ZGTX_FLASH.ld
	arm-none-eabi-gcc -o "NUCLEO-WebSocket.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m7 -T"E:\Users\StefanoParacchino\STM32CubeIDE\workspace_1.0.1\NUCLEO-WebSocket\STM32F746ZGTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="NUCLEO-WebSocket.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

NUCLEO-WebSocket.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "NUCLEO-WebSocket.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
