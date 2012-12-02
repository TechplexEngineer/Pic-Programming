#ifndef __LCD_H__
#define __LCD_H__

// A. Sheaff 1/10/2008 - B. Bourque 10/22/2012
// LCD interface.  LCD is connected in 4 bit mode to PORTD.

//** Depends on delay.h

// Register select, Read/Write, Clock
#define LCD_RS RD0
#define LCD_RW RD1
#define LCD_E  RD2

// LCD DATA OUTPUT RD4-RD7
#define LCD_OUT PORTD

#define LCD_TRIS TRISD

// LCD commands
#define LCD_CLR		0x01	// LCD Clear
#define LCD_HOME	0x02	// LCD Home
#define LCD_SETDD	0x80	// LCD Set Data Address
#define LCD_SHIFT	0x10	// Shift
#define LCD_SCURS	0x00	// Shift Cursor
#define LCD_SDISP	0x08	// Shift Dislay
#define LCD_SRGHT	0x04	// Shift Right //direction of adding chars
#define LCD_SLEFT	0x00	// Shift Left

#define LCD_WIDTH   16

// LCD initialization
void lcd_init(void);

/**********************************************************/ 
// Send a command to the LCD
/**********************************************************/ 
void lcd_command(char i);

/**********************************************************/ 
//Send a character to the LCD
/**********************************************************/ 
void lcd_write(char i);

int lcd_printf(const char *format, ...);

//This isn't perfect, but for normal values
//PRE:	0 <= line <= 1 && 0 <= pos <= 15
//POST:	Cursor moveted to specified position
void lcd_moveCursor(char line, char pos);

//void strf(char* format, ...);

// Wait for LCD to finish current operation.  Returnds DD RAM address.
unsigned char lcd_busy_wait(void);

// Read data memory
//unsigned char lcd_readData(void);

//http://forum.htsoft.com/all/showflat.php?Number=220242&page=0
//void putch(char a);

//#define VSPRINTF

/** Notes (recommended)
	Make sure that ANSEL and ANSELH are set for pin function digital.
    PORTD = 0x00; 	// off
	TRISD = 0; 		// All PORTD pins are outputs
	PORTD = 0x00; 	// off

*/

#endif // __LCD_H__



