# makefile for fcalc.asm
fcalc: fcalc.o
		gcc -o fcalc fcalc.o -no-pie
fcalc.o: fcalc.asm
		nasm -f elf64 -g -F dwarf fcalc.asm -l fcalc.lst
    # -f - output format, elf64 Executable and linkable Format for 64-bit
    # -g includes debug info, -F debug format, dwarf Debug With Arbitrary Record Format
    # -l output file of result of assembly