#!/bin/bash

# Script para instalar Prometheus localmente

# Actualizar los repositorios del sistema
apt update
apt upgrade -y

# Instalar Prometheus
apt install prometheus -y

# Habilitar e iniciar el servicio de Prometheus
systemctl enable prometheus
systemctl start prometheus

# Verificar la instalación
systemctl status prometheus

echo "¡Instalación de Prometheus completada! Accede a la interfaz web en http://localhost:9090"
