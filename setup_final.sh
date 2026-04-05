#!/bin/bash
echo "--- Configurando Entorno MBP 2012 (8GB RAM / 16GB SWAP / 258GB SSD) ---"

# 1. Crear puntos de montaje
sudo mkdir -p /mnt/comun_exfat
sudo mkdir -p /mnt/lab_ext4

# 2. Instrucciones para el fstab (Asegúrate de crear la SWAP de 16GB en la instalación)
echo "UUID=ID_EXFAT /mnt/comun_exfat exfat defaults,uid=1000,gid=1000 0 0"
echo "UUID=ID_EXT4 /mnt/lab_ext4 ext4 defaults 0 2"

# 3. Enlaces simbólicos
ln -s /mnt/comun_exfat ~/Compartido
ln -s /mnt/lab_ext4 ~/Laboratorio_IA

echo "Configuración sincronizada con 16GB de Swap de seguridad."
