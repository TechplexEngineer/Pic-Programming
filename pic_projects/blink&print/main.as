opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F887
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 11 "main.c"
	psect config,class=CONFIG,delta=2 ;#
# 11 "main.c"
	dw 0xFFFC & 0xFFF7 & 0xFFFF & 0xFFDF & 0xFFFF & 0xFFFF & 0xFCFF & 0xFBFF & 0xF7FF & 0xEFFF & 0xFFFF ;#
	FNCALL	_main,_lcd_init
	FNCALL	_main,_printf
	FNCALL	_main,_delayms
	FNCALL	_printf,_putch
	FNCALL	_putch,_lcd_iwrite
	FNCALL	_putch,_lcd_busy_wait
	FNCALL	_putch,_lcd_dwrite
	FNCALL	_lcd_init,_delayus
	FNCALL	_lcd_init,_lcd_clk
	FNCALL	_lcd_init,_lcd_busy_wait
	FNCALL	_lcd_init,_lcd_iwrite
	FNCALL	_lcd_dwrite,_lcd_busy_wait
	FNCALL	_lcd_dwrite,_lcd_clk
	FNCALL	_lcd_iwrite,_lcd_busy_wait
	FNCALL	_lcd_iwrite,_lcd_clk
	FNCALL	_delayms,_delayus
	FNROOT	_main
	global	putch@b
	global	_PORTC
psect	text150,local,class=CODE,delta=2
global __ptext150
__ptext150:
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RC0
_RC0	set	56
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_RD2
_RD2	set	66
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_ANSEL
_ANSEL	set	392
	global	_ANSELH
_ANSELH	set	393
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_2:	
	retlw	79	;'O'
	retlw	102	;'f'
	retlw	102	;'f'
	retlw	10
	retlw	0
psect	strings
	
STR_1:	
	retlw	79	;'O'
	retlw	110	;'n'
	retlw	10
	retlw	0
psect	strings
	file	"main.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
putch@b:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_putch
?_putch:	; 0 bytes @ 0x0
	global	?_delayus
?_delayus:	; 0 bytes @ 0x0
	global	?_lcd_clk
?_lcd_clk:	; 0 bytes @ 0x0
	global	??_lcd_clk
??_lcd_clk:	; 0 bytes @ 0x0
	global	??_lcd_busy_wait
??_lcd_busy_wait:	; 0 bytes @ 0x0
	global	?_lcd_iwrite
?_lcd_iwrite:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_dwrite
?_lcd_dwrite:	; 0 bytes @ 0x0
	global	?_lcd_busy_wait
?_lcd_busy_wait:	; 1 bytes @ 0x0
	global	?_printf
?_printf:	; 2 bytes @ 0x0
	global	delayus@t
delayus@t:	; 2 bytes @ 0x0
	ds	2
	global	??_delayus
??_delayus:	; 0 bytes @ 0x2
	global	lcd_busy_wait@bfa
lcd_busy_wait@bfa:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_iwrite
??_lcd_iwrite:	; 0 bytes @ 0x3
	global	??_lcd_dwrite
??_lcd_dwrite:	; 0 bytes @ 0x3
	ds	1
	global	?_delayms
?_delayms:	; 0 bytes @ 0x4
	global	delayms@t
delayms@t:	; 2 bytes @ 0x4
	ds	1
	global	lcd_dwrite@d
lcd_dwrite@d:	; 1 bytes @ 0x5
	global	lcd_iwrite@d
lcd_iwrite@d:	; 1 bytes @ 0x5
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x6
	global	??_delayms
??_delayms:	; 0 bytes @ 0x6
	global	??_putch
??_putch:	; 0 bytes @ 0x6
	ds	1
	global	putch@a
putch@a:	; 1 bytes @ 0x7
	ds	1
	global	putch@c
putch@c:	; 1 bytes @ 0x8
	ds	1
	global	??_printf
??_printf:	; 0 bytes @ 0x9
	ds	1
	global	printf@ap
printf@ap:	; 1 bytes @ 0xA
	ds	1
	global	printf@f
printf@f:	; 1 bytes @ 0xB
	ds	1
	global	printf@c
