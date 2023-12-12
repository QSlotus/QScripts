#!/bin/bash

clear

echo "Termux换源中"

sed -i 's@packages.termux.org@mirrors.ustc.edu.cn/termux@' $PREFIX/etc/apt/sources.list
cat $PREFIX/etc/apt/sources.list

echo "换源完毕"
echo "更新软件包中"

apt-get update -y
UPDATE="apt-get upgrade -y"
echo -e "Y" | $UPDATE
echo -e "Y" | $UPDATE
echo "软件包更新完毕"

echo "安装常用软件中"

INSTALL="pkg install wget -y"
echo -e "Y" | $INSTALL
echo -e "Y" | $INSTALL
echo -e "Y" | $INSTALL
echo "常用软件安装完毕"

echo "安装Java环境中"

JAVA="pkg install openjdk-17 -y"
echo -e "Y" | $JAVA
echo -e "Y" | $JAVA
echo -e "Y" | $JAVA
echo "验证Java安装"

java -version

echo "Java环境安装成功"

mkdir ~/geysermc

cd ~/geysermc

echo "开始下载Geyser"

wget https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/standalone/build/libs/Geyser-Standalone.jar -O geyser.jar 

echo "Geyser下载完成"


# JAR文件的路径
jar_path="geyser.jar"

# 创建标志文件
touch kill-geyser

# 标志文件的路径
flag_file="kill-geyser"

# 启动JAR文件
java -jar $jar_path &

# 获取JAR文件的进程ID
pid=$!

sleep 70

echo "正在生成配置文件..."
echo "配置文件生成成功"
# 如果标志文件存在，则关闭JAR文件
if [ -f $flag_file ]; then
  kill $pid
  echo "Geyser已经关闭"
else
  echo "Geyser正在运行"
fi
