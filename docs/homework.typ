
#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

  #show: doc => report(
    title: "Teste de campo e Análise de desempenho 
  em rede LoRa WAN para IoT",
    subtitle: "Comunicações sem fio",
    // Se apenas um autor colocar , no final para indicar que é um array
    authors:("Arthur Cadore Matuella Barcella",
                "Gabriel Luiz Espindola Pedro",
                "Gusto Paulo",
                "Matheus Pires Salazar",
                "Rhenzo Hideki Silva Kajikawa",),
    date: "23 de Dezembro de 2024",
    doc,
  )


= Introdução
Este relatório apresenta os resultados e análises obtidos durates a atividades de simulação e medições de enlaces Lora (Long Range). Técnologia essa que é tem sido utilizada em sistemas de comunicação de baixa potência e longo alcance. 

Foram relizadas medições do sinal RSSI (Received Signal Strength Indicator) utilizando uma ESP32 da Robocore com módulo LoRa , disponibilizado pelo professor. Além disso, foi utilizada o software Radio Mobile para calcular o valores teóricos para cada ponto medido, comparando com os resultados medidos em campo.

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


= Análise Premptiva e Teste em Campo 

Para determinar o desempenho do enlace LoRa, foram realizadas medições de RSSI em diferentes pontos proximos do campus do IFSC-SJ. Os pontos de medição foram escolhidos de maneira a cobrir diferentes distâncias e obstáculos, permitindo avaliar a variação do sinal em função da distância e da presença de obstáculos.

Inicialmente, foi realizada uma simulação do enlace LoRa utilizando o software Radio Mobile, que permite calcular a perda de percurso esperada para diferentes distâncias e expoentes de perda. Em seguida, foram realizadas medições de RSSI em campo, utilizando uma ESP32 com módulo LoRa.

== Simulação dos locais de medição

Para cada ponto de medição, foi calculada a perda de percurso esperada utilizando o Radio Mobile. Os resultados teóricos foram comparados com os dados medidos em campo, permitindo avaliar a precisão do modelo de perda de percurso.

=== Ponto 0 (Inicio):

Inicialmente, definimos sua localização no software apontando através de sua latitude e longitude. Em seguida, calculamos um enlace P2P entre o ponto de medição e a torre do IFSC, com uma altura de 10 metros. Abaixo está uma representação do P2P em questão: 


#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto1-3.png"), width: 75%),
    numbering: none,
    caption: [Localização do ponto de medição]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo é apresentado um corte transversal do enlace P2P, com a altura de 10 metros (torre do IFSC) e 1 metro (ponto de medição) em relação ao solo. Note que o corte permite avaliar a obstrução da zona de Fresnel entre os pontos de transmissão e recepção, permitindo avaliar a presença de obstáculos no enlace.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto1-1.png"), width: 75%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Os resultados do enlace estão dispostos abaixo em forma de tabela, note o nivel de sinal esperado e a perda de percurso esperada.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto1-2.png"), width: 100%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Ponto 1:

Em seguida, repetimos o processo para o ponto 1. Calculando um enlace P2P entre o ponto de medição e a torre do IFSC, com uma altura de 10 metros. Abaixo está uma representação do P2P em questão:

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto2-3.png"), width: 75%),
    numbering: none,
    caption: [Localização do ponto de medição]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo é apresentado um corte transversal do enlace P2P, com a altura de 10 metros (torre do IFSC) e 1 metro (ponto de medição) em relação ao solo. Note que o corte permite avaliar a obstrução da zona de Fresnel entre os pontos de transmissão e recepção, permitindo avaliar a presença de obstáculos no enlace.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto2-1.png"), width: 75%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Os resultados do enlace estão dispostos abaixo em forma de tabela, note o nivel de sinal esperado e a perda de percurso esperada.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto2-2.png"), width: 100%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Ponto 2:

Em seguida, repetimos o processo para o ponto 2. Calculando um enlace P2P entre o ponto de medição e a torre do IFSC, com uma altura de 10 metros. Abaixo está uma representação do P2P em questão:

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto3-3.png"), width: 75%),
    numbering: none,
    caption: [Localização do ponto de medição]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo é apresentado um corte transversal do enlace P2P, com a altura de 10 metros (torre do IFSC) e 1 metro (ponto de medição) em relação ao solo. Note que o corte permite avaliar a obstrução da zona de Fresnel entre os pontos de transmissão e recepção, permitindo avaliar a presença de obstáculos no enlace.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto3-1.png"), width: 75%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Os resultados do enlace estão dispostos abaixo em forma de tabela, note o nivel de sinal esperado e a perda de percurso esperada.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto3-2.png"), width: 100%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Ponto 3:

