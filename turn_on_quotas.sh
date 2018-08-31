#!/bin/bash

### turn_on_quotas.sh

### XXX You could just set the default by:
###         xfs_quota -x -c 'limit -p bhard=15g -d'

homebase=/xfs/home

for u in $( /bin/ls -1 $homebase ) 
do
    if [ -d "$homebase/$u" ] 
    then
        if [ $u != "special01" -a $u != "special02" ]
        then
            cmd_string="limit -p bsoft=15g bhard=17g ${u}"
            xfs_quota -x -c "${cmd_string}" /xfs
        fi
    fi
done

