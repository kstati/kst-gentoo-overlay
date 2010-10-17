# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-base/gnome/gnome-2.24.1.ebuild,v 1.10 2009/04/28 16:21:02 volkmar Exp $
EAPI="1"

DESCRIPTION="Meta package for the Eugeny's office software pack"
HOMEPAGE="http://www.gnome.org/"

LICENSE="as-is"
SLOT="2.0"

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="amd64"

IUSE="ek-pdf"

S=${WORKDIR}

RDEPEND="
	app-office/openoffice
	ek-pdf? (
		app-text/xpdf
		app-text/dvipdfmx
		app-text/pdf2html
		app-text/ghostscript-gpl
	)
	
	"

pkg_postinst() {
	elog
}
