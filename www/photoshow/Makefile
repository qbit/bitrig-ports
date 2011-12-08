# $OpenBSD: Makefile,v 1.1.1.1 2011/12/04 11:04:27 ajacoutot Exp $

COMMENT=	easy to use web gallery

DISTNAME=	photoshow-0.0.20111203
CATEGORIES=	www graphics

HOMEPAGE=	http://www.photoshow-gallery.com/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv3
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	http://distfiles.bsdfrog.org/

MODULES=	lang/php

NO_BUILD=	Yes
NO_REGRESS=	Yes
PKG_ARCH=	*

PREFIX=		/var/www
INSTDIR=	${PREFIX}/photoshow
TINSTDIR=	${TRUEPREFIX}/photoshow
SUBST_VARS=	INSTDIR TINSTDIR

RUN_DEPENDS=	archivers/pecl-zip

do-install:
	cp -R ${WRKSRC} ${INSTDIR}
	mv ${INSTDIR}/conf.ini ${INSTDIR}/conf.ini.dist
	${SUBST_CMD} -c ${FILESDIR}/photoshow.conf \
		${INSTDIR}/photoshow.conf.dist
	${SUBST_CMD} -c ${FILESDIR}/dot.htaccess \
		${INSTDIR}/.htaccess.dist
	find ${INSTDIR} -type f -name \*.orig -or -name \*.beforesubst | xargs rm
	chown -R ${BINOWN}:${BINGRP} ${INSTDIR}

.include <bsd.port.mk>