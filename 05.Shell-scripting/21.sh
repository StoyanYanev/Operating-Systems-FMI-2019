#Да се напише shell скрипт, който получава единствен аргумент директория и изтрива 
#всички повтарящи се (по съдържание) файлове в дадената директория. 
#Когато има няколко еднакви файла, да се остави само този, чието име е лексикографски 
#преди имената на останалите дублирани файлове.

#!/bin/bash
if [[ ! -d "${1}" ]]; then
	echo ""${1}" is not a directory!"
	exit 1;
fi
while read file1; do
	currentHasSum=$(md5sum ${file}|cut -d' ' -f1)
	while read file2; do
		hash=$(md5sum ${file2}|cut -d' ' -f1)
		if [[ $currentHasSum == $hash ]]; then
			rm $file2
			echo "1"
		fi 
	done < <(find ${1} -type f|sort|tail -n +2)
done < <(find ${1} -type f|sort)

