global _start

section .data
number:  	db 	127

section .bss
str_number	resb	4			; we need four bytes "1", "2", "7", 10 (LF)
num_digits	resb    1			; total number of digits

; div rax, 4 		the quotient of the division is going to be stored in RAX and the remainder in RDX
section .text
_start:
	; initialize the stack
	push rbp
	mov rbp, rsp
	sub rsp, 16
	
	; initialize the loop first
	xor rax, rax
	mov rax, [number]	; load the number into the rax register
	xor rdx, rdx
	mov rcx, 10	; divisor
	mov r8, 0	; loop counter
loop:
	xor rdx, rdx	
	div rcx
	add rdx, 48
	push rdx
	inc r8
	test rax, rax
	jg loop

	xor r10, r10
	xor rax, rax
loop2:
	pop rax	
	mov [str_number + r10], rax
	inc r10
	cmp r10, r8
	jl loop2
	
	mov rax, 10
	mov byte [str_number + r10], al

	add r10, 1	
	mov rax, 1
	mov rdi, 1
	lea rsi, str_number
	mov rdx, r10 
	syscall
	
	mov rax, 60
	mov rdi, 0
	syscall
