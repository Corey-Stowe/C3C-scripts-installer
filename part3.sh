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
wget https://www.dropbox.com/s/nkz6qak4i8uliec/c3c.zip?dl=1
mv c3c.zip?dl=1 c3c.zip
unzip c3c.zip
echo "Đã hoàn tất cài bot"
echo " "
echo "để config file vui lòng qua VNC để chỉnh sửa"
echo " "
#địt mẹ thằng nào làm tools .php mà không viết soucre người làm scripts thì pay acc ok
cd c3c
npm start
