#!/bin/bash
# ==========================================
# Script de Limpieza Blindado - CustomKernel Lavender
# ==========================================

echo "[*] Iniciando purga segura de archivos temporales..."

# 1. Limpiar archivos objeto, módulos y dependencias de compilación de forma segura
find . -type f \( -name "*.o" -o -name "*.ko" -o -name "*.cmd" -o -name "*.d" -o -name "*.su" \) -delete

# 2. Limpiar rastros temporales del kernel si existen
find . -type d -name ".*.cmd" -exec rm -rf {} + 2>/dev/null || true

# 3. Limpiar la carpeta de salida de compilación de forma controlada
if [ -d "output" ]; then
    rm -rf output/*
    echo "[✔] Carpeta 'output/' limpiada con éxito."
else
    echo "[!] La carpeta 'output/' no existía, omitiendo..."
fi

echo "[✔] ¡Limpieza completada! El entorno de la base está impecable y libre de basura."
