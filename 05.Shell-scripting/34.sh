#Този път програмата ви ще приема само един параметър, който е измежду ("-r", "-b", "-g", "-x").
#Напишете shell script, който приема редовете от stdin и ги изпринтва всеки ред с редуващ се цвят. 
#Цветовете вървят RED-GREEN-BLUE и цветът на първия ред се определя от аргумента.
#Ако е подаден аргумент "-x", то не трябва да променяте цветовете в терминала 
#(т.е., все едно сте извикали командата cat).

#!/bin/bash
if [[ -z "${1}" ]]; then
	echo "No argument supplied!"
	exit 1;
fi
color="${1}"
while read line; do
case $color in
-r)
	echo -e "\033[0;31m $line"
	read line
	echo -e "\033[0;32m $line"
	read line
	echo -e "\033[0;34m $line"
;;
-g)
	echo -e "\033[0;32m $line"
	read line
	echo -e "\033[0;31m $line"
	read line
	echo -e "\033[0;34m $line"
;;
-b)
	echo -e "\033[0;34m $line"
	read line
	echo -e "\033[0;31m $line"
	read line
	echo -e "\033[0;32m $line"
;;
-x)
	echo "$line"
;;
*)
	echo "Unknown color"
	exit 2;
esac
done
echo "\033[0m"
echo "\033[0m"
