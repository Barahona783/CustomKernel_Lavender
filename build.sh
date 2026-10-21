#!/bin/bash
# ==========================================
# Script de Compilación Maestro - Lavender
# ==========================================

set -e

echo "Cargando entorno de compilación para Redmi Note 7..."

# Definir rutas relativas basadas en la estructura limpia
ROOT_DIR="$(pwd)"
KERNEL_DIR="$ROOT_DIR/kernel_source"
CONFIG_DIR="$ROOT_DIR/configs"

# 1. Verificar que la carpeta del kernel no esté vacía
if [ ! -d "$KERNEL_DIR" ] || [ -z "$(ls -A "$KERNEL_DIR")" ]; then
    echo "[!] Error: La carpeta 'kernel_source/' está vacía."
    echo "[!] Asegúrate de colocar o descargar el código fuente del kernel allí antes de compilar."
    exit 1
fi

# 2. Entrar a la carpeta donde reside el código fuente y el Makefile real
cd "$KERNEL_DIR"

# 3. Configurar arquitectura obligatoria para Snapdragon (ARM64)
export ARCH=arm64
export SUBARCH=arm64

echo "Aplicando configuración y lanzando el Makefile principal..."

# Aplicar la configuración si la tienes guardada en configs/
if [ -f "$CONFIG_DIR/lavender_defconfig" ]; then
    make O=out lavender_defconfig
fi

# 4. Compilar usando todos los núcleos disponibles de forma optimizada
make -j$(nproc --all) O=out

echo "¡Estructura base procesada y compilada con éxito!"
