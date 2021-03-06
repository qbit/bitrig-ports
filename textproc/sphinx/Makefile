# $OpenBSD: Makefile,v 1.9 2011/11/16 15:56:37 robert Exp $

COMMENT =	free open-source SQL full-text search engine

DISTNAME =	sphinx-0.9.8.1
REVISION =	4
CATEGORIES =	textproc

HOMEPAGE =	http://www.sphinxsearch.com/

MAINTAINER =	Rama McIntosh <face00@gmail.com>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES =	${HOMEPAGE}/downloads/

MODULES =	converters/libiconv lang/php

MODPHP_BUILDDEP=No
MODPHP_RUNDEP=No

WANTLIB =	c expat m stdc++

CONFIGURE_STYLE = gnu
CONFIGURE_ARGS = --with-mysql
CONFIGURE_ENV =	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

FLAVORS =	pgsql
FLAVOR ?=

.if ${FLAVOR:L:Mpgsql}
CONFIGURE_ARGS +=--with-pgsql \
		--without-mysql
LIB_DEPENDS +=	databases/postgresql
WANTLIB +=	pq
.else
LIB_DEPENDS +=	databases/mysql
WANTLIB +=	crypto ssl z mysqlclient
.endif

# Needs php with pdo_mysql setup.
REGRESS_IS_INTERACTIVE=	Yes
REGRESS_DEPENDS=lang/php/${MODPHP_VERSION},-mysql \
		lang/php/${MODPHP_VERSION},-pdo_mysql

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/sphinx
	${INSTALL_DATA} ${WRKSRC}/doc/sphinx.txt ${PREFIX}/share/doc/sphinx

.include <bsd.port.mk>
