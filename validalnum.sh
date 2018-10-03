#!/bin/bash
# Skrypt validalnum sprawdzający, czy wprowadzone dane zawierają wyłącznie litery i cyfry.
validAlphaNum()
{
  # Funkcja sprawdzająca argument. Zwraca 0, jeżeli składa się on z samych
  # wielkich i małych liter oraz cyfr, a 1 w przeciwnym wypadku.
  # Usunięcie wszystkich niedozwolonych znaków.
   validchars="$(echo $1 | sed -e 's/[^[:alnum:]]//g')" 
   if [ "$validchars" = "$1" ] ; then  
    return 0
  else
    return 1
  fi
}
# POCZĄTEK GŁÓWNEJ CZĘŚCI SKRYPTU. USUŃ LUB ZAMIEŃ W KOMENTARZ KOD 
# PONIŻEJ TEGO WIERSZA,
# JEŻELI TEN SKRYPT BĘDZIE WYKORZYSTYWANY W INNYCH SKRYPTACH.
# =================

/bin/echo -n "Podaj dane: "
read input

#sprawdzanie danych

if ! validAlphaNum "$input" ; then
echo "Dane moga zawierac tylko dane badz liczby" >&2

exit 1


else 

echo "Dane poprawne"

fi 

exit 0

#Powyższy algorytm działa poprawnie, ponieważ polecenie sed usuwa z ciągu wszystkie znaki 
#określone za pomocą wyrażenia [:alnum:]. Jest to wyrażenie regularne zgodne ze standardem 
#POSIX, reprezentujące wszystkie znaki alfanumeryczne. Jeżeli przekształcone dane nie są zgodne 
#z oryginalnymi, oznacza to, że we wprowadzonym ciągu znajdują się znaki inne niż alfanumeryczne, 
#a więc wprowadzone dane są błędne. Funkcja zwraca wtedy wartość różną od zera oznaczającą problem. 
#Pamiętaj, że dane mogą zawierać tylko znaki ASCII