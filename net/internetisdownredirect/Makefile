include $(TOPDIR)/rules.mk

PKG_NAME:=internetisdownredirect
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/sudomesh/internetisdownredirect.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/internetisdownredirect
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Internet is down redirect
endef

define Package/internetisdownredirect/description
  This package is a very simple http server that responds
  with redirects to all queries. Such that the user will
  be redirected to a webserver that tells them the 
	internet is down.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	mv $(PKG_BUILD_DIR)/src/* $(PKG_BUILD_DIR)
endef

define Package/internetisdownredirect/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/internetisdownredirect $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/internetisdownredirect.init $(1)/etc/init.d/internetisdownredirect
endef

$(eval $(call BuildPackage,internetisdownredirect))
