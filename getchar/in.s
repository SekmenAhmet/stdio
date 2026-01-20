global getchar
; Rend la fonction "getchar" visible depuis d'autres fichiers (linker)

section .bss
; Section pour les donnees non initialisees
buf resb 2
; Reserve 2 octets : caractere + '\n'

section .text
; Debut de la section contenant le code executable

getchar:
; Lit un caractere sur l'entree standard et verifie la fin de ligne
; Retour : RAX = caractere lu, ou -1 en cas d'erreur
	; faire appel à read
	; signature de read:
	; sys: 0
	; (fd, buf, count)
	; rdi, rsi, rdx

	mov rdi, 0
	; RDI = 0 (stdin)
	lea rsi, [rel buf]
	; RSI = adresse du buffer
	mov rdx, 2
	; RDX = nombre d'octets a lire (caractere + '\n')
	mov rax, 0
	; RAX = numero du syscall read
	syscall

	cmp rax, 2
	; Si on n'a pas lu 2 octets, echec
	jne .fail

	cmp byte [rel buf + 1], 10
	; Verifie que le second octet est '\n' (10)
	jne .fail
	je .done

.fail:
	; Valeur d'erreur
	mov rax, -1

.done:
	; Retourne le caractere lu dans RAX
	movzx rax, byte [rel buf]
	ret
