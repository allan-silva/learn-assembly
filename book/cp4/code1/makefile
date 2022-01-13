# makefile for alive.asm
alive: alive.o
		gcc -o alive alive.o -no-pie
alive.o: alive.asm
		nasm -f elf64 -g -F dwarf alive.asm -l alive.lst
    # -f - output format, elf64 Executable and linkable Format for 64-bit
    # -g includes debug info, -F debug format, dwarf Debug With Arbitrary Record Format
    # -l output file of result of assembly