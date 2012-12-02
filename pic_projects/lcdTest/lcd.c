#include "lcd.h"
#include <pic.h>
#include "delay.h"
//#include <stdio.h>
//#include <stdlib.h>
#include <stdarg.h> 
//4-bit LCD Initialization: 
int cursor;				//holds current cursor position.
char line2[LCD_WIDTH];
char line1Full;

void zeroArray(char* array, char length)
{
	for(int i=0; i<length; i++)
	{
		array[i] = ' ';
	}
}

//put data on output Port
void lcd_put(char i) {
	LCD_OUT &= 0x0F; 	//Clear upper four bits
	LCD_OUT |= (i&0xF0); //put upper four bits of data on output Port
}
/**********************************************************/
void lcd_toggleClock() {
	LCD_E = 1;
	delayms(1); 		//enable pulse width  >= 300ns
	LCD_E = 0;  		//Clock enable: falling edge 
	delayms(1);
}
/**********************************************************/
void lcd_command(char i) {
	lcd_put(i); 		//put data on output Port
	LCD_RS = 0;			//D/I=LOW : send instruction 
	LCD_RW = 0;			//R/W=LOW : Write      
	lcd_toggleClock();	//Send lower 4 bits
	i = i<<4;			//Shift over by 4 bits 
	lcd_put(i);			//put data on output Port
	lcd_toggleClock();	//Send upper 4 bits
	lcd_put(0);			//Clear upper four bits
	
	if(i == LCD_CLR)
	{	
		cursor = 0;
		zeroArray(line2, LCD_WIDTH);
		line1Full = 0;
	}
}
/**********************************************************/
void lcd_write(char i) {
	lcd_put(i);			//put data on output Port
	LCD_RS =1;			//D/I=HIGH : send data 
	LCD_RW =0;			//R/W=LOW : Write     
	lcd_toggleClock();	//Clock upper 4 bits
	i = i<<4;			//Shift over by 4 bits 
	lcd_put(i);
	lcd_toggleClock();	//Clock lower 4 bits
	lcd_put(0);			//Clear output port
}
/**********************************************************/
void lcd_init() {
	/*
	ANSEL = 0; 			// Pin functions digital
    ANSELH = 0; 		/ Pin functions digital
    PORTD = 0x00; 		// off
	TRISD = 0; 			// All PORTD pins are outputs
	PORTD = 0x00; 		// off
	*/
	
	lcd_toggleClock();
	lcd_put(0);			//Clear output port
	delayms(15);		//Wait >15 msec after power is applied 
	lcd_put(0x30);		//put 0x30 on the output port 
	delayms(5);			//must wait 5ms, busy flag not available 
	lcd_toggleClock();	//command 0x30 = Wake up  
	delayus(160);		//must wait 160us, busy flag not available 
	lcd_toggleClock();	//command 0x30 = Wake up #2 
	delayus(160);		//must wait 160us, busy flag not available 
	lcd_toggleClock();	//command 0x30 = Wake up #3 
	delayms(10);		//can check busy flag now instead of delay 
	lcd_put(0x20);		//put 0x20 on the output port 
	lcd_toggleClock();	//Function set: 4-bit interface 
	lcd_command(0x28);	//Function set: 4-bit/2-line 
	lcd_command(0x10);	//Set cursor 
	lcd_command(0x0F);	//Display ON; Blinking cursor 
	lcd_command(0x06);	//Entry Mode set
	
	cursor = 0;
	zeroArray(line2, LCD_WIDTH);
	line1Full = 0;
	lcd_command(LCD_CLR);
}
//This isn't perfect, but for normal values
//PRE:	0 <= line <= 1 && 0 <= pos <= 15
//POST:	Cursor moved to specified position
void lcd_moveCursor(char line, char pos) {
	lcd_command(LCD_SETDD | (0x40*line) | pos);
}
/**********************************************************/
/* Removing --Superfluoius
void lcd_print(char* string)
{
	//int length = strlenpgm(format);
	for(int i=0; string[i]; i++)
	{
		lcd_write(string[i]);
		cursor ++;
	}
}
*/
typedef char flag;
typedef unsigned int uint;
// type -- a character-putter (putc-like sink)
typedef void(*putter)(int);
typedef char byte;
void byte2hex(byte b, char *hex, flag upper) {
	static const char *uppers="0123456789ABCDEF";
	static const char *lowers="0123456789abcdef";
	const char *letters=(upper ? uppers : lowers);
	// select table
	hex[0]=letters[(unsigned)b>>4];
	hex[1]=letters[b & 0x0f];
}
// lcd_write
void putC(char i)
{
	cursor++;
	//						protect against index out of bounds
	if((cursor > LCD_WIDTH && cursor <= 2*LCD_WIDTH)) // || line1Full
	{
		line2[cursor-(LCD_WIDTH-1)] = i;
	}
	
	if(cursor >= 2*LCD_WIDTH) //end of line2
	{
		lcd_command(LCD_CLR);  //also homes cursor
		
		//print second line on first
		for(int i=0; i<LCD_WIDTH ; i++)
		{
			lcd_write(line2[i]);
		}
		zeroArray(line2, LCD_WIDTH); //clear out the array to ensure that data from a previous run isn't printed on \n
		cursor -= LCD_WIDTH; //this means that \n should change cursor, but that is ok, as they won't add chars to the line after \n
		//line1Full = 0;
		lcd_moveCursor(1,0);//move to new line
	}
	lcd_write(i);
}

