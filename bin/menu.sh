#!/bin/sh
host=$(dialog --menu "Choose server:" 0 0 0 \
  $(awk '/^Host/ {printf $2" "}; /HostName/ {printf $2"\n"}' "$HOME"/.ssh/config) \
  2>&1 >/dev/tty)

ssh "$host"
