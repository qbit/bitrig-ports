# $OpenBSD: Makefile,v 1.19 2010/10/18 17:47:52 espie Exp $
# $FreeBSD: ports/devel/cvs2cl/Makefile,v 1.8 2000/07/09 03:15:07 knu Exp $

COMMENT=	generate GNU-style ChangeLogs from CVS repositories

V=		2.62
DISTNAME=	cvs2cl.pl-${V}
PKGNAME=	cvs2cl-${V}
CATEGORIES=     devel
HOMEPAGE=	http://www.red-bean.com/cvs2cl/
EXTRACT_SUFX=	.gz

# GPL
PERMIT_PACKAGE_CDROM=	Yes 
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WRKDIST=	${WRKDIR}
MASTER_SITES=	http://openbsd.dead-parrot.de/distfiles/

USE_GROFF =	Yes
NO_REGRESS=	Yes
PKG_ARCH=	*

do-build:
	pod2man ${WRKSRC}/cvs2cl.pl-${V} ${WRKSRC}/cvs2cl.1

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/cvs2cl.pl-${V} ${PREFIX}/bin/cvs2cl
	${INSTALL_MAN} ${WRKSRC}/cvs2cl.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
