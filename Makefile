# $OpenBSD: Makefile,v 1.1.1.2 2011/11/14 12:45:49 pascal Exp $

ONLY_FOR_ARCHS = alpha i386 m68k sparc sparc64 powerpc vax amd64
#BROKEN=adjust for types changes

V = 4.6.2
FULL_VERSION = $V
FULL_PKGVERSION = $V
BOOTSTRAP_GEN = 3
# XXX this needs libc.so.61.0 to build on i386
ADASTRAP = adastrap-i386-$V-${BOOTSTRAP_GEN}.tar.xz

PKGNAME-main =  gcc-${FULL_PKGVERSION}
PKGNAME-c++ =   g++-${FULL_PKGVERSION}
PKGNAME-estdc = libstdc++-${FULL_PKGVERSION}
PKGNAME-f95 =   g95-${FULL_PKGVERSION}
PKGNAME-java =  gcj-${FULL_PKGVERSION}
PKGNAME-objc =  gobjc-${FULL_PKGVERSION}
PKGNAME-ada =   gnat-${FULL_PKGVERSION}
#PKGNAME-go =	gccgo-${FULL_PKGVERSION}

SHARED_LIBS =	estdc++		11.0 \
		gfortran	2.0 \
		gcj		0.0 \
		gcj-tools	0.0 \
		gij		0.0 \
		objc		2.0 \
		ssp		0.0 \
		lto_plugin      0.0


PSEUDO_FLAVORS = no_c++ no_f95 no_objc no_java no_ada
FLAVOR ?= 

ONLY_FOR_ARCHS-ada = i386
ONLY_FOR_ARCHS-java = amd64 sparc64 i386
#ONLY_FOR_ARCHS-go = amd64 i386			# XXX

MULTI_PACKAGES = -main -f95 -objc -java -c++ -estdc -ada

.include <bsd.port.arch.mk>

# kill both C++ subpackages
.if !${BUILD_PACKAGES:M-c++}
BUILD_PACKAGES := ${BUILD_PACKAGES:N-estdc}
.endif

DISTFILES =  ${DISTNAME}.tar.bz2
SUPDISTFILES =	${ADASTRAP}:0

USE_LIBTOOL =	Yes

BUILD_DEPENDS += devel/bison


REGRESS_DEPENDS = 	devel/dejagnu \
			devel/autogen

DISTNAME =   	gcc-${FULL_VERSION}


MASTER_SITES =	${MASTER_SITE_GCC:=releases/gcc-$(FULL_VERSION)/}
MASTER_SITES0 =	ftp://quatramaran.ens.fr/pub/espie/

CONFIGURE_STYLE =	gnu
MODGNU_CONFIG_GUESS_DIRS =	${WRKSRC} ${WRKSRC}/gcc

LANGS = c
.if ${BUILD_PACKAGES:M-c++}
LANGS := ${LANGS},c++
REGRESS_DEPENDS += 	libstdc++->=4.6,<4.7:${BUILD_PKGPATH},-estdc
.endif
.if ${BUILD_PACKAGES:M-f95}
LANGS := ${LANGS},fortran
CONFIGURE_ARGS += --with-gmp=${LOCALBASE}
.endif
.if ${BUILD_PACKAGES:M-objc}
LANGS := ${LANGS},objc
.endif
.if ${BUILD_PACKAGES:M-java}
LANGS := ${LANGS},java
BUILD_DEPENDS += archivers/zip>=2.3p0
CONFIGURE_ARGS += --enable-libgcj
.endif
.if ${BUILD_PACKAGES:M-ada}
LANGS := ${LANGS},ada
DISTFILES += ${ADASTRAP}:0
CONFIGURE_ENV = ADAC=${WRKDIR}/bin/egcc GNATBIND=${WRKDIR}/bin/gnatbind
MAKE_ENV = ADAC=${WRKDIR}/bin/egcc GNATBIND=${WRKDIR}/bin/gnatbind
CC = ${WRKDIR}/bin/egcc
REGRESS_DEPENDS += ${BUILD_PKGPATH},-ada
.endif
#.if ${BUILD_PACKAGES:M-go}
#LANGS := ${LANGS},go
#.endif

post-extract:
.for f in egcc gnatbind gnatmake gnatlink
	echo "#! /bin/sh" >${WRKDIR}/bin/$f
	echo 'GNAT_ROOT=${WRKDIR}/bootstrap GCC_ROOT=${WRKDIR}/bootstrap exec ${WRKDIR}/bootstrap/bin/$f "$$@"' >>${WRKDIR}/bin/$f
	chmod a+x ${WRKDIR}/bin/$f
