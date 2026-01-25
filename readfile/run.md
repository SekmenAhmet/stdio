# run (build)

Ce fichier explique comment compiler et executer l'exemple. Lancez les commandes
depuis le dossier `readfile/`.
Le programme lit le fichier `text.txt` present dans le dossier.

## Variante asm pure

```
make asm
./prog
```

```bash
nasm -f elf64 out.s -o out.o
nasm -f elf64 read.s -o read.o
nasm -f elf64 start.s -o start.o
ld start.o read.o out.o -o prog
./prog
```

## Variante C + asm

```
make c
./prog
```

```bash
nasm -f elf64 out.s -o out.o
nasm -f elf64 read.s -o read.o
gcc main.c read.o out.o -o prog
./prog
```
