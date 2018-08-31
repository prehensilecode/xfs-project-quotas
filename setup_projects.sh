#!/bin/bash

### setup_projects.sh

homebase=/xfs/home

for u in $( /bin/ls -1 $homebase ) 
do
    if [ -d "$homebase/$u" ] 
    then
        if [ $u != "special01" -a $u != "special02" ]
        then
            cmd_string="project -s ${u}"
            xfs_quota -x -c "${cmd_string} " /xfs
        fi
    fi
done

