#ifndef __LCD_H__
#define __LCD_H__

// A. Sheaff 1/10/2008
// LCD interface.  LCD is connected in 4 bit mode to PORTD.

// Register select, Read/Write, Clock
#define LCD_RS RD0
#define LCD_RW RD1
#define LCD_E  RD2

// LCD commands
#define LCD_CLR		0x01	// LCD Clear
#define LCD_HOME	0x02	// LCD Home
#define LCD_SETDD	0x80	// LCD Set Data Address
#define LCD_SHIFT	0x10	// Shift
#define LCD_SCURS	0x00	// Shift Cursor
#define LCD_SDISP	0x08	// Shift Dislay
#define LCD_SRGHT	0x04	// Shift Right
#define LCD_SLEFT	0x00	// Shift Left

// LCD DATA RD4-RD7

// LCD initialization
void lcd_init(void);

// Wait for LCD to finish current operation.  Returnds DD RAM address.
unsigned char lcd_busy_wait(void);

// Write character data to LCD
void lcd_dwrite(unsigned char d);

// Write instruction data to LCD
void lcd_iwrite(unsigned char d);

// Read data memory
unsigned char lcd_dread(void);
#endif // __LCD_H__
