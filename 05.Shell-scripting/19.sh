#Да се напише shell скрипт, който приема файл и директория. 
#Скриптът проверява в подадената директория и нейните под-директории дали съществува копие на 
#подадения файл и отпечатва имената на намерените копия, ако съществуват такива.

#!/bin/bash
if [[ ! -d "${1}" ]]; then
	echo ""${1}" is not a directory!"
	exit 1;
fi
if [[ ! -f "${2}" ]]; then
	echo ""${2}" is not a file!"
	exit 1;
fi
hashSum=$(echo "$(md5sum ${2})"|tr -s ' '|cut -d ' ' -f1)
while read currentFile; do
	currentHash=$(echo "$(md5sum ${currentFile})"|tr -s ' '|cut -d ' ' -f1)
	if [[ $currentHash == $hashSum ]]; then
		echo ${currentFile}
	fi
done < <(find ${1} -mindepth 1 -type f)
