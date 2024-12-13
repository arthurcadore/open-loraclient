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

// Instância do objeto TemperatureHumidity (DHT11)
TemperatureHumidity tempHumiditySensor(12);

// Instância do objeto LDR no pino analógico 34 (exemplo no ESP32)
LDR ldrSensor(34);

// Instancia do objeto loraClient
loraClient lc(appeui, 
              deveui, 
              appkey, 
              intervalo_envio, 
              intervalo_desconectado, 
              reconfigurar, 
              regiao);


bool reconnect = false;
void event_handler(Event type){ 
  // Verifica se o modulo esta conectado e atualiza essa informacao
  if(type == Event::JOINED){
    Serial.println(F("Connected into the network!"));
    reconnect = true;
  }
}

// Função para escrever dados no módulo LoRa e ficar aguardando a resposta, ao receber, imprime a resposta no Serial Monitor
void writeAndWaitResponse(const char *command) {
  Serial.write(command);
  LoRaSerial.print(command);
  LoRaSerial.print("\n");
  unsigned long timeout = millis() + 1000;
  while (millis() < timeout) {
    if (LoRaSerial.available()) {
      Serial.write(LoRaSerial.read());
    }
  }
}

// Função para escrever dados no módulo LoRa e ficar aguardando a resposta, ao receber, imprime a resposta no Serial Monitor
void writeAndDebug(const char *command) {
  LoRaSerial.print(command);
  LoRaSerial.print("\n");
  unsigned long timeout = millis() + 1000;
  while (millis() < timeout) {
    if (LoRaSerial.available()) {
      Serial.write(LoRaSerial.read());
    }
  }
}

void loraDebug(){
  // Verifica a região de operação do módulo LoRa
  Serial.println(F("Validating the region of the LoRa module: "));
  writeAndDebug("AT+REGION");

  // Verificando os canais de envio configurados
  Serial.println(F("Validating the configured sending channels: "));
  writeAndDebug("AT+CH");  

   // Verifica o Device EUI 
  Serial.print(F("Validating the Device EUI: "));
  writeAndDebug("AT+DEVEUI");

  // Verifica o Application EUI 
  Serial.print(F("Validating the Application EUI: "));
  writeAndDebug("AT+APPEUI");

  // Verifica o Application Key 
  Serial.print(F("Validating the Application Key: "));
  writeAndDebug("AT+APPKEY");
}

void canalReconfig(){
  Serial.println();
  Serial.println(F("Reconfiguring the sending region..."));

  // Configurando a região de operação do módulo LoRa
  char region[32];
  sprintf(region, "AT+REGION %d\n", lc.getRegion());
  writeAndWaitResponse(region);
  
  Serial.println();
  Serial.println(F("Reconfiguring the sending channels..."));  

    int i = 0;
    unsigned long reconecta = TEMPO_ENVIO;
    while (i < 72){
        char channel[21];
        if (reconecta < millis()){
          if(lc.getChannel(i)){
            sprintf(channel, "AT+CH %d status=1", i);
            writeAndWaitResponse(channel);
          } else {
            sprintf(channel, "AT+CH %d status=0", i);
            writeAndWaitResponse(channel);
          }
          i++;
        }
    }
}

void loraConfig(){
  Serial.println();
  Serial.println(F("Configuring the LoRa module..."));

  // Configurando o Device EUI usando a função writeAndWaitResponse
  char deveuiset[32];
  sprintf(deveuiset, "AT+DEVEUI %s\n", lc.getDeveui());
  writeAndWaitResponse(deveuiset);

  // Configurando o Application EUI usando a função writeAndWaitResponse
  char appeuiset[32];
  sprintf(appeuiset, "AT+APPEUI %s\n", lc.getAppeui());
  writeAndWaitResponse(appeuiset);

  // Configurando o Application Key usando a função writeAndWaitResponse
  char appkeyset[64];
  sprintf(appkeyset, "AT+APPKEY %s\n", lc.getAppkey());
  writeAndWaitResponse(appkeyset);
}

void setup() {
  // Inicializando o pino 13 como saída para controle de LED
  pinMode(13, OUTPUT);

  // Inicializando a comunicação serial.
  Serial.begin(115200);

  // Configuração do LoRaWAN
  lorawan.setPinReset(5);
  lorawan.reset();
  LoRaSerial.begin(115200, SERIAL_8N1, RXD2, TXD2);

  // verifica se o módulo precisa ser reconfigurado 
  if (!lc.getReconfigurar()) {
    canalReconfig();
    loraConfig();
  }

  // Debug do módulo LoRa
  loraDebug();

  // Configuração do evento de conexão
  Serial.println(F("Configuring the connection event..."));
  lorawan.event_listener = &event_handler;

  resposta = lorawan.set_JoinMode(SMW_SX1276M0_JOIN_MODE_OTAA);
  if(resposta == CommandResponse::OK){
    Serial.println(F("Connection method configured as OTAA"));
  } else {
    Serial.println(F("Error configuring connection method as OTAA"));
  }

  // Requisita conexao com a rede
  Serial.println(F("Connecting into the gateway..."));
  writeAndWaitResponse("AT+JOIN");

  // Inicialização do sensor de temperatura e umidade
  tempHumiditySensor.measureBaseTemperature();

  // Configura o pino do sensor LDR
  pinMode(34, INPUT);

  Serial.println("Initializing LDR Sensor...");
    
  // Define o valor base inicial para comparação
  ldrSensor.measureBaseValue();
  Serial.print("Base Value Set: ");
  Serial.println(ldrSensor.getBaseValue());
}

void loop() {
  static unsigned long lastSendTime = 0;
  const unsigned long sendInterval = 10000; // Intervalo de envio (10 segundos)

  // Realiza medições e envia os dados pelo LoRa em intervalos
  if (millis() - lastSendTime >= sendInterval) {
      lastSendTime = millis();

      // Realiza a medição do sensor de temperatura e umidade
      tempHumiditySensor.measure();
      float temperature = tempHumiditySensor.getCurrentTemperature();
      float humidity = tempHumiditySensor.getCurrentHumidity();

      // Realiza a leitura do LDR
      ldrSensor.measure();
      int ldrValue = ldrSensor.getCurrent();

      // Monta a string com os dados coletados
      char payload[128];
      sprintf(payload, "Temperature: %.2f C, Humidity: %.2f %%, LDR: %d", 
              temperature, humidity, ldrValue);

      Serial.println(F("Sending payload:"));
      Serial.println(payload);

      // Envia o payload ao módulo LoRa
      writeAndWaitResponse(payload);
  }

  // Exibe os valores do LDR no Monitor Serial (para debug)
  ldrSensor.measure();
  int currentValue = ldrSensor.getCurrent();

  Serial.print("Current Value: ");
  Serial.print(currentValue);
  Serial.print(" | Base Value: ");
  Serial.print(ldrSensor.getBaseValue());
  
  if (ldrSensor.getStatus()) {
      Serial.println(" | Status: BELOW Threshold");
  } else {
      Serial.println(" | Status: ABOVE Threshold");
  }

  // Lê comandos da Serial e envia ao LoRa
  static String inputBuffer = "";
  while (Serial.available()) {
      char c = Serial.read();
      inputBuffer += c;
      if (c == '\n') {
          writeAndWaitResponse(inputBuffer.c_str());
          inputBuffer = "";
      }
  }
}
