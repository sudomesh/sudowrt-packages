include $(TOPDIR)/rules.mk

PKG_NAME:=notdhcpserver
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git@github.com:sudomesh/notdhcp.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/notdhcpserver
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Server side implementation of Sudomesh protocol for evented management of antenna nodes by mesh routing nodes
	DEPENDS:=+libc
endef

define Package/notdhcpserver/description
	notdhcp is how sudo mesh extender nodes get an ip from a sudo mesh home node 
  and how they establish a trust relationship upon physical connection.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
endef

define Package/notdhcpserver/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/notdhcpserver $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/notdhcpserver.init $(1)/etc/init.d/notdhcpserver
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/config.default $(1)/etc/config/notdhcpserver
endef

define Package/notdhcpserver/conffiles
/etc/config/notdhcpserver
endef

$(eval $(call BuildPackage,notdhcpserver))
