make: build
	pio device monitor --baud 115200 --echo -f send_on_enter -f colorize

build: variables
	platformio run --target upload --upload-port /dev/ttyUSB0

install: 
	platformio project init --board esp32dev

variables: 
	export APPEUI=50F8A500000103E3
	export APPKEY=08C0916E1C0E9306EC38DFE7C10E2E07
	export DEVEUI=70B3D57ED006C580
	export RECONFIGURAR=0
	export INTERVALO_ENVIO=60
	export INTERVALO_DESCONECTADO=60