Em seguida, repetimos o processo para o ponto 3. Calculando um enlace P2P entre o ponto de medição e a torre do IFSC, com uma altura de 10 metros. Abaixo está uma representação do P2P em questão:

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto4-3.png"), width: 75%),
    numbering: none,
    caption: [Localização do ponto de medição]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo é apresentado um corte transversal do enlace P2P, com a altura de 10 metros (torre do IFSC) e 1 metro (ponto de medição) em relação ao solo. Note que o corte permite avaliar a obstrução da zona de Fresnel entre os pontos de transmissão e recepção, permitindo avaliar a presença de obstáculos no enlace.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto4-1.png"), width: 75%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Os resultados do enlace estão dispostos abaixo em forma de tabela, note o nivel de sinal esperado e a perda de percurso esperada.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto4-2.png"), width: 100%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Ponto 4:

Em seguida, repetimos o processo para o ponto 4. Calculando um enlace P2P entre o ponto de medição e a torre do IFSC, com uma altura de 10 metros. Abaixo está uma representação do P2P em questão:

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto5-3.png"), width: 75%),
    numbering: none,
    caption: [Localização do ponto de medição]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo é apresentado um corte transversal do enlace P2P, com a altura de 10 metros (torre do IFSC) e 1 metro (ponto de medição) em relação ao solo. Note que o corte permite avaliar a obstrução da zona de Fresnel entre os pontos de transmissão e recepção, permitindo avaliar a presença de obstáculos no enlace.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto5-1.png"), width: 75%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Os resultados do enlace estão dispostos abaixo em forma de tabela, note o nivel de sinal esperado e a perda de percurso esperada.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto5-2.png"), width: 100%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Ponto 5: 

Em seguida, repetimos o processo para o ponto 5. Calculando um enlace P2P entre o ponto de medição e a torre do IFSC, com uma altura de 10 metros. Abaixo está uma representação do P2P em questão:

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto6-3.png"), width: 75%),
    numbering: none,
    caption: [Localização do ponto de medição]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo é apresentado um corte transversal do enlace P2P, com a altura de 10 metros (torre do IFSC) e 1 metro (ponto de medição) em relação ao solo. Note que o corte permite avaliar a obstrução da zona de Fresnel entre os pontos de transmissão e recepção, permitindo avaliar a presença de obstáculos no enlace.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto6-1.png"), width: 75%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Os resultados do enlace estão dispostos abaixo em forma de tabela, note o nivel de sinal esperado e a perda de percurso esperada.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto6-2.png"), width: 100%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Ponto 5 (Torre do IFSC):

Por fim, repetimos o processo para o ponto 5, a referencia proxima a torre do IFSC. Calculando um enlace P2P entre o ponto de medição e a torre do IFSC, com uma altura de 10 metros. Abaixo está uma representação do P2P em questão:

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto-Ref-3.png"), width: 75%),
    numbering: none,
    caption: [Localização do ponto de medição]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo, é apresentado um corte transversal do enlace P2P, com a altura de 10 metros (torre do IFSC) e 1 metro (ponto de medição) em relação ao solo. Note que o corte permite avaliar a obstrução da zona de Fresnel entre os pontos de transmissão e recepção, permitindo avaliar a presença de obstáculos no enlace.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto-Ref-1.png"), width: 75%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Os resultados do enlace estão dispostos abaixo em forma de tabela, note o nivel de sinal esperado e a perda de percurso esperada.

