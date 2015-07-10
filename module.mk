# Copyright 2015 Erik Van Hamme
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

sources += \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c \

ifeq ($(chip),stm32f407)
sources += stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f407xx.s
endif

# TODO: add support for the other stm32f4 chips if needed (as above). List:
#stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xc.s
#stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xe.s
#stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f405xx.s
#stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f411xe.s
#stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f415xx.s
#stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f417xx.s
#stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f427xx.s
#stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f429xx.s
#stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f437xx.s
#stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f439xx.s
#stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f446xx.s

systemheaders += \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f401xc.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f401xe.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f405xx.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f411xe.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f415xx.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f417xx.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f427xx.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f429xx.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f437xx.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f439xx.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f446xx.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f4xx.h \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/system_stm32f4xx.h \
	stm32f4/Drivers/CMSIS/Include/arm_common_tables.h \
	stm32f4/Drivers/CMSIS/Include/arm_const_structs.h \
	stm32f4/Drivers/CMSIS/Include/arm_math.h \
	stm32f4/Drivers/CMSIS/Include/core_cm0.h \
	stm32f4/Drivers/CMSIS/Include/core_cm0plus.h \
	stm32f4/Drivers/CMSIS/Include/core_cm3.h \
	stm32f4/Drivers/CMSIS/Include/core_cm4.h \
	stm32f4/Drivers/CMSIS/Include/core_cm7.h \
	stm32f4/Drivers/CMSIS/Include/core_cmFunc.h \
	stm32f4/Drivers/CMSIS/Include/core_cmInstr.h \
	stm32f4/Drivers/CMSIS/Include/core_cmSimd.h \
	stm32f4/Drivers/CMSIS/Include/core_sc000.h \
	stm32f4/Drivers/CMSIS/Include/core_sc300.h \

