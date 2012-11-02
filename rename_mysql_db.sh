#!/bin/bash

# Shell script to rename a MySQL database from "olddb" to "newdb".
# Found on http://www.rndblog.com/how-to-rename-a-database-in-mysql/
 
mysqlconn="mysql -u root"
olddb=xxxx
newdb=yyyy
 
#$mysqlconn -e "CREATE DATABASE $newdb"

params=$($mysqlconn -N -e "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE table_schema='$olddb'")
 
for name in $params; do
      $mysqlconn -e "RENAME TABLE $olddb.$name to $newdb.$name";
done;
 
#$mysqlconn -e "DROP DATABASE $olddb"
