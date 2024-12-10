#include "loraclient.h"

loraClient::loraClient(const char appeui[17], 
                       const char deveui[17], 
                       const char appkey[33], 
                       const char intervalo_envio[17], 
                       const char intervalo_desconectado[17], 
                       const char reconf[17], 
                       const char region[17])
{
    setAppeui(appeui);
    setDeveui(deveui);
    setAppkey(appkey);
    setIntervaloEnvio(intervalo_envio);
    setIntervaloDesconectado(intervalo_desconectado);
    setReconfigurar(reconf);
    setRegion(region);
}

void loraClient::setAppeui(const char appeui[17]) {
    memcpy(this->appeui, appeui, 17);
}

void loraClient::setDeveui(const char deveui[17]) {
    memcpy(this->deveui, deveui, 17);
}
void loraClient::setAppkey(const char appkey[33]){
    memcpy(this->appkey, appkey, 33);
}
void loraClient::setIntervaloEnvio(const char intervalo_envio[17]) {
    this->intervalo_envio = atoi(intervalo_envio) * 1000;
}
void loraClient::setIntervaloDesconectado(const char intervalo_desconectado[17]) {
    this->intervalo_desconectado = atoi(intervalo_desconectado) * 1000;
}
void loraClient::setReconfigurar(const char reconf[17]) {
    int tmp = atoi(reconf);

    if (tmp == reconfigurar::RECONF) {
        this->reconf = true;
    } else {
        this->reconf = false;
    }
}

void loraClient::setRegion(const char reg[17]) {
    int tmp = atoi(reg);

    if (tmp == region::AUSTRALIA) {
        this->region = region::AUSTRALIA;

        this->regionChannels = new RegionChannels(8, 15, region::AUSTRALIA);
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

const int loraClient::getRegion() {
    return this->region;
}

const bool loraClient::getChannel(int index) {
    return this->regionChannels->getChannel(index);
}



