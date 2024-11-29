#include "loraclient.h"

loraClient::loraClient(const char appeui[16], const char deveui[16], const char appkey[32], const char intervalo_envio[16], const char intervalo_desconectado[16], const char reconf[16])
{
    setAppeui(appeui);
    setDeveui(deveui);
    setAppkey(appkey);
    setIntervaloEnvio(intervalo_envio);
    setIntervaloDesconectado(intervalo_desconectado);
    setReconfigurar(reconf);
}

void loraClient::setAppeui(const char appeui[16]) {
    memcpy(this->appeui, appeui, 16);
}

void loraClient::setDeveui(const char deveui[16]) {
    memcpy(this->deveui, deveui, 16);
}
void loraClient::setAppkey(const char appkey[32]){
    memcpy(this->appkey, appkey, 32);
}
void loraClient::setIntervaloEnvio(const char intervalo_envio[16]) {
    this->intervalo_envio = atoi(intervalo_envio) * 1000;
}
void loraClient::setIntervaloDesconectado(const char intervalo_desconectado[16]) {
    this->intervalo_desconectado = atoi(intervalo_desconectado) * 1000;
}
void loraClient::setReconfigurar(const char reconf[16]) {
    if (strcmp(reconf, "RECONF") == 0) {
        this->reconf = true;
    } else {
        this->reconf = false;
    }
}

const char* loraClient::getAppeui() {
    return this->appeui;
}

const char* loraClient::getDeveui() {
    return this->deveui;
}

const char* loraClient::getAppkey() {
    return this->appkey;
}

const int loraClient::getIntervaloEnvio() {
    return this->intervalo_envio;
}

const int loraClient::getIntervaloDesconectado() {
    return this->intervalo_desconectado;
}

const bool loraClient::getReconfigurar() {
    return this->reconf;
}

