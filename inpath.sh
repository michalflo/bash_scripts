#!/bin/bash
# Skrypt inpath sprawdzający, czy dany program jest poprawny sam w sobie,
# czy też znajduje się w katalogach zapisanych w zmiennej PATH.
in_path()
{
   # Funkcja usiłująca odnaleźć program na podstawie jego nazwy i zmiennej PATH. 
   # Zwraca 0, jeżeli program istnieje i jest plikiem wykonywalnym, albo 1 w przeciwnym wypadku.
   # Zwróć uwagę, że tymczasowo zmieniany jest separator IFS, ale jego pierwotna wartość jest 
   # przywracana na końcu funkcji.
  cmd=$1       
  ourpath=$2         
  result=1
   
   oldIFS=$IFS   
   IFS=":"


   for directory in "$ourpath"
   do
     if [ -x $directory/$cmd ] ; 
     
     then
       
       result=0      # Dojście do tego miejsca oznacza, że program $cmd znajduje się 
                     # w katalogu $directory.
     fi
   done
   IFS=$oldIFS
   return $result
 }
 checkForCmdInPath()
 {
   var=$1
   if [ "$var" != "" ] ; then
      if [ "${var:0:1}" = "/" ] ; then
        if [ ! -x $var ] ; then       
         return 1
       fi
      elif !  
      in_path $var "$PATH" ; then
       return 2
     fi
   fi
}

if [ $# -ne 1 ] ; then
  echo "Użycie: $0 polecenie" >&2 ; exit 1
fi
checkForCmdInPath "$1"
case $? in

  0 ) echo "$1 znajduje się w katalogach zmiennej PATH."         ;;
  1 ) echo "$1 nie istnieje i nie jest to plik wykonywalny."     ;;
  2 ) echo "$1 nie znajduje się w katalogach zmiennej PATH."     ;;
esac
exit 0
