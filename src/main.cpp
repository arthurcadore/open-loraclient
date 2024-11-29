//Inclusao da biblioteca
#include "main.h"

//Declaracao dos pinos de comunicacao serial do Kit
HardwareSerial LoRaSerial(2);
#define RXD2 16
#define TXD2 17

//Criacao do objeto lorawan para a biblioteca SMW_SX1276M0
SMW_SX1276M0 lorawan(LoRaSerial);

// Variável de reconfiguração do módulo
CommandResponse resposta;

void cliDebug(loraClient loraClient){
    Serial.println("Configurações do módulo LoRa:");
    Serial.print("AppEUI: ");
    Serial.println(loraClient.getAppeui());
    Serial.print("DevEUI: ");
    Serial.println(loraClient.getDeveui());
    Serial.print("AppKey: ");
    Serial.println(loraClient.getAppkey());
    Serial.print("Intervalo de envio: ");
    Serial.println(loraClient.getIntervaloEnvio());
    Serial.print("Intervalo de desconexão: ");
    Serial.println(loraClient.getIntervaloDesconectado());
    Serial.print("Reconfigurar: ");
    Serial.println(loraClient.getReconfigurar());
}


void setup() {
  pinMode(13, OUTPUT);

  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(13, LOW);
  delay(500);
  digitalWrite(13, HIGH);

  loraClient loraClient(appeui, deveui, appkey, intervalo_envio, intervalo_desconectado, reconfigurar);
  
  cliDebug(loraClient);
}