#figure(
  figure(
    rect(image("./assets/Lora-IFSC-Ponto-Ref-2.png"), width: 100%),
    numbering: none,
    caption: [Cálculo teórico através do Rádio Mobile]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Resultados Medidos em Campo

Após a saida de campo, os resultados amostrados foram triados por horário, de maneira a determinar quais coletas correspondem a cada ponto de coleta. Em seguida, foi aplicado um script para cada conjunto de dados para determinar a média e variância das amostras coletadas. 

Abaixo, segue o código utilizado para realizar essa análise: 

#sourcecode[```python: 
def calcular_estatisticas_rssi(nome_arquivo):
    try:
        with open(nome_arquivo, 
                  mode='r', 
                  newline='', 
                  encoding='utf-8-sig') as arquivo:
            leitor_csv = csv.reader(arquivo)
            rssi_valores = []
            
            for linha in leitor_csv:
                rssi_valor = linha[0].strip()  
                rssi_valores.append(int(rssi_valor))
            
            if rssi_valores:
                # Cálculo da média
                media_rssi = sum(rssi_valores) / len(rssi_valores)
                
                # Cálculo da variância
                variancia_rssi = (
                    sum((x - media_rssi) ** 2 for x in rssi_valores) 
                    / len(rssi_valores))
                
                print(f"Média da RSSI: {media_rssi:.2f}")
                print(f"Variância da RSSI: {variancia_rssi:.2f}")
            else:
                print("O arquivo está vazio.")
    except FileNotFoundError:
        print(f"O arquivo '{nome_arquivo}' não foi encontrado.")
    except IndexError:
        print("Erro ao acessar as colunas do arquivo.")
    except ValueError as e:
        print(f"Erro ao processar valores de RSSI: {e}")
```]

Abaixo, segue a análise dos dados coletados em cada ponto de amostragem:

=== Ponto 0 (Inicio): 

#let moore = csv("inicio2.csv")
#let moore-log = moore.slice(1).map(m => {
  let (rssi,data,hora) = m
  (data,hora,rssi)
})

#align(center)[
  #table(
   columns: moore-log.first().len(),
   align: (left, center, center),
   fill: (_, y) => if calc.odd(y) { rgb("D7D9E0") },
   table.header[Index][Descrição][Necessidade de LAB],
   ..moore-log.flatten(),
)]

#sourcecode[```python
Média da RSSI: -94.27
```]

=== Ponto 1: 

#let moore = csv("pt1.csv")
#let moore-log = moore.slice(1).map(m => {
  let (rssi,data,hora) = m
  (data,hora,rssi)
})

#align(center)[
  #table(
   columns: moore-log.first().len(),
   align: (left, center, center),
   fill: (_, y) => if calc.odd(y) { rgb("D7D9E0") },
   table.header[Index][Descrição][Necessidade de LAB],
   ..moore-log.flatten(),
)]

#sourcecode[```python
Média da RSSI: -99.75
```]

=== Ponto 2: 

#let moore = csv("pt2.csv")
#let moore-log = moore.slice(1).map(m => {
  let (rssi,data,hora) = m
  (data,hora,rssi)
})

#align(center)[
  #table(
   columns: moore-log.first().len(),
   align: (left, center, center),
   fill: (_, y) => if calc.odd(y) { rgb("D7D9E0") },
   table.header[Index][Descrição][Necessidade de LAB],
   ..moore-log.flatten(),
)]

#sourcecode[```python
Média da RSSI: -96.83
```]


=== Ponto 3: 

#let moore = csv("pt3.csv")
#let moore-log = moore.slice(1).map(m => {
  let (rssi,data,hora) = m
  (data,hora,rssi)
})

#align(center)[
  #table(
   columns: moore-log.first().len(),
   align: (left, center, center),
   fill: (_, y) => if calc.odd(y) { rgb("D7D9E0") },
   table.header[Index][Descrição][Necessidade de LAB],
   ..moore-log.flatten(),
)]

#sourcecode[```python
Média da RSSI: -93.00
```]

=== Ponto 4: 

#let moore = csv("pt4.csv")
#let moore-log = moore.slice(1).map(m => {
  let (rssi,data,hora) = m
  (data,hora,rssi)
})

#align(center)[
  #table(
   columns: moore-log.first().len(),
   align: (left, center, center),
   fill: (_, y) => if calc.odd(y) { rgb("D7D9E0") },
   table.header[Index][Descrição][Necessidade de LAB],
   ..moore-log.flatten(),
)]


#sourcecode[```python
Média da RSSI: -99.71
```]


=== Ponto 5 (Torre do IFSC): 

#let moore = csv("pt5.csv")
#let moore-log = moore.slice(1).map(m => {
  let (rssi,data,hora) = m
  (data,hora,rssi)
})

#align(center)[
  #table(
   columns: moore-log.first().len(),
   align: (left, center, center),
   fill: (_, y) => if calc.odd(y) { rgb("D7D9E0") },
   table.header[Index][Descrição][Necessidade de LAB],
   ..moore-log.flatten(),
)]

#sourcecode[```python
Média da RSSI: -69.85
```]

Dessa forma, obetivemos os seguintes valores analisando todos os pontos: 

#let data = csv("assets/pontos.csv")
#align(center)[
    #table(
        columns: 3,
        ..data.flatten(),
    )
]

== Mapa de Calor

A partir dos dados coletados em campo, e também das simulações realizadas no Radio Mobile, foi possível gerar um mapa de calor da potência do sinal recebido (RSSI) em função da distância. O mapa de calor permite visualizar a distribuição espacial do sinal LoRa, identificando áreas com maior e menor potência de sinal.

Abaixo é apresentado o mapa de calor gerado a partir dos dados coletados em campo:

#figure(
  image("./assets/Heatmap.png",width: 100%),
  caption: [
     Mapa de calor baseado na potência do sinal recebido \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

Note que a região do IFSC apresenta uma maior potência de sinal, representada por uma área do mapa mais aquecida, enquanto as regiões mais distantes apresentam uma menor potência de sinal. Isso é esperado, uma vez que a perda de percurso aumenta com a distância, resultando em uma menor potência de sinal recebido.

= Conclusão

Neste relatório, foram analisados os resultados teóricos e experimentais das medições do sinal LoRa.
Utilizando o Radio Mobile, foram calculadas as perdas de caminho esperadas e observado os resultados ideais.

Os dados coletedos em campo foram utilizados para determinar o expoente de perdas, confirmando a adequação do modelo log-distância para o ambiente estudado. Com base nesse expoente, foi gerado um Heatmap da potência do sinal, permitindo visualizar a distribuição espacial do RSSI.

Os resultados mostram que o sinal LoRa apresenta boa cobertuda, mas com perdas significativas à medida que se aumenta a distância.
