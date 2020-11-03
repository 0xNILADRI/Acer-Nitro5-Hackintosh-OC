#!/bin/sh
IPATH='/usr/local/bin'

###
### Inject a delay to make sure we're awake before
### continuing.  You should not need to edit this
### section.
###

while true
do
  sleep 3
  SLEEPTEST=$(${IPATH}/hda-verb 0x01 GET_POWER_STATE POWER_STATE 2>&1 | awk 'BEGIN {FS="= "}; /result/ {print $2}')
  if [ ! "${SLEEPTEST}" == "0x00000000" ]
  then
    ${IPATH}/hda-verb 0x01 SET_POWER_STATE 1
    ${IPATH}/hda-verb 0x01 SET_POWER_STATE 0
    break
  else
    break
  fi
done

###
### Tickle the control pins to enable jacksense.
### Update these verbs to match the output of your
### tests.  You may not need all four verbs.
###

###
### These are the defaults for the ALC255 with
### ALC layout 13.
###

${IPATH}/hda-verb 0x18 SET_PIN_WIDGET_CONTROL 0x24
${IPATH}/hda-verb 0x19 SET_PIN_WIDGET_CONTROL 0x24
${IPATH}/hda-verb 0x1a SET_PIN_WIDGET_CONTROL 0x24
${IPATH}/hda-verb 0x24 SET_UNSOLICITED_ENABLE 0x83
