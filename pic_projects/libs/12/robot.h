#ifndef __ROBOT_H__
#define __ROBOT_H__

// Wheel diameter 2.111 inches
// 200 steps per revolution
// Wheel base 5.3"
// Maze is on 11.5" centers

__CONFIG( FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);


// Sensor A/D Channels
#define LEFT 3
#define FLEFT 2
#define FRIGHT 1
#define RIGHT 0

// Defines for motion
#define MSTOP 0x00
#define MFORWARD 0x01
#define MLEFT 0x03
#define MRIGHT 0x04

// Defines for acceleration
#define M_DELAY 150

// Motor data needed in interrupt routine
struct motors {
	signed char m_ls;
	signed char m_rs;
	unsigned char m_delay;
	signed int m_angle;
	unsigned int m_dist;
};

// Move robot
void move(unsigned char dir);

// Initaliation
void init(void);

// Interrupts
void interrupt isr(void);

// A/D converter
unsigned int sensor(unsigned char ch);

// 555 Period
unsigned int period(void);

#endif // __ROBOT_H__
