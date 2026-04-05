#!/bin/bash
echo "--- Configurando entorno Dual Boot ---"
# 1. Crear punto de montaje para la partición de datos
sudo mkdir -p /mnt/datos
# Nota: Tendrás que identificar el UUID de tu partición ExFAT con blkid
echo "Recuerda añadir la partición ExFAT a /etc/fstab para montaje automático."

# 2. Ejecutar instalación de drivers de la 2012
./install_2012.sh

# 3. Instalar soporte para el Archer T4u Plus
./install_archer.sh

echo "Configuración terminada. Ya puedes acceder a tus documentos desde /mnt/datos."
