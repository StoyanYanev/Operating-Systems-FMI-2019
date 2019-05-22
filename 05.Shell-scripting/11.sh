#Да се напише shell скрипт, който чете от стандартния вход име на файл и символен низ, 
#проверява дали низа се съдържа във файла и извежда на стандартния изход кода на завършване на командата.
#!/bin/bash
read -p "Enter text file: " file 
read -p "Enter string to search: " string
if [[ ! -f "${file}" ]]; then
	echo ""${file}" is not exsist!"
	exit 1;
fi
exit_code=$(grep -q "${string}" "${file}" ; echo $?)
echo "${exit_code}"
