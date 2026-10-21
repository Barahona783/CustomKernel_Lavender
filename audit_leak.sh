#!/bin/bash

# ==============================================================================
# Script de Auditoría y Detección de Conexiones / Procesos Ocultos
# Proyecto: CustomKernel_Lavender
# ==============================================================================

AUDIT_LOG="/root/CustomKernel_Lavender/audit_leak.log"

echo "==================================================" >> "$AUDIT_LOG"
echo "[*] Auditoría de seguridad ejecutada: $(date)" >> "$AUDIT_LOG"
echo "==================================================" >> "$AUDIT_LOG"

# 1. Verificar conexiones de red activas y sockets para detectar telemetría o salidas no deseadas
if command -v ss &> /dev/null; then
    echo "[*] Inspeccionando sockets de red activos (ss):" | tee -a "$AUDIT_LOG"
    ss -tunp 2>/dev/null | tee -a "$AUDIT_LOG"
elif command -v netstat &> /dev/null; then
    echo "[*] Inspeccionando sockets de red activos (netstat):" | tee -a "$AUDIT_LOG"
    netstat -anp 2>/dev/null | tee -a "$AUDIT_LOG"
else
    echo "[!] Nota: Herramientas de red avanzadas no disponibles en este entorno mínimo." | tee -a "$AUDIT_LOG"
fi

# 2. Listar procesos activos para análisis de comportamiento
echo "[*] Listando procesos en ejecución:" | tee -a "$AUDIT_LOG"
ps aux 2>/dev/null | tee -a "$AUDIT_LOG"

echo "[✔] Auditoría finalizada. Resultados guardados de forma segura en: $AUDIT_LOG"
