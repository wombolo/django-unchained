#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."
    while ! nc -z $DB_HOST $DB_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

pwd
ls -l

#python manage.py flush --no-input
python manage.py migrate
python manage.py runserver 0.0.0.0:8000

exec "$@"
