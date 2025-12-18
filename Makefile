PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man1

.PHONY: install uninstall clean

install: svcctl svcctl.1
	@echo "Installing svcctl to $(BINDIR)..."
	install -d $(BINDIR)
	install -m 755 svcctl $(BINDIR)/svcctl
	@echo "Installing man page to $(MANDIR)..."
	install -d $(MANDIR)
	install -m 644 svcctl.1 $(MANDIR)/svcctl.1
	@echo "Installing profiles..."
	@if [ "$(shell id -u)" -eq 0 ]; then \
		sh template/install.sh; \
	else \
		sudo sh template/install.sh; \
	fi
	@echo "Installation complete."

uninstall:
	@echo "Removing svcctl from $(BINDIR)..."
	rm -f $(BINDIR)/svcctl
	@echo "Removing man page from $(MANDIR)..."
	rm -f $(MANDIR)/svcctl.1
	@echo "Uninstallation complete."

clean:
	@echo "Cleaning up..."
