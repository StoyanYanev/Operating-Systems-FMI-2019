#Да се напише shell скрипт, който приема два параметъра - име на директория и число. 
#Скриптът да извежда на стандартния изход имената на всички обикновени файлове във директорията, 
#които имат размер, по-голям от подаденото число.

#!/bin/bash
if [[ ! -d "${1}" ]]; then
	echo ""${1}" is not a directory!"
	exit 1;
fi
if [[ ! "${2}" =~ ^[0-9]+$ ]]; then
	echo ""${2}" is not a number!"
	exit 1;
fi
dir="${1}"
size="${2}"
while read file; do
	sizeOfCurrentFile=$(stat -c "%s" "${file}")
	if [[ "${sizeOfCurrentFile}" -ge "${size}" ]]; then 
		echo ""${file}""
	fi
done < <(find "${dir}" -type f)
