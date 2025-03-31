AE3OBJS = addexamp3.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

%.o : %.s
	as $(DEBUGFLGS) $< -o $@

all: addexamp3

addexamp3: $(AE3OBJS)
	ld -o addexamp3 $(AE3OBJS)