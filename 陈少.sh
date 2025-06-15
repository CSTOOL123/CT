#!/bin/bash
# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'
# 检查当前目录是否为一个目录
if [ ! -d "$PWD" ]; then
    echo "错误：当前路径不是一个目录。"
    exit 1
fi

# 遍历当前目录及其子目录下的所有文件，并添加执行权限和设置权限为777
echo "正在为当前目录及其子目录中的所有文件添加执行权限…"
find "$PWD" -type f -exec chmod 777 "{}" \; -exec chmod +x "{}" \;
echo "所有文件的执行权限已更新…"
sleep 2
clear
# 设定正确卡密
CORRECT_KEY="1"
# 最大尝试次数
MAX_TRIES=3
tries=0
while [ $tries -lt $MAX_TRIES ]; do
    echo -n "请输入卡密:"
    sleep 1
    read input_key
    if [ "$input_key" = "$CORRECT_KEY" ]; then
        echo "卡密正确，欢迎进入系统！"
        sleep 1
        echo "卡密有效期:2099-12-30-00:00"
        sleep 1
        break
    else
        tries=$((tries + 1))
        remaining_tries=$((MAX_TRIES - tries))
        if [ $remaining_tries -gt 0 ]; then
            echo -e "${RED}卡密错误，还有 $remaining_tries 次机会，请重新输入！${NC}"
        else
            echo -e "${RED}尝试次数已用完，无法进入系统！${NC}"
            exit 1
        fi
    fi
