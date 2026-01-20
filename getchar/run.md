# run (build)

Ce fichier explique comment compiler et executer l'exemple. Lancez les commandes
depuis le dossier `getchar/`.

## Variante asm pure


```
make asm
./prog
```

```bash
nasm -f elf64 out.s -o out.o
nasm -f elf64 start.s -o start.o
nasm -f elf64 in.s -o in.o
ld start.o in.o out.o -o prog
./prog
```

## Variante C + asm

```
make c
./prog
```

```bash
nasm -f elf64 out.s -o out.o
nasm -f elf64 in.s -o in.o
gcc main.c in.o out.o -o prog
./prog
```
