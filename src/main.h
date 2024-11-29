#ifndef MAIN_H
#define MAIN_H

//Inclusao da biblioteca
#include "RoboCore_SMW_SX1276M0.h"
#include <ArduinoJson.h>
#include <HardwareSerial.h>
#include <sstream>
#include "loraclient.h"

const char appeui[] = "50F8A500000103E3";
const char appkey[] = "08C0916E1C0E9306EC38DFE7C10E2E07";
const char deveui[] = "70B3D57ED006C580";
const char intervalo_envio[] = "10";
const char intervalo_desconectado[] = "20";
const char reconfigurar[] = "0";

/*
    Função de CLI, recebe uma instância loraClient como parâmetro 
    e imprime as variáveis de configuração para debug
*/

void cliDebug(loraClient loraClient);

#endif

