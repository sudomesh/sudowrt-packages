include $(TOPDIR)/rules.mk

PKG_NAME:=openwrt-firmware-config
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/sudomesh/openwrt-firmware-config.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/openwrt-firmware-config
	SECTION:=base
	CATEGORY:=Base system
	TITLE:=Configuration for sudomesh firmware
endef

define Package/openwrt-firmware-config/description
  This is a simple package for putting settings on sudomesh firmware
	This is installed on home nodes as well as extender nodes
	For home nodes, the node configurator server will run afterwards
	These are shared functions and/or initial settings
endef

define Build/Prepare
	$(call Build/Prepare/Default)
endef

define Build/Compile
endef

define Package/openwrt-firmware-config/install
	$(INSTALL_DIR) $(1)/
	mkdir -p $(1)/tmp/openwrt-firmware-config-scripts
	$(CP) $(PKG_BUILD_DIR)/init-scripts/* $(1)/tmp/openwrt-firmware-config-scripts
	mkdir -p $(1)/usr/share/sudomesh
	$(CP) $(PKG_BUILD_DIR)/functions/* $(1)/usr/share/sudomesh/
endef

define Package/openwrt-firmware-config/postinst
	#!/bin/sh
	# check if we are on real system
	if [ -z "$${IPKG_INSTROOT}" ]; then
		chmod 744 /usr/share/sudomesh/*
		# Any scripts that we want to run for configuring a sudomesh flashed node
		chmod 744 /tmp/openwrt-firmware-config-scripts/postinstall.sh
		/tmp/openwrt-firmware-config-scripts/postinstall.sh
		rm -rf /tmp/openwrt-firmware-config-scripts
	fi
	exit 0
endef

define Package/openwrt-firmware-config/postrm
endef

$(eval $(call BuildPackage,openwrt-firmware-config))

