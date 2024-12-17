
#import "@preview/klaro-ifsc-sj:0.1.0": report


  #show: doc => report(
    title: "Resultados das medições com Lora",
    subtitle: "Comunicações sem fio (CSF029008 )",
    // Se apenas um autor colocar , no final para indicar que é um array
    authors:("Arthur Cadore Matuella Barcella",
                "Gabriel Luiz Espindola Pedro",
                "Gusto Paulo",
                "Matheus Pires Salazar",
                "Rhenzo Hideki Silva Kajikawa",),
    date: "17 de Dezembro de 2024",
    doc,
  )

= Introdução
Este relatório apresenta os resultados e análises obtidos durates a atividades de simulação e medições de enlaces Lora (Long Range). Técnologia essa que é tem sido utilizada em sistemas de comunicação de baixa potência e longo alcance. 

Foram relizadas medições do sinal RSSI (Received Signal Strength Indicator) utilizando uma ESP32 da Robocore com módulo LoRa , disponibilizado pelo professor. Além disso, foi utilizada o software Radio Mobile para calcular o valores teóricos para cada ponto medido, comparando com os resultados medidos em campo.

#pagebreak()
= Fundamentação Teórica
== Tecnologia LoRa
LoRa é uma tecnologia de rede de baixa potência e alto alcance , baseada em espalhamento espectral e tecnicas de modulação derivadas da chirp spread spectrum (CSS) , assim o Lora pode chegar até 10km em condições ideais.

RSSI é uma métrica que indicca a apotência do sinal recebido em dBm. Em comunicações, o valor do RSSI é fundamental para analisar a qualidade do enlace e calcular o expoente de perda no canal de propagação

== Modelo simplificado de perda de percurso
A perda de sinal em um canal e modelada por:
$
  L(d) = L(d_0) + 10 n log(d/d_0)
$

#align(center)[
- $d$: distância transmissor-receptor;
- $d_0$: distância de referência;
- $n$: expoente de perda de percurso;
]

#pagebreak()
= Análise dos Resultados
Foram escolhidos 6 pontos onde siriam feitas as medições. A partir disso foi feita o calculo teórico através do Radio Mobile e também foram feitas medições em campo.
== Resultados Obtidos pelo Radio Mobile
Ponto de referência escolhido próximo ao gateway.
#figure(
  image("./assets/Lora-IFSC-Ponto-Ref-3.png",width: 110%),
  caption: [
     Localização do ponto de referência \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto-Ref-1.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto-Ref-2.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#pagebreak()

Primeiro ponto simulado.
#figure(
  image("./assets/Lora-IFSC-Ponto1-3.png",width: 110%),
  caption: [
     Localização do primeiro ponto de medição \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto1-1.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto1-2.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

#pagebreak()
Segundo ponto simulado.
#figure(
  image("./assets/Lora-IFSC-Ponto2-3.png",width: 110%),
  caption: [
     Localização do Segundo ponto de medição \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto2-1.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto2-2.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

#pagebreak()
Terceiro ponto simulado.
#figure(
  image("./assets/Lora-IFSC-Ponto3-3.png",width: 110%),
  caption: [
     Localização do Terceiro ponto de medição \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto3-1.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto3-2.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

#pagebreak()
Quarto ponto simulado.
#figure(
  image("./assets/Lora-IFSC-Ponto4-3.png",width: 110%),
  caption: [
     Localização do Quarto ponto de medição \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto4-1.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto4-2.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

#pagebreak()
Quinto ponto simulado.
#figure(
  image("./assets/Lora-IFSC-Ponto5-3.png",width: 110%),
  caption: [
     Localização do Quinto ponto de medição \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto5-1.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto5-2.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

#pagebreak()
Sexto ponto simulado.
#figure(
  image("./assets/Lora-IFSC-Ponto6-3.png",width: 110%),
  caption: [
     Localização do Sexto ponto de medição \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto6-1.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#figure(
  image("./assets/Lora-IFSC-Ponto6-2.png",width: 110%),
  caption: [
     Cálculo teórico através do Rádio Mobile \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

#pagebreak()
== Resultados Medidos
Os resultados foram medidos através de uma ESP32 com um modulo LoRa.
Obtivemos os seguintes resultados:

#let data = csv("assets/pontos.csv")
#align(center)[
    #table(
        columns: 3,
        ..data.flatten(),
    )
]

== Mapa de Calor
#figure(
  image("./assets/Heatmap.png",width: 110%),
  caption: [
     Mapa de calor baseado na potência do sinal recebido \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

#pagebreak()
= Conclusão
Neste relatório, foram analisados os resultados teóricos e experimentais das medições do sinal LoRa.
Utilizando o Radio Mobile, foram calculadas as perdas de caminho esperadas e observado os resultados ideais.

Os dados coletedos em campo foram utilizados para determinar o expoente de perdas, confirmando a adequação do modelo log-distância para o ambiente estudado. Com base nesse expoente, foi gerado um Heatmap da potência do sinal, permitindo visualizar a distribuição espacial do RSSI.

Os resultados mostram que o sinal LoRa apresenta boa cobertuda, mas com perdas significativas à medida que se aumenta a distância.

