##  D-Link DWR-118 ver. A1
[![Openwrt](https://img.shields.io/badge/os-OpenWrt-<COLOR>.svg)](https://github.com/zuzia-dev/openwrt/) [![GitHub release (latest by date)](https://img.shields.io/github/v/release/zuzia-dev/D-Link-DWR-118-ver.A1?color=orange)](https://github.com/zuzia-dev/D-Link-DWR-118-ver.A1/releases/latest) [![GitHub Downloads](https://img.shields.io/github/downloads/zuzia-dev/D-Link-DWR-118-ver.A1/total)](https://github.com/zuzia-dev/D-Link-DWR-118-ver.A1/releases/latest) [![GitHub issues](https://img.shields.io/github/issues/zuzia-dev/D-Link-DWR-118-ver.A1?color=green)](https://GitHub.com/zuzia-dev/D-Link-DWR-118-ver.A1/issues) ![GitHub latest commit](https://img.shields.io/github/last-commit/zuzia-dev/D-Link-DWR-118-ver.A1?color=00BFFF) [![GitHub forks](https://img.shields.io/github/forks/zuzia-dev/D-Link-DWR-118-ver.A1?color=93917C)](https://GitHub.com/zuzia-dev/D-Link-DWR-118-ver.A1/forks) [![License: GPL v2](https://img.shields.io/badge/License-GPL_v2-blue.svg)](https://github.com/zuzia-dev/D-Link-DWR-118-ver.A1#license) 

#### OpenWrt 23.05-SNAPSHOT with kernel 5.15.x. for D-Link DWR-118 ver. A1
<img src="https://github.com/zuzia-dev/D-Link-DWR-118-ver.A1/blob/055f62d73578cfd74c42e76b3b496218cd41b4af/Firmware/Terminal-sysinfo-v1.jpg?raw=true" width="640" />

- ####   Features included & software
Support 3G-LTE modems, file system ext4, exfat, vfat, msdos, f2fs, ntfs, IPv6 protocol. Software: Adblock (configured and active), DNScrypt-proxy (configured and active), DDNS, LuCI with internationalization and localization (en, pl), 3GInfo, Disk Info, Htop, Nano, Nlbwmon, OpenSSL, OpenVPN, Smartmontools, Sysinfo, SMS-Tool, WPAD (full with OpenSSL), Wireguard, CPU utilization info & Internet detector, script Sysinfo (by Cezary Jackiewicz) and many more.

- ####    Wireless
> Wi-Fi is active, WPA2+AES is set as encryption. 
- Network 5 GHz - SSID: wifi5ghz
- Network 2.4 GHz - SSID: wifi2ghz
- Default password: WiFipassword

#### Installing and upgrading Firmware
- ###### Method 1 - via the D-Link graphical web interface
From the original manufacturer's software, select unknown sources and upload the file [* factory.bin](https://github.com/zuzia-dev/D-Link-DWR-118-ver.A1/raw/main/Firmware/v1/openwrt-ramips-mt7620-dlink_dwr-118-a1-squashfs-factory.bin). The procedure for uploading and booting for the first time takes about 10 minutes. You should wait for the router to restart automatically! The router will be available at: http://192.168.1.1
- ###### Method 2 - via the LuCI graphical web interface
Go to the router’s web interface at http://192.168.1.1 and login. Navigate to LuCI → System → Backup / Flash Firmware. Choose a file [*sysupgrade.bin](https://github.com/zuzia-dev/D-Link-DWR-118-ver.A1/raw/main/Firmware/v1/openwrt-ramips-mt7620-dlink_dwr-118-a1-squashfs-sysupgrade.bin) → Actions: Flash new firmware image.
> Important! Uncheck "Keep settings and retain the current configuration".
- ###### Method 3 - via SSH command line
Open a terminal console on your PC and run ssh root@192.168.1.1 and respond to any prompts regarding fingerprints or passwords. Run the rest of these instructions in the shell you have just logged into on the router.
```
cd /tmp
wget https://github.com/zuzia-dev/D-Link-DWR-118-ver.A1/raw/main/Firmware/v1/openwrt-ramips-mt7620-dlink_dwr-118-a1-squashfs-sysupgrade.bin
sysupgrade -n -F openwrt-ramips-mt7620-dlink_dwr-118-a1-squashfs-sysupgrade.bin
```
> WARNING: do not turn off the router until the upgrade finishes!
- ###### Method 4 - via Recovery mode
Connect to the router with the network cable. Remove the power cable from the router. Press with a toothpick the reset button which is located on the front panel of the router such a small hole on the left side.  Turn on the power all the time holding the reset, after 10 seconds the router enters recovery mode, you can tell by the fast flashing LEDs, then let go of the reset button. Through http://192.168.123.254/upg upload the correct firmware. You should wait for the SUCCESS message which means that everything has been successful. If you have problems - try another browser such as Chrome.

### License
OpenWrt is licensed under GPL-2.0
