#!/bin/bash

# Made By QiuSYan

welcome() {
    clear
    echo -e "\e[36m请选择一个选项：\e[0m"
    echo -e "\e[36m1. 修改Geyser远程服务器信息\e[0m"
    echo -e "\e[36m0. 退出\e[0m"
    read -p "请输入选项（数字）: " choice
}

option1() {
    clear
    cd ~/geysermc
    # 如果存在保存地址的文件，则读取地址
    if [ -f "remote_address.txt" ]; then
        remote_address_old=$(cat "remote_address.txt")
    else
        remote_address_old="auto"
    fi
    echo -n "请输入新的远程服务器地址："
    read remote_address
    sed -i '46s/'"$remote_address_old"'/'"$remote_address"'/' config.yml
    # 将新的地址保存到文件中
    echo $remote_address > "remote_address.txt"  
   
   
    if [ -f "remote_port.txt" ]; then
        remote_port_old=$(cat "remote_port.txt")
    else
        remote_port_old="25565"
    fi
    echo -n "请输入新的远程服务器端口："
    read remote_port
    sed -i '49s/'"$remote_port_old"'/'"$remote_port"'/' config.yml    
    # 将新的地址保存到文件中
    echo $remote_port > "remote_port.txt"    
    if [ -f "remote_mode.txt" ]; then
        remote_mode_old=$(cat "remote_mode.txt")
    else
        remote_mode_old="online"
    fi
    
    echo -n "请输入新的远程服务器验证模式（online/offline）："
    read remote_mode
    sed -i '53s/'"$remote_mode_old"'/'"$remote_mode"'/' config.yml 
    # 将新的地址保存到文件中
    echo $remote_mode > "remote_mode.txt"
    
    
    echo -e "\e[1m-------------------------------\e[0m"
    
    echo -e "\e[31m\e[1m请核对您的信息：\e[0m"
    sed -n '46p;49p;53p' config.yml
    
    echo -e "\e[36m远程服务器信息更新完毕！\e[0m"
    
    echo -e "\e[36m请回到脚本主菜单并且选择启动Geyser\e[0m" 
    sleep 1
    echo -e "\e[36m待Geyser启动后请将Termux保持在后台并且打开你的Minecraft\e[0m"
    sleep 1
    echo -e "\e[36m打开Minecraft后，你将会在「好友」一栏处发现一个名为 「Geyser」的局域网游戏\e[0m"
    sleep 1
    echo -e "\e[36m点击进入即可联通到远程服务器\e[0m"

    read -p "按回车键返回到主菜单..." enter
}

while true; do
    welcome  # 显示提示语界面

    case $choice in
        1) option1 ;;  # 执行选项1的函数
        0) break ;;    # 退出脚本
        *) echo "无效的选项，请重新输入！" ;;
    esac
    
done

echo -e "\e[36m\e[1mMade By QiuSYan\e[0m"