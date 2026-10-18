#!/bin/bash
# ==========================================
# Script de Compilación Maestro - Lavender
# ==========================================

set -e

echo "Cargando entorno de compilación para Redmi Note 7..."

# Configurar arquitectura obligatoria para Snapdragon (ARM64)
export ARCH=arm64
export SUBARCH=arm64

echo "Lanzando el Makefile principal..."
make -j$(nproc --all)

echo "¡Estructura base procesada con éxito!"
