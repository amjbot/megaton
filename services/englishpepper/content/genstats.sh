#!/bin/bash

mysql -u root -proot englishpepper -e 'SELECT pos,count(*) FROM corpus GROUP BY pos ORDER BY count(*) DESC LIMIT 100' > pos_counts.txt

mkdir -p nouns0 names0 verbs0 adj0 adv0
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "nn%" ORDER BY n2 DESC LIMIT 1000' > nouns0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "np%" ORDER BY n2 DESC LIMIT 1000' > names0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "vv%" ORDER BY n2 DESC LIMIT 1000' > verbs0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "aj%" ORDER BY n2 DESC LIMIT 1000' > adj0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "av%" ORDER BY n2 DESC LIMIT 1000' > adv0/list.txt

mkdir -p nouns1 names1 verbs1 adj1 adv1
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "nn%" ORDER BY n2 DESC LIMIT 1000,1000' > nouns1/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "np%" ORDER BY n2 DESC LIMIT 1000,1000' > names1/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "vv%" ORDER BY n2 DESC LIMIT 1000,1000' > verbs1/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "aj%" ORDER BY n2 DESC LIMIT 1000,1000' > adj1/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "av%" ORDER BY n2 DESC LIMIT 1000,1000' > adv1/list.txt

mkdir -p nouns2 names2 verbs2 adj2 adv2
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "nn%" ORDER BY n2 DESC LIMIT 2000,1000' > nouns2/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "np%" ORDER BY n2 DESC LIMIT 2000,1000' > names2/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "vv%" ORDER BY n2 DESC LIMIT 2000,1000' > verbs2/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "aj%" ORDER BY n2 DESC LIMIT 2000,1000' > adj2/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM corpus WHERE pos LIKE "av%" ORDER BY n2 DESC LIMIT 2000,1000' > adv2/list.txt
