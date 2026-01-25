global print
; Rend la fonction "print" visible depuis d'autres fichiers (linker)

section .text
; Debut de la section contenant le code executable

strlen:
; Calcule la longueur d'une chaine terminee par '\0'
; Entree  : RDI = adresse de la chaine
; Sortie  : RAX = longueur (nombre d'octets avant le '\0')
	; Initialise le compteur a 0
	xor rax, rax

.loop:
	cmp byte [rdi + rax], 0
	je .done
	inc rax
	jmp .loop

.done:
	ret

print:
; Affiche une chaine de caracteres sur la sortie standard (stdout)
; Entree : RDI = adresse de la chaine
; Utilise le syscall write(1, buf, len)
	; Sauvegarde RBX car c'est un registre "callee-saved" (ABI)
	push rbx
	; Conserve l'adresse de la chaine dans RBX
	mov rbx, rdi

	; Calcule la longueur
	call strlen

	; Parametres pour write
	mov rdx, rax
	mov rsi, rbx
	mov rdi, 1

	; RAX = numero du syscall write
	mov rax, 1
	syscall
	; Restaure RBX
	pop rbx
	ret
