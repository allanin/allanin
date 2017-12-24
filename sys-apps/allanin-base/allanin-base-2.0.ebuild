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
	dodir /storage
	enewgroup allanin
	enewuser allanin -1 /bin/bash /storage "allanin,wheel,audio,usb,users,video,input,disk,plugdev"
}

pkg_postinst() {
	chown -R allanin:allanin /storage

	elog "Enabling required systemd services"
	elog ""
	systemctl enable sshd.service
	systemctl enable bluetooth.service
	systemctl enable connman.service
	systemctl enable devmon@allanin

	elog "Enable following connman services with these commands for networking support"
	elog "connmanctl enable wifi"
	elog "connmanctl enable bluetooth"
	elog "connmanctl enable ethernet"
}
