#recorre los ficheros de video de la ruta dada como parametro, mostrando en rojo aquellos de menos de 720p

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#Queremos capturar y definir que hacer cuando se pulsa Ctrl+C
trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColour}[!] Saliendo...\n"
        tput cnorm; exit 1 #que vuelva a mostrar el cursor y marcamos que el programa termino anormalmente
}

function path(){
    local path_escanear=$1 #el path a escanear será el primer parametro recibido
    cd $path_escanear #nos posicionamos en dicho path

    #guardo en el array lista todos los ficheros de video encontrados en ese path
    readarray -d '' lista < <(find -type f \( -name "*mp4" -o -name "*mkv" -o -name "*ogg" -o -name "*.mpg" -o -name "*.mpeg" -o -name "*.avi" -o -name "*.flv" -o -name "*.AVI" -o -name "*.divx" -o -name "*.m4v" -o -name "*.ogm" \)  -size +1M -print0 | sort -z) 

    for f in "${lista[@]}"; do #recorro los ficheros uno a uno

        dimensiones=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$f") #devuelve las dimensiones del archivo
        ancho_video=$(echo $dimensiones | cut -d 'x' -f 1) #con 2 en lugar de 1 sacaria el alto del video
        tamanioMB=$(du -m "$f" | awk '{print $1}')

        if [ "$ancho_video" -lt 1200 ]; #si no es un video en HD mostrar las dimensiones
        then
            echo -e "${redColour}$dimensiones" "$tamanioMB MB" "$f${endColour}"
            #lista_archivos_pequenios+=("\n$dimensiones $tamanioMB MB $f") #lista de videos pequeños, sus dimensiones y tamaño
        else
            echo -e "${greenColour}$dimensiones" "$tamanioMB MB" "$f${endColour}"
        fi
    done

    #echo -e "\n${yellowColour} Archivos pequeños en $path_escanear\n${lista_archivos_pequenios[@]}${endColour}"
}


#Ayuda del programa
function helpPanel(){
        echo -e "\n${redColour}[!] Uso: ./script <path_a_escanear>${endColour}"
        for i in $(seq 1 80); do echo -ne "${redColour}-"; done; echo -ne "${endColour}" #dibujar 80 guiones '-'
        echo -e "\n\t${grayColour}[-help]${endColour}${yellowColour} Mostrar este panel de ayuda${endColour}\n"
        tput cnorm; exit 1 #que vuelva a mostrar el cursor y marcamos que el programa termino anormalmente
}


#Gestion de los parametros
if [ "$#" -ne 1 ]; then #si no hay argumentos que muestre la ayuda
        helpPanel
fi
if [ "$1" = "help" ]; then #que muestre la ayuda
        helpPanel
else
        path $1
fi