#!/bin/sh
# 自用
# 拉取lede源码后，自定义feeds

# 添加kenzok8 的 luci包
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
