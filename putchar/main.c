// Import de la fonction asm "putchar"
extern void putchar(const char* c);

// Point d'entree du programme C
int main()
{
    // Caractere a afficher
    char x = 'a';
    // Envoie l'adresse du caractere a putchar
    putchar(&x);
    return 0;
}
