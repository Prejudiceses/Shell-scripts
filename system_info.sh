#!/bin/bash
# ================================================
# 系统信息查看脚本
# 功能：一键查看服务器的 CPU、内存、磁盘、网络情况
# 使用方法：bash system_info.sh
# ================================================

echo "=============================="
echo "       系统信息总览"
echo " 时间：$(date '+%Y-%m-%d %H:%M:%S')"
echo "=============================="

# 系统基本信息
echo ""
echo "【系统版本】"
uname -a

# CPU 使用情况
echo ""
echo "【CPU 使用率】"
top -bn1 | grep "Cpu(s)" | awk '{print "当前 CPU 使用率：" $2 "%"}'

# 内存使用情况
echo ""
echo "【内存使用情况】"
free -h | awk 'NR==2{printf "总内存：%s | 已使用：%s | 剩余：%s\n", $2, $3, $4}'

# 磁盘使用情况
echo ""
echo "【磁盘使用情况】"
df -h | grep -v tmpfs | awk 'NR==1 || /^\// {printf "%-20s %-8s %-8s %-8s %s\n", $1, $2, $3, $4, $5}'

# 网络信息
echo ""
echo "【网络 IP 地址】"
ip addr | grep "inet " | awk '{print $2}'

# 检查 Nginx 是否在运行
echo ""
echo "【Nginx 运行状态】"
if systemctl is-active --quiet nginx; then
    echo "Nginx 正在运行 ✓"
else
    echo "Nginx 未运行"
fi

echo ""
echo "=============================="
echo "          查看完毕"
echo "=============================="
