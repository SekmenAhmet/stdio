.global _start

.extern main

.section .text

_start:
	bl main

	mov r7, #1
	svc #0
