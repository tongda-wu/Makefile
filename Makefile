# TARGETS
DEBUG = 1
EXEC = test_print_integer
GCC = gcc
CFLAGS=-std=c99 -Wall -Wshadow --pedantic -Wvla -Werror

ifeq ($(DEBUG), 1)
CFLAGS += -g -O0
else 
CFLAGS += -O3
endif


build1:
	$(GCC) $(CFLAGS) print_integer.c test_print_integer.c -o test_print_integer

clean: 
	rm -f $(EXEC) 
	rm -f *.o
	rm -f *.exe
	rm -f *.out
	rm -f actual.txt

execute:
	./$(EXEC).exe > actual.txt

diff: 
	diff actual.txt expected.txt

gdb:
	gdb test_print_integer