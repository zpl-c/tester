CC?=gcc
CXX?=g++
STDC=-std=gnu11
LEVEL?=-g

ifeq ($(OS),Windows_NT)
	CFLAGS += -DWIN32
else
	OSDEF := $(shell uname -s)
	ifeq ($(OSDEF),Linux)
		LDFLAGS += -pthread -ldl -lm -latomic
	endif
	ifeq ($(OSDEF),OpenBSD)
		STDC=-std=c11
		CC=clang
		CXX=clang++
		LDFLAGS += -pthread -lm -latomic
	endif
	ifeq ($(OSDEF),FreeBSD)
		STDC=-std=c11
		CC=clang
		CXX=clang++
		LDFLAGS+=-pthread -lm -latomic
	endif
endif

WARNS = -Wall -Wextra -Werror -Wno-missing-field-initializers -Wno-unused-value -Wno-unused-function -Wno-missing-braces -Wno-ignored-qualifiers
CFLAGS += $(LEVEL) $(STDC) -Iinclude $(WARNS)
CXXFLAGS += $(LEVEL) -std=c++11 -Iinclude $(WARNS)

BUILD_FILES = $(wildcard build/*)

.PHONY: all clean test

all: clean test

test: example/tester
	@echo '> Building unit tests'
	build/tester

clean:
ifneq ($(BUILD_FILES),)
	@echo '> Cleaning up files'
	@rm -r $(BUILD_FILES)
endif

% : %.c
	@mkdir -p build
	@echo '=> Building $(@F)'
	$(CC) -g $(CFLAGS) $^ $(LDFLAGS) -o build/$(@F)
