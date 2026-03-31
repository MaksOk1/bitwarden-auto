#!/usr/bin/env bash
set -e

TEMP_DEB="/tmp/bitwarden.deb"

echo "Завантаження останньої версії Bitwarden..."
wget -q "https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb" -O "$TEMP_DEB"

if [ -f "$TEMP_DEB" ]; then
    echo "Встановлення пакета..."
    apt-get install -y "$TEMP_DEB"
    rm "$TEMP_DEB"
    echo "Оновлення завершено успішно."
else
    echo "Помилка: файл не завантажено."
    exit 1
fi

# # Завантажуємо останній пакет
# #wget "https://bitwarden.comi" -O /tmp/bitwarden.deb
# wget "https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb" -O /tmp/bitwarden.deb
# # Встановлюємо його (apt автоматично оновить існуючу версію)
# apt-get install -y /tmp/bitwarden.deb
# # Видаляємо тимчасовий файл
# rm /tmp/bitwarden.deb
