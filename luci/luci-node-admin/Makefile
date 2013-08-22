include $(TOPDIR)/rules.mk

PKG_NAME:=luci-node-admin
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/max-b/luci-node-admin.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

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
	$(CP) $(PKG_BUILD_DIR)/files $(1)/
	chmod 755 $(1)/www/cgi-bin/mesh-admin
endef

$(eval $(call BuildPackage,luci-node-admin))
