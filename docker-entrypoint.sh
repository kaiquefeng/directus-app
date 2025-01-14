#!/bin/sh

# Verifica se o banco de dados já existe
if [ ! -f "$DB_FILENAME" ]; then
    echo "Initializing database..."
    npx directus bootstrap
fi

# Inicia o Directus
echo "Starting Directus..."
npx directus start 