# ==========================================
# Parámetros de Optimización y Rendimiento - Lavender
# ==========================================

# Opciones de rendimiento para procesadores de 8 núcleos (Kryo)
CONFIG_SCHED_SMT=n
CONFIG_PREEMPT=y

# Gestión de energía y perfiles de frecuencia
CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
CONFIG_CPU_IDLE=y

# Parámetros de gestión de memoria limpia
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SWAP=y
