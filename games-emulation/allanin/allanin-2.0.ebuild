# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# enewuser lakka -1 /bin/sh /home/lakka lakka "wheel,audio,usb,users,video,input,disk"


EAPI=6
inherit user

DESCRIPTION="A Gentoo like interpretation of Lakka - Default distribution for RetroArch"
HOMEPAGE="https://www.lakka.org"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="alsa connman plymouth retroarch systemd sudo udevil"

RDEPEND="
	alsa? ( media-sound/alsa-utils )
	connman? ( net-misc/connman net-misc/dhcp net-wireless/rfkill )
	plymouth? ( sys-boot/plymouth )
	systemd? ( sys-process/systemd-cron sys-apps/systemd-readahead )
	retroarch? ( games-emulation/retroarch )
	sudo? ( app-admin/sudo )
	udevil? ( sys-apps/udevil )
"

pkg_preinst() {
	enewgroup allanin
	enewuser allanin -1 /bin/bash /home/lakka "allanin,wheel,audio,usb,users,video,input,disk,plugdev"
	insinto /etc/systemd/system
	dodir /storage
	newins "${FILESDIR}/allanin.service" allanin.service
	newins "${FILESDIR}/allanin.target" allanin.target
}

pkg_postinst() {
	chown -R allanin:allanin /storage

	elog "Enable following systemd services with these commands"
	elog "systemctl enable sshd"
	elog "systemctl enable systemd-networkd.service"
	elog "systemctl enable systemd-resolved.service"
	elog "systemctl enable wpa_supplicant.service"
	elog "systemctl enable bluetooth.service"
	elog "systemctl enable allanin.service"
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
