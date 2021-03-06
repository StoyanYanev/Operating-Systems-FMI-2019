#(Цветно принтиране) Напишете shell script color_print, който взима два параметъра.

#Първият може да е измежду "-r", "-g" "-b", а вторият е произволен string.
#На командата "echo" може да се подаде код на цвят, който ще оцвети текста в определения цвят.
#В зависимост от първия аргумент, изпринтете втория аргумен в определения цвят:
#Ако е подадена друга буква изпишете "Unknown colour", а ако изобщо не е подаден 
#аргумент за цвят, просто изпишете текста.

#!/bin/bash
if [[ -z "${1}" ]]; then
	echo ""${1}""
	exit 1;
fi
case "${1}" in
-r)
	echo -e "\033[0;31m $2"
;;
-g)
	echo -e "\033[0;32m $2"
;;
-b)
	echo -e "\033[0;34m $2"
;;
*)
	echo "Unknown color"
	exit 2;
esac
echo "\033[0m"
