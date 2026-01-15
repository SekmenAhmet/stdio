.global _start

.extern main

.section .text

_start:
	bl main
	
	mov r0, #0
	mov r7, #1
	svc #0
