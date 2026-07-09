#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 修改默认 IP 地址为 192.168.6.1
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 修改默认主题为 Aurora（已去掉注释，并替换为了 aurora）
sed -i 's/luci-theme-bootstrap/luci-theme-aurora/g' feeds/luci/collections/luci/Makefile

# 修改路由器主机名为 Cudy-TR3000
sed -i 's/ImmortalWrt/Cudy-TR3000/g' package/base-files/files/bin/config_generate

# Enable USB power for Cudy TR3000 by default (如果你后续要在 USB 口插 4G/5G 手机网卡，建议把下面这行的 # 删掉以保证供电)
sed -i '/modem-power/,/};/{s/gpio-export,output = <1>;/gpio-export,output = <0>;/}' target/linux/mediatek/dts/mt7981b-cudy-tr3000-v1.dtsi

# 拉取 UA3F 核心及 LuCI 界面
git clone https://github.com/SunBK201/UA3F.git package/UA3F
