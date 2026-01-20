// Import de la fonction asm "print"
extern void print(const char *s);

// Point d'entrée du programme C
int main()
{
    // Utilisation de la fonction print créee en asm
    print("Salut, je suis Ahmet\n");
    return 0;
}
