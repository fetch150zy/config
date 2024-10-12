#!/bin/bash

TTF_DIR="/usr/share/fonts/TTF"
OTF_DIR="/usr/share/fonts/OTF"

if [ ! -d "$TTF_DIR" ]; then
    echo "TTF 字体目录不存在，正在创建..."
    sudo mkdir -p "$TTF_DIR"
fi
if [ ! -d "$OTF_DIR" ]; then
    echo "OTF 字体目录不存在，正在创建..."
    sudo mkdir -p "$OTF_DIR"
fi

for dir in */; do
    if [ -d "$dir" ]; then
        echo "正在检查目录：$dir"
        find "$dir" -iname "*.ttf" | while read -r font; do
            echo "正在安装 TTF 字体：$font"
            sudo cp "$font" "$TTF_DIR"
        done
        find "$dir" -iname "*.otf" | while read -r font; do
            echo "正在安装 OTF 字体：$font"
            sudo cp "$font" "$OTF_DIR"
        done
    else
        echo "警告：目录 $dir 不存在，跳过..."
    fi
done

echo "更新字体缓存..."
fc-cache -f

echo "所有字体已安装完成。"
