; this is a program that places a number into a register and prints it

global _start
section .data
number: 	db 	9, 10

section .text
_start:
	xor rax, rax
	add rax, 48
	add rax, [number]
	mov [number], al
	
	mov rax, 1
	mov rdi, 1
	lea rsi, number
	mov rdx, 2
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall
