global print
; Rend la fonction "print" visible depuis d'autres fichiers (linker)

section .text
; Début de la section contenant le code exécutable


strlen:
; Calcule la longueur d'une chaîne de caractères terminée par '\0'
; Entrée  : RDI = adresse de la chaîne
; Sortie  : RAX = longueur (nombre de caractères avant le '\0')
; Utile pour appeler write(fd, buf, len)

    ; Initialise le compteur de longueur à 0
    xor rax, rax


; Boucle : tant qu'on n'a pas trouvé '\0', on compte
.loop:
    cmp byte [rdi + rax], 0     ; compare s[rax] avec 0
    je .done                    ; si s[rax] == 0, fin
    inc rax                     ; longueur++
    jmp .loop

.done:
    ret


print:
; Affiche une chaîne de caractères sur la sortie standard (stdout)
; Entrée : RDI = adresse de la chaîne
; Utilise le syscall write(1, buf, len)

    push rbx
    ; Sauvegarde RBX car c'est un registre "callee-saved" (convention ABI)
    ; Une fonction doit le restaurer avant de retourner

    mov rbx, rdi
    ; On garde l'adresse de la chaîne dans RBX (car RDI va être réutilisé)

    call strlen
    ; Après strlen : RAX = longueur de la chaîne

    mov rdx, rax
    ; RDX = 3e argument de write = len

    mov rsi, rbx
    ; RSI = 2e argument de write = buf (adresse de la chaîne)

    mov rdi, 1
    ; RDI = 1er argument de write = fd (1 = stdout)

    mov rax, 1
    ; RAX = numéro du syscall write

    syscall
    ; write(1, buf, len)

    pop rbx
    ; Restaure RBX comme il était avant l'appel

    ret
