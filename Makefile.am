# This file is part of pybliographer
# 
# Copyright (C) 1998-2004 Frederic GOBRY
# Email : gobry@pybliographer.org
# 	   
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2 
# of the License, or (at your option) any later version.
#   
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details. 
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
# 
# 

DISTCHECK_CONFIGURE_FLAGS = --disable-update-desktop-database

pybdir  = $(datadir)/$(PACKAGE)
appdir  = $(datadir)/applications

SUBDIRS = 	Pyblio 		\
		.		\
		scripts		\
		tests		\
		Styles		\
		po		\
		help		\
		data


app_DATA = pybliographic.desktop

appdatadir = $(datadir)/appdata
appdata_DATA = pybliographic.appdata.xml


bin_SCRIPTS = pybliographer

EXTRA_DIST = 	setup-check.py			\
		pybrc.py 			\
	 	pybliographer.py 		\
		etc/installer.in		\
		pybliographic.appdata.xml	\
		pybliographic.desktop.in

dist-hook:
	intltool-merge -d po pybliographic.desktop.in $(distdir)/pybliographic.desktop

pybliographic.desktop: pybliographic.desktop.in po/*.po
	intltool-merge -d po pybliographic.desktop.in pybliographic.desktop \
		|| echo "**** Warning: cannot update desktop file"

pybliographer: $(top_srcdir)/pybliographer.py etc/installer
	$(SHELL) etc/installer < $(top_srcdir)/pybliographer.py > pybliographer
	chmod 755 pybliographer

install-data-local:
	mv -f $(DESTDIR)$(pybdir)/pybrc.py $(DESTDIR)$(pybdir)/pybrc.old || true
	$(INSTALL_DATA) $(srcdir)/pybrc.py $(DESTDIR)$(pybdir)
	$(Python) -c "import compileall ; compileall.compile_dir ('"$(DESTDIR)$(pybdir)"');"

update_desktop_database = update-desktop-database $(DESTDIR)$(appdir) \
	|| echo "**** Warning: cannot update mime cache (recommended for Gnome >= 2.8)"

install-data-hook: update-desktop-database
uninstall-hook: update-desktop-database
update-desktop-database:
if ENABLE_UPDATE_DESKTOP_DATABASE
	$(update_desktop_database)
endif
