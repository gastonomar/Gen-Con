#!/data/data/com.termux/files/usr/bin/bash

# Listas de nombres latinos comunes
nombres=("Carlos" "María" "Juan" "Ana" "Pedro" "Lucía" "Luis" "Sofía" "Raul" "Ramirez" "José" "Valentina" "Miguel" "Camila" "Diego" "Isabella")

echo -e "\e[35mGENERADOR DE CONTRASEÑAS\e[0m"
echo ""
echo "1. Nombres"
echo "2. Números"
read -p "Elige una opción (1/2): " opcion
echo ""
read -p "¿Cuántas contraseñas quieres generar?: " cantidad
echo ""

contrasenas=()

if [[ "$opcion" == "1" ]]; then
    for ((i=0; i<cantidad; i++)); do
        nombre1=${nombres[$RANDOM % ${#nombres[@]}]}
        nombre2=${nombres[$RANDOM % ${#nombres[@]}]}
        contrasena="${nombre1}${nombre2}"
        echo "$contrasena"
        contrasenas+=("$contrasena")
    done
elif [[ "$opcion" == "2" ]]; then
    for ((i=0; i<cantidad; i++)); do
        numero=$(shuf -i 1000000000-9999999999 -n 1)
        echo "$numero"
        contrasenas+=("$numero")
    done
else
    echo "Opción no válida."
    exit 1
fi

echo ""
read -p "¿Deseas guardar las contraseñas en la tarjeta sdcard? (s/n): " guardar

if [[ "$guardar" == "s" || "$guardar" == "S" ]]; then
    ruta="/sdcard/contrasenas_generadas.txt"
    for item in "${contrasenas[@]}"; do
        echo "$item" >> "$ruta"
    done
    echo "Contraseñas guardadas en: $ruta"
else
    echo "No se guardaron las contraseñas."
fi
