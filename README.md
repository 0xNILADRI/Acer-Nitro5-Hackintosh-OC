# [SUCCESS] Acer-Nitro5-Hackintosh

Fully functional on Big Sur 11.0.1 - Beta 

The whole project was made with the help of Opencore - Dortania (Guide). A huge thanks to the awesome community with well ducumented guide.
[Guide Followed](https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html)


## Contents

- [Configuration](#configuration)
- [Current Status](#current-status)
- [DSDT-SSDT](#dsdt-ssdt)
- [Credits](#credits)

## Configuration

| Specifications | Detail                                                  |
| ------------------- | ------------------------------------------- |
| Computer model      | Acer Nitro 5 2018 - AN515-51 (GTX1050ti)   |
| Processor           | Intel Core i5-7300hq ~2.5ghz turbo 3.5ghz  |
| Memory              | 8GB/16GB Sk Hynix DDR4 2133MHz             |
| Hard Disk           | Kingston Q500 480GB SATA3 2.5 SSD          |
| Integrated Graphics | Intel UHD Graphics 630                     |
| Monitor             | FHD 1920x1080 (15.6 inch) 24 Bit Color     |
| Sound Card          | Realtek ALC255                             |
| Wireless Card       | Qualcomm Atheros QCA61x4A : ordered Intel Ax200   |
| Touchpad            | I2C HID based                              |

## Current Status
- **Discrete graphic card** is not working yet
- **Touchpad Gestures** works after adding patched DSDT/SSDT (XOSI) in OC
- **Display Brightness** is works after using [Enable macOS HiDPI](https://github.com/xzhih/one-key-hidpi)
- **Sound** Fully Functional <br> [Headphone Fix](https://github.com/fewtarius/jackfix), the headphnone fix has been provided in the HeadphoneFix directory, just run the install.command on your system and you're good to go!

## DSDT-SSDT
- Custom DSDT/SSDT files for this particular model has been created using dumping the DSDT from windows 10 and then modifying it for mac os to work.

***Note*** : Please don't use this if you're using a different model, it will definitely cause problem.

## Credits

- **Special thanks** to [Acidanthera](https://github.com/acidanthera) for providing [AppleALC](https://github.com/acidanthera/AppleALC), [AppleSupportPkg](https://github.com/acidanthera/AppleSupportPkg), [HibernationFixup](https://github.com/acidanthera/HibernationFixup), [Lilu](https://github.com/acidanthera/Lilu), [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg), [VirtualSMC](https://github.com/acidanthera/VirtualSMC), [VoodooPS2](https://github.com/acidanthera/VoodooPS2), and [WhateverGreen](https://github.com/acidanthera/WhateverGreen).
- Thanks to [RehabMan](https://github.com/RehabMan) for providing [SATA-unsupported](https://github.com/RehabMan/hack-tools/tree/master/kexts/SATA-unsupported.kext).
- Thanks to [VoodooI2C](https://github.com/VoodooI2C) for providing [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C).
- Thanks to [Fewtarius](https://github.com/fewtarius) for providing [JackFix](https://github.com/fewtarius/jackfix).
- A huge thanks to the opencore community, I couldn't stress enough the support I got to make this a success. [Reddit](https://www.reddit.com/r/hackintosh/) 
