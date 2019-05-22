#Да се напише shell скрипт, който приканва потребителя да въведе низ - потребителско име 
#на потребител от системата - след което извежда на стандартния изход колко пъти потребителят се е логнал.
#!/bin/bash
read -p "Enter username from system: " name
user=$(cat /etc/passwd| cut -d: -f1 |egrep "^${name}\$")
if [[ -z "${user}" ]]; then
	echo "User not exist in the system!"
	exit 1;
fi
user_logged_count=$(last ${user}|head -n -2|wc -l) 
echo "User $user logged $user_logged_count times"
