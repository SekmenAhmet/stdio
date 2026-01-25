// Import de la fonction asm "print"
extern void print(const char *s);
// Import de la fonction asm "read_file"
extern char *read_file(const char *path);

// Point d'entree du programme C
int main()
{
    // Chemin vers le fichier a lire
    const char *path = "text.txt";
    // Lit le fichier en asm et retourne un buffer termine par '\0'
    char *content = read_file(path);
    // Affiche le contenu lu
    print(content);
    return 0;
}
