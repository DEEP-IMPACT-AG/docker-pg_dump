#!/bin/sh

set -e

mkdir -p /var/dump
pg_dump -Fc -U ${PGUSER} -h ${PGHOST} ${PGDB} | openssl smime -encrypt \
	-aes256 -binary -outform DEM -out /var/dump/dump-$(date +"%Y%m%d%H%M%S").ssl /var/backup_key.pem.pub

# clean up
cd /var/dump
ls -t | sed -e '1,30d' | xargs -I % find . -name % -mtime +${DUMP_RETENTION} | xargs rm
cd /