# Syntek Semicon Web Cam Driver ebuild file
# Copyright (c) 2010 Eugeny Borisov
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit linux-mod linux-info subversion


MAKEFILE_SYNTEK="Makefile-syntekdriver"

DESCRIPTION="Syntek Semicon Web Cam Driver. Most used in Asus Laptops"
HOMEPAGE="http://downloads.sourceforge.net/project/syntekdriver"

ESVN_REPO_URI="https://syntekdriver.svn.sourceforge.net/svnroot/syntekdriver/trunk/driver"
SRC_URI="http://bookeldor-net.info/merdier/${MAKEFILE_SYNTEK}"

LICENSE="GPL BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


MODULE_NAMES="stk11xx(usb/media:${S})"

_check_kernel_config() {
	if ! kernel_is 2 6 ; then
		eerror "You need a 2.6 linux kernel to compile against!"
		die "No 2.6 Kernel found"
	fi

	if ! linux_chkconfig_present "V4L_USB_DRIVERS" ; then
		eerror "${PN} is needed for V4L_USB_DRIVERS enabled";
		eerror "Please enable it:"
		eerror "  CONFIG_V4L_USB_DRIVERS=y"
		eerror "in ${KV_DIR}/.config or"
		eerror "  Device Drivers"
		eerror "    -> Multimedia support"
		eerror "       -> Video capture adapters"
		eerror "          [*] V4L USB devices"
		eerror "in menuconfig"
		die "kernel CONFIG_V4L_USB_DRIVERS disabled"

	fi
}
src_unpack() {
	_check_kernel_config
	subversion_fetch
	cp "${PORTAGE_ACTUAL_DISTDIR}"/"${A}" "${S}"/"${MAKEFILE_SYNTEK}" \
		|| die "can't copy Makefile"
}

src_prepare() {
	_check_kernel_config

	# change kernel version and kernel sources dir
	# from run-time to environment values
	sed "s/(shell uname -r)/(KV_FULL)/;s/KDIR/KV_DIR/;" "${S}/${MAKEFILE_SYNTEK}" \
		> "${S}/Makefile" \
		|| die "Can't patch Makefile"
}


pkg_setup() {
	linux-mod_pkg_setup
}

src_compile() {
	BUILD_TARGETS="all"
	BUILD_PARAMS=" KV_FULL=\"$KV_FULL\" KV_DIR=\"$KV_DIR\" "
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst

	elog "Please add \"stk11xx\" to:"
	if has_version sys-apps/openrc; then
		elog "/etc/conf.d/modules"
	else
		elog "/etc/modules.autoload.d/kernel-${KV_MAJOR}.${KV_MINOR}"
	fi
}
