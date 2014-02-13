# New ports collection makefile for:	jailaudit
# Date created:				21 October 2005
# Whom:					cryx
#
# $FreeBSD: ports/ports-mgmt/jailaudit/Makefile,v 1.6 2012/11/17 06:00:45 svnexp Exp $
#

PORTNAME=	jailaudit
PORTVERSION=	1.5
CATEGORIES=	ports-mgmt
MASTER_SITES=	http://outpost.h3q.com/software/jailaudit/

MAINTAINER=	cryx-ports@h3q.com
COMMENT=	Script to generate portaudit reports for jails

LICENSE=        Beerware
LICENSE_NAME=   Beerware
LICENSE_PERMS=  auto-accept
LICENSE_TEXT=	"THE BEER-WARE LICENCE": Philipp Wuensche <cryx-ports@h3q.com> wrote this software. As long as you retain this notice you can do whatever you want with this stuff. If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.

USE_BZIP2=	yes

PERIODICDIR?=	${PREFIX}/etc/periodic
REPORTDIR?=	${PREFIX}/jailaudit/reports
XTMPDIR?=	${PREFIX}/jailaudit/tmp

PLIST_SUB+=	PERIODICDIR="${PERIODICDIR:S,^${PREFIX}/,,}" \
		REPORTDIR="${REPORTDIR:S,^${PREFIX}/,,}" \
		XTMPDIR="${XTMPDIR:S,^${PREFIX}/,,}"

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 1000000
RUN_DEPENDS=	${LOCALBASE}/sbin/portaudit:${PORTSDIR}/ports-mgmt/portaudit
.endif

.include <bsd.port.post.mk>
