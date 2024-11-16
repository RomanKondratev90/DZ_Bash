#!/bin/bash

#Переменные
files=()            #Список файлов
extension=""        #Старое расширение
replacement=""      #Новое расширение

# Обработка параметров
while [ "$#" -gt 0 ]; do
    if [ "$1" == "--file" ]; then
        files+=("$2")
        shift
    elif [ "$1" == "--extension" ]; then
        extension="$2"
        shift
    elif [ "$1" == "--replacement" ]; then
        replacement="$2"
        shift
    else
        echo "Неизвестный параметр: $1"
        exit 1
    fi
    shift
done

if [ "$extension" == "" ] || [ "$replacement" == "" ] || [ ${#files[@]} -eq 0 ]; then
    echo "Необходимо указать файлы через --file, расширение через --extension и новое расширение через --replacement"
    exit 1
fi

for file in "${files[@]}"; do
    if [[ "$file" == *.$extension ]]; then
        new_file="${file%.$extension}.$replacement"
        if [ -f "$file" ]; then
            echo "Переименование файла: $file -> $new_file"
            mv "$file" "$new_file"
            echo "Файл $file переименован в $new_file"
        else
            echo "Файл $file не найден, пропускаем"
        fi
    else
        echo "Файл $file не имеет расширение $extension, пропускаем"
    fi
done