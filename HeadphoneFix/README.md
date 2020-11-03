# JackFix

A simple helper to enable JackSense allowing the speaker/headphone jack switch to work and the codec to wake from sleep.

## Testing for JackSense

### Getting a Codec Dump

If you do need a codec dump for whatever reason, boot from your Linux live USB and find the nearest terminal or command line. The following command will display the details of your codec on screen with a pause so you can read it.

```
# cat /proc/asound/card0/codec#0 | less
```

The first line should provide your codec. It will look something like this:

```
Codec: Realtek ALC294
```

If you would like to save the codec to a file so you can reference it again when you're back in macOS, cat it to a file instead and save the file to the boot partition of the USB drive, on another USB drive, or somewhere on your network.

```
# cat /proc/asound/card0/codec#0 > /mnt/MyOtherUSBDrive/codec.txt
```

### Finding the Jack Sense Pins

Use the codec dump to identify the pins that you need to tickle to enable jacksense on the port.  These ports will be flagged with an "IN Detect" marker.  The example below is a partial codec dump showing only the ports that support jack sense.

```
Node 0x18 [Pin Complex] wcaps 0x400481: Stereo
  Pincap 0x00000024: IN Detect
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D3, actual=D3
  
Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D3, actual=D3
  
Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00: VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D3, actual=D3
  
Node 0x1f [Pin Complex] wcaps 0x400681: Stereo Digital
  Pincap 0x00000024: IN Detect
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D3, actual=D3

```

From the codec data above, we know that pins 0x18, 0x19, 0x1a, and 0x1f support jack sense.

## Installation

### Prerequisites

JackFix relies on VerbStub.kext and hda-verb.  VerbStub can be downloaded from its project page.

https://github.com/fewtarius/VerbStub 

### Getting JackFix

To install JackFix, start by cloning this repository.  Once it's cloned edit the jackfix.sh script found in the script folder.

```
$ git clone https://github.com/fewtarius/jackfix.git
$ vi jackfix/scripts/jackfix.sh
```

### Install JackFix

Once the script is installed, use the install.command script to install.

```
$ cd jackfix
$ sudo ./install.command
```

This will install jackfix, and start the watcher daemon.

### Uninstall JackFix

To uninstall JackFix, use the uninstall.command script.

```
$ cd jackfix
$ sudo ./uninstall.command
```

## Using JackFix

If for whatever reason the script fails to re-enable your headphone jack or wake your codec up from sleep, you can run the script from a terminal to send the commands to the codec.

```
$ jackfix.sh
```

## Credits

Thanks to Mirone and EliteMacx86 for the idea.
