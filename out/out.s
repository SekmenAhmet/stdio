.global str_len
.global print

.type str_len, %function  
.type print, %function

.section .text

str_len:
	mov r1, r0
	mov r0, #0

1: 
	ldrb r2, [r1], #1
	cmp r2, #0
	beq 2f
	add r0, r0, #1
	b 1b
2: 
	bx lr
.size str_len, .-str_len

print:
	push {r4, lr}
	mov r4, r0

	bl str_len
	mov r2, r0
	mov r0, #1

	mov r1, r4
	mov r7, #4
	svc #0

	pop {r4, lr}
	bx lr	

.size print, .-print
