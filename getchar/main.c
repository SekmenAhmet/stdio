// Import de la fonction asm "print"
extern void print(const char* s);
// Import de la fonction asm "getchar"
extern int getchar(void);

// Point d'entree du programme C
int main()
{
    // Affiche une invite a l'utilisateur
    print("Tape un caractere puis entree: ");
    // Lit un caractere depuis l'entree standard
    int c = getchar();

    // Message avant d'afficher le caractere saisi
    print("Tu as tape: ");

    // Prepare un buffer C termine par '\0' pour print
    char buf[2];
    buf[0] = (char)c;
    buf[1] = '\0';
    // Affiche le caractere puis un retour a la ligne
    print(buf);
    print("\n");

    return 0;
}
