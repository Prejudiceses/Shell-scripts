#!/bin/bash
# ================================================
# 文件备份脚本
# 功能：将指定目录打包备份，自动按日期命名
# 使用方法：bash backup.sh
# ================================================

# 要备份的目录
SOURCE_DIR="/home/$(whoami)/documents"

# 备份保存的位置
BACKUP_DIR="/home/$(whoami)/backups"

# 按日期生成备份文件名
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# 如果备份目录不存在就创建
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "已创建备份目录：$BACKUP_DIR"
fi

# 如果源目录不存在就报错退出
if [ ! -d "$SOURCE_DIR" ]; then
    echo "错误：源目录 $SOURCE_DIR 不存在"
    exit 1
fi

# 执行备份
echo "开始备份 $SOURCE_DIR ..."
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# 判断备份是否成功
if [ $? -eq 0 ]; then
    echo "备份成功！文件保存在：$BACKUP_FILE"
else
    echo "备份失败，请检查权限或磁盘空间"
fi
