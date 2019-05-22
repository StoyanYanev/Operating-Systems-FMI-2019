#Да се напише shell скрипт, който приканва потребителя да въведе пълното име на 
#директория и извежда на стандартния изход подходящо съобщение за броя на всички файлове и директории в нея.
#!/bin/bash
read -p "Enter directory name: " dirName
if [[ ! -d "${dirName}" ]]; then
	echo ""${dirName}" is not a directory"
	exit 1;
fi
files_count=$(find "${dirName}" -type f | wc -l)
directories_count=$(find "${dirName}" -type d | wc -l)
echo " "${dirName}" has total "${files_count}" files and "${directories_count}" directories"
exit 0
