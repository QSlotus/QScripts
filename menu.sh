#!/bin/bash

# Made By QiuSYan & ChatGPT

# 定义提示语界面函数
welcome() {
    clear
    echo -e "\e[36m欢迎使用QiuSYan的Geyser安装脚本！\e[0m"
    echo -e "\e[36m请选择一个选项：\e[0m"
    echo -e "1. \e[33mTermux换源 & 更新软件包\e[0m"
    echo -e "2. \e[33m安装常用软件 & 安装Java环境\e[0m"
    echo -e "3. \e[33m下载 & 安装Geyser\e[0m"
    echo -e "4. \e[33mGeyser，启动！\e[0m"
    # echo -e "5. \e[33m修改远程服务器信息\e[0m"
    echo -e "5. \e[33m卸载Geyser\e[0m"
    echo -e "0. \e[33m退出\e[0m"
    read -p "请输入选项（数字）: " choice
}

# 定义选项1的函数
option1() {
    clear
    echo -e "\e[36m即将开始换源...\e[0m"
    cd ~/../usr/etc/apt
    rm sources.list
    curl -O https://pic.qiusyan.top/sources.list
    cat sources.list
    # sed -i 's#.*#deb https://mirrors.ustc.edu.cn/termux/apt/termux-main stable main#g' ../usr/etc/apt/sources.list
    echo -e "\e[36m换源成功！\e[0m"
    echo -e "\e[36m即将开始更新软件包...\e[0m"
    apt-get update -y 
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
    echo -e "\e[36m软件包更新成功\e[0m"
    echo -e "\e[1m-------------------------------\e[0m"
    read -p "按回车键返回到主菜单..." enter
}

# 定义选项2的函数
option2() {
    clear
    echo -e "\e[36m开始安装常用软件...\e[0m"
    pkg install vim git wget zip unzip -y
    echo -e "\e[36m常用软件安装完毕！\e[0m"
    echo -e "已安装\e[1mvim\e[0m、\e[1mgit\e[0m、\e[1mwget\e[0m、\e[1mzip\e[0m、\e[1munzip\e[0m"
    echo -e "\e[1m-------------------------------\e[0m" 
    
    echo -e "\e[36m即将开始安装Java环境...\e[0m"
    pkg install openjdk-17 -y
    echo -e "\e[36mJava环境安装成功！\e[0m"
    echo -e "\e[36m开始验证Java环境...\e[0m"
    java -version    
    echo -e "\e[1m-------------------------------\e[0m"        
    
    read -p "按回车键返回到主菜单..." enter
}


#定义选项3的函数
option3() {
    clear
    mkdir ~/geysermc
    cd ~/geysermc
    echo -e "\e[36m开始下载Geyser...\e[0m"
    wget https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/standalone/build/libs/Geyser-Standalone.jar -O geyser.jar
    echo -e "\e[36mGeyser下载完毕！\e[0m"
    echo -e "\e[36mGeyser启动中...\e[0m"
    echo -e "\e[31m\e[1m请注意！！！\e[0m"
    echo -e "\e[31m\e[1m当Geyser启动完成后（即出现「>」后），请手动输入 geyser stop 以停止Geyser运行\e[0m"    
    java -jar geyser.jar    
    echo -e "\e[1m-------------------------------\e[0m"
   
    echo -e "\e[36m开始配置config.yml...\e[0m"
        
    echo -n "请输入远程服务器地址："
    read remote_address
    sed -i '42s/auto/'"$remote_address"'/' config.yml

    echo -n "请输入远程服务器端口："
    read remote_port
    sed -i '45s/25565/'"$remote_port"'/' config.yml

    echo -n "请输入远程服务器验证模式（online/offline）：" 
    read remote_mode
    sed -i '49s/online/'"$remote_mode"'/' config.yml
    
    echo -e "\e[1m-------------------------------\e[0m"
    
    echo -e "\e[31m\e[1m请核对您的信息：\e[0m"
    sed -n '42p;45p;49p' config.yml
    
    echo -e "\e[36m远程服务器信息填写完成！\e[0m"
    echo -e "\e[1m-------------------------------\e[0m"
    echo -e "\e[36m请回到脚本主菜单并且选择第4项\e[0m" 
    echo -e "\e[36m待Geyser启动后请将Termux保持在后台并且打开你的Minecraft\e[0m"
    echo -e "\e[36m打开Minecraft后，你将会在「好友」一栏处发现一个名为 「Geyser」的局域网游戏\e[0m"
    echo -e "\e[36m点击进入即可联通到远程服务器\e[0m"
    # option5() {
        # clear
        # cd ~/geysermc
        # echo -e "\e[36m修改远程服务器信息\e[0m"
        # echo -n "请输入新的远程服务器地址："
        # read remote_address_new
        # sed -i '42s/'"$remote_address"'/'"$remote_address_new"'/' config.yml
        # echo -n "请输入新的远程服务器端口："
        # read remote_port_new
        # sed -i '45s/'"$remote_port"'/'"$remote_port_new"'/' config.yml
        # echo -n "请输入新的远程服务器验证模式（online/offline）：" 
        # read remote_mode_new
        # sed -i '49s/'"$remote_mode_new"'/'"$remote_mode_new"'/' config.yml   
        # echo -e "\e[31m\e[1m请核对您的信息：\e[0m"
        # sed -n '42p;45p;49p' config.yml
        # read -p "按回车键返回到主菜单..." enter     
    # }
    read -p "按回车键返回到主菜单..." enter
}


option4() {
    clear
    echo -e "\e[36mGeyser启动中...\e[0m"
    cd ~/geysermc
    java -jar geyser.jar
    echo -e "\e[1m-------------------------------\e[0m"
    read -p "按回车键返回到主菜单..." enter
}


option5() {
    clear
    echo -e "\e[36m正在删除Geyser安装文件夹...\e[0m"
    rm -rf ~/geysermc
    echo -e "\e[36m删除完毕！\e[0m"
    echo -e "\e[36m如需重新安装Geyser，请运行脚本第三项。\e[0m"
    read -p "按回车键返回到主菜单..." enter 
    
}

# 主循环
while true; do
    welcome  # 显示提示语界面

    case $choice in
        1) option1 ;;  # 执行选项1的函数
        2) option2 ;;  # 执行选项2的函数
        3) option3 ;;
        4) option4 ;;
        5) option5 ;;
        0) break ;;    # 退出脚本
        *) echo "无效的选项，请重新输入！" ;;
    esac
    
done

echo -e "\e[36m谢谢使用！\e[0m"
echo -e "\e[36m\e[1mMade By QiuSYan & ChatGPT\e[0m"
