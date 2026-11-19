Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064687;
	b=qH3BffJ/VA95+b4WV3kWoD8J0br4Sep3DexQVTQqpbP4ZujyqlORm1mTY35RILqoYVx7
	 NEbo98p3MEM43OlFK/v+A7qopHP72NQ7jKPRBWsAXwPTq8ymza9c9MC5/IkKADHeZuMZx
	 4vm/CGJYPqrhiGIYLYCUFJVl64OxhhdgHc3tB18gjWun00MAayAf5stMi6npZ4GFScctm
	 Wi7GykdK0ul9/ECwXeTVUeCzc5qDd3zc/s7do2eGPrNbP8ZB1WZPUfxSBVi5GtCkmo3lD
	 oZs9/4gEJIOG9mjX4jVxaK2vmleHQb8eFhSzGejp20ekQAUiNoqpeGw6qHyLjPm6ryw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064687;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1eLXwX2TTOtzzg4YJJJIqHeDrys/MbfPMcbT+8ekHvM=;
	b=ylvIe/NWcXqMBZQcuRCXFp04SDfRPMozs4r/hrESmo5qwYzUNhmKm7+MAQ1MBaDHShNQ
	 yD/ulxLjL/EzN9TR4E6o3ZpR0iOGxJ05gafCAji77kPSCS5fNBbKr0ktWXJfGbiHGTF+3
	 DK73I2iTRkkPSHm29XNpMW+etIgHNO/ypLZ8j30ZHURsEh1n0HOLnlB0GYks2+ELXRkLP
	 WFn7rbqRhlLAAZXphcslNsZmz7O0NUjX8IECRTOrDlxS/fIKTwSVJO1wPLUEs1WFO4+yr
	 GJWaHa3abgaxak0n1musWhhZy0Z4yUZlsvyYBB9DfascbeoK+CgKpTfXcQOobyr2b7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LMGhFMP+;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538D8606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538D8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LMGhFMP+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1eLXwX2TTOtzzg4YJJJIqHeDrys/MbfPMcbT+8ekHvM=; b=LMGhFMP+Xb3Gf0fGkgI1INWmyG
	g0dhPzl/ESY559GnjkH5Qse+BtSj/PgTy6ACVw7v4qBCEwJgyH+shxKFGq01uXdxOONTE3ktew51D
	pPHkeX5m+GLalA/Vk7fOqI5fNNGuS/mvYzAleP/AFYpM6viWNlk4GviovCazqK3Nmdf6PCdZsjBMM
	KAvKhq1fXtWuvojnn1JlhRmqgTFBGpK8gNOU88UUgpDlPEouhkRRS9XIQF9NpD554KWEIB+zES7QH
	Bel97Wd65hlfdIqqmWBGwqQ2v6vcax129nY1K37ez+sDYCrhvZHTujHl43Oh57TSl6mMHtW8o0KrS
	LyWEE2rw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuKE-0000000ArIo-3pcS;
	Thu, 19 Nov 2026 05:04:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 07/12] docs: ioctl-number: update MTD entries
Date: Wed, 18 Nov 2026 21:04:32 -0800
Message-ID: <20261119050444.249752-8-rdunlap@infradead.org>
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

Update the list of files where MTD ioctls are defined and update
the ranges of function numbers that are used.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: address sashiko review comments (missing update of 'O' range
    for mtd/ubi-user.h)

[Since having multiple maintainers trying to merge these would
cause some conflicts, it would be more manageable for Jon to
take all of these through the docs-next tree.]

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org

 Documentation/userspace-api/ioctl/ioctl-number.rst |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20261116.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ linux-next-20261116/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -193,8 +193,8 @@ Code  Seq#    Include File
 'L'   35-38  arch/m68k/include/asm/fbio.h
 'L'   35-38  arch/sparc/include/asm/fbio.h
 'M'   all    linux/soundcard.h                                         conflict!
-'M'   01-16  mtd/mtd-abi.h                                             conflict!
-      and    drivers/mtd/mtdchar.c
+'M'   01-1A  mtd/mtd-abi.h                                             conflict!
+'M'   03-04  drivers/mtd/mtdchar.c
 'M'   01-03  drivers/scsi/megaraid/megaraid_sas.h
 'M'   00-03  drivers/video/fbdev/mb862xx/mb862xxfb.h
 'M'   00-0F  drivers/video/fsl-diu-fb.h                                conflict!
@@ -203,7 +203,7 @@ Code  Seq#    Include File
 'N'   80-83  uapi/linux/ntsync.h and uapi/linux/nvme_ioctl.h           conflict!
 'N'   84-8F  uapi/linux/ntsync.h                                       NT synchronization primitives
                                                                        <mailto:wine-devel@winehq.org>
-'O'   00-06  mtd/ubi-user.h                                            UBI
+'O'   00-08  mtd/ubi-user.h                                            UBI
 'O'   1F-3F  linux/omapfb.h
 'P'   all    linux/soundcard.h                                         conflict!
 'P'   60-6F  sound/sscape_ioctl.h                                      conflict!
@@ -305,7 +305,7 @@ Code  Seq#    Include File
 'n'   E0-FF  linux/matroxfb.h                                          matroxfb
 'n'   F8-FA  video/sisfb.h                                             sisfb
 'o'   00-1F  fs/ocfs2/ocfs2_fs.h                                       OCFS2
-'o'   00-03  mtd/ubi-user.h                                            conflict! (OCFS2 and UBI overlaps)
+'o'   00-06  mtd/ubi-user.h                                            conflict! (OCFS2 and UBI overlap)
 'o'   40-41  mtd/ubi-user.h                                            UBI
 'o'   01-A1  `linux/dvb/*.h`                                           DVB
 'p'   00-0F  linux/phantom.h                                           conflict! (OpenHaptics needs this)
