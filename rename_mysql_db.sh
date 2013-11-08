#!/bin/bash

# Shell script to rename a MySQL database from "SOURCE_DB" to
# "DESTINATION_DB".  Found on
# http://www.rndblog.com/how-to-rename-a-database-in-mysql/
 
MYSQL_CMD="mysql -u root"
SOURCE_DB=$1
DESTINATION_DB=$2
if [ -z "$SOURCE_DB" -o -z "$DESTINATION_DB" ]; then
    echo "Rename all the MySQL tables from a SOURCE database to a DESTINATION
database.

USAGE: $0 SOURCE_DB DESTINATION_DB
"
    exit -1
fi
 
#$MYSQL_CMD -e "CREATE DATABASE $DESTINATION_DB"

params=$($MYSQL_CMD -N -e "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE table_schema='$SOURCE_DB'")
 
for name in $params; do
    $MYSQL_CMD -e "RENAME TABLE $SOURCE_DB.$name to $DESTINATION_DB.$name"
done
 
#$MYSQL_CMD -e "DROP DATABASE $SOURCE_DB"
