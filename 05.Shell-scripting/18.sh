#Да се напише shell скрипт, който форматира големи числа, за да са по-лесни за четене.
#Като пръв аргумент на скрипта се подава цяло число.
#Като втори незадължителен аргумент се подава разделител. 
#По подразбиране цифрите се разделят с празен интервал.

#!/bin/bash
if [[ ! "${1}" ]];then
	echo "Missing arguments!"
	exit 1;
fi
if [[ ! "${1}" =~ ^[[0-9]|-]+$ ]];then
	echo "The number is not integer!"
	exit 1;
fi
number="${1}"
delimiter=" "
if [[ "${2}" ]];then
	delimiter="${2}"
fi
sizeOfNumber="${#1}" # or "${1}"|wl -c
if [[ $(($sizeOfNumber % 3)) -ge 2 ]]; then
	first_digits=${number:0:2}
	echo -n "$first_digits$delimiter"
	sizeOfNumber=$(($sizeOfNumber - 2))
elif [[ $(($sizeOfNumber % 3)) -ge 1 ]]; then
	first_digit=${number:0:1}
	echo -n "$first_digit$delimiter"
	sizeOfNumber=$(($sizeOfNumber - 1))
fi
number=${number:(-$sizeOfNumber)}
while [[ $sizeOfNumber -gt 0 ]]; do

	first_digit=${number:0:3}
	if [[ $(($sizeOfNumber - 3)) -le 0 ]]; then
		echo -n "$first_digit"
	else
		echo -n "$first_digit$delimiter"
	fi
	sizeOfNumber=$(($sizeOfNumber - 3))
	number=${number:(-$sizeOfNumber)}
done
