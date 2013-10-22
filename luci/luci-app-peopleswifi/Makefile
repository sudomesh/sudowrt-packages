include $(TOPDIR)/rules.mk

include $(INCLUDE_DIR)/package.mk

define Package/luci-node-admin
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:= People's Wifi Mesh Node Admin
	DEPENDS:=+luci-lib-json +luci-mod-admin-core +luci-lib-httpclient +luci-theme-bootstrap
endef

define Build/Prepare
	$(call Build/Prepare/Default)
endef

define Build/Compile
endef

define Package/luci-app-peopleswifi/install
	$(INSTALL_DIR) $(1)/
	$(CP) $(PKG_BUILD_DIR)/luasrc/* $(1)/usr/lib/lua/luci/
endef

define Package/luci-app-peopleswifi/postinst
	#!/bin/sh
	# check if we are on real system
	if [ -z "$${IPKG_INSTROOT}" ]; then
		# Delete the default theme from luci so that we're always using the fancy bootstrap one
		sed -i '/OpenWrt/d' /etc/config/luci	        
	fi
	exit 0
endef

$(eval $(call BuildPackage,luci-app-peopleswifi))

