.global get_input

.type get_input, %function

.section .text

get_input:
	mov r2, r1
	mov r1, r0
	mov r0, #0
	mov r7, #3
	svc #0
	bx lr

.size get_input, .-get_input
