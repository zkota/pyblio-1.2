icon16dir=$(datadir)/icons/hicolor/16x16/apps
icon22dir=$(datadir)/icons/hicolor/22x22/apps
icon24dir=$(datadir)/icons/hicolor/24x24/apps
icon32dir=$(datadir)/icons/hicolor/32x32/apps
icon48dir=$(datadir)/icons/hicolor/48x48/apps
icon128dir=$(datadir)/icons/hicolor/128x128/apps
icon256dir=$(datadir)/icons/hicolor/256x256/apps
icon512dir=$(datadir)/icons/hicolor/512x512/apps
iconscalabledir=$(datadir)/icons/hicolor/scalable/apps

icon16_DATA = 16x16/pybliographic.png
icon22_DATA = 22x22/pybliographic.png
icon24_DATA = 24x24/pybliographic.png
icon32_DATA = 32x32/pybliographic.png
icon48_DATA = 48x48/pybliographic.png
icon128_DATA = 128x128/pybliographic.png
icon256_DATA = 256x256/pybliographic.png
icon512_DATA = 512x512/pybliographic.png
iconscalable_DATA = scalable/pybliographic.svg

EXTRA_DIST =	$(icon16_DATA) \
		$(icon22_DATA) \
		$(icon24_DATA) \
		$(icon32_DATA) \
		$(icon48_DATA) \
		$(icon128_DATA) \
		$(icon256_DATA) \
		$(icon512_DATA) \
		$(iconscalable_DATA)

gtk_update_icon_cache = gtk-update-icon-cache -f -t $(datadir)/icons/hicolor

install-data-hook: update-icon-cache
uninstall-hook: update-icon-cache
update-icon-cache:
	if test -z "$(DESTDIR)"; then \
		echo "Updating Gtk icon cache."; \
		$(gtk_update_icon_cache); \
	else \
		echo "*** Icon cache not updated.  After (un)install, run this:"; \
		echo "***   $(gtk_update_icon_cache)"; \
	fi

