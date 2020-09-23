# OpenDKIM server based on openSUSE Leap 15.2
FROM fcrespel/base-image:opensuse15.2

# MariaDB
RUN zypper in -y opendkim &&\
    zypper clean -a

# Files
COPY ./root /
RUN chmod +x /run.sh &&\
    cp -p /etc/opendkim/opendkim.conf /etc/opendkim/opendkim.default.conf &&\
    confd -onetime -backend env &&\
    chown -R opendkim:opendkim /etc/opendkim &&\
    chmod a+r /var/lib/unbound/root.key

# Ports
EXPOSE 8891