printf@c:	; 1 bytes @ 0xC
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xD
;;Data sizes: Strings 9, constant 0, data 0, bss 1, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; printf@f	PTR const unsigned char  size(1) Largest target is 5
;;		 -> STR_2(CODE[5]), STR_1(CODE[4]), 
;;
;; printf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_printf(COMMON[2]), 
;;
;; S1810$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_printf
;;   _printf->_putch
;;   _putch->_lcd_iwrite
;;   _putch->_lcd_dwrite
;;   _lcd_init->_lcd_iwrite
;;   _lcd_dwrite->_lcd_busy_wait
;;   _lcd_iwrite->_lcd_busy_wait
;;   _delayms->_delayus
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     510
;;                           _lcd_init
;;                             _printf
;;                            _delayms
;; ---------------------------------------------------------------------------------
;; (1) _printf                                              10    10      0     285
;;                                              9 COMMON     4     4      0
;;                              _putch
;; ---------------------------------------------------------------------------------
;; (2) _putch                                                3     3      0     255
;;                                              6 COMMON     3     3      0
;;                         _lcd_iwrite
;;                      _lcd_busy_wait
;;                         _lcd_dwrite
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0     165
;;                            _delayus
;;                            _lcd_clk
;;                      _lcd_busy_wait
;;                         _lcd_iwrite
;; ---------------------------------------------------------------------------------
;; (3) _lcd_dwrite                                           3     3      0      75
;;                                              3 COMMON     3     3      0
;;                      _lcd_busy_wait
;;                            _lcd_clk
;; ---------------------------------------------------------------------------------
;; (3) _lcd_iwrite                                           3     3      0      75
;;                                              3 COMMON     3     3      0
;;                      _lcd_busy_wait
;;                            _lcd_clk
;; ---------------------------------------------------------------------------------
;; (1) _delayms                                              2     0      2      60
;;                                              4 COMMON     2     0      2
;;                            _delayus
;; ---------------------------------------------------------------------------------
;; (4) _lcd_busy_wait                                        3     3      0      45
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (4) _lcd_clk                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _delayus                                              4     2      2      45
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _delayus
;;     _lcd_clk
;;     _lcd_busy_wait
;;     _lcd_iwrite
;;       _lcd_busy_wait
;;       _lcd_clk
;;   _printf
;;     _putch
;;       _lcd_iwrite
;;         _lcd_busy_wait
;;         _lcd_clk
;;       _lcd_busy_wait
;;       _lcd_dwrite
;;         _lcd_busy_wait
;;         _lcd_clk
;;   _delayms
;;     _delayus
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      D       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0       E       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      12      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 15 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_init
;;		_printf
;;		_delayms
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"main.c"
	line	15
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	18
	
l6565:	
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(392)^0180h	;volatile
	line	19
	clrf	(393)^0180h	;volatile
	line	21
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	22
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	24
	
l6567:	
	fcall	_lcd_init
	goto	l6569
	line	27
	
l1031:	
	line	29
	
