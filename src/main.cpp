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

    // imprime os canais de envio
    Serial.println("Canais de envio:");
    for (int i = 0; i < 72; i++){
      if (lc.getChannel(i)){
        Serial.print("Canal ");
        Serial.print(i);
        Serial.println("habilitado");
      }
    }

}

void canalReconfig(){
    Serial.println(F("Reconfigurando os canais de envio..."));
    // imprime os canais de envio

    int i = 0;
    unsigned long reconecta = TEMPO_ENVIO; // 1 segundos
    while (i < 72){
        // //Recebe as informacoes do modulo e exibe no monitor serial
        if (LoRaSerial.available()){
          Serial.write(LoRaSerial.read());
        }

        char channel[21];
        if (reconecta < millis()){
          if(lc.getChannel(i)){
            sprintf(channel, "AT+CH %d status=1", i);
            Serial.write(channel);
            LoRaSerial.print(channel);
            LoRaSerial.print("\n");
            reconecta = millis() + TEMPO_AGUARDO;
          } else {
            sprintf(channel, "AT+CH %d status=0", i);
            Serial.write(channel);
            LoRaSerial.print(channel);
            LoRaSerial.print("\n");
            reconecta = millis() + TEMPO_AGUARDO;
          }
          i++;
        }
    }
}

void reconfig(){
    Serial.println(F("Reconfigurando o módulo..."));

    // Configuração da região
    if (LoRaSerial.available()){
      Serial.write(LoRaSerial.read());
    }
    char region[16];
    sprintf(region, "AT+REGION %d\n", lc.getRegion());
    Serial.write(region); 

    // Configuração da DevEUI
    if (LoRaSerial.available()){
      Serial.write(LoRaSerial.read());
    }
    char deveui[32];
    sprintf(deveui, "AT+DEVEUI %s\n", lc.getDeveui());
    Serial.write(deveui);   

}

void loraConfig(){
  Serial.print(F("Verificando o Device EUI: "));
  Serial.write((uint8_t *)lc.getDeveui(), 16);
  Serial.println();

  char deveui[16];
  resposta = lorawan.get_DevEUI(deveui);
  if(resposta == CommandResponse::OK){
    Serial.print(F("DevEUI: "));
    Serial.write((uint8_t *)deveui, 16);
    Serial.println();
    Serial.println();
  } else {
    Serial.println(F("Erro ao obter o Device EUI"));
  }

  //Configura o Application EUI no modulo
  Serial.print(F("Configurando o Application EUI: "));
  Serial.write((uint8_t *)lc.getAppeui(), 16);
  Serial.println();

  resposta = lorawan.set_AppEUI(lc.getAppeui());
  if(resposta == CommandResponse::OK){
    Serial.print(F("App EUI: "));
    Serial.write((uint8_t *)lc.getAppeui(), 16);
    Serial.println();
    Serial.println();
  } else {
    Serial.println(F("Erro ao configurar o Application EUI"));
  }

  //Configura o Application Key no modulo
  Serial.print(F("Configurando o Application Key: "));
  Serial.write((uint8_t *)lc.getAppkey(), 32);
  Serial.println();

  resposta = lorawan.set_AppKey(lc.getAppkey());
  if(resposta == CommandResponse::OK){
    Serial.print(F("AppKey: "));
    Serial.write((uint8_t *)lc.getAppkey(), 32);
    Serial.println();
    Serial.println();
  } else {
    Serial.println(F("Erro ao configurar o AppKey"));
  }
   
}

bool reconnect = false;
void event_handler(Event type){ 
  // Verifica se o modulo esta conectado e atualiza essa informacao
  if(type == Event::JOINED){
    Serial.println(F("\nConectado!"));
    reconnect = true;
  }
}


void setup() {
  pinMode(13, OUTPUT);

  Serial.begin(115200);

  // Configuração do LoRaWAN
  lorawan.setPinReset(5);
  lorawan.reset();
  LoRaSerial.begin(115200, SERIAL_8N1, RXD2, TXD2);

  //  if (!lorawan.join()) {
  //  Serial.println("Falha ao conectar no LoRaWAN!");
  //  while (1);
  //  }
  
  // verifica se o módulo precisa ser reconfigurado 

  if (!lc.getReconfigurar()) {
    // Altera os parâmetros básicos do módulo
    reconfig();
    // Configuração dos canais de envio
    canalReconfig();
  }

  // Configuração do evento de conexão
  lorawan.event_listener = &event_handler;
  Serial.println(F("\nEvento configurado."));

  // Define demais parâmetros de configuração do módulo
  loraConfig();

  resposta = lorawan.set_JoinMode(SMW_SX1276M0_JOIN_MODE_OTAA);
  if(resposta == CommandResponse::OK){
    Serial.println(F("Metodo de Conexao Configurado como OTAA"));
  } else {
    Serial.println(F("Erro ao configurar o metodo OTAA"));
  }

  //Requisita conexao com a rede
  Serial.println(F("Conectando a Rede...\n"));
  lorawan.join();

}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(13, LOW);
  delay(500);
  digitalWrite(13, HIGH);

  // cliDebug(lc);
}
