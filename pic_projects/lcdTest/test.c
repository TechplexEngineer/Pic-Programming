#include <pic.h>		// Always include this
#include <stdio.h>
#include <math.h>

#include "lcd.h"
#include "delay.h"
//#include "177.h"


// The following line is required. do not let it break across lines
__CONFIG(FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);


#define BUZZER RD3
#define LED RC0

void toggleClock();
void command(char i);

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
	
	/*PORTC = 0xFF; //on
	PORTE = 0b00000111;
	delayms(1000);
	PORTC = 0x00; //on
	PORTE = 0b00000000;
	delayms(1000);*/
	
	//ANSEL = 0; 		// Pin functions digital
    //ANSELH = 0; 	// Pin functions digital
    
    /*PORTD = 0x00; 	// off
	TRISD = 0; 		// All PORTD pins are outputs
	PORTD = 0x00; 	// off*/
	
	
	/** //Toggle RD3 for test
	RD3 = 1;
	while(1)
	{
		RD3 = !RD3;
		delayms(5);
	}
	*/
	
	
	////////////////////////////// 
	/*
	RD3 = 1;
	delayms(5);
	RD3 = 0;
	
	delayms(5);
	lcd_write(0b01100001);//lowercase a
	*/ //////////////////////////////
	
	
		
	
	
	
	//** Testing Section **
	//Toggle portD
	/*
	PORTD = 0xff;
	delayms(1000);
	PORTD = 0x00;
	delayms(1000);
	*/
	
	/*
	//Toggle the output lines
	LCD_RS = 1;
	delayms(1000);
	LCD_RS = 0;
	LCD_RW = 1;
	delayms(1000);
	LCD_RW = 0;
	LCD_E = 1;
	delayms(1000);
	LCD_E = 0;
	*/
	
	/*
	//check the data lines
	LCD_OUT = 0xff;	//Turn on PORTD
	delayms(1000);
	LCD_OUT &= 0xF0; //Turn off upper four bits
	delayms(1000);
	LCD_OUT &= 0x0F; //Turn off lower four bits
	delayms(1000);
	*/
	
	
	
//	LCD_OUT = 0x01;
//	//pow(2, 4); //put a one in the 4th bit position
//	for(int i=0; i < 15; i++)
//	{
//		LCD_OUT <<= 1;
//		delayms(1000);
//	}

	//If I wanted to write 1100 1001 
	
