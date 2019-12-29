hw6_test.exe : hw6.c conv.s
	arm-none-eabi-gcc -g -o0 --specs=nosys.specs hw6.c conv.s -o hw6_test.exe
	arm-none-eabi-insight hw6_test.exe

clean:
	rm -f hw6_test.exe
