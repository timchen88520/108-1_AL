all: hw7.c hw7simd.c
	gcc hw7.c -o hw7
	gcc -msse4 hw7simd.c -o hw7simd
clean:
	rm -f hw7simd hw7
