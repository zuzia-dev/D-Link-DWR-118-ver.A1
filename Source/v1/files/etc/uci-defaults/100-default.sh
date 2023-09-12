/etc/init.d/adblock enable

mkdir -p /mnt/sda1

rm /etc/ssl/certs/9168f543.0
rm /etc/ssl/certs/TÜRKTRUST_Elektronik_Sertifika_Hizmet_Sağlayıcısı_H5.crt
rm /etc/ssl/certs/7992b8bb.0
rm /etc/ssl/certs/451b5485.0
rm /etc/ssl/certs/a760e1bd.0
rm /etc/ssl/certs/Certplus_Root_CA_G1.crt
rm /etc/ssl/certs/Visa_eCommerce_Root.crt
rm /etc/ssl/certs/2c11d503.0
rm /etc/ssl/certs/Certplus_Root_CA_G2.crt
rm /etc/ssl/certs/OpenTrust_Root_CA_G1.crt
rm /etc/ssl/certs/OpenTrust_Root_CA_G2.crt
rm /etc/ssl/certs/608a55ad.0
rm /etc/ssl/certs/87229d21.0
rm /etc/ssl/certs/OpenTrust_Root_CA_G3.crt

chmod +x /etc/rc.local

uci set luci.ccache.enable=0
uci commit luci

uci del uhttpd.main.listen_https
uci set uhttpd.main.script_timeout='120'
uci set uhttpd.main.redirect_https='0'
uci set uhttpd.main.http_keepalive='0'
uci set uhttpd.main.max_requests='1'
uci set uhttpd.main.network_timeout='40'
uci commit uhttpd

uci set luci.sauth.sessiontime='360'
uci set luci.apply.rollback='60'
uci commit luci

chmod 4755 /usr/bin
chmod 4755 /usr/sbin

cat << EOF >> /etc/profile
PS1='\e[1;31m\u@\h: \e[31m\W\e[0m\$ '
EOF

chmod -R 777 /mnt/sda1

uci set system.ntp.enabled=1
uci commit system

chmod +x /usr/share/3ginfo/cgi-bin/3ginfo.sh

ln -s /etc/init.d/wpad /etc/init.d/hostapd
chmod +x /etc/init.d/smsled
chmod +x /sbin/smsled-init.sh

chmod -R u=rwX,go= /etc/dropbear

#ln -s /usr/lib/libiwinfo.so.20210430 /usr/lib/libiwinfo.so

touch /var/etc/timecontrol.include

chmod +x /usr/bin/watchdog2cron.sh
chmod +x /usr/bin/lite-watchdog-data.sh
chmod +x /usr/bin/lite_watchdog.sh
chmod +x /sbin/cronsync.sh
chmod +x /sbin/set_sms_ports.sh
chmod +x /sbin/smsled-init.sh
chmod +x /sbin/smsled.sh

uci set system.@system[0].description='DLINK DWR-118'
uci set system.@system[0].notes='ver. A1'
uci commit system

chgrp root /dev/crypto
chmod g+r /dev/crypto
chmod o+r /dev/crypto

sed -i 's|START=30|START=30|g' /etc/init.d/adblock

hexdump -ve '1/4 "%.8x\n"' /rom//lib/modules/$(uname -r)/mt76x0-common.ko|sed -e 's/^122c54f2/122c3cf2/' |sed -re 's/(..)(..)(..)(..)/\\\\x\4\\\\x\3\\\\x\2\\\\x\1/g'|  xargs -n1 printf >  /tmp/mt76x0-common.ko
rm /lib/modules/$(uname -r)/mt76x0-common.ko
cp /tmp/mt76x0-common.ko /lib/modules/$(uname -r)

uci del network.globals.ula_prefix
uci set network.globals.packet_steering='1'
uci set network.wan.device='eth0.2'
uci set network.wan.proto='dhcp'
uci set network.wan.metric='20'
uci set network.wan.peerdns='0'
uci set network.wan.dns='127.0.0.1'
uci set network.wan6=interface
uci set network.wan6.device='eth0.2'
uci set network.wan6.proto='dhcpv6'
uci set network.wan6.peerdns='0'
uci commit network

cat << EOF >> /etc/config/network

config interface 'wwan'
	option proto 'dhcp'
	option ipv6 '1'
	option auto '1'
	option metric '10'
	option device 'usb0'
	option peerdns '0'
	option dns '127.0.0.1'

config interface 'umts'
	option proto '3g'
	option device '/dev/ttyUSB0'
	option service 'umts'
	option apn 'internet'
	option dialnumber '*99***1#'
	option ipv6 '1'
	option auto '1'
	option metric '10'
	option peerdns '0'
	option dns '127.0.0.1'

config interface 'hilink'
	option proto 'dhcp'
	option ipv6 '0'
	option metric '10'
	option device 'eth1'
	option delegate '0'
	option auto '1'
	option peerdns '0'
	option dns '127.0.0.1'

config interface 'wg0'
	option proto 'wireguard'
	option listen_port '55055'
	list addresses '10.9.0.1/24'
	option private_key 'aNcfPPirZGQrgFDHw07dgRqoSnP/Kni45ITneZlFFng='
	option ipv6 '0'
	option auto '0'
	option metric '10'

config wireguard_wg0
	option public_key 'Axn5g0cb0eYEc8utzM/2FXZ0vSdIE8AwxmUGfQBwzEY='
	option route_allowed_ips '1'
	list allowed_ips '10.9.0.3/32'
	option persistent_keepalive '25'
	option description 'android'
	option ipv6 '0'
	option auto '0'

config interface 'PPTP'
	option proto 'pptp'
	option keepalive '0'
	option ipv6 '0'
	option auto '0'
	option server 'pl02.vpnonline.eu'
	option username 'twoj login'
	option password 'twoje haslo'
	option metric '10'

config interface 'TUN'
	option proto 'none'
	option delegate '0'
	option auto '1'
	option metric '10'
	option device 'tun0'
EOF

uci commit network

cd /usr/bin
rm -rf awk
ln -s gawk awk
cd -

