NAME = prog

ASM = nasm
ASMFLAGS = -f elf64

CC = gcc
CFLAGS = -Wall -Wextra -Werror
LDFLAGS = -no-pie

LD = ld

ASM_LIB = out.o in.o

all: c

c: main.o $(ASM_LIB)
	$(CC) $(LDFLAGS) main.o $(ASM_LIB) -o $(NAME)

asm: start.o $(ASM_LIB)
	$(LD) start.o $(ASM_LIB) -o $(NAME)

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o prog

fclean: clean
	rm -f $(NAME)

re: fclean all
