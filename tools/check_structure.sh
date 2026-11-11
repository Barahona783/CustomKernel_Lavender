#!/bin/bash
# ==========================================
# Verificador de Estructura Mejorado - CustomKernel
# ==========================================

echo "Verificando integridad del proyecto para Lavender..."

# Validar directorios y archivos esenciales
REQUIRED_DIRS=("configs" "tools" "output" "kernel-source")
MISSING=0

for dir in "${REQUIRED_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "[!] Advertencia: Falta el directorio requerido: $dir"
        # Creamos automáticamente el directorio si no existe para prevenir errores
        mkdir -p "$dir"
        echo "[+] Directorio $dir creado automáticamente."
    fi
done

if [ -f "Makefile" ] && [ -f "arch_base.mk" ]; then
    echo "¡Estructura base correcta! Los archivos de arquitectura y makefiles están listos."
else
    echo "[!] Advertencia: Faltan archivos clave de arquitectura en la raíz."
fi
