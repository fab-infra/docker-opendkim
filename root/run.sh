#!/bin/sh

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
