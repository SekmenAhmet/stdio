global _start

extern print

section .rodata
msg db "Salut !", 10, 0


section .text
_start:
	lea rdi, [rel msg]
	call print

	xor rdi, rdi
	mov rax, 60
	syscall
