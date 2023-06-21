#!/bin/bash

# Directorio en el que se buscarán los archivos
directorio="/media/DISCO_USB_EXT/_Varios_Backup/"

# Calcula la fecha actual hace dos meses
fecha_limite=$(date -d '2 months ago' +%s)

# Patrón de nombre de archivo a buscar
patron="*Inventario*"
patron2="*crontab*"


# Purgar Inventario de Peliculas y Series
for archivo in "$directorio"/$patron; do
  # Comprueba si el archivo cumple con la condición de tiempo
  if [ -f "$archivo" ] && [ $(stat -c %Y "$archivo") -lt "$fecha_limite" ]; then
    rm "$archivo"
  fi
done

# Purgar los crontab
for archivo in "$directorio"/$patron2; do
  # Comprueba si el archivo cumple con la condición de tiempo
  if [ -f "$archivo" ] && [ $(stat -c %Y "$archivo") -lt "$fecha_limite" ]; then
    rm "$archivo"
  fi
done

