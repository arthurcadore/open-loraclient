#ifndef __LDR_H__
#define __LDR_H__

#include <Arduino.h>

class LDR
{
public:
    // Construtor da classe LDR
    LDR(int pin = 15);

    // Realiza uma medição do valor atual do LDR
    void measure();

    // Mede e define o valor base para comparação
    void measureBaseValue();

    // Retorna o valor atual do LDR
    int getCurrent();

    // Retorna o valor base salvo
    int getBaseValue();

    // Retorna o status do sensor
    bool getStatus();

    ~LDR() {};

private:
    int VMax = 4095;      // Máximo valor do ADC (ESP32)
    int baseValue = 0;    // Valor base do sensor
    int currentValue = 0; // Último valor lido do LDR
    int pin = 0;          // Pino analógico conectado ao LDR
};

#endif
