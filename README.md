##  D-Link DWR-118 ver. A1
[![Openwrt](https://img.shields.io/badge/os-OpenWrt-<COLOR>.svg)](https://github.com/zuzia-dev/openwrt/) [![GitHub release (latest by date)](https://img.shields.io/github/v/release/zuzia-dev/DLINK-DWR-118-A1-repo-source?color=orange)](https://github.com/zuzia-dev/DLINK-DWR-118-A1-repo-source/releases/latest) [![GitHub Downloads](https://img.shields.io/github/downloads/zuzia-dev/DLINK-DWR-118-A1-repo-source/total)](https://github.com/zuzia-dev/DLINK-DWR-118-A1-repo-source/releases/latest) [![GitHub issues](https://img.shields.io/github/issues/zuzia-dev/DLINK-DWR-118-A1-repo-source?color=green)](https://GitHub.com/zuzia-dev/DLINK-DWR-118-A1-repo-source/issues) ![GitHub latest commit](https://img.shields.io/github/last-commit/zuzia-dev/DLINK-DWR-118-A1-repo-source?color=00BFFF) [![GitHub forks](https://img.shields.io/github/forks/zuzia-dev/DLINK-DWR-118-A1-repo-source?color=93917C)](https://GitHub.com/zuzia-dev/DLINK-DWR-118-A1-repo-source/forks) [![License: GPL v2](https://img.shields.io/badge/License-GPL_v2-blue.svg)](https://github.com/zuzia-dev/DLINK-DWR-118-A1-repo-source#license) 

#### OpenWrt 23.05 with kernel 5.15.x. for D-Link DWR-118 ver. A1
<img src="https://github.com/zuzia-dev/D-Link-DWR-118-ver.A1/blob/055f62d73578cfd74c42e76b3b496218cd41b4af/Firmware/Terminal-sysinfo-v1.jpg?raw=true" width="512" />

#### Perform the following procedures to upgrade the firmware
- ###### Method 1 - via the LuCI graphical web interface
Go to the router’s web interface at http://192.168.1.1 and login. Navigate to LuCI → System → Backup / Flash Firmware → Actions: Flash new firmware image
> Important! Uncheck "Keep settings and retain the current configuration".
- ###### Method 2 - via SSH command line
Open a terminal console on your PC and run ssh root@192.168.1.1 and respond to any prompts regarding fingerprints or passwords. Run the rest of these instructions in the shell you have just logged into on the router.
```
cd /tmp
wget https://github.com/zuzia-dev/D-Link-DWR-118-ver.A1/raw/main/Firmware/v1/openwrt-ramips-mt7620-dlink_dwr-118-a1-squashfs-sysupgrade.bin
sysupgrade -n -F openwrt-ramips-mt7620-dlink_dwr-118-a1-squashfs-sysupgrade.bin
```
> WARNING: do not turn off the router until the upgrade finishes!
- ###### Method 3 - via Recovery mode
Connect to the router with the network cable. Remove the power cable from the router. Press with a toothpick the reset button which is located on the front panel of the router such a small hole on the left side.  Turn on the power all the time holding the reset, after 10 seconds the router enters recovery mode, you can tell by the fast flashing LEDs, then let go of the reset button. Through http://192.168.123.254/upg upload the correct firmware. You should wait for the SUCCESS message which means that everything has been successful. If you have problems try another browser such as Chrome.

### License
OpenWrt is licensed under GPL-2.0
