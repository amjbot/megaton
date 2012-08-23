#!/bin/bash

mysql -u root -proot englishpepper -e 'SELECT pos,count(*) FROM corpus GROUP BY pos ORDER BY count(*) DESC LIMIT 100' > pos_counts.txt


mkdir -p nouns0 names0 verbs0 adj0 adv0
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "nn%" ORDER BY n2 DESC LIMIT 0,1000) AS q \
                                       WHERE itext IS NULL' > nouns0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "np%" ORDER BY n2 DESC LIMIT 0,1000) AS q \
                                       WHERE itext IS NULL' > names0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "vv%" ORDER BY n2 DESC LIMIT 0,1000) AS q \
                                       WHERE itext IS NULL' > verbs0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "aj%" ORDER BY n2 DESC LIMIT 0,1000) AS q \
                                       WHERE itext IS NULL' > adj0/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "av%" ORDER BY n2 DESC LIMIT 0,1000) AS q \
                                       WHERE itext IS NULL' > adv0/list.txt


mkdir -p nouns1 names1 verbs1 adj1 adv1
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "nn%" ORDER BY n2 DESC LIMIT 1000,1000) AS q \
                                       WHERE itext IS NULL' > nouns1/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "np%" ORDER BY n2 DESC LIMIT 1000,1000) AS q \
                                       WHERE itext IS NULL' > names1/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "vv%" ORDER BY n2 DESC LIMIT 1000,1000) AS q \
                                       WHERE itext IS NULL' > verbs1/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "aj%" ORDER BY n2 DESC LIMIT 1000,1000) AS q \
                                       WHERE itext IS NULL' > adj1/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "av%" ORDER BY n2 DESC LIMIT 1000,1000) AS q \
                                       WHERE itext IS NULL' > adv1/list.txt

mkdir -p nouns2 names2 verbs2 adj2 adv2
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "nn%" ORDER BY n2 DESC LIMIT 2000,1000) AS q \
                                       WHERE itext IS NULL' > nouns2/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "np%" ORDER BY n2 DESC LIMIT 2000,1000) AS q \
                                       WHERE itext IS NULL' > names2/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "vv%" ORDER BY n2 DESC LIMIT 2000,1000) AS q \
                                       WHERE itext IS NULL' > verbs2/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "aj%" ORDER BY n2 DESC LIMIT 2000,1000) AS q \
                                       WHERE itext IS NULL' > adj2/list.txt
mysql -u root -proot englishpepper -e 'SELECT * FROM (SELECT corpus.*, ideas.text as itext FROM corpus LEFT OUTER JOIN ideas ON corpus.text=ideas.text \
                                       WHERE corpus.pos LIKE "av%" ORDER BY n2 DESC LIMIT 2000,1000) AS q \
                                       WHERE itext IS NULL' > adv2/list.txt
