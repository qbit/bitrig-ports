# $OpenBSD: Makefile,v 1.22 2011/09/28 09:54:01 jasper Exp $

COMMENT=	simple network library

GNOME_PROJECT=	gnet
GNOME_VERSION=	2.0.8
SHARED_LIBS +=  gnet-2.0             1.0      # .8.0
CATEGORIES=	net
REVISION=		0

HOMEPAGE=	http://www.gnetlibrary.org/

# LGPL
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes

EXTRACT_SUFX=		.tar.bz2

MODULES=	devel/gettext \
		x11/gnome

LIB_DEPENDS=	devel/glib2

WANTLIB=	pcre glib-2.0 gthread-2.0

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS+=--enable-threadsafe-getaddrinfo \
		--enable-threadsafe-gethostbyname

REGRESS_FLAGS=	CFLAGS="${CFLAGS} -D_internal_test" LIBTOOL=${LIBTOOL} \
		CHECK_CFLAGS="-I${LOCALBASE}/include" \
		CHECK_LIBS="-L${LOCALBASE}/lib -lcheck" \
		SUBDIRS_CHECK=check
REGRESS_DEPENDS=devel/check

.include <bsd.port.mk>
