OBJS = main.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

%.o : %.s
	as $(DEBUGFLGS) $< -o $@

all: main

main: $(OBJS)
	ld -o main $(OBJS)

clean:
	rm -f $(OBJS) main
