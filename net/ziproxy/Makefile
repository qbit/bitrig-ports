# $OpenBSD: Makefile,v 1.7 2012/03/29 13:38:49 sthen Exp $

COMMENT =		compressing non-caching HTTP proxy

DISTNAME =	 	ziproxy-2.7.2
REVISION =		0
EXTRACT_SUFX = 		.tar.bz2

CATEGORIES =		net www

HOMEPAGE =		http://ziproxy.sourceforge.net/

MAINTAINER = 		Edd Barrett <edd@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB += 		c m pthread z gif>=5 png>=8 jpeg>=62 jasper>=2

MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=ziproxy/}

LIB_DEPENDS =		graphics/libungif \
			graphics/png \
			graphics/jpeg \
			graphics/jasper

SEPARATE_BUILD =	Yes

CONFIGURE_STYLE =	autoconf
AUTOCONF_VERSION =	2.61
USE_GROFF =		Yes

CPPFLAGS =		-I${LOCALBASE}/include -I${LOCALBASE}/include/libpng

CONFIGURE_ARGS = 	--with-jasper=${LOCALBASE}

CONFIGURE_ENV = 	LDFLAGS="-L${LOCALBASE}/lib" \
			CPPFLAGS="${CPPFLAGS}"

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/ziproxy
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/ziproxy
	${INSTALL_DATA} ${WRKSRC}/src/tools/ziproxy_genhtml_stats.sh \
	    ${WRKSRC}/etc/ziproxy/* ${PREFIX}/share/examples/ziproxy
.for i in COPYING CREDITS JPEG2000* README*
	${INSTALL_DATA} ${WRKSRC}/$i ${PREFIX}/share/doc/ziproxy
.endfor

.include <bsd.port.mk>
