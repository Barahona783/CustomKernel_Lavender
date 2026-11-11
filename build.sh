#!/bin/bash
# ==========================================
# Script de Compilación Maestro Blindado - Lavender
# ==========================================

set -e

echo "[*] Cargando entorno de compilación seguro para Redmi Note 7..."

# Definir rutas absolutas y relativas de forma estricta
ROOT_DIR="$(pwd)"
KERNEL_DIR="$ROOT_DIR/kernel-source"
CONFIG_DIR="$ROOT_DIR/configs"
OUTPUT_DIR="$ROOT_DIR/output"

# 1. Verificar que la carpeta del kernel exista y no esté vacía
if [ ! -d "$KERNEL_DIR" ] || [ -z "$(ls -A "$KERNEL_DIR" 2>/dev/null)" ]; then
    echo "[!] Error Crítico: La carpeta 'kernel-source/' no existe o está vacía."
    echo "[!] Ejecuta primero el script de configuración para descargar el árbol de fuentes."
    exit 1
fi

# Asegurar que el directorio de salida exista
mkdir -p "$OUTPUT_DIR"

# 2. Entrar al directorio del código fuente
cd "$KERNEL_DIR"

# 3. Configurar arquitectura obligatoria para Snapdragon (ARM64)
export ARCH=arm64
export SUBARCH=arm64
export CROSS_COMPILE="${ROOT_DIR}/tools/aarch64-linux-gnu-/bin/aarch64-linux-gnu-"

echo "[*] Aplicando configuración y preparando el árbol de compilación..."

# Aplicar la configuración si existe en configs/
if [ -f "$CONFIG_DIR/lavender_defconfig" ]; then
    make O="$OUTPUT_DIR" lavender_defconfig
else
    echo "[!] Advertencia: No se encontró 'lavender_defconfig' en $CONFIG_DIR. Usando configuración por defecto del árbol..."
    make O="$OUTPUT_DIR" defconfig
fi

# 4. Compilar usando todos los núcleos disponibles de forma optimizada
echo "[*] Iniciando compilación paralela con $(nproc --all) núcleos..."
make -j$(nproc --all) O="$OUTPUT_DIR"

echo "[✔] ¡Compilación de la base completada con éxito! Los binarios se encuentran en output/"
