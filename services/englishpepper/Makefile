SHELL=/bin/bash

restart:
	sudo supervisorctl restart englishpepper

status:
	sudo supervisorctl status englishpepper

stop:
	sudo supervisorctl stop englishpepper

reset-database:
	mysql -u root -proot root < etc/schema.sql

tail-log:
	sudo tail -1000 /var/log/supervisor/englishpepper-stdout*.log

tail-err:
	sudo tail -1000 /var/log/supervisor/englishpepper-stderr*.log
