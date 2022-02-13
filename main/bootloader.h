#ifndef __BOOTLOADER_H
#define __BOOTLOADER_H

#include "stdint.h"

#define USER_APP_ID				0x7FFC
#define RAM_ADDR_START		0x10000000
#define RAM_BUFFER_ADDR		0x10001C00
#define FLASH_BUFFER_ADDR	0x2000
#define LAST_SECTOR_NUM		0x07
#define LAST_SECTOR_ADDR	0x7000

#define APP_DATA_BLOCK_SIZE	0x400
#define SECTOR_BLOCK_SIZE		4

#define APP_ADDR_START	0x1000

typedef void (*USER_ENTRY_PFN)();

#endif
