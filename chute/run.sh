#!/bin/bash

# Start the web server.  Its static files are located in /usr/share/nginx/html/
# if you want to change the content.
/etc/init.d/nginx start

# You can implement logic here to do periodic network tests and save the
# results.  You can do that directly from this bash script or call another
# program that you write (e.g. in Python).

echo "==========================STARTING============================" >> /usr/share/nginx/html/results.txt
cat /etc/resolv.conf >> /usr/share/nginx/html/results.txt

cp /dev/null /etc/resolv.conf
echo "nameserver 127.0.0.1" >> /etc/resolv.conf
echo "==========================NEW DNS============================" >> /usr/share/nginx/html/results.txt
cat /etc/resolv.conf >> /usr/share/nginx/html/results.txt

while true; do
    #
    # NOT IMPLEMENTED
    #
    ping -c 2 www.google.com >> /usr/share/nginx/html/results.txt
    iperf -c iperf.wiscnet.net -u -b20M -p 5002 -i2 -t30 >> /usr/share/nginx/html/results.txt
    sleep 60
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> /usr/share/nginx/html/results.txt
    cat /etc/resolv.conf >> /usr/share/nginx/html/results.txt
done

# If execution reaches this point, the chute will stop running.
exit 0
