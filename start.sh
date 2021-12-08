#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/vc/lib

echo "version v$(cat VERSION). Powered by UxPlay"
echo "Device is discoverable as ${DEVICE_NAME}"

# rpiplay -n $DEVICE_NAME -a $AUDIO_OUT -b $BACKGROUND $LATENCY $ROTATION $FLIP