done
# 创建目录
mkdir -p "$base_dir/storage/emulated/0/陈少/打包/dat打包"
mkdir -p "$base_dir/storage/emulated/0/陈少/打包/uexp打包"
mkdir -p "$base_dir/storage/emulated/0/陈少/打包/uexp块打包"
mkdir -p "$base_dir/storage/emulated/0/陈少/Paks"
mkdir -p "$base_dir/storage/emulated/0/陈少/解包/dat解包"
mkdir -p "$base_dir/storage/emulated/0/陈少/解包/uexp解包"
mkdir -p "$base_dir/storage/emulated/0/陈少/解包/uexp块解包"
clear
# 旋转加载动画
progress_spinner() {
    local spinner="/-\|"
    local i=0
    local status="系统启动中"
    
    echo -ne "$status "
    while true; do
        local idx=$((i % ${#spinner}))
        local char="${spinner:idx:1}"
        echo -ne "\r$status $char"
        i=$((i + 1))
        sleep 0.05
        
        # 模拟加载完成
        if [ $i -gt 50 ]; then
            break
        fi
    done
    echo -e "\n系统启动完成！"
}
progress_spinner
zjm () {
clear
echo -e "${YELLOW} ██████ ███████ ████████  ██████   ██████  ██      ${NC}"
echo -e "${YELLOW}██      ██         ██    ██    ██ ██    ██ ██   ${NC}"   
echo -e "${YELLOW}██      ███████    ██    ██    ██ ██    ██ ██      ${NC}"
echo -e "${BLUE}██           ██    ██    ██    ██ ██    ██ ██      ${NC}"
echo -e "${BLUE} ██████ ███████    ██     ██████   ██████  ███████ ${NC}"
echo -e "${YELLOW}+------------------------------+${NC}"
echo -e "${YELLOW}陈少高效工具，助您一臂之力!${NC}" 
echo -e "${YELLOW}作者:陈少${NC}"
# 按照指定格式获取当前时间
formatted_time=$(date +"%Y-%m-%d %H:%M:%S")
echo -e "${YELLOW}执行时间:$formatted_time${NC}"
echo -e "${YELLOW}频道:https://t.me/csnb13${NC}"
echo -e "${YELLOW}美化主群:778011079${NC}"
echo -e "${YELLOW}+------------------------------+${NC}"
echo -e "${YELLOW}🎮和平精英${NC}"
echo -e "${YELLOW}[1]打包${NC}"
echo -e "${YELLOW}[2]解包${NC}"
echo -e "${YELLOW}[3]自动美化${NC}"
echo -e "${YELLOW}[4]音乐${NC}"
echo -e "${YELLOW}[5]创建快捷指令${NC}"
echo -e "${YELLOW}[0]Quit${NC}"
echo -e "${YELLOW}+------------------------------+${NC}"
}
repackpak () {
/data/user/0/com.termux/files/home/陈少/dbjbbms/paks -a -r $selected_file /storage/emulated/0/陈少/打包/uexp打包
}
unpackpak () {
/data/user/0/com.termux/files/home/陈少/dbjbbms/paks -a $UEXP/storage/emulated/0/陈少/Paks/$(basename "$selected_file") /storage/emulated/0/陈少/解包/uexp解包
}
kjzl () {
echo "alias 1='cd $HOME/陈少 && chmod +x 陈少.sh && ./陈少.sh'" >> $HOME/.bashrc
echo "快捷命令 '1' 已创建，你以后可以通过输入1进入工具"
source ~/.bashrc
}
lzlj () {
YELLOW='\033[1;33m'

# 定义要跳转的目标 URL
target_url=""

# 检查是否提供了自定义 URL 参数
if [ -n "$1" ]; then
  target_url="$1"
fi

# 输出提示信息
echo -e "${YELLOW}正在跳转至：$target_url"

# script系统默认浏览器打开链接
xdg-open "$target_url"
}
zdmh () {
clear
echo -e "${YELLOW}[1]云端美化${NC}"
echo -e "${YELLOW}[2]自动修改美化${NC}"
echo -e "${YELLOW}[3]载具小包修改${NC}"
echo -e "${YELLOW}[4]自动修改伪实体美化${NC}"
echo -e "${YELLOW}[5]伪实体小包修改${NC}"
echo -e "${YELLOW}[6]自动头像框/播报/大厅动作/称号/地铁金光${NC}"
echo -e "${YELLOW}[7]全自动提取dat+全自动提取特征码${NC}"
echo -e "${YELLOW}[8]自动大厅完美枪械${NC}"
echo -e "${YELLOW}[9]自动地铁原皮${NC}"
echo -e "${YELLOW}[10]自动抓小包${NC}"
echo -e "${YELLOW}[11]自动写配料表${NC}"
echo -e "${YELLOW}[12]注释与格式${NC}"
echo -e "${YELLOW}[13]偷配置${NC}"
echo -e "${YELLOW}[14]免root输出${NC}"
echo -e "${YELLOW}[15]自动配置加注解${NC}"
echo -e "${YELLOW}[16]自动写配置${NC}"
echo -e "${YELLOW}[17]对比${NC}"
echo -e "${YELLOW}[0]返回${NC}"
# 操作选择处理
while true; do
    read -p "请选择选项: " option
    sleep 1
    case $option in
        1) 
            python script/
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        2) 
            python script/自动修改美化.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        3) 
            python script/载具小包修改.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        4) 
            python script/自动修改伪实体美化.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        5) 
            python script/伪实体小包修改.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        6) 
            python script/自动其他之类.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        7) 
            python script/全自动提取dat+全自动提取特征码.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        8) 
            python script/自动大厅完美枪皮.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        9) 
            python script/自动地铁原皮.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        10) 
            python script/
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        11) 
            python script/自动写配料表.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        12) 
            python script/注释与格式.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        13) 
            python script/偷配置.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        14) 
            python script/免root输出.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        15) 
            python script/自动配置加注解.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        16) 
            python script/自动写配置.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        17) 
            python script/对比.py
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            zdmh
            break
            ;;
        0) 
            echo -e "${YELLOW}正在返回…${NC}"
            sleep 1
            zjm
            break
            ;;
        *) 
            echo -e "${BLUE}无效选项，请重新输入${NC}"
            sleep 1
            ;;
    esac
done
}
# 操作选择处理
while true; do
    zjm
    read -p "SELECT OPTION: " option
    sleep 1
    case $option in
        1)  
        dat_db() {
    echo -e "${LIGHTPURPLE}启动dat打包...${NOCOLOR}"
    echo -e "${LIGHTPURPLE}请选择要打包的 PAK 文件：${NOCOLOR}"
    select file in $(find /storage/emulated/0/陈少/Paks -name "*.pak"); do
        if [[ $REPLY -eq 0 ]]; then
            echo -e "${GREEN}操作取消 正在返回${NOCOLOR}"
            return
        elif [[ $REPLY -gt 0 && $REPLY -le $(find /storage/emulated/0/陈少/Paks  -name "*.pak" | wc -l) ]]; then
            if ! qemu-i386 dbjbbms/quickbms -w -r -r dbjbbms/打包.bms "$file" /storage/emulated/0/陈少/打包/dat打包; then
                echo -e "${RED}打包失败，错误: ${NOCOLOR}"
            else
                echo -e "${GREEN}打包成功…${NOCOLOR}"
            fi
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            jm
            break
            
        else
            echo "无效选择，请重新输入。"
        fi
    done 
}

