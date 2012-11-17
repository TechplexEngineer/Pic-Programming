#include <pic.h>
#include "printf.h"
#include "lcd.h"
#include "delay.h"
#include "robot.h"

#define STRAIGHTBAND 75		// Straight dead band

union u_uint_16 {
	volatile unsigned int s;
	volatile unsigned char b[2];
};

struct motors m={0,0,150,0,0};  // Motor init
union u_uint_16 plight={0};
union u_uint_16 clight={0};

#define LED RC0

void main(void)
{
	// Your code here


}

// Initialization
void init(void)
{

	// Motors
	PORTD=0;		// All Motor windings off
	TRISD=0;		// Motors

	// LED
	TRISC0=0;		// Status LED
	RC0=1;

	// A/D
	TRISA0=1;
	TRISA1=1;

	ANSEL=0x0f;		// CH 0 - 3 in use
	ANSELH=0;		// CH 0 - 3 in use

	ADCS0=1;		// 4 MHz - 2 us conversion
	ADCS1=0;
	VCFG0=0;		// Internal Ref +V
	VCFG1=0;		// Internal Ref GND
	CHS0=0;			// CH0
	CHS1=0;
	CHS2=0;
	CHS3=0;
	ADFM=1;			// Right Justified
	ADON=1;			// A/D on

	// LCD init
	lcd_init();

	// Timer 0 - Acceleration
	T0CS=0;			// Internal Clock
	PSA=0;			// Prescaler owned by timer0
	PS0=0;			// Prescaler is 1
	PS1=0;
	PS2=0;
	T0IF=0;			// Clear any pending interrupt
	T0IE=1;			// Enable interrupts

	// Use Capture and Timer 1 to get 555 period.
	TRISC2=1;
	CCP1M0=1;               // Capture every 16th on rising edge
	CCP1M1=1;
	CCP1M2=1;
	CCP1M3=0;
	TMR1CS=0;
	T1CKPS0=1;				// Prescale Timer 1 by 8
	T1CKPS1=1;
	TMR1ON=1;               // Capture uses timer 1
	CCP1IF=0;               // Clear interrupts
	CCP1IE=1;               // Enable interrupt

	// Start Interrupts
	PEIE=1;
	GIE=1;

	return;
}


void interrupt isr(void)
{
	static unsigned char d=50;
	static unsigned char ms=0;
	static unsigned char mr[]={0x01,0x02,0x04,0x08};
	static unsigned char ml[]={0x10,0x20,0x40,0x80};
	static signed char r=0;
	static signed char l=0;

	// Motor stepping interrupt and acceleration delay
	// Every 512us T0IF occurs
	if (T0IF) {
		if (m.m_ls|m.m_rs) {	// At least one motor on
			if (d==0) {				// Speed delay
				l+=m.m_ls;		// Next step
				r+=m.m_rs;		// Next step
				d=m.m_delay;
			}
			d--;
			if (ms==0) {			// PWM
				PORTD=mr[r&0x03]|ml[l&0x03];
				ms=1;
			} else {
				PORTD=0;
				ms=0;
			}
		} else {					// Motors set all off
			PORTD=0;
		}
		T0IF=0;
	}
	// Capture interrupt for getting 555 period.
	if (CCP1IF) {
		plight.s=clight.s;
		clight.b[1]=CCPR1H;
		clight.b[0]=CCPR1L;
		CCP1IF=0;
	}
	return;	
}

// Move robot
void move(unsigned char dir)
{
	switch (dir) {
		case MSTOP:		// Stop
			m.m_ls=0;
			m.m_rs=0;
			break;
		case MFORWARD:	// Forward
			m.m_ls=1;
			m.m_rs=1;
			break;
		case MRIGHT:	// Right
			m.m_ls=1;
			m.m_rs=0;
			break;
		case MLEFT:		// Left
			m.m_ls=0;
			m.m_rs=1;
			break;
	}
	return;
}

// 555 Period
unsigned int period(void)
{
	unsigned int p;
	
	CCP1IE=0;				// Atomic context
	p=clight.s-plight.s;	// Current minus previous times
	CCP1IF=0;
	CCP1IE=1;
	return p;
}

// Get current raw A/D value
unsigned int sensor(unsigned char ch)
{
	unsigned int res;

	CHS0=ch&0x01;	// Select channel
	CHS1=(ch&0x02)>>1;
	CHS2=(ch&0x04)>>2;
	CHS3=(ch&0x08)>>3;

	GO=1;			// Settling time - throw away.
	while (GO);
	GO=1;
	while (GO);
	res=(ADRESH<<8)+ADRESL;
	return res;
}
