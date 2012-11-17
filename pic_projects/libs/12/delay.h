#ifndef __DELAY_H__
#define __DELAY_H__

#ifndef _XTAL_FREQ
#error Please define _XTAL_FREQ in Hz.
#endif

// A. Sheaff 1/10/2008
// Delay routines

// Delay in microseconds
void delayus(unsigned int t);

// Delay in milliseconds
void delayms(unsigned int t);

#endif // __DELAY_H__
