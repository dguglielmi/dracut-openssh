MODULE_NAME = 60openssh
MODULE_VERSION = 0.3

PREFIX =
DRACUT_MODULEDIR ?= $(PREFIX)/usr/lib/dracut/modules.d
DRACUT_CONFIGDIR ?= $(PREFIX)/etc/dracut.conf.d

INSTALL ?= install

all:

install: dracut-openssh.conf module-setup.sh sshd-banner sshd_config sshd.service
	@$(INSTALL) -d -m 0755 $(DRACUT_CONFIGDIR)
	$(INSTALL) -m 0644 dracut-openssh.conf $(DRACUT_CONFIGDIR)/
	@$(INSTALL) -d -m 0755 $(DRACUT_MODULEDIR)/$(MODULE_NAME)/
	$(INSTALL) -m 0644 sshd-banner $(DRACUT_MODULEDIR)/$(MODULE_NAME)/
	$(INSTALL) -m 0644 sshd_config $(DRACUT_MODULEDIR)/$(MODULE_NAME)/
	$(INSTALL) -m 0644 sshd.service $(DRACUT_MODULEDIR)/$(MODULE_NAME)/
	$(INSTALL) -m 0755 module-setup.sh $(DRACUT_MODULEDIR)/$(MODULE_NAME)/
