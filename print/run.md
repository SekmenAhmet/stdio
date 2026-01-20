# run (build)

Ce fichier explique comment compiler et executer l'exemple. Lancez les commandes
depuis le dossier `print/`.

## Variante asm pure


```
make asm
./prog
```

```bash
nasm -f elf64 out.s -o out.o
nasm -f elf64 start.s -o start.o
ld start.o out.o -o prog
./prog
```

## Variante C + asm

```
make c
./prog
```

```bash
nasm -f elf64 out.s -o out.o
gcc main.c out.o -o prog
./prog
```
