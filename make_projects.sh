#!/bin/bash

### make_projects.sh

cat /dev/null > /etc/projects
cat /dev/null > /etc/projid

homebase=/xfs/home

for u in $( /bin/ls -1 $homebase ) 
do
    if [ -d "$homebase/$u" ] 
    then
        if [ $u != "special01" -a $u != "special02" ]
        then
            userid=$( id -u $u )
            echo "$userid:$homebase/$u" >> /etc/projects
            echo "$u:$userid" >> /etc/projid
        fi
    fi
done

