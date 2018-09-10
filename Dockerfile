FROM alpine:3.8
ADD dump.sh /
RUN apk --update add postgresql-client=10.5-r0 openssl=1.0.2o-r2 && rm -rf /var/cache/apk/*
ENTRYPOINT [ "/dump.sh" ]
