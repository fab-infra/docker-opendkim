#!/bin/sh

# Set default environment
export DKIM_DOMAIN="${DKIM_DOMAIN:-localdomain}"
export DKIM_KEYFILE="${DKIM_KEYFILE:-/var/lib/opendkim/private.key}"
export DKIM_SELECTOR="${DKIM_SELECTOR:-default}"
export DKIM_INTERNALHOSTS="${DKIM_INTERNALHOSTS:-127.0.0.1}"

# Generate configuration
confd -onetime -backend env

# Check permissions
if [ -e "$DKIM_KEYFILE" ]; then
    chmod 600 "$DKIM_KEYFILE" || true
    chmod 700 `dirname "$DKIM_KEYFILE"` || true
else
    echo "ERROR: key file '$DKIM_KEYFILE' is missing or not accessible"
    exit 1
fi

# Start OpenDKIM
echo "Starting OpenDKIM"
exec /usr/sbin/opendkim -f -v -x /etc/opendkim/opendkim.conf
