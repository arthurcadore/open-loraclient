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

class RegionChannels{
private: 
  region reg;
  bool channels[72];
  
public:
  RegionChannels(int firstChannel, int lastChannel, region reg){
    this->reg = reg;
    for (int i = 0; i < 72; i++){
      this->channels[i] = 0;
    }
    for (int i = firstChannel; i <= lastChannel; i++){
      this->channels[i] = 1;
    }
  }

  int getRegion(){
    return this->reg;
  }

  bool getChannel(int index){
    return this->channels[index];
  }
};

class loraClient {
private:
    char appeui[17];
    char deveui[17];
    char appkey[33];
    int intervalo_envio;
    int intervalo_desconectado;
    bool reconf;
    int region;
    RegionChannels* regionChannels;

public:
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
    const bool getChannel(int index);

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

