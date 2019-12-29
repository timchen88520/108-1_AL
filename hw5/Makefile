# sample makefile
all:hw5.s conv.s
	arm-none-eabi-gcc -O3 -g --specs=nosys.specs hw5_test.s conv.s -o hw5_test.exe
	arm-none-eabi-insight hw5_test.exe
clean:
	rm -f hw5_test.exe
