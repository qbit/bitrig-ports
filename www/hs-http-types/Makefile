# $OpenBSD: Makefile,v 1.2 2012/01/15 17:18:49 kili Exp $

COMMENT =		generic HTTP types for Haskell

DISTNAME =		http-types-0.6.8
CATEGORIES =		devel www

MAINTAINER =		Matthias Kilian <kili@openbsd.org>

# BSD3
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

BUILD_DEPENDS =		${RUN_DEPENDS}
RUN_DEPENDS =		devel/hs-blaze-builder>=0.2.1.4,<0.4 \
			devel/hs-case-insensitive>=0.2,<0.5 \
			devel/hs-text>=0.11.0.2,<0.12

.include <bsd.port.mk>
