#!/bin/bash

mysql -u root -proot englishpepper -e 'SELECT pos,count(*) FROM corpus GROUP BY pos ORDER BY count(*) DESC LIMIT 100' > pos_counts.txt

mkdir -p nouns0 names0 verbs0 adj0 adv0
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "nn%" ORDER BY n2 DESC LIMIT 1000' > nouns0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "np%" ORDER BY n2 DESC LIMIT 1000' > names0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "vv%" ORDER BY n2 DESC LIMIT 1000' > verbs0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "aj%" ORDER BY n2 DESC LIMIT 1000' > adj0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "av%" ORDER BY n2 DESC LIMIT 1000' > adv0/list.txt
