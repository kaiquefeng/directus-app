#!/bin/sh

echo "Waiting for PostgreSQL to be ready..."
while ! pg_isready -h $DB_HOST -p $DB_PORT -U $DB_USER
do
    echo "Waiting for database connection..."
    sleep 2
done

echo "PostgreSQL is ready!"

# Tenta inicializar o Directus
echo "Initializing Directus..."
npx directus bootstrap

# Inicia o Directus
echo "Starting Directus..."
npx directus start 