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
git clone http://github.com/lequanglam/c3c
cd c3c
npm i
echo "Đã hoàn tất cài bot"
echo " "
echo "để config file vui lòng qua VNC để chỉnh sửa"
echo " "
#địt mẹ thằng nào làm tools .php mà không viết soucre người làm scripts thì pay acc ok
npm start
