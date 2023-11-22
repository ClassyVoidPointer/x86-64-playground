print_number.o: print_number.asm
	nasm -felf64 print_number.asm

print_number: print_number.o
	ld -o print_number print_number.o

print_numbers.o: print_numbers.asm
	nasm -felf64 print_numbers.asm

print_numbers: print_numbers.o
	ld -o print_numbers print_numbers.o

clean:
	rm print_number.o print_numbers.o
