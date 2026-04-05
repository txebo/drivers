#!/bin/bash
echo "--- Instalando Driver Archer T4u Plus (RTL8812BU) ---"
sudo apt update && sudo apt install -y build-essential dkms git linux-headers-$(uname -r)
cd ./adaptadores/archer-t4u-plus/src
# Usamos DKMS para que el driver no se rompa con cada actualización del kernel
sudo ./dkms-install.sh
echo "--- PROCESO FINALIZADO. Conecta el adaptador. ---"
