#!/bin/bash

stand_url=""
grid_url=""
browser_name=""
browser_mode="FULLSCREEN"

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --stand)
      stand_url="$2"
      shift 2
      ;;
    --grid-url)
      grid_url="$2"
      shift 2
      ;;
    --browser)
      browser_name="$2"
      shift 2
      ;;
    --browser-mode)
      browser_mode="$2"
      shift 2
      ;;
    *)
      echo "Неизвестный параметр: $1"
      exit 1
      ;;
  esac
done

if [[ -z "$stand_url" || -z "$grid_url" || -z "$browser_name" ]]; then
  echo "Использование: $0 --stand <URL стенда> --grid-url <URL Grid> --browser <имя браузера> [--browser-mode <режим браузера>]"
  exit 1
fi

export SELENIUM_GRID_URL="$grid_url"
export BASE_URL="$stand_url"
export BROWSER_NAME="$browser_name"
export BROWSER_MODE="$browser_mode"

echo "Запуск тестов"
mvn clean test

if [ $? -eq 0 ]; then
  echo "Тесты выполнены успешно!"
else
  echo "Ошибка при выполнении тестов."
fi