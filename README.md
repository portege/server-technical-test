# server-technical-test
Prepare system for technical test

## prep ##
install mysql, php-fpm
mysql_secure_installation
stop mysql
run php-fpm
chkconfig php-fpm
clear bash_history

## question ##
file:
- install webserver (nginx|apache2)
- change to ec2-user home directory
- find index.html and put the file to document_root webserver
- find random file which contain 'delete me', then remove the file
- find random file which contain 'remove me', then remove its line and line at 100

db:
- login to mysql server with user 'root'
- create database `db1` and `db2`
- create user 'usr1' that only can see `db1`, but not `db2`

system:
- shutdown process with name 'killme'
- create scheduller that shutting down mysql server at 1.40 AM, and turn it back at 2:00 PM
- php-fpm is running on which port?
