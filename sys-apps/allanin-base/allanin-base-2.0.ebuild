# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# enewuser lakka -1 /bin/sh /home/lakka lakka "wheel,audio,usb,users,video,input,disk"


EAPI=6
inherit user

DESCRIPTION="A Gentoo like interpretation of Lakka - Default distribution for RetroArch"
HOMEPAGE="https://www.lakka.org"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="alsa connman linux-firmware ntfs3g plymouth ssh systemd sudo udevil wireless-tools"

RDEPEND="
	alsa? ( media-sound/alsa-utils )
	connman? ( net-misc/connman net-misc/dhcp net-wireless/rfkill )
	linux-firmware? ( sys-kernel/linux-firmware )
	ntfs3g? ( sys-fs/ntfs3g )
	ssh? ( net-misc/openssh )
	plymouth? ( sys-boot/plymouth )
	systemd? ( sys-apps/systemd )
	sudo? ( app-admin/sudo )
	udevil? ( sys-apps/udevil )
	wireless-tools? ( net-wireless/wireless-tools )
"

pkg_preinst() {
	enewgroup allanin
	enewuser allanin -1 /bin/bash /home/lakka "allanin,wheel,audio,usb,users,video,input,disk,plugdev"
	dodir /storage
#	insinto /etc/systemd/system
#	newins "${FILESDIR}/allanin.service" allanin.service
#	newins "${FILESDIR}/allanin.target" allanin.target
}

pkg_postinst() {
	chown -R allanin:allanin /storage

	elog "Enable following systemd services with these commands"
	elog "systemctl enable sshd"
	elog "systemctl enable systemd-networkd.service"
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
