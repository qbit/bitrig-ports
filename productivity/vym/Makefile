# $OpenBSD: Makefile,v 1.14 2011/11/03 22:21:21 jasper Exp $

COMMENT=	generate and manipulate maps of your thoughts

DISTNAME=	vym-1.12.7
REVISION=	3
CATEGORIES=	productivity x11

HOMEPAGE=	http://www.insilmaril.de/vym/

# modified GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=vym/}
EXTRACT_SUFX=	.tar.bz2

WANTLIB += Qt3Support QtGui QtNetwork QtSql QtXml c m pthread
WANTLIB += stdc++

MODULES=	devel/gettext \
		x11/qt4

RUN_DEPENDS=	archivers/zip \
		archivers/unzip \
		textproc/libxslt

PORTHOME=	${WRKDIR}
NO_REGRESS=	Yes

SHARE_DIRS=	flags icons scripts styles

pre-configure:
	${SUBST_CMD} ${WRKSRC}/mainwindow.cpp ${WRKSRC}/main.cpp

do-configure:
	@echo "QMAKE_CXXFLAGS_RELEASE=${CXXFLAGS}" \
		>> ${WRKSRC}/vym.pro
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} \
		${LOCALBASE}/bin/qmake4 vym.pro

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/vym ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/vym/
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/vym/
	${INSTALL_DATA} ${WRKSRC}/doc/* ${PREFIX}/share/doc/vym/
	${INSTALL_DATA} ${WRKSRC}/demos/* ${PREFIX}/share/examples/vym/
.for i in ${SHARE_DIRS}
	${INSTALL_DATA_DIR} ${PREFIX}/share/vym/${i}
	find ${WRKSRC}/${i}/ -type f -exec \
		${INSTALL_DATA} {} ${PREFIX}/share/vym/${i} \;
.endfor

.include <bsd.port.mk>
