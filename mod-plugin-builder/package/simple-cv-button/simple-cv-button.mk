################################################################################
#
# simple-cv-button
#
################################################################################

# Commit / tag to build from the mod-cv-plugins repository.
SIMPLE_CV_BUTTON_VERSION = ecc4ddba125d61de526a67e3e3ff1be4cfc34c08
SIMPLE_CV_BUTTON_SITE = $(call github,pilali,mod-cv-plugins,$(SIMPLE_CV_BUTTON_VERSION))

# Only this bundle is produced by the recipe.
SIMPLE_CV_BUTTON_BUNDLES = simple-cv-button.lv2

# The plugin only needs the LV2 headers at build time.
SIMPLE_CV_BUTTON_DEPENDENCIES = lv2

# Build just the simple-cv-button sub-directory, not the whole repository.
define SIMPLE_CV_BUTTON_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/source/simple-cv-button
endef

# Install the bundle into /usr/lib/lv2 inside the target.
define SIMPLE_CV_BUTTON_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/source/simple-cv-button install \
		DESTDIR=$(TARGET_DIR) PREFIX=/usr
endef

$(eval $(generic-package))
