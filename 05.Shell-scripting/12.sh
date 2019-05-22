#Имате компилируем (a.k.a няма синтактични грешки) source file на езика C. 
#Напишете shell script, който да покзва колко е дълбоко най-дълбокото nest-ване (влагане). 
#По-лесно ли щеше да е за файл с Python код?
#!/bin/bash
currentCount=0
maxCount=-1
read file
if [[ ! -r "${file}" ]]; then
	echo "Error! File "${file}" is not a readable!"
	exit 1;
fi
if [[ "${file:-2}" == ".c" ]]; then
	echo "Error! File "${file}" has not .c extension!"
	exit 1;
fi
while read line;do
        if [[ "${line}" == "{" ]];then
                currentCount=$(($currentCount + 1))
        else
                currentCount=$(($currentCount - 1))
        fi

        if [[ "${currentCount}" -ge "${maxCount}" ]]; then
                maxCount="${currentCount}"
        fi

done < <(grep -o "[{}]" "${file}")
echo "${maxCount}"
