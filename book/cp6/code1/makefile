# makefile for move.asm
move: move.o
		gcc -o move move.o -no-pie
move.o: move.asm
		nasm -f elf64 -g -F dwarf move.asm -l move.lst
    # -f - output format, elf64 Executable and linkable Format for 64-bit
    # -g includes debug info, -F debug format, dwarf Debug With Arbitrary Record Format
    # -l output file of result of assembly