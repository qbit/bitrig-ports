# $OpenBSD: Makefile,v 1.6 2011/09/16 11:13:40 espie Exp $

COMMENT =	bindings for RRD functions

DISTNAME =	errand-0.7.2
REVISION =	3
CATEGORIES =	net

# MIT
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/ruby

CONFIGURE_STYLE =	ruby gem

RUN_DEPENDS =		net/rrdtool,-ruby

.include <bsd.port.mk>
