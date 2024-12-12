#ifndef MAIN_H
#define MAIN_H

//Inclusao da biblioteca
#include "RoboCore_SMW_SX1276M0.h"
#include <ArduinoJson.h>
#include <HardwareSerial.h>
#include <sstream>
#include "loraclient.h"

const char appeui[17] = "0000000000000000";
const char appkey[33] = "9241B3D458A57D3758FDD1567344D77A";
const char deveui[17] = "50F8A500400103E3";
const char intervalo_envio[17] = "10";
const char intervalo_desconectado[17] = "20";
const char reconfigurar[17] = "1";
const char regiao[17] = "1";

//Define dos tempos de envio e desconexão
#define TEMPO_ENVIO 1000
#define TEMPO_AGUARDO 1000
/*
    Função de CLI, recebe uma instância loraClient como parâmetro 
    e imprime as variáveis de configuração para debug
*/

void cliDebug(loraClient loraClient);

#endif

