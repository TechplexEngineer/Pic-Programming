CC=picc
CFLAGS=--chip=16f887
COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) --PASS1
OUTPUT_OPTION = -O${@}

DELAY=delay.lpp

.PHONY: clean test.hex

test.hex: clean test.p1 lcd.p1
	${CC} ${CFLAGS} test.p1 lcd.p1 ${DELAY}
	pk2cmd -F test.hex -M -R -Y -P

clean:
	rm -f core* *.obj *.as *.hex *.hxl *.cof *.sym *.lst *.sdb *.p1 *.pre
	rm -f *.rlf *.pre funclist
#	${MAKE} -C serial clean
#	${MAKE} -C delay clean
#	${MAKE} -C putch clean
#	${MAKE} -C lcd clean

erase:
	pk2cmd -P -e
	
lib:
	${CC} ${CFLAGS} --output=lpp lcd.c

#${DELAY}: flook
#	${MAKE} -C delay

#${PUTCH}: flook
#	${MAKE} -C putch

#${SERIAL}: flook
#	${MAKE} -C serial

#${LCD}: flook
#	${MAKE} -C lcd

#flook:
#	true

%.p1: %.c
	$(COMPILE.c) $(OUTPUT_OPTION) $<
