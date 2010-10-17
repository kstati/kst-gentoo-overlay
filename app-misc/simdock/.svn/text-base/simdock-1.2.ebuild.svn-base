# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils

DESCRIPTION="fast and customizable dockbar"
HOMEPAGE="http://sourceforge.net/projects/simdock/"
SRC_URI="mirror://sourceforge/simdock/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="gnome-base/gconf
	x11-libs/libwnck
	>=x11-libs/wxGTK-2.8
	x11-libs/libX11"
DEPEND="${RDEPEND}
	x11-proto/xproto
	dev-util/pkgconfig
	sys-devel/gettext" #not sure about gettext

S=${WORKDIR}/trunk

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-desktop-entry.patch
	#the crappy hack for cflags
	epatch "${FILESDIR}"/${P}-cflags.patch
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc AUTHORS ChangeLog INSTALL README
}
