build:
	rgbasm main.asm -o main.o
	rgblink -o game.gb main.o
	rgbfix -v -p 0xFF game.gb

clean:
	rm -f *.o
	rm -f *.gb
