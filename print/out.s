global print

section .text

strlen:
	xor rax, rax

.loop:
	cmp byte [rdi + rax], 0
	je .done
	inc rax
	jmp .loop

.done:
	ret

print:
	push rbx
	mov rbx, rdi
	call strlen
	mov rdx, rax
	mov rsi, rbx
	mov rdi, 1
	mov rax, 1
	syscall
	pop rbx
	ret


