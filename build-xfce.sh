#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
echo "install requirement============================================"
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove -y
apt-get autoclean -y
apt-get update
apt-get install -y curl git live-build

echo "cloning repository============================================="
cd ${SCRIPT_DIR}
git clone git://git.kali.org/live-build-config.git build

echo "copy config files=============================================="
cp cfg/isolinux.cfg build/kali-config/common/includes.binary/isolinux/
cp cfg/menu.cfg build/kali-config/common/includes.binary/isolinux/
cp cfg/live.cfg build/kali-config/common/includes.binary/isolinux/
cp cfg/zsh.chroot build/kali-config/common/hooks/live/
cp cfg/0031-root-password build/kali-config/common/includes.chroot/usr/lib/live/config/
cp cfg/xfce/kali.list.chroot build/kali-config/variant-xfce/package-lists/

echo "start build===================================================="
cd build
./build.sh --distribution kali-rolling --variant xfce --verbose

echo "move iso======================================================="
mkdir ${SCRIPT_DIR}/images
mv ${SCRIPT_DIR}/build/images/* ${SCRIPT_DIR}/images/
cd ${SCRIPT_DIR}
sudo rm -rf build
