#!/bin/bash

# Каталог для скриншотов
SAVE_DIR="$HOME/Pictures/screenshots"
mkdir -p "$SAVE_DIR"

# Определение типа снимка
if [[ "$1" == "select" ]]; then
    MODE="select"
    FILENAME="$(date +'%Y-%m-%d_%H-%M-%S')_select.png"
else
    MODE="full"
    FILENAME="$(date +'%Y-%m-%d_%H-%M-%S').png"
fi

# Полный путь
FILEPATH="$SAVE_DIR/$FILENAME"

# Сделать скриншот
if [[ "$MODE" == "select" ]]; then
    scrot -s "$FILEPATH"
else
    scrot "$FILEPATH"
fi

# Проверка наличия файла
if [[ -f "$FILEPATH" ]]; then
    # Копирование в буфер обмена
    if command -v xclip >/dev/null; then
        xclip -selection clipboard -t image/png -i "$FILEPATH"
    fi

    # Уведомление
    if command -v notify-send >/dev/null; then
        notify-send "Скриншот ($MODE) сохранён и скопирован" "$FILEPATH"
    fi
fi

