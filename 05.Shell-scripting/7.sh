#Да се напише shell скрипт, който извежда на стандартния изход факултетния номер на потребителя, който 
#изпълнява скрипта, или казва "DANGER! It's a teacher!", ако потребителското име не е факултетен номер.
#!/bin/bash
fNumber=$(who -m|cut -d ' ' -f1)
if [[ "${fNumber}" =~ ^s[0-9]{5,6}$ ]]; then
        echo "${fNumber}"
else
        echo "DANGER! It's a teaher!"
fi
