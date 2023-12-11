#!/bin/bash

# Made By QiuSYan

welcome() {
    clear
    echo -e "\e[36m请选择一个选项：\e[0m"
    echo -e "\e[36m1. 更改Geyser远程服务器信息\e[0m"
    echo -e "\e[36m0. 退出\e[0m"
    read -p "请输入选项（数字）: " choice
}

option1() {
    clear
    cd ~/geysermc
    echo -n "请输入新的远程服务器地址："
    read remote_address
    sed -i '46s/auto/'"$remote_address"'/' config.yml

    echo -n "请输入新的远程服务器端口："
    read remote_port
    sed -i '49s/25565/'"$remote_port"'/' config.yml

    echo -n "请输入新的远程服务器验证模式（online/offline）：" 
    read remote_mode
    sed -i '53s/online/'"$remote_mode"'/' config.yml
    
    echo -e "\e[1m-------------------------------\e[0m"
    
    echo -e "\e[31m\e[1m请核对您的信息：\e[0m"
    sed -n '46p;49p;53p' config.yml
    
    echo -e "\e[36m远程服务器信息更新完毕！\e[0m"
    
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