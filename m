Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967981;
	b=06HPtY2tQYKyITziarKImLIHNpXScWEoqrU5BdaK7B1KCLiq6VnDARbX8mRCzdognBmA
	 1Gr1RpyGBJwpnvt8HF6sy4TnD5nCKe6SMg4nZ15X06UdPsyFp1UvE9hHUXvmeHzQLd+W1
	 ubl2kRfGFK+SVcMMcPE/k28QkqmsIpivfEp3oMe1JzPhscW6mXirYwOTR+0qA1j5tHaYL
	 eUpTRKwdc/bpD2bboIg2431bA+yuNPqm8ZxtW2cq/cA+MJtlIqJbSJ0yOD5mUR/GyznGB
	 NVd8mcACoYkpTWkuAGkusHYFM9MqM5D/QO/TFubpq5GwfEeOI/q1ta1Up2cLAgR4OEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967981;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s2JJHN2g30Yts/u9cQZA6XudMmaASrrbwWdwm+BQBFI=;
	b=Yu2UTFq57ejOMyafpcyndHbltO7lkJrQqnVEcR6kymrRmXh+7ulVa5vu3jG2bh5Zcw1+
	 eGGFcdUWNYYmgZLmRTnFmgU75jEkpzH4K9/ZmX8PfCub3I+5ZRLb/e14UMrPJ8bHgt55E
	 afROq+aiV0BRiJ+EhhKp8myc43azxUcgwGaW2YglY2HYl/1t/2CUDX+uL7WTSr1Zwjxql
	 W0ggqVRy+41SWELgg+DaSBPfK1UgaQTJzF73sCGFG21n4BzWou5zIG+07cBvoxxi3kycj
	 TvNrFV3w3Lb37+qgY8nDjYGy8Cg4zsPBe8NCZqPplxjw6tvgBpulU0DrkAdmN6ap5tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rhazpaYn;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5D5606A337
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5D5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rhazpaYn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rhazpaYnIPgI0eB2VZF9TPkTgw5xsk1Ol1MUD/zL4SzRF6pNEISmJ3e5wnBzvYZMuPj19pLJeQESp
	 gGI9BvpqEwSDGMcAgvS2dXthpA+U3DfiKA3cxSydPLiOLZ0eGDXjXqmHrM95Sy4dqyQArAlF58SdQs
	 UugpxAjI7vz6aIuU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afd09a3e10-ae400;
	Wed, 18 Nov 2026 10:12:51 +0800 (CST)
X-RM-TRANSID:2ee86afd09a3e10-ae400
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afd09a1cf7-c5347;
	Wed, 18 Nov 2026 10:12:51 +0800 (CST)
X-RM-TRANSID:2ee66afd09a1cf7-c5347
From: zhaofeng2@cmss.chinamobile.com
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 1/2] mtd: rawnand: parse GPIO CS with devm_gpiod_get_index_optional()
Date: Wed, 18 Nov 2026 10:12:46 +0800
Message-ID: <20261118021248.1952-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
References: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
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

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

rawnand_dt_parse_gpio_cs() acquires the CS GPIO descriptors with
gpiod_get_index_optional() and hands them to the caller, which must
release them on error and at remove time.  If a later loop iteration
fails, the descriptors acquired so far are leaked as well.

Acquire them with devm_gpiod_get_index_optional() instead, so the
device-managed framework releases them on probe failure and at device
removal, and its only caller, the arasan driver, can drop its manual
gpiod_put() bookkeeping.

Fixes: b85c943d181a ("mtd: rawnand: Add a helper to parse the gpio-cs DT property")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
'cs_array' is already devm-allocated, so after this change both the
descriptors and the array are released by devres.

v2: respun to use devm_gpiod_get_index_optional() per Sashiko's review
    and Miquel's request (managed version instead of manual rollback).

Verified against current upstream master.  Not runtime-tested (no
hardware using gpio-cs).

 drivers/mtd/nand/raw/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5479,8 +5479,8 @@
 		return -ENOMEM;
 
 	for (i = 0; i < ndescs; i++) {
-		descs[i] = gpiod_get_index_optional(dev, "cs", i,
-						    GPIOD_OUT_HIGH);
+		descs[i] = devm_gpiod_get_index_optional(dev, "cs", i,
+							 GPIOD_OUT_HIGH);
 		if (IS_ERR(descs[i]))
 			return PTR_ERR(descs[i]);
 	}


