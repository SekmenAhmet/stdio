| exec 

```
nasm -f elf64 out.s -o out.o
nasm -f elf64 start.s -o start.o
ld start.o out.o -o prog
./prog
```