l6569:	
	movlw	1<<((56)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((56)/8),f
	line	30
	
l6571:	
	btfsc	(56/8),(56)&7
	goto	u2341
	goto	u2340
u2341:
	goto	l6575
u2340:
	line	32
	
l6573:	
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_printf
	line	33
	goto	l6577
	line	34
	
l1032:	
	line	36
	
l6575:	
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_printf
	goto	l6577
	line	37
	
l1033:	
	line	38
	
l6577:	
	movlw	low(03E8h)
	movwf	(?_delayms)
	movlw	high(03E8h)
	movwf	((?_delayms))+1
	fcall	_delayms
	goto	l6569
	line	39
	
l1034:	
	line	27
	goto	l6569
	
l1035:	
	line	40
	
l1036:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_printf
psect	text151,local,class=CODE,delta=2
global __ptext151
__ptext151:

;; *************** function _printf *****************
;; Defined at:
;;		line 461 in file "/usr/local/ht-picc/9.83/lib/doprnt.c"
;; Parameters:    Size  Location     Type
;;  f               1    wreg     PTR const unsigned char 
;;		 -> STR_2(5), STR_1(4), 
;; Auto vars:     Size  Location     Type
;;  f               1   11[COMMON] PTR const unsigned char 
;;		 -> STR_2(5), STR_1(4), 
;;  _val            4    0        struct .
;;  c               1   12[COMMON] char 
;;  ap              1   10[COMMON] PTR void [1]
;;		 -> ?_printf(2), 
;;  flag            1    0        unsigned char 
;;  prec            1    0        char 
;; Return value:  Size  Location     Type
;;                  2  1026[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_putch
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text151
	file	"/usr/local/ht-picc/9.83/sources/doprnt.c"
	line	461
	global	__size_of_printf
	__size_of_printf	equ	__end_of_printf-_printf
	
_printf:	
	opt	stack 4
; Regs used in _printf: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	537
	movwf	(printf@f)
	
l6559:	
	movlw	(?_printf)&0ffh
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	movwf	(printf@ap)
	line	540
	goto	l6563
	
l1044:	
	line	545
	
l6561:	
	movf	(printf@c),w
	fcall	_putch
	line	546
	goto	l6563
	line	1525
	
l1043:	
	line	540
	
l6563:	
	movlw	01h
	addwf	(printf@f),f
	movlw	-01h
	addwf	(printf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	movwf	(printf@c)
	movf	((printf@c)),f
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l6561
u2330:
	goto	l1046
	
l1045:	
	line	1533
;	Return value of _printf is never used
	
l1046:	
	return
	opt stack 0
GLOBAL	__end_of_printf
	__end_of_printf:
;; =============== function _printf ends ============

	signat	_printf,602
	global	_putch
psect	text152,local,class=CODE,delta=2
global __ptext152
__ptext152:

;; *************** function _putch *****************
;; Defined at:
;;		line 8 in file "putch.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    8[COMMON] unsigned char 
;;  a               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_iwrite
;;		_lcd_busy_wait
;;		_lcd_dwrite
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text152
	file	"/usr/local/ht-picc/9.83/sources/putch.c"
	line	8
	global	__size_of_putch
	__size_of_putch	equ	__end_of_putch-_putch
	
_putch:	
	opt	stack 4
; Regs used in _putch: [wreg+status,2+status,0+pclath+cstack]
	line	12
	movwf	(putch@c)
	
l6539:	
	movf	(putch@c),w
	xorlw	0Dh
	skipnz
	goto	u2291
	goto	u2290
u2291:
	goto	l6543
u2290:
	
l6541:	
	movf	(putch@c),w
	xorlw	0Ah
	skipz
	goto	u2301
	goto	u2300
u2301:
	goto	l6547
u2300:
	goto	l6543
	
l4165:	
	line	13
	
l6543:	
	clrf	(putch@b)
	bsf	status,0
	rlf	(putch@b),f
	goto	l4166
	line	14
	
l6545:	
	goto	l4166
	line	15
	
l4163:	
	line	16
	
l6547:	
	movf	(putch@b),w
	skipz
	goto	u2310
	goto	l4167
u2310:
	line	17
	
l6549:	
	movlw	(01h)
	fcall	_lcd_iwrite
	line	18
	movlw	(02h)
	fcall	_lcd_iwrite
	line	19
	
l6551:	
	clrf	(putch@b)
	line	20
	
l4167:	
	line	21
	fcall	_lcd_busy_wait
	movwf	(??_putch+0)+0
	movf	(??_putch+0)+0,w
	movwf	(putch@a)
	line	22
	
l6553:	
	movf	(putch@a),w
	xorlw	08h
	skipz
	goto	u2321
	goto	u2320
u2321:
	goto	l4168
u2320:
	line	23
	
l6555:	
	movlw	(0C0h)
	fcall	_lcd_iwrite
	line	24
	
l4168:	
	line	25
	movf	(putch@c),w
	fcall	_lcd_dwrite
	goto	l4166
	line	26
	
l6557:	
	line	27
	
l4166:	
	return
	opt stack 0
GLOBAL	__end_of_putch
	__end_of_putch:
;; =============== function _putch ends ============

	signat	_putch,4216
	global	_lcd_init
psect	text153,local,class=CODE,delta=2
global __ptext153
__ptext153:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 10 in file "lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delayus
;;		_lcd_clk
;;		_lcd_busy_wait
;;		_lcd_iwrite
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text153
	file	"lcd.c"
	line	10
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	12
	
l6491:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	13
	
l6493:	
	movlw	(08h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(136)^080h	;volatile
	line	14
	
l6495:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	15
	
l6497:	
	bcf	(65/8),(65)&7
	line	16
	
l6499:	
	bcf	(66/8),(66)&7
	line	17
	
l6501:	
	movlw	low(03A98h)
	movwf	(?_delayus)
	movlw	high(03A98h)
	movwf	((?_delayus))+1
	fcall	_delayus
	line	19
	
l6503:	
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	20
	
l6505:	
	fcall	_lcd_clk
	line	21
	
l6507:	
	movlw	low(01004h)
	movwf	(?_delayus)
	movlw	high(01004h)
	movwf	((?_delayus))+1
	fcall	_delayus
	line	23
	
l6509:	
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	24
	
l6511:	
	fcall	_lcd_clk
	line	25
	
l6513:	
	movlw	low(064h)
	movwf	(?_delayus)
	movlw	high(064h)
	movwf	((?_delayus))+1
	fcall	_delayus
	line	27
	
l6515:	
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	28
	
l6517:	
	fcall	_lcd_clk
	line	29
	
l6519:	
	fcall	_lcd_busy_wait
	line	30
	
l6521:	
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	31
	
l6523:	
	fcall	_lcd_clk
	line	32
	
l6525:	
	movlw	(028h)
	fcall	_lcd_iwrite
	line	33
	
l6527:	
	movlw	(08h)
	fcall	_lcd_iwrite
	line	34
	
l6529:	
	movlw	(01h)
	fcall	_lcd_iwrite
	line	35
	
l6531:	
	movlw	(06h)
	fcall	_lcd_iwrite
	line	36
	
l6533:	
	movlw	(0Fh)
	fcall	_lcd_iwrite
	line	38
	
l6535:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	goto	l2079
	line	39
	
l6537:	
	line	40
	
l2079:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_dwrite
psect	text154,local,class=CODE,delta=2
global __ptext154
__ptext154:

;; *************** function _lcd_dwrite *****************
;; Defined at:
;;		line 103 in file "lcd.c"
;; Parameters:    Size  Location     Type
;;  d               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  d               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_busy_wait
;;		_lcd_clk
;; This function is called by:
;;		_putch
;; This function uses a non-reentrant model
;;
psect	text154
	file	"lcd.c"
	line	103
	global	__size_of_lcd_dwrite
	__size_of_lcd_dwrite	equ	__end_of_lcd_dwrite-_lcd_dwrite
	
_lcd_dwrite:	
	opt	stack 4
; Regs used in _lcd_dwrite: [wreg+status,2+status,0+pclath+cstack]
	movwf	(lcd_dwrite@d)
	line	104
	
l6475:	
	fcall	_lcd_busy_wait
	line	105
	
l6477:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(64/8),(64)&7
	line	106
	
l6479:	
	bcf	(65/8),(65)&7
	line	107
	
l6481:	
	movlw	(0Fh)
	andwf	(8),w
	movwf	(??_lcd_dwrite+0)+0
	movf	(lcd_dwrite@d),w
	andlw	0F0h
	iorwf	0+(??_lcd_dwrite+0)+0,w
	movwf	(8)	;volatile
	line	108
	
l6483:	
	fcall	_lcd_clk
	line	109
	
l6485:	
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(8),w
	movwf	(??_lcd_dwrite+0)+0
	movf	(lcd_dwrite@d),w
	movwf	(??_lcd_dwrite+1)+0
	movlw	(04h)-1
u2285:
	clrc
	rlf	(??_lcd_dwrite+1)+0,f
	addlw	-1
	skipz
	goto	u2285
	clrc
	rlf	(??_lcd_dwrite+1)+0,w
	andlw	0F0h
	iorwf	0+(??_lcd_dwrite+0)+0,w
	movwf	(8)	;volatile
	line	110
	
l6487:	
	fcall	_lcd_clk
	goto	l2093
	line	111
	
l6489:	
	line	112
	
l2093:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_dwrite
	__end_of_lcd_dwrite:
;; =============== function _lcd_dwrite ends ============

	signat	_lcd_dwrite,4216
	global	_lcd_iwrite
psect	text155,local,class=CODE,delta=2
global __ptext155
__ptext155:

;; *************** function _lcd_iwrite *****************
;; Defined at:
;;		line 116 in file "lcd.c"
;; Parameters:    Size  Location     Type
;;  d               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  d               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_busy_wait
;;		_lcd_clk
;; This function is called by:
;;		_lcd_init
;;		_putch
;; This function uses a non-reentrant model
;;
psect	text155
	file	"lcd.c"
	line	116
	global	__size_of_lcd_iwrite
	__size_of_lcd_iwrite	equ	__end_of_lcd_iwrite-_lcd_iwrite
	
_lcd_iwrite:	
	opt	stack 4
; Regs used in _lcd_iwrite: [wreg+status,2+status,0+pclath+cstack]
	movwf	(lcd_iwrite@d)
	line	117
	
l6459:	
	fcall	_lcd_busy_wait
	line	118
	
l6461:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	119
	
l6463:	
	bcf	(65/8),(65)&7
	line	120
	
l6465:	
	movlw	(0Fh)
	andwf	(8),w
	movwf	(??_lcd_iwrite+0)+0
	movf	(lcd_iwrite@d),w
	andlw	0F0h
	iorwf	0+(??_lcd_iwrite+0)+0,w
	movwf	(8)	;volatile
	line	121
	
l6467:	
	fcall	_lcd_clk
	line	122
	
l6469:	
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(8),w
	movwf	(??_lcd_iwrite+0)+0
	movf	(lcd_iwrite@d),w
	movwf	(??_lcd_iwrite+1)+0
	movlw	(04h)-1
u2275:
	clrc
	rlf	(??_lcd_iwrite+1)+0,f
	addlw	-1
	skipz
	goto	u2275
	clrc
	rlf	(??_lcd_iwrite+1)+0,w
	andlw	0F0h
	iorwf	0+(??_lcd_iwrite+0)+0,w
	movwf	(8)	;volatile
	line	123
	
l6471:	
	fcall	_lcd_clk
	goto	l2096
	line	124
	
l6473:	
	line	125
	
l2096:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_iwrite
	__end_of_lcd_iwrite:
;; =============== function _lcd_iwrite ends ============

	signat	_lcd_iwrite,4216
	global	_delayms
psect	text156,local,class=CODE,delta=2
global __ptext156
__ptext156:

;; *************** function _delayms *****************
;; Defined at:
;;		line 17 in file "delay.c"
;; Parameters:    Size  Location     Type
;;  t               2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delayus
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text156
	file	"delay.c"
	line	17
	global	__size_of_delayms
	__size_of_delayms	equ	__end_of_delayms-_delayms
	
_delayms:	
	opt	stack 6
; Regs used in _delayms: [wreg+status,2+status,0+pclath+cstack]
	line	18
	
l6453:	
	goto	l6457
	
l3128:	
	
l6455:	
	movlw	low(03E8h)
	movwf	(?_delayus)
	movlw	high(03E8h)
	movwf	((?_delayus))+1
	fcall	_delayus
	goto	l6457
	
l3127:	
	
l6457:	
	movlw	low(01h)
	subwf	(delayms@t),f
	movlw	high(01h)
	skipc
	decf	(delayms@t+1),f
	subwf	(delayms@t+1),f
	movlw	high(0FFFFh)
	xorwf	((delayms@t+1)),w
	skipz
	goto	u2265
	movlw	low(0FFFFh)
	xorwf	((delayms@t)),w
u2265:

	skipz
	goto	u2261
	goto	u2260
u2261:
	goto	l6455
u2260:
	goto	l3130
	
l3129:	
	line	20
	
l3130:	
	return
	opt stack 0
GLOBAL	__end_of_delayms
	__end_of_delayms:
;; =============== function _delayms ends ============

	signat	_delayms,4216
	global	_lcd_busy_wait
psect	text157,local,class=CODE,delta=2
global __ptext157
__ptext157:

;; *************** function _lcd_busy_wait *****************
;; Defined at:
;;		line 56 in file "lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  bfa             1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;;		_lcd_dwrite
;;		_lcd_iwrite
;;		_putch
;;		_lcd_dread
;; This function uses a non-reentrant model
;;
psect	text157
	file	"lcd.c"
	line	56
	global	__size_of_lcd_busy_wait
	__size_of_lcd_busy_wait	equ	__end_of_lcd_busy_wait-_lcd_busy_wait
	
_lcd_busy_wait:	
	opt	stack 4
; Regs used in _lcd_busy_wait: [wreg+status,2+status,0]
	line	59
	
l5533:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(136)^080h,w
	andlw	08h
	iorlw	0F0h
	movwf	(136)^080h	;volatile
	line	60
	
l5535:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(64/8),(64)&7
	line	61
	
l5537:	
	bsf	(65/8),(65)&7
	goto	l5539
	line	62
	
l2085:	
	line	63
	
l5539:	
	bsf	(66/8),(66)&7
	line	64
	
l5541:	
# 64 "lcd.c"
nop ;#
psect	text157
	line	65
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w
	andlw	0F0h
	movwf	(??_lcd_busy_wait+0)+0
	movf	(??_lcd_busy_wait+0)+0,w
	movwf	(lcd_busy_wait@bfa)
	line	66
	
l5543:	
	bcf	(66/8),(66)&7
	line	67
	
l5545:	
# 67 "lcd.c"
nop ;#
psect	text157
	line	68
	
l5547:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	line	69
	
l5549:	
# 69 "lcd.c"
nop ;#
psect	text157
	line	70
	
l5551:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w	;volatile
	movwf	(??_lcd_busy_wait+0)+0
	movlw	04h
u25:
	clrc
	rrf	(??_lcd_busy_wait+0)+0,f
	addlw	-1
	skipz
	goto	u25
	movf	0+(??_lcd_busy_wait+0)+0,w
	andlw	0Fh
	iorwf	(lcd_busy_wait@bfa),w
	movwf	(??_lcd_busy_wait+1)+0
	movf	(??_lcd_busy_wait+1)+0,w
	movwf	(lcd_busy_wait@bfa)
	line	71
	
l5553:	
	bcf	(66/8),(66)&7
	line	72
	
l5555:	
	btfsc	(lcd_busy_wait@bfa),(7)&7
	goto	u31
	goto	u30
u31:
	goto	l5539
u30:
	
l2086:	
	line	73
	bcf	(65/8),(65)&7
	line	74
	
l5557:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(136)^080h,w
	andlw	08h
	movwf	(136)^080h	;volatile
	line	75
	
l5559:	
	movf	(lcd_busy_wait@bfa),w
	goto	l2087
	
l5561:	
	line	76
	
l2087:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_busy_wait
	__end_of_lcd_busy_wait:
;; =============== function _lcd_busy_wait ends ============

	signat	_lcd_busy_wait,89
	global	_lcd_clk
psect	text158,local,class=CODE,delta=2
global __ptext158
__ptext158:

;; *************** function _lcd_clk *****************
;; Defined at:
;;		line 44 in file "lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;;		_lcd_dwrite
;;		_lcd_iwrite
;; This function uses a non-reentrant model
;;
psect	text158
	file	"lcd.c"
	line	44
	global	__size_of_lcd_clk
	__size_of_lcd_clk	equ	__end_of_lcd_clk-_lcd_clk
	
_lcd_clk:	
	opt	stack 4
; Regs used in _lcd_clk: []
	line	45
	
l5531:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(66/8),(66)&7
	line	46
# 46 "lcd.c"
nop ;#
	line	47
# 47 "lcd.c"
nop ;#
psect	text158
	line	48
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	49
# 49 "lcd.c"
nop ;#
	line	50
# 50 "lcd.c"
nop ;#
psect	text158
	line	52
	
l2082:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clk
	__end_of_lcd_clk:
;; =============== function _lcd_clk ends ============

	signat	_lcd_clk,88
	global	_delayus
psect	text159,local,class=CODE,delta=2
global __ptext159
__ptext159:

;; *************** function _delayus *****************
;; Defined at:
;;		line 5 in file "delay.c"
;; Parameters:    Size  Location     Type
;;  t               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;;		_delayms
;; This function uses a non-reentrant model
;;
psect	text159
	file	"delay.c"
	line	5
	global	__size_of_delayus
	__size_of_delayus	equ	__end_of_delayus-_delayus
	
_delayus:	
	opt	stack 6
; Regs used in _delayus: [wreg+status,2+status,0]
	line	6
	
l5521:	
	comf	(delayus@t),w
	movwf	(??_delayus+0)+0
	comf	(delayus@t+1),w
	movwf	((??_delayus+0)+0+1)
	incf	(??_delayus+0)+0,f
	skipnz
	incf	((??_delayus+0)+0+1),f
	movf	0+(??_delayus+0)+0,w
	addlw	low(0FFFFh)
	movwf	(delayus@t)
	movf	1+(??_delayus+0)+0,w
	skipnc
	addlw	1
	addlw	high(0FFFFh)
	movwf	1+(delayus@t)
	line	7
	
l5523:	
	movf	(delayus@t+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	8
	
l5525:	
	movf	(delayus@t),w
	movwf	(14)	;volatile
	line	9
	
l5527:	
	bcf	(96/8),(96)&7
	line	10
	
l5529:	
	bsf	(128/8),(128)&7
	line	11
	goto	l3121
	
l3122:	
	
l3121:	
	btfss	(96/8),(96)&7
	goto	u11
	goto	u10
u11:
	goto	l3121
u10:
	
l3123:	
	line	12
	bcf	(128/8),(128)&7
	line	14
	
l3124:	
	return
	opt stack 0
GLOBAL	__end_of_delayus
	__end_of_delayus:
;; =============== function _delayus ends ============

	signat	_delayus,4216
psect	text160,local,class=CODE,delta=2
global __ptext160
__ptext160:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
