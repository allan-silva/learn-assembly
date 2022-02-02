# makefile for shifts.asm
shifts: shifts.o
		gcc -o shifts shifts.o -no-pie
shifts.o: shifts.asm
		nasm -f elf64 -g -F dwarf shifts.asm -l shifts.lst
    # -f - output format, elf64 Executable and linkable Format for 64-bit
    # -g includes debug info, -F debug format, dwarf Debug With Arbitrary Record Format
    # -l output file of result of assembly