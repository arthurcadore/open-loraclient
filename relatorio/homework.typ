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
  subtitle: "Comunicações Sem Fio",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "17 de Dezembro de 2024",
  doc,
)

= Introdução: 

= Desenvolvimento: 

== Calculo Teórico: 

== Análise dos Dados Coletados

Primeiramente os dados recebidos foram triados por horário, de maneira a determinar quais coletas correspondem a cada ponto de coleta. Em seguida, foi aplicado um script para cada conjunto de dados para determinar a média e variância das amostras coletadas. 

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
Variância da RSSI: 21.11
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
Variância da RSSI: 24.19
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
Variância da RSSI: 8.64
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
Variância da RSSI: 65.00
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
Variância da RSSI: 37.63
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
Variância da RSSI: 10.59
```]

== Gráfico de Calor:

= Conclusão:

= Referências: 

