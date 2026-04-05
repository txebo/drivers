#!/bin/bash
echo "--- Configurando Particiones de Datos (Investigación) ---"

# 1. Crear carpetas de montaje
sudo mkdir -p /mnt/datos_comunes
sudo mkdir -p /mnt/laboratorio_ia

# 2. Identificar UUIDs (Debes reemplazarlos con los tuyos tras formatear)
echo "Ejecuta: sudo blkid"
echo "Luego añade estas lineas a /etc/fstab:"
echo "# Particion Comun (ExFAT - 20GB):"
echo "UUID=UUID_EXFAT /mnt/datos_comunes exfat defaults,uid=1000,gid=1000 0 0"
echo "# Particion Laboratorio (EXT4 - El resto):"
echo "UUID=UUID_EXT4 /mnt/laboratorio_ia ext4 defaults 0 2"

# 3. Crear accesos directos en el Home
ln -s /mnt/datos_comunes ~/Compartido_Mac
ln -s /mnt/laboratorio_ia ~/Proyectos_IA

echo "Configuración de rutas lista."
