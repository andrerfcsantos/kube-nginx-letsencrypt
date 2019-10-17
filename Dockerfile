FROM fedora:32

MAINTAINER André Santos <andrerfcsantos@gmail.com>

RUN dnf install tree curl certbot base64 sed -y && dnf clean all
RUN mkdir -p /etc/letsencrypt /acme-challenge /hooks

COPY ssl-secret-patch-template.json /
COPY challenge-secret-patch-template.json /
COPY entrypoint.sh /
COPY hooks/authenticator.sh /hooks
COPY hooks/cleanup.sh /hooks

RUN chmod +x /hooks/authenticator.sh /hooks/cleanup.sh

CMD ["/entrypoint.sh"]
