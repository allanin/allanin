# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit user eutils toolchain-funcs versionator git-r3

DESCRIPTION="A Gentoo like interpretation of Lakka - Default distribution for RetroArch"
HOMEPAGE="https://www.lakka.org"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="allanin-base termite sway chromium mpv i3status urxvt"

DEPEND=""

RDEPEND="
	allanin-base? ( sys-apps/allanin-base )
	termite? ( x11-terms/termite )
	sway? ( dev-libs/sway )
	chromium? ( www-client/chromium )
	mpv? ( media-video/mpv )
	i3status? ( x11-misc/i3status  )
	urxvt? ( x11-terms/rxvt-unicode  )
"

pkg_preinst() {
	insinto /etc/systemd/system
	newins "${FILESDIR}/swayland.service" swayland.service
	newins "${FILESDIR}/swayland.target" swayland.target
}

pkg_postinst() {
        chown -R allanin:allanin /storage

        elog "Enable following systemd services with these commands"
        elog "systemctl enable sshd"
        elog "systemctl enable systemd-networkd.service"
        elog "systemctl enable wpa_supplicant.service"
        elog "systemctl enable bluetooth.service"
        elog "systemctl enable swayland.service"
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
