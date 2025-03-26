.PHONY: clean

OBJS = HelloWorld.o

ifdef DEBUG
DEBUGFLGS = -g
else 
DEBUGFLGS = 
endif

%.o : %.s
	as $(DEBUGFLGS) $< -o $@

HelloWorld: $(OBJS)
	ld -o HelloWorld $(OBJS)

clean:
	rm -f HelloWorld $(OBJS)