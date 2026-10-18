# ==========================================
# Makefile Maestro - CustomKernel Lavender
# ==========================================

VERSION = 4
PATCHLEVEL = 4
SUBLEVEL = 153
EXTRAVERSION = -custom-lavender

# Definir herramientas de compilación base para ARM64
CROSS_COMPILE ?= aarch64-linux-gnu-
HOSTCC  = gcc
HOSTCXX = g++

export VERSION PATCHLEVEL SUBLEVEL EXTRAVERSION CROSS_COMPILE HOSTCC HOSTCXX

# Regla principal por defecto
all:
	@echo "Construyendo base del kernel para Redmi Note 7 (Lavender)..."
	@echo "Arquitectura objetivo: arm64 (SDM660)"
