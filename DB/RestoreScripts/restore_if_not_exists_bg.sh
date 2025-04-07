#!/bin/bash

DB_NAME="SingiAttend_BG"
BACKUP_PATH="/var/mongodb_dumps/SingiAttend_BG-MongoDB-Dump/"

# Check if the database exists
if ! mongo --quiet --eval "db.getMongo().getDBNames().indexOf('$DB_NAME') >= 0" > /dev/null; then
    echo "Database $DB_NAME does not exist, restoring..."
    mongorestore --db $DB_NAME $BACKUP_PATH
else
    echo "Database $DB_NAME already exists, skipping restore."
fi