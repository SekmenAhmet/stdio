global _start
; Rend le label "_start" visible : point d'entrée du programme

extern print
; Déclare la fonction "print" comme étant définie dans un autre fichier (out.s)

section .rodata
; Début de la section contenant des données en lecture seule (Read-Only Data)
msg db "Salut !", 10, 0
; Chaîne de caractères terminée par '\0' (0) + retour à la ligne (10)

section .text
; Début de la section contenant le code exécutable


_start:
; Point d'entrée du programme (appelé directement au lancement)

    ; Place l'adresse de "msg" dans RDI (1er argument de print)
    lea rdi, [rel msg]

    ; Appelle la fonction print(msg)
    call print

    ; Termine le programme avec exit(0)
    xor rdi, rdi        ; code de retour = 0
    mov rax, 60         ; syscall exit
    syscall
