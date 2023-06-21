#!/bin/bash


sudo find /home/pi/Peliculas_Nuevas/ -type d -exec chmod 777 {} +
sudo find /home/pi/Peliculas_Nuevas/ -type f -exec chmod 644 {} +
sudo chown -R pi:pi /home/pi/Peliculas_Nuevas/

sudo find /home/pi/Series_Nuevas/ -type d -exec chmod 777 {} +
sudo find /home/pi/Series_Nuevas/ -type f -exec chmod 644 {} +
sudo chown -R pi:pi /home/pi/Series_Nuevas

sudo find /home/pi/downloads/complete -type d -exec chmod 777 {} +
sudo find /home/pi/downloads/complete -type f -exec chmod 644 {} +
sudo chown -R pi:pi /home/pi/downloads/complete

sudo find /media/DISCO_USB_EXT/Anuncios -type d -exec chmod 777 {} +
sudo find /media/DISCO_USB_EXT/Anuncios -type f -exec chmod 644 {} +
sudo chown -R pi:pi /media/DISCO_USB_EXT/Anuncios

sudo find /media/DISCO_USB_EXT/Conocimiento -type d -exec chmod 777 {} +
sudo find /media/DISCO_USB_EXT/Conocimiento -type f -exec chmod 644 {} +
sudo chown -R pi:pi /media/DISCO_USB_EXT/Conocimiento

sudo find /media/DISCO_USB_EXT/Documentales -type d -exec chmod 777 {} +
sudo find /media/DISCO_USB_EXT/Documentales -type f -exec chmod 644 {} +
sudo chown -R pi:pi /media/DISCO_USB_EXT/Documentales

sudo find /media/DISCO_USB_EXT/Juegos -type d -exec chmod 777 {} +
sudo find /media/DISCO_USB_EXT/Juegos -type f -exec chmod 644 {} +
sudo chown -R pi:pi /media/DISCO_USB_EXT/Juegos

sudo find /media/DISCO_USB_EXT/Musicales -type d -exec chmod 777 {} +
sudo find /media/DISCO_USB_EXT/Musicales -type f -exec chmod 644 {} +
sudo chown -R pi:pi /media/DISCO_USB_EXT/Musicales

sudo find /media/DISCO_USB_EXT/Otros -type d -exec chmod 777 {} +
sudo find /media/DISCO_USB_EXT/Otros -type f -exec chmod 644 {} +
sudo chown -R pi:pi /media/DISCO_USB_EXT/Otros

sudo find /media/DISCO_USB_EXT/P0rn0 -type d -exec chmod 777 {} +
sudo find /media/DISCO_USB_EXT/P0rn0 -type f -exec chmod 644 {} +
sudo chown -R pi:pi /media/DISCO_USB_EXT/P0rn0

sudo find /media/DISCO_USB_EXT/Peliculas -type d -exec chmod 777 {} +
sudo find /media/DISCO_USB_EXT/Peliculas -type f -exec chmod 644 {} +
sudo chown -R pi:pi /media/DISCO_USB_EXT/Peliculas

sudo find /media/DISCO_USB_EXT/Series -type d -exec chmod 777 {} +
sudo find /media/DISCO_USB_EXT/Series -type f -exec chmod 644 {} +
sudo chown -R pi:pi /media/DISCO_USB_EXT/Series

sudo find /media/DISCO_USB_EXT/ZZZ___REVISAR -type d -exec chmod 777 {} +
sudo find /media/DISCO_USB_EXT/ZZZ___REVISAR -type f -exec chmod 644 {} +
sudo chown -R pi:pi /media/DISCO_USB_EXT/ZZZ___REVISAR
