#!/bin/bash
echo "--- Iniciando Instalación MacBook Pro 2016 (13,1) ---"
sudo apt update && sudo apt install -y build-essential linux-headers-$(uname -r)
echo "Compilando Driver SPI (Teclado y Trackpad)..."
cd ./macbook2016/spi-keyboard/driver && make && sudo make install
sudo modprobe applespi
echo "Instalando Driver de Audio Digital (Leifliddy)..."
cd ../../../macbook2016/audio/driver-audio && sudo ./install.sh
echo "--- PROCESO 2016 FINALIZADO ---"
