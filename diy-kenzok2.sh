#!/bin/sh
#
#

# Modify default ip & theme
sed -i 's/192.168.1.1/192.168.31.2/g' package/base-files/files/bin/config_generate
# 删除自定义源默认的 argon 主题
#rm -rf package/lean/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon
# 部分第三方源自带 argon 主题，上面命令删除不掉的请运行下面命令
#find ./ -name luci-theme-argon | xargs rm -rf;
# 针对 lede 项目拉取 argon 原作者的适用源码
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
# 替换默认主题为 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds/luci/collections/luci/Makefile

# 删除以下feed源重复的软件包
# lede: https://github.com/coolsnowwolf/luci
# kenzok8: https://github.com/kenzok8/openwrt-packages

# lede ./feeds/luci
rm -rf feeds/luci/applications/luci-app-diskman
rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-serverchan

# kenzok8 ./feeds/kenzo
rm -rf feeds/kenzo/luci-app-aliyundrive-webdav
rm -rf feeds/kenzo/luci-app-easymesh
rm -rf feeds/kenzo/luci-app-pushbot

# 自定义添加额外软件包
# 甜糖心愿自动收集
svn co https://github.com/jerrykuku/luci-app-ttnode/trunk package/luci-app-ttnode

# Update feeds
./scripts/feeds update -a
./scripts/feeds install -a
