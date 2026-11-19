Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126463;
	b=Po6zbSaNfbvl5CMywvRW/eIG2Xc/ESoK+7u2147jdZAafl6Zi/lqCjHTmNT3CIzGoc81
	 5YuAd92r8kiIZAH3kpP34RlXf+Lulut4BlMN9qxNlNV5D3R4IvjibLYchfG29XSqW7Wip
	 Jxrl247+RyM2mxGCjL9vyiwT8E5M4hryfvrvI9cSNUc5NkMEEmHVRdbG4UgatXerkCbgr
	 bwXCj0ZzlmRTaVLsUYvJiQ/KApZdjQxBjf7zfHZCr0UoIQk7fHvekJ0LQ4vAgjU2s+vhZ
	 Mk+1gOBzeNLjkI+kK2/SDt9NO6nWRqPPmEE56P6y6v5rtxD3wGyT7lyEIrWBeUlvw1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126463;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=QUhDIKa/sqfQRowaGrbQDBdkAr5ivf2TV421uK0bqak=;
	b=oEDG3JJrGze5b+7E23mz/A4NZ9rWjF7GayKdHGlo7pvJPG/IvYUK4pWyROBLu8amYfHQ
	 KgDTGSiu/h/o94LM3laN9gTBGrFKj1gYVfRk3/z6QbMpEs3x0wvqcWsCmQDsMzWOSjJqb
	 V8up9hx8bJJrM6P5ZJADK0NyyICQfeVhKgbL1sLA2zCCTp4mKtdsAgDeuSZqQlFFpMqA7
	 16NoPzsimbxNl//OoHS4AqxtrtVllkDs/lV/7dJfSyUIzBCL4AroQIRzmWjf4acnvF6rt
	 z/S+D1u68pQnQaLSv8uVtq+y6XWVwIy0/BSXdhDrbgs9wMXTZsoVrHtvwgX2Mh5Ji8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2BQVFObA;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4A7606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E4A7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2BQVFObA
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D63F21A172B;
	Thu, 19 Nov 2026 22:14:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A378E6035B;
	Thu, 19 Nov 2026 22:14:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDA4B11BC0DFB;
	Thu, 19 Nov 2026 23:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795126455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QUhDIKa/sqfQRowaGrbQDBdkAr5ivf2TV421uK0bqak=;
	b=2BQVFObAwb7foT8q7P8Uhx8Iqr69QEuila1vxzLrlqOrhOz0wchEK5miLp0mq7IOFux8DK
	jQ8TbacyPas5yu5p/f1Zts7uim7ghTa5ogDb5ZihYp2gMkw0n6u9kM7PxjhMfQXR2wWbxn
	c9UuxjHVbqlCdFi+cQqulUhc6OJceBcA9cgEF8Nti3zn/VevkBwHFy4cmgwf7NopIDv2iG
	Bl9AIFXokuKQg9OREXnLe7Okn/2d+R1MIoH682EHR2+GhFz5jFMV5YE476QeTATHVcVYsz
	qeLAE9y7T8CuIeTRJlOpg58B6DKy/IPOLOAYEq+bBy6j5Xa2BqY2iJeqMWqXHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Nov 2026 23:13:51 +0100
Subject: [PATCH 1/4] mtd: spi-nor: Return early in the non-RWW lock paths
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-1-da72ad9c2d4e@bootlin.com>
References: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-0-da72ad9c2d4e@bootlin.com>
In-Reply-To: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-0-da72ad9c2d4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Return early from the non-RWW path so the RWW branch can later grow.

No functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a04d22d2e2e1..fdd6ff1e0aba 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1224,11 +1224,13 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (!spi_nor_use_parallel_locking(nor))
+	if (!spi_nor_use_parallel_locking(nor)) {
 		mutex_lock(&nor->lock);
-	else
-		ret = wait_event_killable(nor->rww.wait,
-					  spi_nor_rww_start_exclusive(nor));
+		return 0;
+	}
+
+	ret = wait_event_killable(nor->rww.wait,
+				  spi_nor_rww_start_exclusive(nor));
 
 	if (ret)
 		spi_nor_unprep(nor);
@@ -1298,11 +1300,13 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 	if (ret)
 		return ret;
 
-	if (!spi_nor_use_parallel_locking(nor))
+	if (!spi_nor_use_parallel_locking(nor)) {
 		mutex_lock(&nor->lock);
-	else
-		ret = wait_event_killable(nor->rww.wait,
-					  spi_nor_rww_start_pe(nor, start, len));
+		return 0;
+	}
+
+	ret = wait_event_killable(nor->rww.wait,
+				  spi_nor_rww_start_pe(nor, start, len));
 
 	if (ret)
 		spi_nor_unprep(nor);
@@ -1374,11 +1378,13 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 	if (ret)
 		return ret;
 
-	if (!spi_nor_use_parallel_locking(nor))
+	if (!spi_nor_use_parallel_locking(nor)) {
 		mutex_lock(&nor->lock);
-	else
-		ret = wait_event_killable(nor->rww.wait,
-					  spi_nor_rww_start_rd(nor, start, len));
+		return 0;
+	}
+
+	ret = wait_event_killable(nor->rww.wait,
+				  spi_nor_rww_start_rd(nor, start, len));
 
 	if (ret)
 		spi_nor_unprep(nor);

-- 
2.56.0

