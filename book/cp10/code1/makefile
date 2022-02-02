# makefile for stack.asm
stack: stack.o
		gcc -o stack stack.o -no-pie
stack.o: stack.asm
		nasm -f elf64 -g -F dwarf stack.asm -l stack.lst
    # -f - output format, elf64 Executable and linkable Format for 64-bit
    # -g includes debug info, -F debug format, dwarf Debug With Arbitrary Record Format
    # -l output file of result of assembly