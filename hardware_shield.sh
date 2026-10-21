#!/bin/bash

# ==============================================================================
# Script de Blindaje de Hardware y Permisos (/dev/)
# Proyecto: CustomKernel_Lavender
# ==============================================================================

LOG_FILE="/root/CustomKernel_Lavender/hardware_audit.log"

echo "[*] Iniciando protocolo de blindaje de hardware..." | tee -a "$LOG_FILE"

# 1. Asegurar que los permisos base de rutas críticas estén restringidos
# Restringimos el acceso público a nodos sensibles del sistema
if [ -d "/dev" ]; then
    echo "[*] Aplicando restricciones de permisos en nodos de dispositivos..." | tee -a "$LOG_FILE"
    
    # Ejemplo de endurecimiento en directorios de control de energía e interfaces críticas
    # Evitamos que procesos sin privilegios manipulen directamente entradas de bajo nivel
    chmod 750 /dev/input/* 2>/dev/null || true
    
    echo "[✔] Permisos de nodos ajustados correctamente." | tee -a "$LOG_FILE"
else
    echo "[!] Advertencia: El directorio /dev no está accesible o el entorno difiere." | tee -a "$LOG_FILE"
fi

echo "[✔] Blindaje de hardware completado de forma segura." | tee -a "$LOG_FILE"
