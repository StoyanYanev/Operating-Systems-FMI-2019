#Да се напише shell скрипт, който проверява дали подаденият му параметър се състои само от букви и цифри.
#!/bin/bash
read -p "Enter some text: " input
if [[ ! "${input}" ]]; then
	echo "Missing arguments!"
	exit 1
fi
if [[ ! "${input}" =~ [^a-zA-Z0-9]+ ]]; then
echo "The text contains only letters or digits!"
else
echo "The text not contains only letters or digits!"
fi
