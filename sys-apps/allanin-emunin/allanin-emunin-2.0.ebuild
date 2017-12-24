# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit user eutils toolchain-funcs versionator git-r3

DESCRIPTION="A Gentoo like interpretation of Lakka - Default distribution for RetroArch"
HOMEPAGE="https://www.lakka.org"

EGIT_REPO_URI="https://github.com/allanin/allanin-emunin.git"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="allanin-base retroarch"

DEPEND=""

RDEPEND="
	allanin-base? ( sys-apps/allanin-base )
	retroarch? ( games-emulation/retroarch )
"

src_install() {
        cp -R "${S}/etc" "${D}/" || die "Install failed!"
}

src_install() {
        cp -R "${S}/etc" "${D}/" || die "Install failed!"
}

pkg_postinst() {
        systemctl enable emunin
}

