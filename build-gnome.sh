#!/bin/bash

echo "install requirement============================================"
cd /root
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove -y
apt-get autoclean -y
apt-get update
apt-get install -y curl git live-build

echo "cloning repository============================================="
git clone git://git.kali.org/live-build-config.git build
cd build

echo "copy config files=============================================="
cp /root/kali_live_build/cfg/isolinux.cfg /root/build/kali-config/common/includes.binary/isolinux/
cp /root/kali_live_build/cfg/menu.cfg /root/build/kali-config/common/includes.binary/isolinux/
cp /root/kali_live_build/cfg/live.cfg /root/build/kali-config/common/includes.binary/isolinux/
cp /root/kali_live_build/cfg/zsh.chroot /root/build/kali-config/common/hooks/live/
cp /root/kali_live_build/cfg/0031-root-password /root/build/kali-config/common/includes.chroot/usr/lib/live/config/
cp /root/kali_live_build/cfg/gnome/kali.list.chroot /root/build/kali-config/variant-gnome/package-lists/

echo "start build===================================================="
./build.sh --distribution kali-rolling --variant gnome --verbose
