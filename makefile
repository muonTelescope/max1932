CXX = g++
CXXFLAGS = -std=c++11
LDLIBS = -lwiringPi

HEADERS = #Components/Headers/RumPi.h ./Common.h Components/Headers/Component.h \
#    Components/Headers/Vehicle.h Components/Headers/Motor.h Components/Headers/Receiver.h \
#    Components/Headers/DualLED.h Components/Headers/LED.h Components/Headers/RGBLED.h \
#    Components/Headers/Relay.h 
OBJECTS = max1932.o 

default: max1932

max1932: $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ $(LDLIBS) -o $@

%.o: ./%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(OBJECTS): $(HEADERS)

clean:
	-rm -f $(OBJECTS)
	-rm -f max1932