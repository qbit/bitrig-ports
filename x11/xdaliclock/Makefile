# $OpenBSD: Makefile,v 1.20 2010/10/24 21:15:36 ajacoutot Exp $

COMMENT=	rather neat animated clock

DISTNAME=	xdaliclock-2.23
CATEGORIES=	x11

HOMEPAGE=	http://www.jwz.org/xdaliclock/

# License: BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		ICE SM X11 Xext Xt c

MASTER_SITES=	${HOMEPAGE}

USE_GROFF =	Yes

CONFIGURE_STYLE=	gnu
MODGNU_CONFIG_GUESS_DIRS=	${WRKDIST}
WRKSRC=			${WRKDIST}/X11

NO_REGRESS=		Yes

.include <bsd.port.mk>
