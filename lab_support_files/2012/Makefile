XTAL_FREQ=4000
CC=picc
CFLAGS=--chip=16f887 -D_XTAL_FREQ=${XTAL_FREQ}000 --html
COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) --PASS1
OUTPUT_OPTION = -O${@}
LIBS=lcd.lpp delay.lpp printf.lpp

.PHONY: clean ${T}.hex

${T}.hex: ${T}.p1
	${CC} ${CFLAGS} ${T}.p1 ${LIBS} -M
	pk2cmd -F${T}.hex -M -P -Y -R

program:
	pk2cmd -F${T}.hex -M -P -Y -R
	
clean:
	@rm -f core* *.obj *.as *.hex *.hxl *.cof *.sym *.lst *.sdb *.p1 
	@rm -f *.dmp *.pre *.rlf *.map
	@rm -rf ./html
	@rm -f funclist
	@echo "Directory Cleaned" #Removes all generated files

%.p1 : %.c
	$(COMPILE.c) $(OUTPUT_OPTION) $<
