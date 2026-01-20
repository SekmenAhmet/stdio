global _start
; Rend le label "_start" visible : point d'entree du programme

extern putchar
; Declare la fonction "putchar" comme etant definie dans un autre fichier (out.s)

section .rodata
; Debut de la section contenant des donnees en lecture seule (Read-Only Data)
msg db "A", 10, 0
; Donnees : 'A' + '\n' + '\0'

section .text
; Debut de la section contenant le code executable

_start:
; Point d'entree du programme (appele au lancement)
	; Place l'adresse du caractere 'A' dans RDI
	lea rdi, [rel msg]
	; Appelle putchar('A')
	call putchar

	; Place l'adresse du caractere '\n' dans RDI
	lea rdi, [rel msg + 1]
	; Appelle putchar('\n')
	call putchar

	; Termine le programme avec exit(0)
	xor rdi, rdi
	; RAX = numero du syscall exit
	mov rax, 60
	syscall
