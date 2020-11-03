#!/bin/bash

WD="`pwd`/script"
IPATH="/usr/local/bin"

if [ ! $UID = 0 ]
then
  echo "Run this install script as root. (sudo ./uninstall.command)"
  exit 1
fi

echo "Removing JackFix"
rm -f /usr/bin/JackFix 2>/dev/null
rm -f ${IPATH}/jackfix.sh 2>/dev/null

echo "Removing hda-verb"
rm -f /usr/bin/hda-verb 2>/dev/null
rm -f ${IPATH}/hda-verb 2>/dev/null

echo "Uninstall jackfix.plist"
launchctl unload /Library/LaunchAgents/jackfix.plist 2>/dev/null
rm -f /Library/LaunchAgents/jackfix.plist 2>/dev/null

echo "Uninstall sleepwatcher.plist"
launchctl unload /Library/LaunchAgents/sleepwatcher.plist 2>/dev/null
rm -f /Library/LaunchAgents/sleepwatcher.plist 2>/dev/null
