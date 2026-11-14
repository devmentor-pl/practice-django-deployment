#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"
mkdir -p "backups"
source .env
BACKUP_FILE="backups/backup_$(date +"%Y%m%d_%H%M").sql"

if ! docker compose exec -T db pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB" > "$BACKUP_FILE"; then

    rm -f "$BACKUP_FILE"
    echo "Błąd podczas tworzenia backupu!"
    exit 1
fi

echo "Backup utworzony: $BACKUP_FILE"

find backups -type f -mtime +7 -delete