#!/bin/bash

# Start the web server.  Its static files are located in /usr/share/nginx/html/
# if you want to change the content.
#/etc/init.d/nginx start

# You can implement logic here to do periodic network tests and save the
# results.  You can do that directly from this bash script or call another
# program that you write (e.g. in Python).

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

while true; do
    #
    # NOT IMPLEMENTED
    #
    sleep 300
done

# If execution reaches this point, the chute will stop running.
exit 0
