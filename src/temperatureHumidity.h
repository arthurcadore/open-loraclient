#ifndef __TEMPERATUREHUMIDITY_H__
#define __TEMPERATUREHUMIDITY_H__

#include <Arduino.h>
#include "DHT.h"

class TemperatureHumidity {
public:
    // Construtor com pinagem e tipo de sensor DHT
    TemperatureHumidity(uint8_t pin = 12, uint8_t type = DHT11);

    void measure();                // Realiza leitura do sensor
    void measureBaseTemperature(); // Define a temperatura base

    float getCurrentTemperature() const; // Retorna temperatura atual
    float getPreviousTemperature() const; // Retorna temperatura anterior
    float getBaseTemperature() const;     // Retorna temperatura base
    float getCurrentHumidity() const;     // Retorna umidade atual
    float getPreviousHumidity() const;    // Retorna umidade anterior

private:
    float baseTemperature = 0.0;
    float previousTemperature = 0.0;
    float currentTemperature = 0.0;
    float previousHumidity = 0.0;
    float currentHumidity = 0.0;

    DHT dht; // Instância da biblioteca DHT
};

#endif // __TEMPERATUREHUMIDITY_H__
