import streamlit as st
import pandas as pd
import folium
from folium.plugins import HeatMap
from streamlit_folium import st_folium

# Título da aplicação
# Ler o arquivo CSV
data = pd.read_csv('data/mapa.csv')

# Verificar se as colunas necessárias estão presentes
if all(col in data.columns for col in ['latitude', 'longitude', 'rssi']):
    # Preparar os dados para o HeatMap
    heat_data = [[row['latitude'], row['longitude'], row['rssi']] for index, row in data.iterrows()]

    # Criar o mapa centrado em uma localização específica
    mapa = folium.Map(location=[-27.6035,-48.619], zoom_start=14)

    # Adicionar o HeatMap ao mapa
    HeatMap(heat_data).add_to(mapa)

    # Renderizar o mapa no Streamlit
    st_folium(mapa, width=700, height=500)
else:
    st.error("O arquivo CSV deve conter as colunas: 'latitude', 'longitude' e 'rssi'.")
