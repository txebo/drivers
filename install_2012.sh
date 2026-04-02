#!/bin/bash
echo "--- Iniciando Instalación MacBook Pro 2012 ---"
sudo apt update && sudo apt install -y build-essential linux-headers-$(uname -r)
echo "Instalando Wi-Fi..."
sudo dpkg -i ./macbook2012/wifi/*.deb
echo "Configurando Audio..."
sudo cp ./macbook2012/audio/apple-audio.conf /etc/modprobe.d/
echo "Compilando Driver de Cámara..."
cd ./macbook2012/camara/driver-src && make && sudo make install
sudo modprobe facetimehd
echo "PROCESO 2012 FINALIZADO. Reinicia el equipo."
