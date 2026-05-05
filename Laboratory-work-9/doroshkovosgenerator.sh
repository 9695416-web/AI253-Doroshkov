#!/bin/bash



# Файл для команд создания групп

alias_file="create_groups.cmd"

> "$alias_file"



# Цикл для генерации 37 объектов 

for ((i=1; i<=37; i++)); do

    group_name="group$RANDOM"

    # Записываем команду создания в файл

    echo "groupadd $group_name" >> "$alias_file"

    echo "Команда для $group_name додана."

done



echo "Всього згенеровано 37 команд у файлі $alias_file."

