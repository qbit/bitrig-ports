# $OpenBSD: Makefile,v 1.9 2011/11/09 00:17:38 jeremy Exp $

COMMENT =	parse strings of Lisp style s-expressions

DISTNAME =	sexp-0.2.1
REVISION =	5
CATEGORIES =	devel

# MIT
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

MODULES =	lang/ruby

CONFIGURE_STYLE = ruby gem

BUILD_DEPENDS =		${RUN_DEPENDS}
RUN_DEPENDS =		devel/ruby-rparsec,${MODRUBY_FLAVOR}>=1.0

.include <bsd.port.mk>
