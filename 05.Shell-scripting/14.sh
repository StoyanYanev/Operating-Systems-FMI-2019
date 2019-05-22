#Напишете shell script, който автоматично да попълва файла 
#указател от предната задача по подадени аргументи: име на файла указател, 
#пълно име на човека (това, което очакваме да е в /etc/passwd) и избран за него nickname.
#Файлът указател нека да е във формат:
#<nickname, който лесно да запомните> <username в os-server>

#***Бонус: Ако има няколко съвпадения за въведеното име (напр. има 10 човека Ivan Petrov в /etc/passwd), 
#всички те да се показват на потребителя, заедно с пореден номер >=1,
#след което той да може да въведе някой от номерата (или 0 ако не си хареса никого), 
#и само избраният да бъде добавен към указателя.

#!/bin/bash 
read -p "Enter file name: " file_name
read -p "Enter name of the user: " name
read -p "Enter nickname: " nickname
if [[ ! -e "${file_name}" ]]; then
	touch "${file_name}"
fi
if grep -q "${name}" /etc/passwd; then
	username=$(grep -i "${name}" /etc/passwd|cut -d ':' -f1)
	echo ""${nickname}" "${username}"" >> "${file_name}"
else
	echo "User name not exists!"
	exit 1;
fi
#BONUS
read -p "Enter file name: " file_name
read -p "Enter name of the user: " name
read -p "Enter nickname: " nickname
if [[ ! -e "${file_name}" ]]; then
	touch "${file_name}"
fi
numberOfNames=$(egrep -i ":${name}" /etc/passwd|wc -l)
if [[ "${numberOfNames}" -eq 0 ]]; then
	echo "User name not exists!"
	exit 1;
fi
if [[ "${numberOfNames}" -gt 1 ]]; then
	egrep -i ":${name}" /etc/passwd|cut -d ':' -f1,5| cut -d ',' -f1|cat -n
	max_choice=$(egrep -i ":${name}" /etc/passwd|cut -d ':' -f1,5| cut -d ',' -f1|wc -l)
	read -p "Choice: " choice
	if [[ "${choice}" -gt 0 && "${choice}" -le "${max_choice}" ]]; then
		username=$(egrep -i ":${name}" /etc/passwd|cut -d ':' -f1|head -n $choice|tail -n1)
		echo ""${nickname}" "${username}"" >> "${file_name}"
	
	elif [[ "${choice}" -gt "${max_choice}" ]]; then
		echo "Invalid choice!"
	fi
else
	username=$(grep -i "${name}" /etc/passwd|cut -d ':' -f1)
	echo ""${nickname}" "${username}"" >> "${file_name}"
fi
