#!/bin/bash
inputfile="proxy_list.txt"
cat $inputfile | while read update ip port country; do
    echo "INSERT INTO proxy (last_update,ip_address,port,country) VALUES ('$update', '$ip', '$port', '$country');"
    echo "DELETE FROM proxy WHERE port=80 AND last_update='2mins';"
done | mysql -uroot -proot -h172.16.0.9 freeipdb;
