global read_file
; Rend la fonction "read_file" visible depuis d'autres fichiers (linker)

section .bss
; Section pour les donnees non initialisees
buffer resb 1024
; Reserve un buffer de 1024 octets (initialise a zero)

section .text
; Debut de la section contenant le code executable

read_file:
; Lit un fichier et retourne l'adresse d'un buffer
; Entree : RDI = chemin du fichier
; Sortie : RAX = adresse du buffer
	; open(path, O_RDONLY, 0)
	mov rsi, 0
	mov rdx, 0
	mov rax, 2
	syscall

	; read(fd, buffer, 1023)
	mov rdi, rax
	lea rsi, [rel buffer]
	mov rdx, 1023
	mov rax, 0
	syscall

	; Retourne l'adresse du buffer
	lea rax, [rel buffer]
	ret
