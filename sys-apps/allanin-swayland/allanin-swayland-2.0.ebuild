# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit user

DESCRIPTION="A Gentoo like interpretation of Lakka - Default distribution for RetroArch"
HOMEPAGE="https://www.lakka.org"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="allanin-base termite sway chromium mpv i3status urxvt"

RDEPEND="
	allanin-base? ( sys-apps/allanin-base )
	termite? ( x11-terms/termite )
	sway? ( dev-libs/sway )
	chromium? ( www-client/chromium )
	mpv? ( media-video/mpv )
	i3status? ( x11-misc/i3status  )
	urxvt? ( x11-terms/rxvt-unicode  )
"
