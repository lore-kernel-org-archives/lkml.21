Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064687;
	b=y34pwKLUB1NXnZLxzVsERYmE26U4r02rLNUT1rrXP3RaIELVmIGKr3DJUQi2UttVvjZn
	 u7aTG2v2n41tqjJ5RLJUM7Ss3F/JK2SlOMbA8DFyVoSFrh6eig/8O915ExcOCimUJPQtV
	 oYEZ5CC4an94Igg4qBXF+DSVJfzYGH/3EoG0tRzxae31VaQBJcpWbyrVzgB0W0l+bAeHN
	 Ql+S31I+WRCOvyYty+Pf9tM1EmeAARyfETeNCViCOedbVLD4CmIAMPwC5JlG9t7N1slGC
	 pqtdTaclk7eKkNQFvhHmyfro4sGiH9PiVIM6MfxIoutIdE6KjteP9+FYnc17diBmcaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064687;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bp3l8rwDPkSKznuZqcxjKl6885TgLTXi4yzkCNzGJRw=;
	b=2d05qAq8u5E0ERcAX/27NTupp5KJUgZ1I3p1TIcUHZ37EvjmAVDZQQNnA2mk5zARI541
	 bnrzHYvDamH673uwbxZLCUGgb7qtHqQ/fByHOgIko+Ysx3U+50HEyI8oo2L1hQ1FCtOwd
	 azkVk5slgwdfD0ud3h51q3osPRBdFltVglcqPZ9zEcsxdZQoUgzS6wgxQExRZbKfQszBJ
	 OTP7SDfNBAW/sKP4odq5ZskMuHT5pcuPBxZIo4LZEZ4eIiwfBlqmv0xIncbJbBaQTyU2I
	 hRn3K1isFZLF+rw64Nrlzt2sJJ1ub2YrzElliKrASIcz+ZYkuJcm9/j4eo3F8r3ioWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XbYXmlJu;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138CA606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 138CA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XbYXmlJu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=bp3l8rwDPkSKznuZqcxjKl6885TgLTXi4yzkCNzGJRw=; b=XbYXmlJuBE00LWDvVSj7bImTor
	IQCFu2M8UhZ22gh5syDqm4z8L6OwBgUnFIrwd+9smq1MTGHpSad9nx3MmjTZe73v7Us2EEwySPlmH
	2JhJqbFe0Bc+PwsaG3wEJZftyDd43Un1o/rcW217w4De6QzDgtjEn51jnBeLUG6uQHdzBAXdGrU6J
	mBTx8bPu1V7i4C5gXVVktyHM/nhBaUsMKdIhIXlJCp6a69tej0hPP+spvCw2f4EBy75JRN7nvPZj1
	z0Xxcxs7LNta9l70lWZSR54uDWW/JCpEEbCvupLhpiBRje433aakqRWP0tO21u0HY3/4EPbmtQ04m
	3exEhO7A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuKE-0000000ArIo-37tk;
	Thu, 19 Nov 2026 05:04:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 06/12] docs: ioctl-number: update SCSI entries
Date: Wed, 18 Nov 2026 21:04:31 -0800
Message-ID: <20261119050444.249752-7-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119050444.249752-1-rdunlap@infradead.org>
References: <20261119050444.249752-1-rdunlap@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the list of files where SCSI ioctls are defined and update the
ranges of function numbers that are used.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

[Since having multiple maintainers trying to merge these would
cause some conflicts, it would be more manageable for Jon to
take all of these through the docs-next tree.]

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: MPT-FusionLinux.pdl@broadcom.com
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org

 Documentation/userspace-api/ioctl/ioctl-number.rst |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20261116.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ linux-next-20261116/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -187,7 +187,7 @@ Code  Seq#    Include File
 'I'   40-4F  linux/mISDNif.h                                           conflict!
 'K'   all    linux/kd.h
 'L'   00-1F  linux/loop.h                                              conflict!
-'L'   10-1F  drivers/scsi/mpt3sas/mpt3sas_ctl.h                        conflict!
+'L'   10-21  drivers/scsi/mpt3sas/mpt3sas_ctl.h                        conflict!
 'L'   E0-FF  linux/ppdd.h                                              encrypted disk device driver
                                                                        <http://linux01.gwdg.de/~alatham/ppdd.html>
 'L'   35-38  arch/m68k/include/asm/fbio.h
@@ -259,6 +259,7 @@ Code  Seq#    Include File
 'c'   00-7F  linux/comstats.h                                          conflict!
 'c'   00-7F  linux/coda.h                                              conflict!
 'c'   00-1F  linux/chio.h                                              conflict!
+'c'   08     drivers/scsi/ch.c                                         conflict!
 'c'   80-9F  arch/s390/include/asm/chsc.h                              conflict!
 'c'   A0-AF  arch/x86/include/asm/msr.h conflict!
 'd'   00-FF  linux/char/drm/drm.h                                      conflict!
