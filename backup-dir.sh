#!/bin/bash

DEST_DIR=$1    # резервируемая папка
BACKUP_DIR=$2  # папка для хранения бэкапа
LOG_FILE=/var/log/syslog # путь  до лог-фвйла

rsync -a --delete "$DEST_DIR" "$BACKUP_DIR" > /dev/null 2>&1

if [ $? -eq  0 ]; then
    echo "$(date +"%b %d %T"): ОК. Резервирование папки $DEST_DIR прошло успешно!" >> "$LOG_FILE"
else
    echo "$(date +"%b %d %T"): ERR. Резервирование папки $DEST_DIR не выполнено!" >> "$LOG_FILE"
fi

