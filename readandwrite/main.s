.global _start

.extern openFile
.extern readFile
.extern out

.section .text

_start:
	bl openFile
	bl readFile
	bl out

	mov r0, #0
    mov r7, #1       @ sys_exit
    svc #0
