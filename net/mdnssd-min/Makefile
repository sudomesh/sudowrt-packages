include $(TOPDIR)/rules.mk

PKG_NAME:=mdnssd-min
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/sudomesh/mdnssd-min.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/mdnssd-min
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Minimal mDNS and DNS-SD client
endef

define Package/mdnssd-min/description
	This package is a minimal mDNS and DNS-SD client
	that is supposed to be run for one-off queries
	asking for a service type and resulting in
	one or more hostname+ip+port triplets as answers.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	mv $(PKG_BUILD_DIR)/src/* $(PKG_BUILD_DIR)
endef

define Package/mdnssd-min/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mdnssd-min $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mdnssd-min))
