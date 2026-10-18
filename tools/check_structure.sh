#!/bin/bash
# ==========================================
# Verificador de Estructura - CustomKernel
# ==========================================

echo "Verificando integridad del proyecto para Lavender..."

if [ -f "Makefile" ] && [ -d "configs" ] && [ -d "tools" ] && [ -d "output" ]; then
    echo "¡Estructura base correcta! Todos los directorios y archivos esenciales están presentes."
else
    echo "Advertencia: Falta algún componente en la estructura principal."
fi
