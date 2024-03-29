CXX = g++
CXXFLAGS = -std=c++11 -I.
LDLIBS = -lwiringPi

HEADERS = max1932.h
OBJECTS = main.o max1932.o

default: main

main: $(OBJECTS)
		$(CXX) -o $@ $(LDLIBS) $^

%.o: ./%.cpp
		$(CXX) -c $< $(CXXFLAGS)

clean:
		-rm -f $(OBJECTS)
		-rm -f main