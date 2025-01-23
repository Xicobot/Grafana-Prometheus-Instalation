#!/bin/bash

# Script para instalar Prometheus localmente

# Actualizar los repositorios del sistema
sudo apt update
sudo apt upgrade -y

# Instalar Prometheus
sudo apt install prometheus -y

# Habilitar e iniciar el servicio de Prometheus
sudo systemctl enable prometheus
sudo systemctl start prometheus

# Verificar la instalación
sudo systemctl status prometheus

echo "¡Instalación de Prometheus completada! Accede a la interfaz web en http://localhost:9090"