uexp_db() {
    echo -e "${LIGHTPURPLE}启动uexp打包...${NOCOLOR}"
    prompt="请输入你的选择 :"
    options=($(find /storage/emulated/0/陈少/Paks -name "*.pak"))
    PS3="$prompt "
    select opt in "${options[@]}" "退出" ; do
        if (( REPLY == 1 + ${#options[@]} )) ; then
            break
        elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
            selected_file="${options[REPLY-1]}"
            echo "You picked ${selected_file} which is file ${REPLY}"
            repackpak
            echo -e "${GREEN}打包成功…${NOCOLOR}"
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            jm
            break
            exit
        else
            echo "Invalid option. Try another one."
        fi
    done
}

jm () {
    clear
    echo -e "${BLUE}1.dat打包${NC}"
    echo -e "${BLUE}2.uexp打包${NC}"
    echo -e "${BLUE}3.uexp块打包${NC}"
    echo -e "${BLUE}0.退出${NC}"
}

# 独立的循环逻辑，避免嵌套在函数定义内
while true; do
    jm
    read -p "请选择选项: " option
    sleep 1
    case $option in
        1) dat_db ;;
        2) uexp_db ;;
        3) uexp_kdb ;;
        0) zjm
           break ;;
        *) 
            echo -e "${BLUE}无效选项，请重新输入${NC}"
            sleep 1
            ;;
    esac
done ;;
        2)  
        dat_jb() {
            echo -e "${LIGHTPURPLE}启动dat解包...${NOCOLOR}"
            echo -e "${LIGHTPURPLE}请选择要解包的 PAK 文件：${NOCOLOR}"
            select file in $(find /storage/emulated/0/陈少/Paks -name "*.pak"); do
                if [[ $REPLY -eq 0 ]]; then
                    echo -e "${GREEN}操作取消 正在返回${NOCOLOR}"
                    return
                elif [[ $REPLY -gt 0 && $REPLY -le $(find /storage/emulated/0/陈少/Paks -name "*.pak" | wc -l) ]]; then
                    if ! qemu-i386 dbjbbms/quickbms dbjbbms/解包.bms "$file" /storage/emulated/0/陈少/解包/dat解包; then
                        echo -e "${RED}解包失败，错误: ${NOCOLOR}"
                    else
                        echo -e "${GREEN}解包成功…${NOCOLOR}"
                    fi
                    read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
                    jm
                    break
                else
                    echo "无效选择，请重新输入。"
                fi
            done
}

uexp_jb() {
            echo -e "${LIGHTPURPLE}启动uexp解包...${NOCOLOR}"
            prompt="请输入你的选择:"
            options=($(find /storage/emulated/0/陈少/Paks -name "*.pak"))
            PS3="$prompt "
            select opt in "${options[@]}" "退出" ; do
                if (( REPLY == 1 + ${#options[@]} )) ; then
                    break
                elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
                    selected_file="${options[REPLY-1]}"
                    echo "You picked ${selected_file} which is file ${REPLY}"
                    unpackpak
                    echo -e "${GREEN}解包成功…${NOCOLOR}"
                    read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
                    jm
                    break
                    exit
                else
                    echo "Invalid option. Try another one."
                fi
            done
}

jm () {
    clear
    echo -e "${YELLOW}1.dat解包${NC}"
    echo -e "${YELLOW}2.uexp解包${NC}"
    echo -e "${YELLOW}3.uexp块解包${NC}"
    echo -e "${YELLOW}0.退出${NC}"
}

# 独立的循环逻辑，避免嵌套在函数定义内
while true; do
    jm
    read -p "请选择选项: " option
    sleep 1
    case $option in
        1) dat_jb ;;
        2) uexp_jb ;;
        3) uexp_kjb ;;
        0) zjm
           break ;;
        *) 
            echo -e "${BLUE}无效选项，请重新输入${NC}"
            sleep 1
            ;;
    esac
done ;;
        3) zdmh ;;
        4) 
            bash 音乐.sh
            sleep 1
            ;;
        5) 
            kjzl
            read -p "$(echo -e "${YELLOW}按回车键返回…${NC}")"
            ;;
        0) 
            echo -e "${YELLOW}正在退出工具…${NC}"
            sleep 1
            exit 0
            ;;
        *) 
            echo -e "${BLUE}无效选项，请重新输入${NC}"
            sleep 1
            ;;
    esac
done