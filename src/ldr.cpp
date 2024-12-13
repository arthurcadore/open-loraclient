#include "ldr.h"

LDR::LDR(int pin) {
    this->pin = pin;
}

void LDR::measure() {
    currentValue = analogRead(pin); // Leitura do valor analógico
}

void LDR::measureBaseValue() {
    measure();
    baseValue = currentValue; // Define o valor base
}

int LDR::getCurrent() {
    return currentValue; // Retorna o valor atual lido
}

int LDR::getBaseValue() {
    return baseValue; // Retorna o valor base salvo
}

bool LDR::getStatus() {
    measure(); // Realiza uma nova medição
    // Se o valor atual estiver abaixo do valor base + um delta (ex.: 500), retorna true
    return currentValue < baseValue + 500;
}
