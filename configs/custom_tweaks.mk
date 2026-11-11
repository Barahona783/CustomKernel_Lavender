# ==========================================
# Parámetros de Optimización y Rendimiento - Lavender
# ==========================================

# Opciones de rendimiento para procesadores de 8 núcleos (Kryo)
CONFIG_SCHED_SMT=n
CONFIG_PREEMPT=y
CONFIG_SCHED_AUTOGROUP=y

# Gestión de energía y perfiles de frecuencia
CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
CONFIG_CPU_IDLE=y
CONFIG_ENERGY_MODEL=y

# Parámetros de gestión de memoria y rendimiento de E/S
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SWAP=y
CONFIG_ZRAM=y
CONFIG_DEFAULT_CFQ=y
