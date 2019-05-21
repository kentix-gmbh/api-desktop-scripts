#!/bin/sh
APIKEY="API-KEY"
DOORLOCKID="DOORLOCK-ID"
DEVICEIP="DEVICE_IP"

RETURN=$(curl https://"$APIKEY":@"$DEVICEIP"/api/devices/doorlocks/"$DOORLOCKID"/unlock -k)

echo "$RETURN"

if [ "$RETURN" == '{"code":0}' ]; then
	osascript -e 'tell app "System Events" to display dialog "Tür geöffnet"'
else
	osascript -e 'tell app "System Events" to display dialog "Fehler"'
fi

exit 0
