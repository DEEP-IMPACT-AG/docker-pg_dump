#!/bin/sh

set -e

mkdir -p /var/dump
pg_dump -Fc -U ${PGUSER} -h ${PGHOST} ${PGDB} | openssl smime -encrypt \
	-aes256 -binary -outform DEM -out /var/dump/dump-$(date +"%Y%m%d%H%M%S").ssl /var/backup_key.pem.pub

# clean up
find /var/dump -type f -mtime +${DUMP_RETENTION} -execdir rm -- '{}' \;
