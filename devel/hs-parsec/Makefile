# $OpenBSD: Makefile,v 1.11 2011/09/16 09:24:51 espie Exp $

COMMENT =		Monadic parser combinators

DISTNAME =		parsec-3.1.1
REVISION =		1
CATEGORIES =		devel
HOMEPAGE =		http://www.cs.uu.nl/~daan/parsec.html

MAINTAINER =		Matthias Kilian <kili@openbsd.org>

# BSD3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

RUN_DEPENDS =		devel/hs-mtl
BUILD_DEPENDS =		${RUN_DEPENDS}

.include <bsd.port.mk>
