#!/usr/bin/env bash

if [[ ! -e /opt/Supermicro/SSM ]]; then
    exec /SSMInstaller.sh
else
    exec supervisord -c /etc/supervisor/supervisord.conf
fi
