#include <pic.h>		// Always include this
#include <stdio.h>
#include <math.h>

#include "lcd.h"
#include "delay.h"

// The following line is required. do not let it break across lines
__CONFIG(FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);

#define MR RC0
#define ML RC1
#define LASER RC2

void main(void) 
{
	ANSEL = 0; 		// Pin functions digital
    ANSELH = 0; 	// Pin functions digital

	//TRIS Register Note: 0 is output

	//LEDs on portC
	//2 LEDs on PORTE
	
	//Make sure the ports are off
	PORTC = 0;
	PORTD = 0;
	PORTE = 0;
	
	TRISC = ~0xFF; 	// All PORTC pins are outputs
	TRISD = ~0xFF; 	// All PORTD pins are outputs
	TRISE = ~0xFF; 	// All PORTE pins are outputs
	
	//ADON = 1;		//Turn on A2D Converter
	ADCON0 = 0b00101101;
	
	ADFM = 1;		//Set output to right justified
	
	
	//turn on GoDone
	ADCON0 |= 0b00000010;
	
	//AN11 1011
	
	//here
	lcd_init();
	lcd_iwrite(LCD_CLR);
	MR = ML = LASER = 1;
	printf(" Setup Complete ");
	delayms(1000);	//5sec.
	lcd_iwrite(LCD_CLR);
	
	unsigned int counter = 0;
	
	
	while(1)
	{
		lcd_iwrite(LCD_CLR);
		
		int ADRES8 = ADRESH&0x01;
		int ADRES9 = (ADRESH >> 1)&0x01;
		int ctrl = ADRES8*256+ADRES9*512+ADRESL;
		
		ctrl /= 2;
		
		printf("%u %u", ctrl, counter);//ADRESH
		ADCON0 |= 0b00000010;
		//LASER =! LASER;
		if(counter % ctrl == 0)
		{
			//MR = !MR;
			//ML = !ML;
		}
		delayus(250);
		
		if(counter >= ctrl)
		{
			counter = 0;
			MR = !MR;
		}
		else
			counter ++;
	}
}









