#!/bin/bash

# Directorio base del proyecto
PROJECT_DIR="/storage/emulated/0/CustomKernel_Lavender"
KERNEL_SRC="$PROJECT_DIR/kernel-source"

echo "[*] Preparando el directorio para el código fuente..."
mkdir -p "$KERNEL_SRC"
cd "$KERNEL_SRC"

echo "[*] Descargando el código fuente del kernel (LineageOS 19.1 - SDM660) en formato ZIP..."
curl -L -o kernel.zip https://github.com/LineageOS/android_kernel_xiaomi_sdm660/archive/refs/heads/lineage-19.1.zip

echo "[*] Descomprimiendo los archivos..."
unzip -q kernel.zip

echo "[*] Organizando la estructura en la carpeta del proyecto..."
mv android_kernel_xiaomi_sdm660-lineage-19.1/* .
rm -rf android_kernel_xiaomi_sdm660-lineage-19.1 kernel.zip

echo "[¡Hecho!] El código fuente del kernel se ha descargado y colocado automáticamente en su lugar."
