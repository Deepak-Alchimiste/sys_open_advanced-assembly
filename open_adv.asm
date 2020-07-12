BITS 64


%define BUFFER 256


global _open

section .rodata		;variable définie
	path db 'flags.txt', 0
	
section .bss
	entry resb BUFFER ;char entry[256]

section .text

	

_open:			;étiquette open
	mov rax, 2
	mov rdi, path
	mov rsi, 02
	mov rdx, 777
	syscall
	push rax
	jmp _read

_read:			;étiquette read
	mov rax, 0
	pop rsi
	mov rdi, rsi
	mov rsi, entry
	mov rdx, BUFFER
	syscall
	jmp print_flag

print_flag:
	mov rax, 0x1
	mov rdi, 0x1
	mov rsi, entry
	mov rdx, BUFFER	
	syscall
	jmp _exit

_exit: 
	mov rax, 60
	mov rdi, 0
	syscall
