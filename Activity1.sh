#!/bin/bash

# Capturar la salida de 'top' en modo batch (solo las primeras 10 líneas)
output=$(top -b -n 1 | head -10)

# Extraer las columnas que contienen información sobre el uso de CPU, memoria y disco
# Nota: Aquí asumimos que los campos $9 y $10 corresponden a CPU y memoria, según el formato de 'top'.
cpu_usage=$(echo "$output" | awk '/^%Cpu/ {print $2}')
memory_usage=$(echo "$output" | awk '/^MiB Mem/ {print $8}')

# Mostrar el uso de CPU y memoria
echo "CPU Usage: $cpu_usage%"
echo "Memory Usage: $memory_usage MiB"

memory_usage_calculated=$(echo "$memory_usage + 0" | bc -l)
if (( $(echo "$memory_usage_calculated > 2000" | bc -l) )); then
  echo "Estás usando mucha RAM :("
elif (( $(echo "$memory_usage_calculated < 1000" | bc -l) )); then
  echo "Estás usando poca RAM :)"
fi

cpu_usage_calculated=$(echo "$cpu_usage + 0" | bc -l)
if (( $(echo "$cpu_usage_calculated > 7" | bc -l) )); then
  echo "Estás usando una BANDA de Cpu :O"
elif (( $(echo "$cpu_usage_calculated < 1000" | bc -l) )); then
  echo "Estás usando poca Cpu :)"
fi



