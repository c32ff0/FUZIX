#define IDE_IS_MMIO  1		/* MMIO IDE */

#define IDE_REG_DATA		0x00F01000
#define IDE_REG_ERROR		0x00F01002
#define IDE_REG_FEATURES	0x00F01002
#define IDE_REG_SEC_COUNT	0x00F01004
#define IDE_REG_LBA_0		0x00F01006
#define IDE_REG_LBA_1		0x00F01008
#define IDE_REG_LBA_2		0x00F0100A
#define IDE_REG_LBA_3		0x00F0100C
#define IDE_REG_DEVHEAD		0x00F0100C
#define IDE_REG_STATUS		0x00F0100E
#define IDE_REG_COMMAND		0x00F0100E
#define IDE_REG_ALTSTATUS	0x00F01010
#define IDE_REG_CONTROL		0x00F01010

#define ide_select(x)
#define ide_deselect()
