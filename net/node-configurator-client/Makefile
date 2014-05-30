include $(TOPDIR)/rules.mk

PKG_NAME:=node-configurator-client
PKG_VERSION:=0.1.0
PKG_RELEASE:=HEAD
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/sudomesh/node-configurator-client.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/node-configurator-client
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Client for the sudo mesh node-configurator
endef

define Package/node-configurator-client/description
	This is the client for the sudo mesh node-configurator.
        It will find a running node-configurator on the local
        network, connect to it with SSL, receive an ipk
	file containing the configuration and install it.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/node-configurator-client/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/nodeconf
	$(INSTALL_DATA) ./files/config.json $(1)/etc/nodeconf/config.json
	$(CP) $(PKG_BUILD_DIR)/nodeconfclient.lua $(1)/usr/bin/	
	$(CP) $(PKG_BUILD_DIR)/dkjson.lua $(1)/usr/lib/lua/
	$(CP) $(PKG_BUILD_DIR)/getopt_alt.lua $(1)/usr/lib/lua/
	$(CP) $(PKG_BUILD_DIR)/init_script $(1)/etc/init.d/nodeconf_client
endef

$(eval $(call BuildPackage,node-configurator-client))
