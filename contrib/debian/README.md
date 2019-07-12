
Debian
====================
This directory contains files used to package nyc3d/nyc3-qt
for Debian-based Linux systems. If you compile nyc3d/nyc3-qt yourself, there are some useful files here.

## nyc3: URI support ##


nyc3-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install nyc3-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your nyc3-qt binary to `/usr/bin`
and the `../../share/pixmaps/nyc3128.png` to `/usr/share/pixmaps`

nyc3-qt.protocol (KDE)

