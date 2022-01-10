# makefile for hello.asm
hello: hello.o
		gcc -o hello hello.o -no-pie
hello.o: hello.asm
		nasm -f elf64 -g -F dwarf hello.asm -l hello.lst
    # -f - output format, elf64 Executable and linkable Format for 64-bit
    # -g includes debug info, -F debug format, dwarf Debug With Arbitrary Record Format
    # -l output file of result of assembly