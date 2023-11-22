; this is a program that places a number into a register and prints it

global _start:
number: 	db 	9

_start:
    mov r8, 48 			; first store the position of '0' in the ascii table
    mov r9, [number] 		; move into r9 the number
    add r8, r9 			; move the result of the addition into the r8 register '9'

    mov rax, 1 			; write syscall
    mov rdi, 1			; stdout file handle
    mov rsi, r8 		
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall


