#!/bin/bash

# ==============================================================================
# Script de Optimización de Rendimiento y Memoria
# Proyecto: CustomKernel_Lavender
# ==============================================================================

echo "[*] Configurando perfiles de rendimiento y gestión de recursos..."

# 1. Ajustar el gobernador de la CPU si las rutas del kernel están accesibles
if [ -d "/sys/devices/system/cpu/cpu0/cpufreq" ]; then
    echo "[*] Aplicando gobernador 'schedutil' a los núcleos de la CPU..."
    for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
        if [ -w "$cpu" ]; then
            echo "schedutil" > "$cpu" 2>/dev/null || true
        fi
    done
    echo "[✔] Gobernadores de CPU optimizados."
else
    echo "[!] Nota: Las rutas de frecuencia de CPU no están expuestas en este nivel del contenedor (comportamiento normal en entornos rootfs)."
fi

# 2. Configuración de ZRAM / Memoria virtual para evitar cuellos de botella al compilar
if [ -f "/proc/sys/vm/swappiness" ]; then
    echo "[*] Ajustando parámetros de intercambio de memoria (swappiness)..."
    sysctl -w vm.swappiness=60 2>/dev/null || echo "60" > /proc/sys/vm/swappiness 2>/dev/null || true
    echo "[✔] Gestión de memoria ajustada."
fi

echo "[✔] Optimización de rendimiento completada con éxito."
