global print
; Rend la fonction "print" visible depuis d'autres fichiers (linker)

section .text
; Debut de la section contenant le code executable

strlen:
; Calcule la longueur d'une chaine de caracteres terminee par '\0'
; Entree  : RDI = adresse de la chaine
; Sortie  : RAX = longueur (nombre de caracteres avant le '\0')
; Utile pour appeler write(fd, buf, len)
	; Initialise le compteur de longueur a 0
	xor rax, rax

; Boucle : tant qu'on n'a pas trouve '\0', on compte
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
	; Sauvegarde RBX car c'est un registre "callee-saved" (convention ABI)
	; Une fonction doit le restaurer avant de retourner
	push rbx
	; On garde l'adresse de la chaine dans RBX (car RDI va etre reutilise)
	mov rbx, rdi

	; Apres strlen : RAX = longueur de la chaine
	call strlen

	; RDX = 3e argument de write = len
	mov rdx, rax
	; RSI = 2e argument de write = buf (adresse de la chaine)
	mov rsi, rbx
	; RDI = 1er argument de write = fd (1 = stdout)
	mov rdi, 1

	; RAX = numero du syscall write
	mov rax, 1
	; write(1, buf, len)
	syscall
	; Restaure RBX comme il etait avant l'appel
	pop rbx
	ret
