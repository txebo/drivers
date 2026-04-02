#!/bin/bash
echo "--- Iniciando Instalación MacBook Pro 2012 (Mid 2012) ---"
sudo apt update && sudo apt install -y build-essential linux-headers-$(uname -r)
echo "Instalando Wi-Fi (Broadcom 4331)..."
sudo dpkg -i ./macbook2012/wifi/*.deb
echo "Configurando Audio (Fix mbp101)..."
sudo cp ./macbook2012/audio/apple-audio.conf /etc/modprobe.d/
echo "Compilando Driver de Cámara FaceTime HD..."
cd ./macbook2012/camara/driver-src && make && sudo make install
sudo modprobe facetimehd
echo "--- PROCESO 2012 FINALIZADO ---"
