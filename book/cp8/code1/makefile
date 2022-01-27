# makefile for memory.asm
memory: memory.o
		gcc -o memory memory.o -no-pie
memory.o: memory.asm
		nasm -f elf64 -g -F dwarf memory.asm -l memory.lst
    # -f - output format, elf64 Executable and linkable Format for 64-bit
    # -g includes debug info, -F debug format, dwarf Debug With Arbitrary Record Format
    # -l output file of result of assembly