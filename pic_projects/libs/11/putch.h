#ifndef __PRINTF_H
#define __PRINTF_H

// A. Sheaff 1/17/2007 ECE 177

// Printf routine

// Partially implemented printf routine.
// Currently does not have flags, field widths, precision, nor length modifiers.
// int printf(const char *format, ...);

// %c is for a signed or unsigned char
// %d is for an int
// %u is for unsigned int
// %% is to print a %
// %x is to print int in hex
// %b is to print int in binary
// %s is to print NULL terminated char *

void putch(char c);

#endif // __PRINTF_H
