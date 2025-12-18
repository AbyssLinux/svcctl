PREFIX ?= /usr
DESTDIR ?=
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man1
PROFILEDIR = /etc/svcctl/profiles

.PHONY: install uninstall clean

install: svcctl svcctl.1
	@echo "Installing svcctl to $(DESTDIR)$(BINDIR)..."
	install -d "$(DESTDIR)$(BINDIR)"
	install -m 755 svcctl "$(DESTDIR)$(BINDIR)/svcctl"

	@echo "Installing man page to $(DESTDIR)$(MANDIR)..."
	install -d "$(DESTDIR)$(MANDIR)"
	install -m 644 svcctl.1 "$(DESTDIR)$(MANDIR)/svcctl.1"

	@echo "Installing profiles to $(DESTDIR)$(PROFILEDIR)..."
	install -d "$(DESTDIR)$(PROFILEDIR)"
	@for profile_dir in template/profiles/*; do \
		if [ -d "$$profile_dir" ]; then \
			echo "Installing profile: $$(basename "$$profile_dir")"; \
			cp -a "$$profile_dir" "$(DESTDIR)$(PROFILEDIR)/"; \
		fi; \
	done

uninstall:
	rm -f "$(BINDIR)/svcctl"
	rm -f "$(MANDIR)/svcctl.1"
	rm -rf "$(PROFILEDIR)"

clean:
	@echo "Cleaning up..."
