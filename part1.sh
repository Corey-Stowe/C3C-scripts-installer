#!bin/bash
echo "----------------C3C installer setup path-------------------"
echo "Dựa Theo Bản Gốc trên C3C bot trên Github"
echo " "
echo "Leader source: Lê Quang lâm (URI)"
echo " "
echo "Admin : Nguyễn Hải Anh (Kidchoi), Trương Gia Hy, Nguyễn Minh Hiếu,...."
echo " "
echo "Setup bởi Stowe(Edd)"
echo " "
echo "+ v 1.0"
echo " "
echo "----------------------------------------------------------"
echo "Tiến hành cài sau 5s..."
sleep 5
sudo pkg install python && pkg install python2 -y
sleep 3
pkg install wget openssl-tool proot tar -y && hash -r && wget
sleep 3 
#!/data/data/com.termux/files/usr/bin/bash
pkg install wget -y 
folder=ubuntu-fs
if [ -d "$folder" ]; then
	first=1
	echo "Bỏ qua"
fi
tarball="ubuntu-rootfs.tar.xz"
if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
		echo "Đang tải file cần thiết. Nó nhanh hay chậm tùy mạng nhà bạn"
		case `dpkg --print-architecture` in
		aarch64)
			archurl="arm64" ;;
		arm)
			archurl="armhf" ;;
		amd64)
			archurl="amd64" ;;
		x86_64)
			archurl="amd64" ;;	
		i*86)
			archurl="i386" ;;
		x86)
			archurl="i386" ;;
		*)
			echo "unknown architecture"; exit 1 ;;
		esac
		wget "https://github.com/Techriz/AndronixOrigin/blob/master/Rootfs/Ubuntu/${archurl}/ubuntu-rootfs-${archurl}.tar.xz?raw=true" -O $tarball
fi
	cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
	echo "Decompressing Rootfs, please be patient."
	proot --link2symlink tar -xJf ${cur}/${tarball}||:
	cd "$cur"
fi
mkdir -p ubuntu-binds
bin=start-ubuntu.sh
echo "writing launch script"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A ubuntu-binds)" ]; then
    for f in ubuntu-binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b ubuntu-fs/root:/dev/shm"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to / 
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

echo "fixing shebang of $bin"
termux-fix-shebang $bin
echo "making $bin executable"
chmod +x $bin
echo "removing image for some space"
rm $tarball
echo "Đã Hoàn thành vui lòng sử dụng ./${bin} để bắt đầu."
echo "vui lòng cài scipts tiếp theo."
#địt mẹ thằng nào làm tools .php mà không viết soucre người làm scripts thì pay acc ok
