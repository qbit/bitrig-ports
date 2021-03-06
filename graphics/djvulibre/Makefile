# $OpenBSD: Makefile,v 1.25 2011/12/03 18:35:11 ajacoutot Exp $

COMMENT=	view, decode and encode DjVu files

DISTNAME=	djvulibre-3.5.24
REVISION=	3
SHARED_LIBS=	djvulibre 24.0
CATEGORIES=	graphics print

HOMEPAGE=	http://djvu.sourceforge.net/

MAINTAINER=	Alexandr Shadchin <shadchin@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=djvu/}

FLAVORS=	no_x11
FLAVOR?=

WANTLIB=	c m jpeg pthread stdc++ tiff z

LIB_DEPENDS=	graphics/jpeg \
		graphics/tiff

USE_GMAKE=	Yes
USE_LIBTOOL=	Yes
USE_GROFF =	Yes
CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--with-jpeg=${LOCALBASE} \
		--with-tiff=${LOCALBASE} \
		--with-extra-libraries=${LOCALBASE}/lib \
		--disable-i18n

.if ${FLAVOR:Mno_x11}
CONFIGURE_ARGS+=--without-x
.else
MODULES=	x11/qt3

WANTLIB += GL ICE SM X11 Xcursor Xdamage Xext Xfixes
WANTLIB += Xft Xi Xinerama Xmu Xrandr Xrender Xt Xxf86vm drm expat
WANTLIB += fontconfig freetype lcms mng png xcb

RUN_DEPENDS+=	devel/desktop-file-utils \
		x11/gtk+2,-guic

CONFIGURE_ARGS+=--enable-djview
CONFIGURE_ENV+= QT_CFLAGS="-I${MODQT_INCDIR}" \
		QT_LIBS="-L${MODQT_LIBDIR} -lqt-mt" \
		CPPFLAGS="-I${X11BASE}/include"
.endif

NO_REGRESS=	Yes

.include <bsd.port.mk>
