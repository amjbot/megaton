#!/bin/bash

mysqlimport -u root -proot --local --ignore-lines=1 englishpepper */ideas.txt
mysqlimport -u root -proot --local --ignore-lines=1 --fields-terminated-by=' ' englishpepper corpus.txt
mysql -u root -proot englishpepper -e 'INSERT INTO corpus(n1,text,pos,n2) SELECT n1,SUBSTRING_INDEX(text,"-",1),pos,n2 FROM corpus WHERE pos LIKE "%-%"'
mysql -u root -proot englishpepper -e 'INSERT INTO corpus(n1,text,pos,n2) SELECT n1,SUBSTRING_INDEX(text,"-",-1),pos,n2 FROM corpus WHERE pos LIKE "%-%"'
mysql -u root -proot englishpepper -e 'DELETE FROM corpus WHERE pos LIKE "%-%"'
