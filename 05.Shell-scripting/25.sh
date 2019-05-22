#Да се напише shell скрипт, който приема произволен брой аргументи - имена на файлове или директории. 
#Скриптът да извежда за всеки аргумент подходящо съобщение:
	#- дали е файл, който може да прочетем
	#- ако е директория - имената на файловете в нея, които имат размер, по-малък от броя на файловете в директорията.

#!/bin/bash
for file in "$@"; do
	if [[ -f $file ]]; then
	 	echo -n "It is a file "
		if [[ -r $file ]];then
			echo "and we can read it!"
		else
			echo "but we can not read it!"		
		fi	
	fi
	if [[ -d $file ]]; then
		echo "It is a directory "
		numberOfFiles=$(find $file -type f|wc -l)
		while read line; do
			sizeOfCurrentFile=$(stat -c "%s" "${file}")
			if [[ "${sizeOfCurrentFile}" -le "${numberOfFiles}" ]]; then 
				echo ""${file}""
			fi
		done < <(find $file -type f)
	fi
done
