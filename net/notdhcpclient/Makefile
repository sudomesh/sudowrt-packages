include $(TOPDIR)/rules.mk

PKG_NAME:=notdhcpclient
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git@github.com:sudomesh/notdhcp.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/notdhcpclient
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Client side implementation of Sudomesh protocol for evented management of antenna nodes by mesh routing nodes
endef

define Package/notdhcpclient/description
	notdhcp is how sudo mesh extender nodes get an ip from a sudo mesh home node 
  and how they establish a trust relationship upon physical connection.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	mv $(PKG_BUILD_DIR)/* $(PKG_BUILD_DIR)
endef

define Package/notdhcpclient/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/notdhcpclient $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/notdhcpclient.init $(1)/etc/init.d/notdhcpclient
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/config.default $(1)/etc/config/notdhcpclient
endef

define Package/notdhcpclient/conffiles
/etc/config/notdhcpclient
endef

$(eval $(call BuildPackage,notdhcpclient))
