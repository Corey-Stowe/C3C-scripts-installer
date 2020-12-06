#!bin/bash
apt install wget -y
apt-mark hold udisks2
[ ! -f /root/.parrot ] && apt-get update || echo "Parrot detected, not updating apt cache since that will break the whole distro"
apt-get install keyboard-configuration -y
apt-get install sudo wget -y
apt-get install xfce4 xfce4-terminal tigervnc-standalone-server -y
apt-get install xfe -y
apt-get clean

mkdir ~/.vnc
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/XFCE4/xstartup -P ~/.vnc/
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/XFCE4/vncserver-start -P /usr/local/bin/
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/XFCE4/vncserver-stop -P /usr/local/bin/

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vncserver-start
chmod +x /usr/local/bin/vncserver-stop

echo " "

echo "Cài trình duyệt "

echo "Removing distribution provided chromium packages and dependencies..."
apt purge chromium* chromium-browser* snapd -y -qq && apt autoremove -y -qq
sudo apt purge chromium* chromium-browser* -y -qq && apt autoremove -y -qq
apt update -qq; apt install software-properties-common gnupg --no-install-recommends -y -qq
echo "Adding Debian repo for Chromium installation"

echo "deb http://ftp.debian.org/debian buster main
deb http://ftp.debian.org/debian buster-updates main" >> /etc/apt/sources.list

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A

apt update -y
apt install chromium -y

sed -i 's/chromium %U/chromium --no-sandbox %U/g' /usr/share/applications/chromium.de
echo "Đã hoàn thành cài desktop vui lòng kết nối desktop bằng VNC"
echo " "
echo "Khi đến đoạn mật khẩu nó sẽ hỏi đặt mật khẩu cho VNC"
echo " "
echo "Bạn có thể đặt mật khẩu từ 1-8 hoặc tùy ý."
echo " "
echo "Địa chỉ IP của bạn khi kết nối với VNC 127.0.0.1:5901"
echo " "
echo "Hoặc IP của máy bạn 192.168.xxx.xxx:5901"
echo " "
echo " "
echo " "
echo " "
echo "Để chạy remote dektop dùng lệnh vncserver-start"
echo " "
echo " "
echo " "
echo "Để tắt remote desktop dùng lệnh vncserver-stop"
echo " "
echo " "
echo " "

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile
sleep 5

#địt mẹ thằng nào làm tools .php mà không viết soucre người làm scripts thì pay acc ok

vncserver-start
