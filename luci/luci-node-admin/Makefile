include $(TOPDIR)/rules.mk

PKG_NAME:=luci-node-admin
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD
PKG_REV:=HEAD
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-node-admin
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:= People's Wifi Mesh Node Admin
	DEPENDS:=+luci-lib-json +luci-mod-admin-core +luci-lib-httpclient +luci-theme-bootstrap
endef

define Package/luci-node-admin/description
	Stripped down admin page for folks who are hosting nodes to administrate simple functionality.  
endef

define Build/Prepare	
endef

define Package/luci-node-admin/install
	$(CP) ./files/* $(1)/
	chmod 755 $(1)/www/cgi-bin/node-admin
endef

$(eval $(call BuildPackage,luci-node-admin))
