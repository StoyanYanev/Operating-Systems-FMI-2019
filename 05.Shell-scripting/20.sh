#Да се напише shell script, който генерира HTML таблица със студентите в os-server. 
#Таблицата трябва да има:
#- колони за факултетен номер, име, фамилия, специалност, курс и група
#- заглавен ред с имената нa колоните

#!/bin/bash
echo "<table>"
echo " <tr>"
echo "  <th>FN</th>"
echo "  <th>Firstname</th>"
echo "  <th>Lastname</th>"
echo "  <th>Specialty</th>"
echo "  <th>Course</th>"
echo "  <th>Group</th>"
echo " </tr>"
while read line; do
	echo " <tr>"
	echo "  <td>$(echo "$line"|cut -d":" -f1|cut -c 2-6)</td>" #fn
	echo "  <td>$(echo "$line"|cut -d":" -f5|cut -d" " -f1)</td>" #firstName
	echo "  <td>$(echo "$line"|cut -d":" -f5|cut -d" " -f2)</td>" #lastName
	
	#specialty
	if [[ $line =~ SI* ]]; then
		echo "  <td>SI</td>"
	else 
		echo "  <td>KN</td>"
	fi

	#course and group
	if [[ $line =~ [0-9], || $line =~ [0-9][a-z]+, ]]; then
		echo "  <td>$(echo "$line"|cut -d":" -f5|cut -d"," -f3|cut -c 2)</td>"
		echo "  <td>$(echo "$line"|cut -d":" -f5|cut -d"," -f4|cut -c 2)</td>"
	else
		echo "  <td></td>"
		echo "  <td></td>"
	fi
	echo " </tr>"
done < <(cat /etc/passwd|egrep "^s[0-9]+:*")
echo "<table>"
