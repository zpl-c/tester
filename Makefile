CC?=gcc
CXX?=g++
WARNS = -Wall -Wextra -Werror
CFLAGS += -std=c99 -Iinclude $(WARNS)
LDFLAGS += -lm

MULTI_SRCS = $(wildcard example/multi/*.c)
MULTI_OBJS = $(MULTI_SRCS:.c=.o)

.PHONY: all clean test multi

all: clean test

test: example/tester.o
	@mkdir -p build
	@echo '=> Linking tester'
	$(CC) $< $(LDFLAGS) -o build/$(@F)
	@build/test

multi: $(MULTI_OBJS)
	@mkdir -p build
	@echo '=> Linking $@'
	$(CC) $^ $(LDFLAGS) -o build/$(@F)

clean:
	@echo '> Cleaning up files'
	@find . -name '*.o' -delete

%.o : %.c
	@echo '=> Building $(@F)'
	$(CC) -c $(CFLAGS) $< -o $@

