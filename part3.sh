#!bin/bash
echo "Final state"
apt install sudo -y
apt-get install git -y
sudo apt install curl build-essential -y
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs -y
sudo apt-get install build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev -y
sleep 3
echo "downloading data..."
wget https://doc-14-b4-docs.googleusercontent.com/docs/securesc/b09e1nvjr4minpnap01c0qr3n06u4r8s/cmecu8gia1skgmpa4pl1d2lv4i877kbg/1607162025000/17668557641953331708/17668557641953331708/1iPiy5WPC4HVoCegNb5sE8Bew8XlBP9_h?e=download
unzip c3c.zip
echo "Đã hoàn tất cài bot"
echo " "
echo "để config file vui lòng qua VNC để chỉnh sửa"
echo " "
#địt mẹ thằng nào làm tools .php mà không viết soucre người làm scripts thì pay acc ok
cd c3c
npm start
