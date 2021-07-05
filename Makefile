Builddir       := build
Target         := $(Builddir)/status_display
CXX            := gcc
ODIR           := obj
SRC            := ssd1306_i2c.c \
                  status_display.c \

OBJS            = $(SRC:%.c=$(Builddir)/%.o)
CFLAGS         += -Iinclude

$(Target) : $(OBJS)
	$(CC) $^ -o $@

$(Builddir)/%.o : %.c
	mkdir -p $(Builddir)
	$(CC) $^ -o $@ $(CFLAGS) -c

.PHONY:clean

clean:
	rm -rf ${Builddir}
