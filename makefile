# compiler options
CC := g++ -std=c++14
CFLAGS := -Wall `pkg-config --cflags opencv`
LIB := -L/usr/local/lib -llept -ltesseract `pkg-config --libs opencv`
INC := -I/usr/local/include/tesseract

# source files
SRCEXT := cpp
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))

# directories
SRCDIR := src
OUTPUTDIR := bin
BUILDDIR := build
TARGET := $(OUTPUTDIR)/main

# master commands
all: clean $(TARGET)
debug: $(TARGET)

# build artifact
$(TARGET): $(SOURCES)
	@mkdir -p $(OUTPUTDIR)
	$(CC) $(CFLAGS) $(INC) -o $(TARGET) $(SOURCES) $(LIB)

# remove unnecessary files
.PHONY: clean

clean:
	rm -fr $(BUILDDIR) $(OUTPUTDIR)
