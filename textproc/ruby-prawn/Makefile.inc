# $OpenBSD: Makefile.inc,v 1.3 2010/11/08 23:28:55 jeremy Exp $

VERSION ?=	0.5.0.1
CATEGORIES ?=	textproc

HOMEPAGE ?=	http://prawn.majesticseacreature.com/

MAINTAINER ?=	Claudio Jeker <claudio@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM ?= Yes
PERMIT_PACKAGE_FTP ?= Yes
PERMIT_DISTFILES_CDROM ?= Yes
PERMIT_DISTFILES_FTP ?= Yes

MODULES ?=	lang/ruby

BUILD_DEPENDS ?= ${RUN_DEPENDS}

CONFIGURE_STYLE ?= ruby gem
