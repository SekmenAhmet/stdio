global _start
; Rend le label "_start" visible : point d'entree du programme

extern print
; Declare la fonction "print" comme etant definie dans un autre fichier (out.s)
extern getchar
; Declare la fonction "getchar" comme etant definie dans un autre fichier (in.s)

section .bss
; Section pour les donnees non initialisees
c resb 1
; Reserve 1 octet pour stocker le caractere lu


section .text
; Debut de la section contenant le code executable

_start:
; Point d'entree du programme (appele au lancement)
	; Appelle getchar pour lire un caractere (retour dans AL)
	call getchar
	; Stocke le caractere lu dans la variable "c"
	mov byte [rel c], al

	; Place l'adresse de "c" dans RDI (1er argument de print)
	lea rdi, [rel c]
	; Affiche le caractere via print
	call print

	; Termine le programme avec exit(0)
	xor rdi, rdi
	mov rax, 60
	syscall
