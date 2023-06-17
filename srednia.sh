#!/bin/bash
# Ten skrypt liczy średnią z drugiej kolumny pliku CSV,
# eksportowanego przez Microchip MPLAB X IDE.
# Pliki zawierają wartości tablicy, z debugu. 
# Jako argument należy podać nazwę pliku.
# Skrypt jest niedoskonały i niebezpieczny! Zachowaj ostrożność!

# Użyte polecenia z uwzględnieniem parametrów: 
# - cut pozostawia tylko drugą kolumnę pliku CSV,
#   którego kolumny odzielone są przecinkami.
# - sed jest do pozbycia się spacji przed liczbami.
# - paste to coś jak transpozycja macierzy i dodanie "+" pomiędzy słowami
# - bc wykonuje obliczenie, podane jako ciąg znaków.

FILE=$1
LICZBA_WIERSZY=$(wc -l < $FILE)
SUMA=$(cut -d ',' -f 2 $FILE | sed 's/ //g' | paste -sd+ | bc)
SREDNIA=$(echo "$SUMA/$LICZBA_WIERSZY" | bc -l)
echo "średnia z pliku ${FILE} to ${SREDNIA}"