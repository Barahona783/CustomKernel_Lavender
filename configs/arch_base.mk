# ==========================================
# Configuración Base de Arquitectura - Lavender
# ==========================================

ARCH ?= arm64
SUBARCH ?= arm64
TARGET_BOARD_PLATFORM := sdm660

# Definición de optimización base para núcleos Kryo
KCFLAGS += -O3 -pipe
KCPPFLAGS += -O3 -pipe

# Directorios de inclusión primaria
LINUX_INCLUDE := include/
ARCH_INCLUDE := arch/arm64/include/
