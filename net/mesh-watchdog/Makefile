include $(TOPDIR)/rules.mk

PKG_NAME:=mesh-watchdog
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/mesh-watchdog
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Mesh Watchdog for testing connectivity and performing relevant actions
	DEPENDS:=
endef

define Package/mesh-watchdog/description
	The watchdog just pings our mesh exit ip and if it can't connect after a certain amount of time
	it restarts our meshrouting script
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./files/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
endef

define Package/mesh-watchdog/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mesh-watchdog.init $(1)/etc/init.d/mesh-watchdog
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/config.default $(1)/etc/config/mesh-watchdog
	$(INSTALL_DIR) $(1)/opt/mesh
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mesh-watchdog $(1)/opt/mesh/mesh-watchdog
endef

define Package/mesh-watchdog/conffiles
	/etc/config/mesh-watchdog
endef

$(eval $(call BuildPackage,mesh-watchdog))
