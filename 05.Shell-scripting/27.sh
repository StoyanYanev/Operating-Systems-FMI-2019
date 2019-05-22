#Да се напише shell скрипт, който приема параметър - име на потребител. 
#Скриптът да прекратява изпълненито на всички текущо работещи процеси на 
#дадения потребител, и да извежда колко са били те.

#!/bin/bash
if [[ -z "${1}" ]];then
	echo "No argument supplied!"
fi
username="${1}"
numberOfProcess=$(ps -U $username|tail -n +2|wc -l)
echo "$username has $numberOfProcess number of process startes!"
while read line; do
	kill $line
done < <(ps -U $username|cut -d ' ' -f2)
