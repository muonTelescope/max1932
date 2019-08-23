#include <stdio.h>
#include <stdlib.h>
#include <wiringPi.h>
#include <wiringPiSPI.h>

using namespace std;

// Makefile needed
// -lwiringPi

// HV chip select GPIO5, Header Pin 29, Wiring pi Pin 21
// SPI Channel 0

#define CS_PIN 21
#define SPI_CHANNEL 0

// Argv 1 Bit value to set for voltage

int main (int argc, char** argv){
  wiringPiSetup();
  wiringPiSPISetupMode(SPI_CHANNEL, 1000000, 0);

  unsigned char data = (char)strtol(argv[1], NULL, 16);;
  printf("%d\n", (int)data);

  pinMode(CS_PIN, OUTPUT) ;
  digitalWrite(CS_PIN,  HIGH);
  delay(500);
  digitalWrite(CS_PIN, LOW);
  wiringPiSPIDataRW(SPI_CHANNEL, &data, 1);
  digitalWrite(CS_PIN,  HIGH);

  return 0;
}

