.global openFile
.global readFile
.global buffer

.section .bss

buffer: 
	.skip 1024		

.section .rodata

filePath:
	.asciz "text.txt"	

.section .text

openFile:
	ldr r0, =filePath
	mov r1, #0
	mov r2, #0
	mov r7, #5
	svc #0
	bx lr
	
readFile:
	ldr r1, =buffer
	mov r2, #1024
	mov r7, #3
	svc #0	
	bx lr
