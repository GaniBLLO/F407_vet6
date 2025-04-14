/*
 * bootloader.c
 *
 *  Created on: Apr 12, 2025
 *      Author: ganibllo
 */

#define ENABLE_BOOTLOADER_PROTECTION	0


#define FLASH_SIZE	512*1024
#define FLASH_END	FLASH_END

#define SRAM_SIZE	192*1024
#define SRAM_END	(SRAM_BASE + SRAM_SIZE)

#define SRAM_BACKUP	4*1024

//bootloader comands______________________________________________________________________
//Each packet is either accepted (ACK answer), or discarded (NACK answer):
#define ACK			0x79
#define NACK		0x1F

//Gets the version and the allowed commands supported by the current version of the protocol.
#define Get 		0x00
//Gets the protocol version.
#define GetVersion 	0x01
//Gets the chip ID.
#define CMD_GetID 		0x02
//Reads up to 256 bytes of memory starting from an address specified by the application.
#define ReadMemory 	0x11
//Jumps to user application code located in the internal flash memory or in the SRAM.
#define Go 			0x21
//Writes up to 256 bytes to the RAM or flash memory starting from an address specified by the application.
#define	WriteMemory 0x31
// Erases from one to all the flash memory pages.
#define Erase 		0x43
#define ExtendedErase x44

void tt(void){
	boot_loader();
}
