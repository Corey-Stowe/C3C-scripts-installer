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
wget https://uc51440e45aa7038ece6c63c4712.dl.dropboxusercontent.com/cd/0/get/BEV08xgONf4qdXcY_7eCLXwHUS7TtdKOU0gVjwjBGsytwPHtST82TxpTLqSLoA6-oz20GBZM33ykNdNMDrZnpaWtGf9OwLh4Kc8vAh6q0n_o7LQ0fEny9HFFxwc3Ar15PT8/file?dl=1
unzip c3c.zip
echo "Đã hoàn tất cài bot"
echo " "
echo "để config file vui lòng qua VNC để chỉnh sửa"
echo " "
#địt mẹ thằng nào làm tools .php mà không viết soucre người làm scripts thì pay acc ok
cd c3c
npm start