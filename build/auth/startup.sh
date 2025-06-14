#!/bin/bash
set -e

envsubst < /etc/powerdns/pdns.conf.template > /etc/powerdns/pdns.conf

exec /usr/sbin/pdns_server --daemon=no