.endfor
	ln -s /usr/bin/nm ${WRKDIR}/bin/enm
	echo "# This file automatically generated" >> ${WRKSRC}/libversions
.for l v in ${SHARED_LIBS}
	echo "LIB$l_LTVERSION = -version-info ${v:S/./:/}" >> ${WRKSRC}/libversions
.endfor

post-install:
.if ${BUILD_PACKAGES:M-ada}
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/lib/gcc/*/$V/adainclude
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/lib/gcc/*/$V/adalib
.endif
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/lib/gcc/*/$V/include
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/lib/gcc/*/$V/include-fixed
CONFIGURE_ENV += am_cv_func_iconv=no
CONFIGURE_ENV += ac_cv_prog_CONFIGURED_M4=/usr/bin/m4

# Note: the configure target passes CFLAGS to the configure script anyways.

CFLAGS = -O2 -g


CONFIGURE_ARGS += \
	--verbose \
	--program-transform-name=s,^,e, \
	--disable-nls  \
	--disable-checking \
	--with-system-zlib \
	--disable-libmudflap \
	--disable-libgomp \
	--disable-tls \
	--with-as=/usr/bin/as \
	--with-ld=/usr/bin/ld \
	--with-gnu-ld \
	--with-gnu-as \
	--enable-threads=posix \
	--enable-wchar_t \
	--enable-languages=${LANGS}

# This is needed, as internal cpp is no longer compatible with the
# visible beast
CONFIGURE_ARGS += --enable-cpp

CONFIGURE_ARGS += ${CONFIGURE_SHARED}

SEPARATE_BUILD = flavored

USE_GMAKE = yes

# you shouldn't skip bootstrap unless you know what you're doing
# use bootstrap-lean if you're pressed for space
ALL_TARGET = bootstrap

MAKE_FLAGS = libstdc___la_LDFLAGS='-version-info 31:0:0 -lm'


.if ${MACHINE_ARCH} == "m68k" || ${MACHINE_ARCH} == "sparc"  || ${MACHINE_ARCH} == "amd64"
PKG_ARGS += -DPIC=1
.else
PKG_ARGS += -DPIC=0
.endif

.if ${MACHINE_ARCH} == "powerpc"
PKG_ARGS += -DPPC=1
.else
PKG_ARGS += -DPPC=0
.endif

.if ${MACHINE_ARCH} == "i386" || ${MACHINE_ARCH} == "amd64"
PKG_ARGS += -DI386=1
.else
PKG_ARGS += -DI386=0
.endif

RUN_DEPENDS =		gcc-${FULL_PKGVERSION}:${BUILD_PKGPATH}
WANTLIB =		c

RUN_DEPENDS-main =
RUN_DEPENDS-estdc =
RUN_DEPENDS-java =

RUN_DEPENDS-c++ =	${RUN_DEPENDS} libstdc++->=4.6,<4.7:${BUILD_PKGPATH},-estdc
WANTLIB-main =		${WANTLIB} gmp mpc mpfr z
WANTLIB-c++ =		${WANTLIB} gmp mpc mpfr z
WANTLIB-estdc =		m
WANTLIB-f95 =		${WANTLIB} gmp m mpc mpfr z
WANTLIB-java =		${WANTLIB} gmp m mpc mpfr pthread z
WANTLIB-objc =		${WANTLIB} gmp mpc mpfr z

LIB_DEPENDS +=		devel/gmp>=4.2 \
			devel/mpfr \
			devel/libmpc
LIB_DEPENDS-estdc =

.if ${MACHINE_ARCH:Mamd64}
CONFIG=x86_64-unknown-openbsd${OSREV}
.endif

.include <bsd.port.mk>

ADA_PACKAGE = ${PACKAGE_REPOSITORY}/i386/all/${PKGNAME-ada}${PKG_SUFX}
GCC_PACKAGE = ${PACKAGE_REPOSITORY}/i386/all/${PKGNAME-main}${PKG_SUFX}

adastrap: ${ADA_PACKAGE} ${GCC_PACKAGE}
	mkdir -p ${WRKDIR}/prepare/bootstrap
	cd ${WRKDIR}/prepare/bootstrap && tar zxf ${ADA_PACKAGE}
	cd ${WRKDIR}/prepare/bootstrap && tar zxf ${GCC_PACKAGE}
	rm -rf ${WRKDIR}/prepare/bootstrap/{+*,info,man}
	cd ${WRKDIR}/prepare && tar cf - bootstrap | xz > ${FULLDISTDIR}/${ADASTRAP}

