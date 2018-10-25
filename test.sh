
git clone git://git.kali.org/live-build-config.git build
cd build
CHANGE_NUM=$(cat build.sh | grep -n -A 1 "debootstrap" | grep exit | awk -F - '{print $1}')
echo $CHANGE_NUM
sed -e "${CHANGE_NUM} s/exit/# exit/g" build.sh | sudo tee build.sh
