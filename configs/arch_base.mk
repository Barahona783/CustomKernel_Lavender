# ==========================================
# Configuración Base de Arquitectura - Lavender
# ==========================================

ARCH ?= arm64
SUBARCH ?= arm64
TARGET_BOARD_PLATFORM := sdm660

# Definición de optimización avanzada para núcleos Kryo (ARM64)
KCFLAGS += -O3 -pipe -fomit-frame-pointer
KCPPFLAGS += -O3 -pipe -fomit-frame-pointer

# Parámetros de seguridad y robustez del compilador base
KBUILD_CFLAGS += -Wno-unused-variable -Wno-unused-function

# Directorios de inclusión primaria
LINUX_INCLUDE := include/
ARCH_INCLUDE := arch/arm64/include/
