#!/bin/bash

file_path=""
search_string=""

while [[ "$#" -gt 0 ]]; do
    if [[ "$1" == "--file" ]]; then
        file_path="$2"
        shift
    elif [[ "$1" == "--search" ]]; then
        search_string="$2"
        shift
    fi
    shift
done

if [[ -z "$file_path" || -z "$search_string" ]]; then
    echo "Нужно указать --file <путь к файлу> и --search <строка для поиска>"
    exit 1
fi

if [[ ! -f "$file_path" ]]; then
    echo "Файл $file_path не существует."
    exit 1
fi

count=$(grep -o "$search_string" "$file_path" | wc -l)

if [[ $count -gt 0 ]]; then
    echo "Количество найденных совпадений: $count"
else
    abs_path=$(realpath "$file_path")
    echo "Не найдено ни одного совпадения в файле $abs_path"
fi