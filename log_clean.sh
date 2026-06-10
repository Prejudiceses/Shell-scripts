#!/bin/bash
# ================================================
# 日志清理脚本
# 功能：删除指定天数之前的旧日志文件
# 使用方法：bash log_clean.sh
# ================================================

# 日志目录
LOG_DIR="/var/log"

# 保留最近几天的日志（超过这个天数的会被删除）
KEEP_DAYS=7

echo "=============================="
echo " 日志清理脚本"
echo " 清理 $KEEP_DAYS 天前的日志"
echo "=============================="

# 查找并显示即将被删除的文件
echo ""
echo "以下文件将被删除："
find "$LOG_DIR" -name "*.log" -mtime +$KEEP_DAYS -type f

echo ""
read -p "确认删除？(y/n): " CONFIRM

if [ "$CONFIRM" = "y" ]; then
    # 执行删除
    find "$LOG_DIR" -name "*.log" -mtime +$KEEP_DAYS -type f -delete
    echo "清理完成！"
else
    echo "已取消，未删除任何文件"
fi
