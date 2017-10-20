# project name (generate executable with this name)
TARGET   = clips

CC       = gcc
# compiling flags here
CFLAGS   = -std=c99 -Wall -I.

LINKER   = gcc
# linking flags here
LFLAGS   = -Wall -I. -lm

# change these to proper directories where each file should be
SRCDIR   = src
OBJDIR   = obj
BINDIR   = bin

SOURCES  := $(wildcard $(SRCDIR)/*.c)
INCLUDES := $(wildcard $(SRCDIR)/*.h)
OBJECTS  := $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
rm       = rm -f
mkdir    = mkdir -p


$(BINDIR)/$(TARGET): $(OBJECTS)
	 @$(mkdir) $(BINDIR)
	 @$(LINKER) $(OBJECTS) $(LFLAGS) -o $@
	 @echo "'$(BINDIR)/$(TARGET)' compilation complete!" 

$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.c
	 @$(mkdir) $(OBJDIR)
	 @$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	 @$(rm) $(OBJECTS)
	 @echo "Cleanup complete!"

.PHONY: remove
remove: clean
	 @$(rm) $(BINDIR)/$(TARGET)
