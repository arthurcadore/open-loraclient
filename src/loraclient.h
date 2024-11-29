#ifndef LORACLIENT_H
#define LORACLIENT_H
#include <string.h>


enum reconfigurar {
  RECONF = 0,
  NOT_RECONF = 1
};

struct loraClient {
    char appeui[16];
    char deveui[16];
    char appkey[32];
    int intervalo_envio;
    int intervalo_desconectado;
    bool reconf;

    loraClient(const char appeui[16], 
               const char deveui[16], 
               const char appkey[32], 
               const char intervalo_envio[16], 
               const char intervalo_desconectado[16], 
               const char reconf[16]);

    const char* getAppeui();
    const char* getDeveui();
    const char* getAppkey();
    const int getIntervaloEnvio();
    const int getIntervaloDesconectado();
    const bool getReconfigurar();

private:
    void setAppeui(const char appeui[16]);
    void setDeveui(const char deveui[16]);
    void setAppkey(const char appkey[32]);
    void setIntervaloEnvio(const char intervalo_envio[16]);
    void setIntervaloDesconectado(const char intervalo_desconectado[16]);
    void setReconfigurar(const char reconf[16]);
};

#endif

