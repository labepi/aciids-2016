# Code to aid the experiment reproducibility of ACIIDS 2016 paper

## Test on Apache Web Server
#### Perform test settings on apache Web server:

  - Concurrent users number: 194
  - Requests number: 200000
  - Server host IP number: 172.16.0.41 [change to your server host IP]
  - Server port number: 80

#### Perform test command:

```sh
$ ab -c 194 -n 200000 http://172.16.0.41:80/
```
## Test on MariaDB database
#### Connect on MariaDB database:
```sh
$ mysql -uroot -p[your_database_password]
```
#### Create database:
```sh
create database freeipdb;
```
#### Choose database:
```sh
use freeipdb;
```
#### Create table proxy on freeipdb database:
```sh
create table proxy ( id int AUTO_INCREMENT, last_update varchar(10), ip_address varchar(30), port varchar(10), country varchar(30), PRIMARY KEY (id));
```
#### Exit the database access:
```sh
exit;
```
#### Create test script
##### Create new file, add following commands for insert, update and delete actions on 'freeipdb' database, set your password for database user access, set your server host database IP and save the file as 'db_test.sh' :

```sh
#!/bin/bash
inputfile="proxy_list.txt"
cat $inputfile | while read update ip port country; do
    echo "INSERT INTO proxy (last_update,ip_address,port,country) VALUES ('$update', '$ip', '$port', '$country');"
    echo "DELETE FROM proxy WHERE port=80 AND last_update='2mins';"
done | mysql -uroot -p[your_password] -h[your_server_host_IP] freeipdb;
```
##### Provide execute permissions:
```sh
$ chmod a+x db_test.sh 
```
#### Perform test script:
```sh
$ ./db_test.sh 
```