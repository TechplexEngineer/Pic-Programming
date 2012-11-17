CC=picc
CFLAGS=--chip=16f887
COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) --PASS1
OUTPUT_OPTION = -O${@}
SERIAL=serial.lpp
LCD=lcd.lpp
DELAY=delay.lpp
PUTCH=putch.lpp

.PHONY: clean ${T}.hex

${T}.hex: ${T}.p1
	${CC} ${CFLAGS} ${T}.p1 ${LCD} ${DELAY} ${PUTCH}
	pk2cmd -F ${T}.hex -M -R -Y -P

clean:
	rm -f core* *.obj *.as *.hex *.hxl *.cof *.sym *.lst *.sdb *.p1 
	rm -f *.rlf *.pre funclist
	${MAKE} -C serial clean
	${MAKE} -C delay clean
	${MAKE} -C putch clean
	${MAKE} -C lcd clean

${DELAY}: flook
	${MAKE} -C delay

${PUTCH}: flook
	${MAKE} -C putch

${SERIAL}: flook
	${MAKE} -C serial

${LCD}: flook
	${MAKE} -C lcd

flook:
	true

%.p1: %.c
	$(COMPILE.c) $(OUTPUT_OPTION) $<
