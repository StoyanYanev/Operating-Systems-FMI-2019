#Напишете shell script, който по подаден като аргумент файл с map между 
#<nickname> -> <реален username в os-server> и nickname, ще ви улесни да изпращате съобщения на хората.
#!/bin/bash
addresBook=$1
nickname=$2
if [[ ! -r "${addresBook}" ]]; then
	echo "Error! File "${addresBook}" is not a readable!"
	exit 1;
fi
target_user=$(cat "${addresBook}"|egrep "{$nickname}"|cut -d ' ' -f2)
if [[ -z "{$target_user}" ]]; then
	echo "User with nickname "${target_user}" can not be found in "${addresBook}""
	exit 1;
fi
read -p "Enter message: " message
echo "Sending message to "${target_user}""
write "${target_user}" "${message}"
