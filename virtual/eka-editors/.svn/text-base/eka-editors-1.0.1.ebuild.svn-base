# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-base/gnome/gnome-2.24.1.ebuild,v 1.10 2009/04/28 16:21:02 volkmar Exp $
EAPI="1"

DESCRIPTION="Meta package for the Eugeny's editors pack"
HOMEPAGE="http://www.gnome.org/"

LICENSE="as-is"
SLOT="2.0"

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="amd64"

IUSE="gnome"

S=${WORKDIR}

RDEPEND="
	app-editors/vim
	app-vim/vim-spell-ru
	app-vim/align
	app-vim/ebnf-syntax
	app-vim/enhancedcommentify
	app-vim/eselect-syntax
	app-vim/extra-syntax
	app-vim/fluxbox-syntax
	app-vim/genindent
	app-vim/gentoo-syntax
	app-vim/gtk-syntax
	app-vim/perl-support
	app-vim/showmarks
	app-vim/taglist
	app-vim/vimcommander
	

	gnome? ( 
		app-editors/gvim
		app-editors/gphpedit
	)

	"

pkg_postinst() {
	elog
}
