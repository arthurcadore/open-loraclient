#include "temperatureHumidity.h"

// Construtor inicializa o DHT no pino e tipo especificado
TemperatureHumidity::TemperatureHumidity(uint8_t pin, uint8_t type) : dht(pin, type) {
    dht.begin();
}

// Método para realizar as medições do sensor
void TemperatureHumidity::measure() {
    previousTemperature = currentTemperature;
    previousHumidity = currentHumidity;

    // Leitura das medições (temperatura e umidade)
    currentTemperature = dht.readTemperature() * 0.79; // Fator de correção
    currentHumidity = dht.readHumidity();
}

// Define a temperatura base com a leitura atual
void TemperatureHumidity::measureBaseTemperature() {
    measure(); // Faz a leitura antes de atualizar
    baseTemperature = currentTemperature;
}

// Getters para retornar os valores atuais e anteriores
float TemperatureHumidity::getCurrentTemperature() const {
    return currentTemperature;
}

float TemperatureHumidity::getPreviousTemperature() const {
    return previousTemperature;
}

float TemperatureHumidity::getBaseTemperature() const {
    return baseTemperature;
}

float TemperatureHumidity::getCurrentHumidity() const {
    return currentHumidity;
}

float TemperatureHumidity::getPreviousHumidity() const {
    return previousHumidity;
}
