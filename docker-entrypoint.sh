#!/bin/bash
set -e

case $1 in
  start)
  echo -e "Start rbnb "
  java -jar rbnb.jar -F -a localhost:3333 -H data/ -n "Cardioart I" $2
  [ $? -ne 0 ] && echo "[NO]" || echo "[YES]"
  ;;
  stop)
  ;;
  *)
  echo "USAGE start|stop"
  ;;
esac