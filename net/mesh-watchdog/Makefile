include $(TOPDIR)/rules.mk

PKG_NAME:=mesh-watchdog
PKG_VERSION:=0.0.1
PKG_RELEASE:=HEAD
PKG_REV:=HEAD

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
	$(call Build/Prepare/Default)
endef

define Package/mesh-watchdog/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/mesh-watchdog.init $(1)/etc/init.d/mesh-watchdog
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/config.default $(1)/etc/config/mesh-watchdog
	$(INSTALL_DIR) $(1)/opt/mesh
	$(INSTALL_BIN) ./files/mesh-watchdog.sh $(1)/opt/mesh/mesh-watchdog.sh
endef

define Package/mesh-watchdog/conffiles
/etc/config/mesh-watchdog
endef

$(eval $(call BuildPackage,mesh-watchdog))
