# sample makefile
all:hw6_test.c
	arm-none-eabi-gcc -O0 -g --specs=nosys.specs hw6_test.c conv.s -o hw6.exe
	arm-none-eabi-insight hw6.exe
clean:
	rm -f hw6.exe
