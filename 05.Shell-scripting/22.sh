#Да се напише shell скрипт, който получава единствен аргумент директория 
#и отпечатва списък с всички файлове и директории в нея (без скритите).
#До името на всеки файл да седи размера му в байтове, а до името на всяка директория да седи 
#броят на елементите в нея (общ брой на файловете и директориите, без скритите).

#a) Добавете параметър -a, който указва на скрипта да проверява и скритите файлове и директории.

#!/bin/bash
if [[ ! -d "${1}" ]]; then
	echo ""${1}" is not a directory!"
	exit 1;
fi
while read line ;do
	if [[ $line =~ ^d+ ]]; then
		dir=$(echo "$line"|cut -d ' ' -f9)
		numberOfElements=$(ls -a ${1}/$dir|wc -l)
		echo "$dir $numberOfElements"
	fi
	if [[ $line =~ ^-+ ]]; then
		file=$(echo "$line"|cut -d' ' -f9)
		fileSize=$(echo "$line"|cut -d' ' -f5)
		echo "$file $fileSize"
	fi
done < <(ls -la ${1}|tr -s ' '|tail -n +2)
