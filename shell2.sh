#!/bin/bash

date=$(date +%F)

NO-USER=$(cat /etc/passwd | wc -l)

echo "the number of usrs are ${NO-USER}

and the date is $(date)"
