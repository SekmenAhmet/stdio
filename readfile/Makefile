# Nom du binaire final
NAME = prog

# Assembleur et options
ASM = nasm
ASMFLAGS = -f elf64

# Compilateur C et options
CC = gcc
CFLAGS = -Wall -Wextra -Werror
LDFLAGS = -no-pie

# Editeur de liens pour l'asm pure
LD = ld

# Objet asm commun
ASM_LIB = out.o read.o

# C par defaut
all: c

# Variante C + asm
c: main.o $(ASM_LIB)
	$(CC) $(LDFLAGS) main.o $(ASM_LIB) -o $(NAME)

# Variante asm pure
asm: start.o $(ASM_LIB)
	$(LD) start.o $(ASM_LIB) -o $(NAME)

# Compilation des sources asm
out.o: out.s
	$(ASM) $(ASMFLAGS) out.s -o out.o

read.o: read.s
	$(ASM) $(ASMFLAGS) read.s -o read.o

# Compilation du point d'entree asm
start.o: start.s
	$(ASM) $(ASMFLAGS) start.s -o start.o

# Compilation du fichier C
main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

# Nettoyage des objets et du binaire
clean:
	rm -f *.o prog

# Nettoyage complet
fclean: clean
	rm -f $(NAME)

# Rebuild complet
re: fclean all
