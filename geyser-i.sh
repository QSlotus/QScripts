#!/bin/bash

# Made By QiuSYan

welcome() {
    clear
    echo "欢迎使用QiuSYan的Geyser安装脚本。"
    echo "请选择一个选项:"
    echo "1.一键安装Geyser"
    echo "2.填写远程服务器信息"
    echo "3.启动Geyser"
    echo "4.卸载Geyser"
    echo "0.退出脚本"
    read -p "请输入选项（数字）: " choice
}

option1() {
    clear
    cd ~
    curl -sSO https://get.qiusyan.top/geyser/geyser-go.sh && bash geyser-go.sh
    echo -e "\e[1m-------------------------------\e[0m"
    read -p "按回车键返回到主菜单..." enter
}

option2() {
    clear
    cd ~
    curl -sSO https://get.qiusyan.top/geyser/geyser-e.sh && bash geyser-e.sh
    echo -e "\e[1m-------------------------------\e[0m"
    read -p "按回车键返回到主菜单..." enter
}

option3() {
    clear
    cd ~/geysermc
    echo "Geyser启动中"
    java -jar geyser.jar
    echo -e "\e[1m-------------------------------\e[0m"
    read -p "按回车键返回到主菜单..." enter
}



option4() {
    clear
    cd ~
    rm -rf geysermc
    echo "Geyser卸载完成。"
    echo -e "\e[1m-------------------------------\e[0m"
    read -p "按回车键返回到主菜单..." enter
}


while true; do
    welcome  # 显示提示语界面

    case $choice in
        1) option1 ;;  # 执行选项1的函数
        2) option2 ;;
        3) option3 ;;
        4) option4 ;;
        0) break ;;    # 退出脚本
        *) echo "无效的选项，请重新输入！" ;;
    esac
    
done
