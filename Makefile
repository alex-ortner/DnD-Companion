CXX           := clang++
CXXFLAGS      := -Wall -Wextra -pedantic -std=c++17 -g -c -o
ASSIGNMENT    := dnd

BUILDDIR      := build
SOURCES       := $(wildcard *.cpp)
SOURCES_SUBD  := $(wildcard */*.cpp)
DIRS          := $(patsubst %,$(BUILDDIR)/%,${SOURCES_SUBD:.cpp=})
OBJECTS       := $(patsubst %,$(BUILDDIR)/%,${SOURCES:.cpp=.o})
OBJECTS_SUBD  := $(patsubst %,$(BUILDDIR)/%,${SOURCES_SUBD:.cpp=.o})


.DEFAULT_GOAL := default
.PHONY: default prepare reset clean bin all run test help


default: all

$(DIRS):
	mkdir -p $@

prepare: $(DIRS)
	mkdir -p $(BUILDDIR)

$(BUILDDIR)/%.o: %.cpp
	@echo "[\033[36mINFO\033[0m] Compiling object:" $<
	$(CXX) $(CXXFLAGS) $@ $< -MMD -MF ./$@.d

$(ASSIGNMENT) : $(OBJECTS) $(OBJECTS_SUBD)
	@echo "[\033[36mINFO\033[0m] Linking objects:" $@
	$(CXX) -o $@ $^

clean:						## cleans up project folder
	@printf "[\e[0;36mINFO\e[0m] Cleaning up folder...\n"
	rm -f $(ASSIGNMENT)
	rm -rf ./$(BUILDDIR)
	rm -rf testreport.html
	rm -rf ./valgrind_logs

reset: clean				## resets the config files
	@echo "[\033[36mINFO\033[0m] Resetting csv files..."
	rm -rf ./config
	mkdir ./config
	cp ./tests/config* ./configs
	chmod -R 666 ./config

bin: prepare $(ASSIGNMENT)	## compiles project to executable binary
	@printf "[\e[0;36mINFO\e[0m] Compiling binary...\n"
	chmod +x $(ASSIGNMENT)

all: clean bin				## all of the above

run: all					## runs the project with default config
	@printf "[\e[0;36mINFO\e[0m] Executing binary...\n"
	./$(ASSIGNMENT)


help:						## prints the help text
	@printf "Usage: make \e[0;36m<TARGET>\e[0m\n"
	@printf "Available targets:\n"
	@awk -F':.*?##' '/^[a-zA-Z_-]+:.*?##.*$$/{printf "  \033[36m%-10s\033[0m%s\n", $$1, $$2}' $(MAKEFILE_LIST)

-include $(wildcard *.d)

