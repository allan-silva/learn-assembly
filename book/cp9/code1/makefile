# makefile for icalc.asm
icalc: icalc.o
		gcc -o icalc icalc.o -no-pie
icalc.o: icalc.asm
		nasm -f elf64 -g -F dwarf icalc.asm -l icalc.lst
    # -f - output format, elf64 Executable and linkable Format for 64-bit
    # -g includes debug info, -F debug format, dwarf Debug With Arbitrary Record Format
    # -l output file of result of assembly