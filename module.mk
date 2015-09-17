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

# Initialize chip related build system variables.
defines += -Dstm32f4
arch += -mcpu=cortex-m4 -mthumb -mfloat-abi=softfp -mfpu=fpv4-sp-d16

# Main system file.
systemsources += \
	stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c \

# Chip specific information.
ifeq ($(chip),stm32f407)
defines += -DSTM32F407xx
systemsources += stm32f4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f407xx.s
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

# Add the sources for the HAL only if HAL is selected in use flags.
ifneq ($(strip $(findstring hal,$(use))),)
defines += -DUSE_HAL_DRIVER

systemheaders += \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_adc_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_adc.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_can.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_cec.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_conf.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_cortex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_crc.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_cryp_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_cryp.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dac_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dac.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dcmi_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dcmi.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_def.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dma2d.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dma_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dma.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dsi.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_eth.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_flash_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_flash.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_flash_ramfunc.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_fmpi2c_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_fmpi2c.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_gpio_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_gpio.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_hash_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_hash.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_hcd.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_i2c_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_i2c.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_i2s_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_i2s.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_irda.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_iwdg.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_lptim.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_ltdc_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_ltdc.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_nand.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_nor.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_pccard.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_pcd_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_pcd.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_pwr_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_pwr.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_qspi.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_rcc_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_rcc.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_rng.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_rtc_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_rtc.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_sai_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_sai.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_sd.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_sdram.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_smartcard.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_spdifrx.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_spi.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_sram.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_tim_ex.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_tim.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_uart.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_usart.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_wwdg.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_ll_fmc.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_ll_fsmc.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_ll_sdmmc.h \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_ll_usb.h \

systemsources += \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_adc.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_adc_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_can.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cec.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_crc.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cryp.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cryp_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dac.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dac_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dcmi.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dcmi_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma2d.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dsi.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_eth.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_fmpi2c.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_fmpi2c_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hash.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hash_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hcd.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_irda.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_iwdg.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_lptim.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_ltdc.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_ltdc_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_msp_template.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_nand.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_nor.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pccard.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pcd.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pcd_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_qspi.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rng.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rtc.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rtc_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sai.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sai_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sd.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sdram.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_smartcard.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spdifrx.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sram.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_usart.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_wwdg.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_fmc.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_fsmc.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_sdmmc.c \
	stm32f4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usb.c \

endif
