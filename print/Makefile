NAME = prog

ASM = nasm
ASMFLAGS = -f elf64

CC = gcc
CFLAGS = -Wall -Wextra -Werror
LDFLAGS = -no-pie

LD = ld

ASM_LIB = out.o

all: c

c: main.o $(ASM_LIB)
	$(CC) $(LDFLAGS) main.o $(ASM_LIB) -o $(NAME)

asm: start.o $(ASM_LIB)
	$(LD) start.o $(ASM_LIB) -o $(NAME)

out.o: out.s
	$(ASM) $(ASMFLAGS) out.s -o out.o

start.o: start.s
	$(ASM) $(ASMFLAGS) start.s -o start.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

clean:
	rm -f *.o prog

fclean: clean
	rm -f $(NAME)

re: fclean all
