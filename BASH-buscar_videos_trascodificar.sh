#@Sergio Alegre a Mayo de 2023
#Este script busca en el path dado como parametro de manera recursiva, archivos de videos que no sean h264 ni h265

#algunos comandos de ayuda:
#buscar todas las extensiones de ficheros en el directorio actual
#find -type f | sed -rn 's|.*/[^/]+\.([^/.]+)$|\1|p' | sort -u

#buscar todos los fichero de video recursivamente en el directorio actual
#find -type f \( -name "*mp4" -o -name "*mkv" -o -name "*ogg" -o -name "*.mpg" -o -name "*.mpeg" -o -name "*.avi" -o -name "*.flv" -o -name "*.AVI" -o -name "*.divx" -o -name "*.m4v" -o -name "*.ogm" \)



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
    readarray -d '' lista < <(find -type f \( -name "*mp4" -o -name "*mkv" -o -name "*ogg" -o -name "*.mpg" -o -name "*.mpeg" -o -name "*.avi" -o -name "*.flv" -o -name "*.AVI" -o -name "*.divx" -o -name "*.m4v" -o -name "*.ogm" \) -pri$
    for f in "${lista[@]}"; do #recorro los ficheros uno a uno
        codec=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "$f") #devuelve el codel del archivo
        if [[ "${codec}" != 'h264' && "${codec}" != 'hevc' ]] #si no es h264 o h265
        then
            echo -e ${redColour}$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "$f") "   " $(du -h "$f" |cut -f -1) "   " "$f"
            echo -ne "${endColour}"
            lista_corregir+=("\n$f") #lista de videos que hay que trascodificar
        else #si es h264 o h265
            echo -e ${greenColour}$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "$f") "   " $(du -h "$f" |cut -f -1) "   " "$f"
            echo -ne "${endColour}"
        fi
    done

    echo -e "\n${yellowColour} Videos a trascodificar en $path_escanear\n${lista_corregir[@]}${endColour}"
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
