# $OpenBSD: Makefile,v 1.7 2010/11/20 19:56:49 espie Exp $

COMMENT=	simple Objective Caml bindings for XML
CATEGORIES=	textproc

V=		2.2
DISTNAME=	xml-light-${V}
PKGNAME=	ocaml-${DISTNAME}
REVISION =	3
EXTRACT_SUFX=	.zip
MASTER_SITES=	http://tech.motion-twin.com/zip/

MAINTAINER=	Anil Madhavapeddy <avsm@openbsd.org>
HOMEPAGE=	http://tech.motion-twin.com/xmllight.html

# LGPL
PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

MODULES=	lang/ocaml
WRKDIST=	${WRKDIR}/xml-light
NO_REGRESS= 	Yes
ALL_TARGET=	all ${MODOCAML_NATIVE:S,Yes,opt,:S,No,,}
INSTALL_TARGET=	install ${MODOCAML_NATIVE:S,Yes,installopt,:S,No,,}
USE_GMAKE=	Yes

.include <bsd.port.mk>
