// B. Bourque 1/10/2008
// Simple led blink, prints LED status

#include <pic.h>		// Always include this
#include <stdio.h>

#include "lcd.h"
#include "delay.h"	

// The following line is required. do not let it break across lines
__CONFIG(FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);

#define LED RC0

void main(void) {


	ANSEL = 0;		// Pin function digital
	ANSELH = 0;		// Pin function digital
	
	PORTC = 0; // Set the port off
	TRISC = 0; // Set the port to outputs
	
	lcd_init();

	// Your main code here
	while(1)
	{
		LED = !LED;
		if(LED == 0)
		{
			printf("On\n");
		}
		else
		{
			printf("Off\n");
		}
		delayms(1000);
	}
}

