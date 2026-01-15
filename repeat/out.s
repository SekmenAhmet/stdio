.global print

.extern get_input

.type print, %function
.type strlen, %function

.section .text

strlen:
	push {r1, r2, r3, lr}

	mov r1, r0
	mov r2, #0
	
loop:
	ldrb r3, [r1], #1
	cmp r3, #0
	beq done
	add r2, r2, #1
	b loop

done:
	mov r0, r2
	pop {r1, r2, r3, lr}
	bx lr


.size strlen, .-strlen

print:
	push {r4, lr}
	mov r4, r0

	bl strlen

	mov r2, r0
	mov r0, #1
	mov r1, r4
	mov r7, #4
	svc #0

	pop {r4, lr}
	bx lr


.size print, .-print
