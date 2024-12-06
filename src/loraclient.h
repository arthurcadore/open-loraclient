#ifndef LORACLIENT_H
#define LORACLIENT_H
#include <string.h>
#include <Arduino.h>


enum reconfigurar {
  RECONF = 0,
  NOT_RECONF = 1
};

enum region {
  AUSTRALIA = 1
};

struct loraClient {
    char appeui[17];
    char deveui[17];
    char appkey[33];
    int intervalo_envio;
    int intervalo_desconectado;
    bool reconf;
    int region;

    loraClient(const char appeui[17], 
               const char deveui[17], 
               const char appkey[33], 
               const char intervalo_envio[17], 
               const char intervalo_desconectado[17], 
               const char reconf[17], 
               const char region[17]);

    const char* getAppeui();
    const char* getDeveui();
    const char* getAppkey();
    const int getIntervaloEnvio();
    const int getIntervaloDesconectado();
    const bool getReconfigurar();
    const int getRegion();

private:
    void setAppeui(const char appeui[17]);
    void setDeveui(const char deveui[17]);
    void setAppkey(const char appkey[33]);
    void setIntervaloEnvio(const char intervalo_envio[17]);
    void setIntervaloDesconectado(const char intervalo_desconectado[17]);
    void setReconfigurar(const char reconf[17]);
    void setRegion(const char region[17]);
};

#endif

