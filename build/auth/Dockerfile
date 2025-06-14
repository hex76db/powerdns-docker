FROM debian:12-slim

# Install prerequisites and clean in one go
RUN apt-get update && apt-get install -y \
    curl gnupg lsb-release ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PowerDNS Authoritative 4.7.3-2 (verify version availability)
RUN apt-get update && apt-get install -y \
   pdns-server=4.7.3-2 \
   pdns-backend-mysql=4.7.3-2 \
   tini \
   gettext-base \
   default-mysql-client \
   && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./pdns.conf.template /etc/powerdns/pdns.conf.template
COPY ./startup.sh /startup.sh
RUN chmod 755 /startup.sh

EXPOSE 53/tcp 53/udp 8081/tcp

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/startup.sh"]
