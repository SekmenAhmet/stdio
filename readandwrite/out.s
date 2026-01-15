.global out

.extern buffer
.section .text

out:
	mov r2, r0
	ldr r1, =buffer
	mov r0, #1


	mov r7, #4
	svc #0
	bx lr
