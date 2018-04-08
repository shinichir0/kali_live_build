#!/bin/bash

cd /root
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove -y
apt-get autoclean -y
apt-get update
apt-get install -y git live-build cdebootstrap
git clone git://git.kali.org/live-build-config.git build
cd build

cp /root/dotfiles-kali/cfg/isolinux.cfg /root/build/kali-config/common/includes.binary/isolinux/
cp /root/dotfiles-kali/cfg/menu.cfg /root/build/kali-config/common/includes.binary/isolinux/
cp /root/dotfiles-kali/cfg/live.cfg /root/build/kali-config/common/includes.binary/isolinux/
cp /root/dotfiles-kali/cfg/01-start-bluetooth.chroot /root/build/kali-config/common/hooks/
cp /root/dotfiles-kali/cfg/kali.list.chroot /root/build/kali-config/variant-gnome/package-lists/

./build.sh --distribution kali-rolling --variant gnome --verbose
