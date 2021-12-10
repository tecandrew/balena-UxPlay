#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/vc/lib

DEVICE_NAME="${UXPLAY_NAME:="uxplay@$HOSTNAME"}"
WXH_RFRSHRATE="${UXPLAY_WXH_RFRSHRATE:="1920x1080@60"}"
FPS_LIMIT="${UXPLAY_FPSLIMIT:=30}"
# TODO OVERSCAN="${UXPLAY_OVERSCAN:=0}"
#TODO add network PORTS option
#TODO add MAC address option
FLIP="${UXPLAY_FLIP:=""}"
ROTATE="${UXPLAY_ROTATE:=""}"
VIDEOSINK="${UXPLAY_VIDEOSINK:="autovideosink"}"
# TODO video suppress
AUDIOSINK="${UXPLAY_AUDIOSINK:="autoaudiosink"}"
# TODO audio suppress
TIMEOUT="${UXPLAY_TIMEOUT:=0}"

echo "version v$(cat VERSION). Powered by UxPlay"
echo "Device is discoverable as ${DEVICE_NAME}"

uxplay -n $DEVICE_NAME \
    -s $WXH_RFRSHRATE \
    -fps $FPS_LIMIT \
    -f $FLIP \
    -r $ROTATE \
    -vs $VIDEOSINK \
    -as $AUDIOSINK \
    -t $TIMEOUT