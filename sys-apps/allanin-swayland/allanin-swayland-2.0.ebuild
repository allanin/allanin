# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit user eutils toolchain-funcs versionator git-r3

DESCRIPTION="A Gentoo like interpretation of Lakka - Default distribution for RetroArch"
HOMEPAGE="https://www.lakka.org"

EGIT_REPO_URI="https://github.com/allanin/systemd-swayland.git"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="allanin-base termite sway chromium-browser mpv i3status urxvt"

DEPEND=""

RDEPEND="
	allanin-base? ( sys-apps/allanin-base )
	termite? ( x11-terms/termite )
	sway? ( dev-libs/sway )
	chromium-browser? ( www-client/chromium )
	mpv? ( media-video/mpv )
	i3status? ( x11-misc/i3status  )
	urxvt? ( x11-terms/rxvt-unicode  )
"

src_install() {
	cp -R "${S}/etc" "${D}/" || die "Install failed!"
}

pkg_postinst() {
	systemctl enable swayland
}
