global _start
; Rend le label "_start" visible : point d'entree du programme

extern print
; Declare la fonction "print" comme etant definie dans un autre fichier (out.s)
extern read_file
; Declare la fonction "read_file" comme etant definie dans un autre fichier (read.s)

section .data
; Section pour les donnees initialisees
file_path db "text.txt", 0
; Chemin termine par '\0'

section .text
; Debut de la section contenant le code executable

_start:
; Point d'entree du programme (appele au lancement)
	; Place l'adresse du chemin dans RDI (1er argument de read_file)
	lea rdi, [rel file_path]
	; Lit le fichier et recupere un buffer
	call read_file

	; Place l'adresse du buffer dans RDI (1er argument de print)
	mov rdi, rax
	; Affiche le contenu lu
	call print

	; Termine le programme avec exit(0)
	xor rdi, rdi
	mov rax, 60
	syscall
