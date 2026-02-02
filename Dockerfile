# OpenDKIM server based on openSUSE Leap 16.0
FROM ghcr.io/fab-infra/base-image:opensuse16.0

# Environment
ENV DKIM_DOMAIN="localdomain" \
	DKIM_KEYFILE="/var/lib/opendkim/private.key" \
	DKIM_SELECTOR="default" \
	DKIM_INTERNALHOSTS="127.0.0.1"

# OpenDKIM
RUN zypper in -y opendkim &&\
	zypper clean -a

# Files
COPY ./root /
RUN cp -p /etc/opendkim/opendkim.conf /etc/opendkim/opendkim.default.conf &&\
	confd -onetime -backend env &&\
	mkdir -p /run/opendkim &&\
	chown -R opendkim:opendkim /etc/opendkim /run/opendkim &&\
	chmod a+r /var/lib/unbound/root.key

# Ports
EXPOSE 8891