//	LCD_OUT = 0xc0;
//	delayms(1000);
//	LCD_OUT = 0x90;
//	delayms(1000);
	
	
	//most significant to least sig bits
	//LCD_OUT = 0xc0; //1100 M -> L
	//delayms(1000);
	

	//INIT
	/*
	LCD_OUT = 0;	//Set the output port off
	LCD_RS = 0;
	LCD_RW = 0;
	LCD_E  = 0;
	
	delayms(50);	//Wait at >15 ms
	
	LCD_OUT = 0x30;	//command 0x30 = Wake up  //Put on output port
	delayms(5);		//must wait 5ms, busy flag not available
	toggleClock();	
	
	delayus(160);
	toggleClock();	//wake up #2
	
	delayus(160);
	toggleClock();	//wake up #3
	
	//can check busy flag now instead of delay 	
	delayus(160);

	LCD_OUT = 0x20;	//4bit flag
	toggleClock();
	
	command(0x28);		//Function set: 4-bit/2-line 
	command(0x10);		//Set cursor 
	command(0x0F);		//Display ON; Blinking cursor 
	command(0x06);		//Entry Mode set 
	*/
	
	//here
	lcd_init();
	lcd_command(LCD_CLR);
	
	lcd_printf("abc\nbcd");

	//delayms(5000);
	lcd_printf("\nefg");
	delayms(1500);
	
	//lcd_command(LCD_CLR);
	//lcd_printf("Done");
	
	int count = 0;
	while(1)
	{
		lcd_printf("Count: %i \n",count);
		count++;
		delayms(500);
	}
	
	/* LED Blink
	while(1)
	{
		LED =!LED;
		
		if(LED == 0)
		{
			lcd_command(LCD_CLR);
			lcd_printf("on");
			
		}
		else
		{
			lcd_command(LCD_CLR);
			lcd_printf("off");
		}
		delayms(3000);
	}*/
	
	//lcd_print("test");
	//lcd_printf("test %d \n test2", 7);
	//lcd_printf("abcdefghijklmnopqrstuvwxyz012345");
	
	//lcd_printf("t");
	
	//lcd_command(LCD_SETDD | 0x40 | 15);  //line2 last position
	lcd_printf("This is a test \n");
	//lcd_command(LCD_SDISP);
	
	lcd_printf("Hey Sheaff\n");
	delayms(1000);
	lcd_printf("Hey Ben\n");
	
	//command(LCD_SRGHT);	
	
	//This works:
	//lcd_write('b');//lowercase a //0b01100001
	//lcd_write('c');
	
	
	//This also works: 
	/*
	char buffer [50];
	int length, a=5, b=3;
	length=sprintf (buffer, "%d plus %d is %d", a, b, a+b);
	
	for(int i=0; i<length; i++)
	{
		lcd_write(buffer[i]);
	}
	*/
	
	

	//lcd_write(0xff);//solid block
	//lcd_write(0x21);//space
	//lcd_write(0x46);//F
	
	//command(LCD_SCURS);
	
	
		
	
	
	
	
	
	
	//char out = 0b01100001;

	//out <<= 4;
	//out &= 0b11110000;
	//PORTC = out;
	//out & 0x0F;		 //Make sure that the right shift operation inserted zeros
	//PORTC = (LCD_OUT || out);
	//LCD_OUT = (LCD_OUT || out); //Set bits but leave others on RD alone
	//delayms(1000);

	
	
	//lcd_init();
	//lcd_command(LCD_CLR);
	//lcd_write(0b01100001);
	
	/*
	ANSEL = 0; 		// Pin functions digital
    ANSELH = 0; 	// Pin functions digital
	TRISD = 0; 	// All PORTD pins are outputs
	PORTD = 0x00; //off
	RD3 = 1;	//Trigger for LA
	
	
	
	LCD_E = 1;
	delayms(25);
	LCD_E = 0;*/
	
	//lcd_command(LCD_CLR);
	//lcd_write(0b01100001);
	
	
	
	//printf("\n");
	//printf("123456789abcdef|");
	/*while(0){	
		BUZZER =1;
		delayus(400);
		BUZZER = 0;
		delayus(400);
	}*/
	//PORTC = ~0xFF;
	//PORTE = ~0x30;
/*	while(1)
	{
		BUZZER =1;
		delayus(400);
		BUZZER = 0;
		delayus(400);
	}*/
	
	//TRISD = ~0b00001000; //the buzzer is an output
	while(1){
	
		//BUZZER = ~BUZZER;
//		delayus(50);
		delayus(50000); //400
		
		//PORTC = 0xFF;
		//PORTE = 0b00000011; //turn on port E LEDs
		//BUZZER = 0;
		//delayms(400);
	}

}
/**********************************************************/ 
void toggleClock()
{ 
	LCD_E = 1; 
	delayms(1);				//enable pulse width  >= 300ns //supposed to be ms?
	LCD_E = 0;				//Clock enable: falling edge 
}
/**********************************************************/ 
void command(char i) 
{ 
	LCD_OUT = i;			//put data on output Port 
	LCD_RS = 0;				//D/I=LOW : send instruction 
	LCD_RW = 0;				//R/W=LOW : Write      
	toggleClock();			//Send lower 4 bits 
	i = i<<4;				//Shift over by 4 bits 
	LCD_OUT = i;			//put data on output Port 
	toggleClock();			//Send upper 4 bits 
}

