# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit user

DESCRIPTION="A Gentoo like interpretation of Lakka - Default distribution for RetroArch"
HOMEPAGE="https://www.lakka.org"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="allanin retroarch"

RDEPEND="
	allanin? ( games-emulation/allanin )
	retroarch? ( games-emulation/retroarch )
"

pkg_postinst() {
	chown -R allanin:allanin /storage

	elog "Enable following systemd services with these commands"
	elog "systemctl enable sshd"
	elog "systemctl enable systemd-networkd.service"
	elog "systemctl enable systemd-resolved.service"
	elog "systemctl enable wpa_supplicant.service"
	elog "systemctl enable bluetooth.service"
	elog "systemctl enable emunin.service"
	elog "systemctl enable connman"
	elog ""
	elog "If you use udevil enable execute following commands"
	elog "systemctl enable devmon@allanin"
	elog ""
	elog "Enable following connman services with these commands"
	elog "connmanctl enable wifi"
	elog "connmanctl enable bluetooth"
	elog "connmanctl enable ethernet"
}
