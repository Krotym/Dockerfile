#!/bin/bash
set -e

mysql --protocol=socket -uroot  <<EOSQL


CREATE DATABASE student;
USE student;
CREATE Table tovars (    
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
name VARCHAR(200) NOT NULL,  
price VARCHAR(200) default NULL,    
text VARCHAR(255) default NULL);



CREATE USER 'misha' IDENTIFIED BY '1410261';
GRANT ALL privileges ON student.* TO 'misha';
FLUSH PRIVILEGES;
EOSQL
