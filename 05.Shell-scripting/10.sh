#Да се напише shell скрипт, който чете от стандартния вход имената на 3 файла, 
#обединява редовете на първите два, подрежда ги по азбучен ред и резултата записва в третия файл.
#!/bin/bash
read -p "Enter three file names: " file1 file2 file3
if [[ ! -f "${file1}" || ! -f "${file2}" || ! -f "${file3}" ]]; then
	echo "Invalid arguments!"
	exit 1;
fi
cat "${file1}" "${file2}"|sort > "${file3}"
echo "Result saved in "${file3}""
