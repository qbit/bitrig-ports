# $OpenBSD: Makefile,v 1.9 2011/09/21 17:20:56 jasper Exp $

COMMENT=	netdude plugin providing an API for trace sets

DISTNAME=	libnetdude-traceset-plugin-0.4
REVISION=	1
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=netdude/}

HOMEPAGE=	http://netdude.sourceforge.net/

RUN_DEPENDS=	net/libnetdude/libnetdude

BUILD_DEPENDS=	${RUN_DEPENDS} \
		devel/libtool,-ltdl

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

USE_LIBTOOL=		Yes
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--datadir=${PREFIX}/lib

.include <bsd.port.mk>
