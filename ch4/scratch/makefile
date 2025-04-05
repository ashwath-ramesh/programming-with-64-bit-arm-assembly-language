OBJS = scratch.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

%.o : %.s
	as $(DEBUGFLGS) $< -o $@

all: scratch

scratch: $(OBJS)
	ld -o scratch $(OBJS)