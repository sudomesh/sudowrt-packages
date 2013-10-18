include $(TOPDIR)/rules.mk

define Package/luci-node-admin
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:= People's Wifi Mesh Node Admin
	DEPENDS:=+luci-lib-json +luci-mod-admin-core +luci-lib-httpclient +luci-theme-bootstrap
endef

define Package/luci-app-peopleswifi/prepare
endef

define Package/luci-app-peopleswifi/configure
endef

define Package/luci-app-peopleswifi/compile
endef

define Package/luci-app-peopleswifi/install
	$(CP) $(PKG_BUILD_DIR)/luasrc/* $(1)/usr/lib/lua/luci/
endef

$(eval $(call BuildPackage,luci-app-peopleswifi))

