# $OpenBSD: Makefile,v 1.10 2012/03/29 13:38:30 sthen Exp $

ONLY_FOR_ARCHS = 	alpha amd64 arm i386 hppa m68k mips64 mips64el powerpc sparc64 sparc sh

COMMENT =		library for handling page faults in user mode

DISTNAME =		libsigsegv-2.8
SHARED_LIBS =		sigsegv 1.0
CATEGORIES =		devel
HOMEPAGE =		http://libsigsegv.sourceforge.net/

MAINTAINER =		Scott Vokes <vokes.s@gmail.com>

# GPLv2
PERMIT_PACKAGE_CDROM =		Yes
PERMIT_PACKAGE_FTP =		Yes
PERMIT_DISTFILES_CDROM =	Yes
PERMIT_DISTFILES_FTP =		Yes

MASTER_SITES =		${MASTER_SITE_GNU:=libsigsegv/}

SEPARATE_BUILD = 	Yes

USE_LIBTOOL =		gnu

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS +=	${CONFIGURE_SHARED}

.if ${MACHINE_ARCH} == "hppa"
CONFIGURE_ENV +=	sv_cv_leave_handler_longjmp_sigaltstack=no \
			sv_cv_leave_handler_siglongjmp=no \
			sv_cv_leave_handler_siglongjmp_sigaltstack=no
.endif

.include <bsd.port.mk>
