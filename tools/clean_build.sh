#!/bin/bash
# ==========================================
# Script de Limpieza - CustomKernel Lavender
# ==========================================

echo "Limpiando archivos temporales y objetos previos..."

# Limpiar archivos de compilación en el árbol de fuentes
find . -type f \( -name "*.o" -o -name "*.ko" -o -name "*.cmd" -o -name "*.d" \) -delete

# Limpiar la carpeta de salida
rm -rf output/*

echo "¡Limpieza completada con éxito! El entorno está listo."
