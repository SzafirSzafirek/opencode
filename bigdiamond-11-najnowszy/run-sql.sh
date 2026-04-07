#!/bin/bash
MYSQL="/Users/jakub/Library/Application Support/Local/lightning-services/mysql-8.0.35+4/bin/darwin-arm64/bin/mysql"
SOCKET="/Users/jakub/Library/Application Support/Local/run/78YSqlpK-/mysql/mysqld.sock"
"$MYSQL" --socket="$SOCKET" -u root -proot local -e "$1" 2>&1 | grep -v "Warning.*password"
