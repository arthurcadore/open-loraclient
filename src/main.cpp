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

// Instancia do objeto loraClient
loraClient lc(appeui, 
              deveui, 
              appkey, 
              intervalo_envio, 
              intervalo_desconectado, 
              reconfigurar, 
              regiao);


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
    Serial.print("Região: ");
    Serial.println(loraClient.getRegion());
}

void reconfig(){
    Serial.println(F("Reconfigurando o módulo..."));

    cliDebug(lc);

    if (LoRaSerial.available()){
      Serial.write(LoRaSerial.read());
    }
    //     Serial.write("AT+REGION 1\n");
    int regiao = lc.getRegion();
    char region[16];
    sprintf(region, "AT+REGION %d\n", regiao);
    Serial.write(region); 
    
    if (LoRaSerial.available()){
      Serial.write(LoRaSerial.read());
    }
    char appeui[16];
    sprintf(appeui, "AT+APPEUI %s\n", lc.getAppeui());
    Serial.write(appeui);

    if (LoRaSerial.available()){
      Serial.write(LoRaSerial.read());
    }
    char deveui[16];
    sprintf(deveui, "AT+DEVEUI %s\n", lc.getDeveui());
    Serial.write(deveui);



}

void setup() {
  pinMode(13, OUTPUT);

  Serial.begin(115200);

  // Configuração do LoRaWAN
  lorawan.setPinReset(5);
  lorawan.reset();
  LoRaSerial.begin(115200, SERIAL_8N1, RXD2, TXD2);
  // if (!lorawan.join()) {
  //   Serial.println("Falha ao conectar no LoRaWAN!");
  //   while (1);
  // }
  
  // verifica se o módulo precisa ser reconfigurado 

    reconfig();
  if (lc.getReconfigurar()) {
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(13, LOW);
  delay(500);
  digitalWrite(13, HIGH);

  cliDebug(lc);
}
