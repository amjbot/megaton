#!/bin/bash

mysqlimport -u root -proot --local --ignore-lines=1 englishpepper nouns0/ideas.txt
mysqlimport -u root -proot --local --ignore-lines=1 --fields-terminated-by=' ' englishpepper corpus.txt
