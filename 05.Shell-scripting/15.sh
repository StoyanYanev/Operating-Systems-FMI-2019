#Напишете shell script, който да приема параметър име на директория, от която взимаме файлове,
#и опционално експлицитно име на директория, в която ще копираме файлове. 
#Скриптът да копира файловете със съдържание, променено преди по-малко от 45 мин, от първата директория 
#във втората директория. Ако втората директория не е подадена по име, нека да получи такова от днешната дата 
#във формат, който ви е удобен. При желание новосъздадената директория да се архивира.

#!/bin/bash

set -x
src_dir=$1
if [[ ! -d $src_dir ]]; then
    echo "Error! ${src_dir} is not a directory!"
    exit 1
fi

dst_dir=$2
if [[ -z $dst_dir ]]; then
    dst_dir="${HOME}/$(date | tr -s ' ' '_')"
    mkdir ${dst_dir}
    echo "Destination directory is not set, using ${dst_dir}"
fi

echo "Copying recent modified files from ${src_dir} to ${dst_dir}"
find "$src_dir" -type f -mmin -45 -exec cp '{}' ${dst_dir}  \;
echo "Done, check ${src_dir} for new files"

while true; do
    read -p "Do you want to archieve the new folder? yes / no " answer
    case $answer in
        yes)
            echo "Creating archieve"
            tar -zcvf "${dst_dir}.tar.gz" "${dst_dir}"
            echo "Archieve ${dst_dir}.tar.gz created"
            break
            ;;
        no)
            echo "Ok, bye!"
            break
            ;;
    esac
done