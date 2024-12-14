import streamlit as st
import pandas as pd
import folium
from folium.plugins import HeatMap
from streamlit_folium import st_folium

# Configurar a página para modo de largura expandida
st.set_page_config(layout="wide")

# CSS para ajustar o mapa para ocupar a tela inteira
st.markdown(
    """
    <style>
    #mapa {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        width: 100%;
        height: 100%;
        z-index: 9999;
    }
    .main {
        padding: 0;
    }
    </style>
    """,
    unsafe_allow_html=True,
)

# Ler o arquivo CSV
data = pd.read_csv('data/mapa.csv')

# Verificar se as colunas necessárias estão presentes
if all(col in data.columns for col in ['latitude', 'longitude', 'rssi']):
    # Preparar os dados para o HeatMap
    # Normalizando a coluna rssi para valores entre 0 e 1
    data['rssi_normalized'] = (data['rssi'] - data['rssi'].min()) / (data['rssi'].max() - data['rssi'].min())

    heat_data = [[row['latitude'], row['longitude'], row['rssi_normalized']] for index, row in data.iterrows()]

    # Criar o mapa centrado em uma localização específica
    mapa = folium.Map(location=[-27.6035, -48.619], zoom_start=14)

    # Adicionar o HeatMap ao mapa
    HeatMap(heat_data).add_to(mapa)

    # Renderizar o mapa no Streamlit
    st_folium(mapa, width=1920, height=1080)
else:
    st.error("O arquivo CSV deve conter as colunas: 'latitude', 'longitude' e 'rssi'.")
