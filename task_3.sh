#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Использование: $0 <URL стенда> <имя браузера> <версия браузера>"
  exit 1
fi

stand_url=$1
browser_name=$2
browser_version=$3

export SELENIUM_GRID_URL="http://localhost:4444/wd/hub"
export STAND_URL=$stand_url
export BROWSER_NAME=$browser_name
export BROWSER_VERSION=$browser_version

echo "Запуск тестов"
mvn clean test

if [ $? -eq 0 ]; then
  echo "Тесты выполнены успешно!"
else
  echo "Ошибка при выполнении тестов."
fi