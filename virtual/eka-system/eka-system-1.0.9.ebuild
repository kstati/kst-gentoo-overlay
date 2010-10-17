# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-base/gnome/gnome-2.24.1.ebuild,v 1.10 2009/04/28 16:21:02 volkmar Exp $
EAPI="1"

DESCRIPTION="Meta package for the Eugeny's main system files pack"
HOMEPAGE="http://www.gnome.org/"

LICENSE="as-is"
SLOT="2.0"

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86 ~x86-fbsd"

IUSE="X"

S=${WORKDIR}

RDEPEND="
	app-editors/vim
	app-misc/mc
	app-portage/autounmask
	app-portage/eix
	app-portage/gentoolkit
	app-portage/ufed
	app-portage/getdelta
	app-portage/layman


	app-arch/unrar-gpl
	app-text/dos2unix
	app-text/unix2dos


	dev-python/pysqlite
	dev-util/ccache

	net-wireless/iwl4965-ucode
	net-wireless/wpa_supplicant
	net-analyzer/traceroute
	net-misc/bridge-utils


	sys-apps/lshw
	sys-apps/openrc
	sys-apps/sysvinit
	sys-apps/usbutils
	sys-apps/man-db
	sys-apps/usermode-utilities
	sys-apps/slocate

	sys-auth/pambase
	
	sys-boot/grub
	sys-libs/gpm
        X? (	
		x11-base/xorg-x11
		sys-power/acpid
	)

	
	virtual/eka-versioncontrol

	sys-fs/ntfs3g
	sys-fs/dosfstools
	sys-fs/fuseiso
	net-fs/curlftpfs
	net-fs/fusesmb
	net-fs/mount-cifs
	sys-fs/sshfs-fuse
	net-ftp/ftp


	sys-kernel/gentoo-sources
	
	virtual/eka-avir


	media-fonts/terminus-font


	sys-process/lsof
	sys-process/anacron
	sys-power/cpufrequtils

	
	
"

install_clam_cron() {
    elog "Adding freshclam to cron.daily"
    FRESH_CLAM_DIR="${D}etc/cron.daily" 
    FRESH_CLAM_FILE=${FRESH_CLAM_DIR}/freshclam
    mkdir -pv ${FRESH_CLAM_DIR} || die "can't create freshclam cron dir"
    echo "#!/bin/bash" > ${FRESH_CLAM_FILE} || die "can't create freshclam cron file"
    echo "freshclam" >> ${FRESH_CLAM_FILE}  || die "can't create freshclam cron file"
    chmod 700 ${FRESH_CLAM_FILE}
    elog
    elog "Be shure to crond started"

}
src_install() {
    install_clam_cron 
}
pkg_postinst() {
	elog
}
