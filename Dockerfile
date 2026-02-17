FROM docker.io/caddy:builder AS builder
RUN xcaddy build latest --with github.com/caddy-dns/rfc2136 --with github.com/gsmlg-dev/caddy-storage-s3

FROM docker.io/caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY index.html /usr/share/caddy/index.html

