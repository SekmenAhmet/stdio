.global _start

.extern print

.section .text

_start:
	bl print
	
	mov r0, #0
	mov r7, #1
	svc #0
