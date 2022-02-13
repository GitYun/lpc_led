## BLANK LED

### output hex and bin files

```
arm-none-eabi-objcopy -v -O ihx lpc_led.elf lpc_led.hex
arm-none-eabi-objcopy -v -O binary lpc_led.elf lpc_led.bin
```

### output memory size usage

```
arm--none-eabi-size lpc_led.elf
```

### Use 'lpc21isp' to download bin file to LPC1114

```bash
lpc21isp -control -localecho -wipe -bin build/cross/arm/debug/lpc_led.bin /dev/ttyUSB0  115200 12000
```

