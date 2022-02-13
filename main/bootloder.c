#include "include.h"
#include "bootloader.h"

#define MENU	"		\"u\": Upload User Application Firmware" \
                            "		\"a\": Get the version of the current application"	\
                            "		\"b\": Get the version of the current bootloader"	\
                            "		\"q\": Quit"

extern volatile uint8_t UARTBuffer[BUFSIZE];

void print_menu(void)
{
    _PRINT_("Commands:");
    _PRINT_(MENU);
}

void delayUs(uint32_t us)
{
    static uint32_t count;
    SysTick->CTRL |= (1 << 0);
    for (count = 0; count < us; count++) {
        do {
        } while (!(SysTick->CTRL & (1 << 16)));
    }
    SysTick->CTRL &= ~(1 << 0);
}

int c_entry()
{
    uint8_t ch;
//	int retval = 0;
    
    SystemInit();
    SystemCoreClockUpdate();

    UART_Init();		// baudrate: 115200
    print_menu();

    LPC_IOCON->PIO3_5 &= ~(0x3);
    LPC_GPIO3->DIR |= (1 << 5);
    LPC_GPIO3->DATA &= ~(1 << 5);

    for (;;)
    {
        LPC_GPIO3->DATA ^= (1 << 5);
        // delayUs(1000000);
        for (uint32_t i = 1000000; i > 0; --i);
    }
    
    while(1)
    {
        _PRINT_("\r\n>");
        ch = _GET_C;
        _PRINT_C(ch);
        _PRINT_("");	// new line
        switch(ch)
        {
            case 'u':
            case 'U':
                _PRINT_("Upload User Application Firmware");
                break;
            case 'a':
            case 'A':
                _PRINT_("Read Current App Version ID...");
                break;
            case 'b':
            case 'B':
                _PRINT_("Read Current Bootloader Version ID...");
                break;
            case 'q':
            case 'Q':
                goto end_program;
            default:
                continue;
        }
    }
    
end_program:
    while(1);
}

int main()
{
    return c_entry();
}

