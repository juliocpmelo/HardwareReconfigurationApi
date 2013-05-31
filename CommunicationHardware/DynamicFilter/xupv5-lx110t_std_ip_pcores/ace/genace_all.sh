#!/bin/bash 

xbash -q -c "cd ../; /usr/bin/make -f system.make program; exit;"

xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -ace xupv5_pcores_bootloop.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../TestApp_Memory_microblaze_0/executable.elf -ace xupv5_pcores_testapp_mem.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../TestApp_Peripheral_microblaze_0/executable.elf -ace xupv5_pcores_testapp_periph.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/bootload_lcd_elf.elf -ace bootload_lcd.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/bootload_video_elf.elf -ace bootload_video.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/button_led_test_elf.elf -ace button_led_test.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/colorbar_elf.elf -ace colorbar.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/flash_hello_elf.elf -ace flash_hello.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/hello_elf.elf -ace hello.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/hello_uart_elf.elf -ace hello_uart.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/hello_uart_1_elf.elf -ace hello_uart_1.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/iic_clock_elf.elf -ace iic_clock.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/iic_ddr2_elf.elf -ace iic_ddr2.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/iic_eeprom_elf.elf -ace iic_eeprom.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/iic_fan_elf.elf -ace iic_fan.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/iic_sfp_elf.elf -ace iic_sfp.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -data ../sw/standalone/lwipdemo/image.mfs 0x8a400000 -elf ../microblaze_0/code/lwipdemo_elf.elf -ace lwipdemo.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/my_ace_elf.elf -ace my_ace.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/my_plat_flash_elf.elf -ace my_plat_flash.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/piezo_elf.elf -ace piezo.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/simon_elf.elf -ace simon.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/spi_hello_elf.elf -ace spi_hello.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/slideshow_elf.elf -ace slideshow.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/sysace_rebooter_elf.elf -ace sysace_rebooter.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/testfatfs_elf.elf -ace testfatfs.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/xflash_elf.elf -ace xflash.ace -board xupv5 -target mdm
xmd -tcl ../data/genace.tcl -hw ../implementation/download.bit -elf ../microblaze_0/code/xrom_elf.elf -ace xrom.ace -board xupv5 -target mdm


rm -rf ML50X
mkdir ML50X
cd ML50X
mkdir cfg0 cfg1 cfg2 cfg3 cfg4 cfg5 cfg6 cfg7
cd ..

cp -p bootload_video.ace ML50X/cfg0

cp -p xupv5_pcores_testapp_mem.ace ML50X/cfg1
cp -p spi_hello.ace ML50X/cfg2
cp -p button_led_test.ace ML50X/cfg3
cp -p hello.ace ML50X/cfg4
cp -p hello_uart.ace ML50X/cfg5
cp -p hello_uart_1.ace ML50X/cfg6
cp -p xflash.ace ML50X/cfg7
cp -p iic_clock.ace ML50X/cfg1
cp -p iic_ddr2.ace ML50X/cfg2
cp -p iic_eeprom.ace ML50X/cfg3
cp -p iic_fan.ace ML50X/cfg4
cp -p iic_sfp.ace ML50X/cfg5
cp -p piezo.ace ML50X/cfg6
cp -p xrom.ace ML50X/cfg7
cp -p testfatfs.ace ML50X/cfg1
cp -p slideshow.ace ML50X/cfg2
cp -p simon.ace ML50X/cfg3
cp -p sysace_rebooter.ace ML50X/cfg4
cp -p my_ace.ace ML50X/cfg5
cp -p flash_hello.ace ML50X/cfg6
cp -p xupv5_pcores_testapp_periph.ace ML50X/cfg7
cp -p colorbar.ace ML50X/cfg1
cp -p my_plat_flash.ace ML50X/cfg2
cp -p bootload_lcd.ace ML50X/cfg3
cp -p lwipdemo.ace ML50X/cfg4

cp -p ../implementation/download.bit ../implementation/xupv5_pcores_bootloop.bit
