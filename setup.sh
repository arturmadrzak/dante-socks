#!/bin/sh

set -eu

conf_in="/usr/share/sockd.conf.in"
conf_out="/etc/sockd.conf"
iface=$(ip route show to 0/0 | awk -F' ' '{ print $5 }')
port=1080
sed -e "s/%internal%/${iface}/" \
    -e "s/%external%/${iface}/" \
    -e "s/%port%/${port}/" ${conf_in} > ${conf_out}

/usr/sbin/sockd
