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
	DEPENDS:=+base-files
	TITLE:=Configuration for sudomesh firmware
endef

define Package/openwrt-firmware-config/description
  This is a simple package for putting settings on the sudomesh firmware
	The node configurator server will run afterwards - these are just initial settings.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
endef

define Build/Compile
endef

define Package/openwrt-firmware-config/install
	$(INSTALL_DIR) $(1)/
	$(CP) $(PKG_BUILD_DIR)/files/* $(1)/
	$(CP) $(PKG_BUILD_DIR)/scripts/* $(1)/tmp/openwrt-firmware-config-scripts
endef

define Package/openwrt-firware-config/postinst
	#!/bin/sh
	# check if we are on real system
	if [ -z "$${IPKG_INSTROOT}" ]; then
		# Any scripts that we want to run for configuring a sudomesh flashed node
		chmod 744 /tmp/openwrt-firmware-config-scripts/postinstall.sh
		/tmp/openwrt-firmware-config-scripts/postinstall.sh
		rm -rf /tmp/openwrt-firmware-config-scripts
	fi
	exit 0
endef

define Package/luci-app-peopleswifi/postrm
endef

$(eval $(call BuildPackage,luci-app-peopleswifi))