/* --------------------------------------------------------------- */
/* strf -- a reentrant mini printf to send a formatted string      */
/*                                                                 */
/*   putC   -- the function to which to send formatted characters  */
/*   format -- format and data string                              */
/*   args   -- list of other arguments as required                 */
/*                                                                 */
/*   returns the number (count) of characters sent                 */
/*                                                                 */
/* The following format indicators are supported:                  */
/*                                                                 */
/*   %%    -- '%'                                                  */
/*   %c    -- single char                                          */
/*   %d, i -- signed int                                           */
/*   %m    -- minidec decimal number  [iff MINIDEC is defined]     */
/*   %s    -- string                                               */
/*   %u    -- unsigned int                                         */
/*   %x, X -- hexadecimal                                          */
/*   %\n   -- LF only (otherwise ""\n"" becomes CRLF)              */
/*                                                                 */
/* The five ""printf"" format flags (""+ - 0 #"" and space) are    */
/* supported for all formats as in C99 (e.g., ""#"" only affects   */
/* 'x', here).                                                     */
/*                                                                 */
/* The 'h', 'l', and 'L' modifiers are not supported.              */
/*                                                                 */
/* Field width (e.g., %10i, %08x) is supported for all formats.    */
/*                                                                 */
/* Field precision (e.g., %5.7i) is not supported; for decimals,   */
/* use Quantize on a number to set its 'precision'.                */
/*                                                                 */
/* A ""\n"" in the string is expanded to ""\r\n"" unless preceded  */
/* by ""%"".                                                       */
/*                                                                 */
/* Almost no error checking is carried out, so, for example,       */
/* the flags and field width can be used even if the format        */
/* character is not one of those listed; the format character then */
/* appears in the output.                                          */
/* --------------------------------------------------------------- */
// This code is reentrant
// Powers of ten (powers[n]==10**n, 0<=n<=9)
const int powers[10]= {
	1, 10, 100, 1000, 10000, 100000, 1000000,
	                        10000000, 100000000, 1000000000
};
//putter putC,
int strf(const char *format, va_list args) {
  const char *f;         // pointer in format string
  int  count=0;          // chars put counter
  int  width;            // field width [0 means none, may be -ve]
  char sign;             // '+' flag, ' ' if space flag, 0x00 otherwise
  flag left;             // 1 if '-' left-justify flag
  flag alt;              // 1 if '#' flag
  char pad;              // '0' if '0' flag
  char buff[25];         // work, >17 for decimal, >24 for double 'a'
  char *source;          // where to get data from (buff, except for %s)
  int  sourlen;          // characters present at source
  static char line2[16] = {0};
  static char position = 1; //set to where the cursor is

  for (f=format; *f!=0; f++) 
  {
    if (*f!='%') 			// not escape character
    {                           
      if (*f=='\n') 
      {
      	if(cursor <= LCD_WIDTH)
      	{
        	lcd_moveCursor(1,0);//move to new line
	       	cursor = LCD_WIDTH+1;
        	//line1Full = 1;
        }
        else if(cursor > LCD_WIDTH)
        {
        	cursor = 2*LCD_WIDTH;
        }

      }
      else 
      {
      	putC(*f); count++;
      }
      continue;
     }
    // have %
    f++;

    left=0; sign=0x00; alt=0; pad=' ';
    for (;; f++) {           // handle leading flags in any order
      if (*f=='-') left=1;         // left align in field
       else if (*f=='+') sign='+'; // use '+' on signed numbers
       else if (*f=='0') pad='0';  // pad numerics with 0
       else if (*f=='#') alt=1;    // alternate format for x and X
       else if (*f==' ') {         // use ' ' for '+'
        if (!sign) sign=' ';       // does not override +
        }
       else break;
      } // flags loop
    if (left) pad=' ';             // ignore '0' if '-' (C99 spec.)

    width=0;                       // gather width, if any
    for (; *f>='0' && *f<='9'; f++) width=width*10+(*f-'0');
    // [dot and precision could be gathered here]

    // now the data-dependent formatting; the numeric formats and %c
    // lay out the result in buff and set the length in sourlen; this
    // is then output (after padding) as necessary at the end
    //
    // %s changes the source pointer and also sets sourlen
    source=buff;                   // default source

    switch(*f) {                   // format indicator

      case 'c': {
        char c=(char)va_arg(args, int);
        buff[0]=c; sourlen=1;
        pad=' ';                   // not a signed format
        break;}

      case 'u':
      case 'd':
      case 'i': {
        uint u=(uint)va_arg(args, uint);
        char *bp=buff;   // work
        int  i;          // work
        flag had;        // had leading digit

        if (*f=='u') {   // unsigned
          if (sign) {*bp=sign; bp++;}
          }
         else {          // signed
          int i=(int)u;
          if (i>=0) {
            if (sign) {*bp=sign; bp++;}
            }
           else {
            *bp='-'; bp++;
            if (u==0x80000000) u=2147483648U;
             else u=-i;
            }
          }
        // u is now abs(arg), such that 0 <= u <= 4294967295 (2**32-1)
        had=0;
        if (u==0)  {*bp='0'; bp++;}
         else for (i=9; i>=0; i--) {
          uint d=u/powers[i];
          if (d) had=1;  // had leading digit
          u%=powers[i];
          if (had) {*bp='0'+d; bp++;}
          }
        sourlen=bp-buff;
        break;}

      #ifdef MINIDEC
      case 'm': {
        dec num=va_arg(args, dec);
        char *bp=buff;   // work

        if (sign && !decIsSigned(num)) {*bp=sign; bp++;}
        decToString(num, bp);
        sourlen=0;       // set length ..
        for (bp=buff; *bp; bp++) sourlen++;  // strlen
        break;}
      #endif

      case 's': {
        char *cp=(char *)va_arg(args, int);
        sourlen=0;
        if (cp!=0) {
          source=cp;
          for (; *cp; cp++) sourlen++;       // strlen
          }
        // [else use zero-length 'string' from buff]
        pad=' ';                   // not a signed format
        break;}

      case 'x':
      case 'X': {
        uint u=(uint)va_arg(args, uint);
        flag upper=(*f=='X');
        flag had;
        char x[8];
        char *bp=buff;   // work
        int i;

        // handle any 0x or 0X prefix: if padding with '0' and right-
        // aligning then it must be sent now; otherwise add to buffer
        if (alt) {
          if (pad=='0' && !left) {
            putC('0'); putC(*f);
            count+=2;
            width-=2;    // (may push it negative)
            }
           else {
            *bp='0'; bp++;
            *bp=*f;  bp++;
            }
          } // alt

        // convert whole to hex
        for (i=6; i>=0; i-=2) {
          byte2hex(u & 0xff, &x[i], upper);
          u>>=8;
          }
        // copy to buff without leading zeros
        had=0;
        for (i=0; i<8; i++) {
          if (!had && x[i]=='0' && i!=7) continue; // skip leading 0s
          had=1;
          *bp=x[i]; bp++;
          }
        sourlen=bp-buff;
        // [this can be padded with '0' but never has sign]
        break;}

      default: {                   // %? => %?  (so %\n => LF, %% => %)
        // all of these may have padding
        buff[0]=*f; sourlen=1;
        break;}
      } // format char

    // all formats may need padding; width may be negative now
    if (!left) {
      // if padding with zeros and the first character is a sign then
      // output the sign before padding ("sign" may be ' ')
      if (pad=='0' && (*source=='-' || *source=='+' || *source==' ')) {
        putC(*source); count++;
        width--;    // (may push it negative)
        source++;   // step past sign
        sourlen--;  // and account
        }
      for (; width>sourlen; width--) {putC(pad); count++;}
      }
    // output the real data
    for (; sourlen>0; source++, sourlen--, width--) {putC(*source); count++;}
    // padding might be afterwards
    if (left) for (; width>0; width--) {putC(pad); count++;}
    } // format scan

  return count;
  } // strf
int lcd_printf(const char *format, ...) {
	va_list args; // argument list
	int count=0; // chars put counter
	va_start(args, format);
	// carry out formatting, sending generated characters to lcd_write
	count=strf(format, args); //lcd_write, 
	va_end(args); // done with argument list
	return count;
}

unsigned char lcd_busy_wait(void)
{
	unsigned char value=0;
	LCD_RS = 0;
	LCD_RW = 1;
	LCD_TRIS |= 0xF0; //set to input
	while(!(LCD_OUT&0x80));		//wait for the busy flag to become false
	//value = LCD_OUT;
	LCD_TRIS &= 0x0F; //set back to output
	
	return 0;
}


