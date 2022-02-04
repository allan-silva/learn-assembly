# makefile for rustlinked.asm
rustlinked: rustlinked.o build_displays
	clang -o rustlinked rustlinked.o -ldisplays -L./deps/displays/release/

rustlinked.o: rustlinked.asm
	nasm -f elf64 -g -F dwarf rustlinked.asm -l rustlinked.lst
  # -f - output format, elf64 Executable and linkable Format for 64-bit
  # -g includes debug info, -F debug format, dwarf Debug With Arbitrary Record Format
  # -l output file of result of assembly

build_displays:
	cargo build --release --target-dir ./deps/displays --manifest-path ../rust/displays/Cargo.toml

run: rustlinked
	export LD_LIBRARY_PATH=./deps/displays/release/ && ./rustlinked
