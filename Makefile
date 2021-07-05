Builddir        = build
Target          = ${Builddir)/status_display
CXX             = gcc
ODIR            = obj
SRC             = $(wildcard *.c)
DIR             = $(notdir $(SRC))
OBJ             = $(patsubst %.c, %.o, $(DIR))
INC             = -Iinclude

$(Target): $(OBJ)
	mkdir -p $(Builddir)
	$(CXX) $^ -o $@ -g -rdynamic

.PHONY:clean

clean:
	rm -rf ${Builddir}
