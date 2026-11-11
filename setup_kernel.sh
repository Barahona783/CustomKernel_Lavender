#!/bin/bash
# ==========================================
# Script de Configuración y Descarga Blindado - Lavender
# ==========================================

set -e

# Directorio base del proyecto (ajustable a la ruta local o emulada)
PROJECT_DIR="${PWD}"
KERNEL_SRC="$PROJECT_DIR/kernel-source"

echo "[*] Preparando el entorno para el código fuente en: $KERNEL_SRC"

# 1. Verificar herramientas necesarias
for cmd in curl unzip; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "[!] Error: La herramienta '$cmd' es requerida pero no está instalada."
        exit 1
    fi
done

# 2. Crear y asegurar el directorio del kernel
mkdir -p "$KERNEL_SRC"
cd "$KERNEL_SRC"

# 3. Verificar si ya existe código fuente para evitar descargas redundantes
if [ -n "$(ls -A "$KERNEL_SRC" 2>/dev/null)" ]; then
    echo "[!] Nota: La carpeta 'kernel-source' ya contiene archivos."
    read -p "¿Deseas sobreescribir y descargar de nuevo? (s/N): " choice
    case "$choice" in 
      s|S ) echo "[*] Limpiando contenido anterior..."; rm -rf ./*;;
      * ) echo "[*] Omitiendo descarga. Conservando archivos actuales."; exit 0;;
    esac
fi

echo "[*] Descargando el código fuente del kernel (LineageOS 19.1 - SDM660)..."
curl -L -o kernel.zip https://github.com/LineageOS/android_kernel_xiaomi_sdm660/archive/refs/heads/lineage-19.1.zip

echo "[*] Descomprimiendo archivos..."
unzip -q kernel.zip

echo "[*] Organizando la estructura del proyecto..."
mv android_kernel_xiaomi_sdm660-lineage-19.1/* .
rm -rf android_kernel_xiaomi_sdm660-lineage-19.1 kernel.zip

echo "[✔] ¡Listo! El código fuente del kernel se ha configurado correctamente en su lugar."
