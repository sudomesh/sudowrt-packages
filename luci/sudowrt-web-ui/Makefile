include $(TOPDIR)/rules.mk

PKG_NAME:=sudowrt-web-ui
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/sudomesh/sudowrt-web-ui.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/sudowrt-web-ui
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:= Peoples Wifi Mesh Node Admin
	DEPENDS:=+rpcd +rpcd-mod-file +rpcd-mod-iwinfo +uhttpd +uhttpd-mod-ubus +libubox +libubus
endef

define Build/Prepare
	$(call Build/Prepare/Default)
endef

define Build/Compile
endef

define Package/sudowrt-web-ui/install
	$(INSTALL_DIR) $(1)/www
	$(CP) $(PKG_BUILD_DIR)/web-build/index.html $(1)/www/index.html
	$(INSTALL_DIR) $(1)/www/js
	$(CP) $(PKG_BUILD_DIR)/web-build/js/bundle.min.js $(1)/www/js/bundle.js
	$(INSTALL_DIR) $(1)/www/css
	$(CP) $(PKG_BUILD_DIR)/web-build/css/bundle.min.css $(1)/www/css/bundle.css
	$(INSTALL_DIR) $(1)/www/css/fonts
	$(CP) $(PKG_BUILD_DIR)/web-build/css/fonts/* $(1)/www/css/fonts/
	$(INSTALL_DIR) $(1)/usr/libexec/rpcd
	$(INSTALL_DATA) ./files/src/usr/libexec/rpcd/password $(1)/usr/libexec/rpcd/pasword
endef

define Package/sudowrt-web-ui/postinst
	#!/bin/sh
	# check if we are on real system
	if [ -z "$${IPKG_INSTROOT}" ]; then
		if [ "$$(uci -q get uhttpd.main.ubus_prefix)" != "/ubus" ]; then
			uci set uhttpd.main.ubus_prefix="/ubus"
			uci commit uhttpd
		fi
	fi
	exit 0
endef

$(eval $(call BuildPackage,sudowrt-web-ui))

