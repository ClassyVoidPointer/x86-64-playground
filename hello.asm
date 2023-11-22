global _start:

section .data
message: 	db 	"Hello, World", 10  	; storing a string and a LF

section .text
_start: 	mov rax, 1  		; system call for write
		mov rdi, 1 		; file handle 1 stdout
		mov rsi, message 	; address of string to output
		mov rdx, 13 		; number of bytes	
		syscall

		mov rax, 60 		; system call for exit
		xor rdi, rdi
		syscall
