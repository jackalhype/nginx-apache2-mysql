#!/bin/bash

# web visible from app
for I in 1 2 3 4 5 6 7 8 9
do
    sleep 1
    web_ip=$(dig +short web)
    if [ ${#web_ip} -ge 4 ]
    then
        sleep 3   # hope /etc/hosts will not be overwritten
        echo "$(dig +short web)  site.local" | tee -a /etc/hosts
        echo "/etc/hosts:"
        cat /etc/hosts
        break
    fi
    if [ 9 == I ]
    then
        echo "app: did not write to /etc/hosts. App not seeing web. "
    fi
done

# apache itself:
exec apache2-foreground
