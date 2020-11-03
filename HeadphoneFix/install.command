#!/bin/bash

WD="`pwd`"
IPATH="/usr/local/bin"

if [ ! $UID = 0 ]
then
  echo "Run this install script as root. (sudo ./install.cmd)"
  exit 1
fi

cat <<EOF

Jack Fix Script
-----------------------

This script tickles the jack configuration pins to enable the
speaker out / headphone switch on startup and after a wakeup.

EOF

echo "Removing previous installations."
./uninstall.command 2>/dev/null

if [ ! -d "${IPATH}" ]
then
  mkdir -p "${IPATH}"
  if [ ! $? = 0 ]
  then
    echo "Could not make directory ${IPATH}, exiting."
    exit 1
  fi 
  chown ${USER}:admin
fi

echo "Installing JackFix"
cp ${WD}/script/jackfix.sh ${IPATH}
chmod 755 ${IPATH}/jackfix.sh
chown root:wheel ${IPATH}/jackfix.sh

echo "Installing hda-verb"
cp ${WD}/bin/hda-verb ${IPATH}
chmod 755 ${IPATH}/hda-verb
chown root:wheel ${IPATH}/hda-verb

echo "Installing sleepwatcher"
cp ${WD}/bin/sleepwatcher ${IPATH}
chmod 755 ${IPATH}/sleepwatcher
chown root:wheel ${IPATH}/sleepwatcher

echo "Install and start jackfix launcher"
cp ${WD}/launchers/jackfix.plist /Library/LaunchAgents/
sed -i -e "s#--PATH--#${IPATH}#g" /Library/LaunchAgents/jackfix.plist
chmod 644 /Library/LaunchAgents/jackfix.plist
chown root:wheel /Library/LaunchAgents/jackfix.plist
launchctl load /Library/LaunchAgents/jackfix.plist

echo "Install and start sleepwatcher launcher"
cp ${WD}/launchers/sleepwatcher.plist /Library/LaunchAgents/
sed -i -e "s#--PATH--#${IPATH}#g" /Library/LaunchAgents/sleepwatcher.plist
chmod 644 /Library/LaunchAgents/sleepwatcher.plist
chown root:wheel /Library/LaunchAgents/sleepwatcher.plist
launchctl load /Library/LaunchAgents/sleepwatcher.plist
