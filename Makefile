CC?=gcc
CXX?=g++
WARNS = -Wall -Wextra -Werror
CFLAGS += -std=c99 -Iinclude $(WARNS)

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
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o build/$(@F)
