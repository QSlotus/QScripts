#!/bin/bash

# Made By QiuSYan 

# 定义提示语界面函数
welcome() {
    clear
    echo -e "\e[36m欢迎使用QiuSYan的Geyser安装脚本！\e[0m"
    echo -e "\e[36m请选择一个选项：\e[0m"
    echo -e "1. \e[33mTermux换源 & 更新软件包\e[0m"
    echo -e "2. \e[33m安装常用软件\e[0m"
    echo -e "3. \e[33m安装Java环境\e[0m"
    echo -e "4. \e[33m下载 & 安装Geyser\e[0m"
    echo -e "5. \e[33m启动 Geyser\e[0m"
    # echo -e "5. \e[33m修改远程服务器信息\e[0m"
    echo -e "6. \e[33m卸载Geyser\e[0m"
    echo -e "0. \e[33m退出\e[0m"
    read -p "请输入选项（数字）: " choice
}

# 定义选项1的函数
option1() {
    clear
    echo -e "\e[36m即将开始换源...\e[0m"
    # cd ~/../usr/etc/apt
    # rm sources.list
    # curl -O https://pic.qiusyan.top/sources.list
    # cat sources.list
    # sed -i 's#.*#deb https://mirrors.ustc.edu.cn/termux/apt/termux-main stable main#g' ../usr/etc/apt/sources.list
    sed -i 's@packages.termux.org@mirrors.ustc.edu.cn/termux@' $PREFIX/etc/apt/sources.list
    cat $PREFIX/etc/apt/sources.list
    echo -e "\e[36m换源成功！\e[0m"
    echo -e "\e[36m即将开始更新软件包...\e[0m"
    