include $(TOPDIR)/rules.mk

PKG_NAME:=peoplesopen-dash
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/sudomesh/peoplesopen-dash.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/peoplesopen-dash
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

define Package/peoplesopen-dash/install
	$(INSTALL_DIR) $(1)/www
	$(CP) $(PKG_BUILD_DIR)/build/* $(1)/www/
	$(INSTALL_DIR) $(1)/usr/libexec/rpcd
	$(INSTALL_BIN) ./files/src/usr/libexec/rpcd/password $(1)/usr/libexec/rpcd/password
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./files/src/usr/share/rpcd/acl.d/peoplesopen-dash.json $(1)/usr/share/rpcd/acl.d/peoplesopen-dash.json
endef

define Package/peoplesopen-dash/postinst
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

$(eval $(call BuildPackage,peoplesopen-dash))

