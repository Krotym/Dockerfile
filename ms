#!/bin/bash
set -e

mysql --protocol=socket -uroot  <<EOSQL


CREATE DATABASE student;

CREATE USER 'misha' IDENTIFIED BY '1410261';
GRANT ALL privileges ON student.* TO 'misha';
FLUSH PRIVILEGES;
EOSQL
