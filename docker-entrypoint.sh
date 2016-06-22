#!/bin/bash
set -e

echo "Arguments received: $@"
URL="$DRIVER://$USER@$HOST:$PORT/<DBNAME>?$DRIVER_ARGS"
echo "Base Driver URL: ${URL/<DBNAME>/$DBNAME}"

cd /migrations

if [ "$1" = 'help' ]; then
    echo
    echo "Mount your migrations to the /migrations volume when running. e.g."
    echo "  docker run --rm --volume ~/migrations:/migrations deinspanjer/migrate"
    echo
    echo "Use the -all argument to run the migrations in each migration subdirectory with the pattern ###_db_<dbname>"
    echo
    echo "Use Docker environment variables to build the driver URL: HOST PORT DBNAME DRIVER_ARGS"
    echo "  DBNAME is optional if using migration subfolders and the -all argument"
    echo
    migrate -url "${URL/<DBNAME>/$DBNAME}" "$@"
elif [ "$1" = '-all' ]; then
    shift
    for dbdir in *_db_*; do
        echo "Running on DB: ${dbdir#*_db_}"
        migrate -url "${URL/<DBNAME>/${dbdir#*_db_}}" -path ./$dbdir "$@"
    done
else
    migrate -url "${URL/<DBNAME>/$DBNAME}" "$@"
fi
