#!/bin/bash

# Start X server
echo "starting x server"
Xorg -noreset +extension GLX +extension RANDR +extension RENDER -logfile /tmp/xorg.log -config /etc/X11/xorg.conf :0 &

# Wait for X to start
sleep 2

echo "seting variables"
# Set the DISPLAY environment variable
export DISPLAY=:0

export QT_QPA_PLATFORM=xcb

echo "starting openbox"
# Start menu.xml in the background
openbox &
sleep 2

python /app/gui_app.py
# Start your PyQt application

