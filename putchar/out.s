global putchar
; Rend la fonction "putchar" visible depuis d'autres fichiers (linker)

section .text
; Debut de la section contenant le code executable

putchar:
	; Affiche un caractere sur la sortie standard (stdout)
	; Entree : RDI = adresse du caractere a afficher
	; Utilise le syscall write(1, buf, 1)

	; Sauvegarde RBX car c'est un registre "callee-saved" (ABI)
	push rbx
	
	; On garde l'adresse du caractere dans RBX
	mov rbx, rdi
	; RDI = 1er argument de write = fd (1 = stdout)
	mov rdi, 1
	; RSI = 2e argument de write = buf (adresse du caractere)
	mov rsi, rbx
	; RDX = 3e argument de write = count (1 octet)
	mov rdx, 1
	; RAX = numero du syscall write
	mov rax, 1
	; write(1, buf, 1)
	syscall
	; Restaure RBX comme il etait avant l'appel
	pop rbx
	ret 
