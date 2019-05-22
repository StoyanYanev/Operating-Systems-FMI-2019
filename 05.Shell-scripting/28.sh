#Да се напише shell скрипт, който приема два параметъра - име на директория и число. 
#Скриптът да извежда сумата от размерите на файловете в директорията, които имат размер, 
#по-голям от подаденото число.

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
sum=0
while read file; do
	sizeOfCurrentFile=$(stat -c "%s" "${file}")
	if [[ "${sizeOfCurrentFile}" -ge "${size}" ]]; then 
		sum=$(($sum + $sizeOfCurrentFile))
	fi
done < <(find "${dir}" -type f)
echo "The sum of the sizes is "${sum}""
