include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-peopleswifi
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/sudomesh/luci-app-peopleswifi.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-peopleswifi
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:= Peoples Wifi Mesh Node Admin
	DEPENDS:=+luci-lib-json +luci-mod-admin-core +luci-lib-httpclient +luci-theme-bootstrap
endef

define Build/Prepare
	$(call Build/Prepare/Default)
endef

define Build/Compile
endef

define Package/luci-app-peopleswifi/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	$(CP) $(PKG_BUILD_DIR)/luasrc/* $(1)/usr/lib/lua/luci/
endef

define Package/luci-app-peopleswifi/postinst
	#!/bin/sh
	# check if we are on real system
	if [ -z "$${IPKG_INSTROOT}" ]; then
		# Delete the default theme from luci so that we're always using the fancy bootstrap one
		sed -i '/OpenWrt/d' /etc/config/luci	        
		sed -i 's/openwrt.org/bootstrap/g' /etc/config/luci	        
		# Restart the http server
		/etc/init.d/uhttpd restart
		# This creates a "homeuser" account which can access the limited admin panel with password "homeuser"
		echo "homeuser::100:0:home:/tmp:/bin/false" >> /etc/passwd
		(
		echo "homeuser"
		sleep 1
		echo "homeuser"
		)|passwd homeuser
	fi
	exit 0
endef

define Package/luci-app-peopleswifi/postrm
	#!/bin/sh
	sed -i '/homeuser/d' /etc/passwd
	exit 0
endef

$(eval $(call BuildPackage,luci-app-peopleswifi))

