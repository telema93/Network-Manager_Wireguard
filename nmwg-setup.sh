#!/bin/bash
echo -n "Enter your sudo passord: "
read supassw
echo $supassw | sudo -S apt install wireguard git dh-autoreconf libglib2.0-dev intltool build-essential libgtk-3-dev libnma-dev libsecret-1-dev network-manager-dev resolvconf
git clone https://github.com/max-moser/network-manager-wireguard
cd network-manager-wireguard
./autogen.sh --without-libnm-glib
./configure --without-libnm-glib --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/lib/NetworkManager --localstatedir=/var
echo $supassw | sudo -S make install
echo $supassw | sudo -S systemctl restart NetworkManager.service
echo -e "\e[32mInstallation completed\e[0m""
