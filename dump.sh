#!/bin/sh

set -e

mkdir -p /var/dump
pg_dump -Fc -U ${PGUSER} -h ${PGHOST} ${PGDB} > /var/dump/dump-$(date +"%Y%m%d%H%M%S")
