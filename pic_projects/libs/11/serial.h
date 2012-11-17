#ifndef __SERIAL_H
#define __SERIAL_H

// A. Sheaff 1/17/2007 ECE 177
// A. Sheaff Modified 3/31/2008
// Serail routines

// Serial port initialization
void serial_init(void);

// Transmit a single character c serially RS232.
void serial_tx(unsigned char c);

// Receive a single character c serially RS232.  Blocks.
char serial_rx(void);

// Serial putch
void serial_putch(char d);

// Serial getch
char serial_getch(void);

#endif // __SERIAL_H
