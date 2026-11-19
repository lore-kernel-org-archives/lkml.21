Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126480;
	b=bMhL0IXky8LATdaNbz/DEK4NhYtgm2CXiIdOScuHpKpKtGRCB4KUAnN20lrZsvZtxaIy
	 9PDTZVCvSVEeAuBD73xjlL3B1mvXJ9yAzdWgnGWj91uQWt1YHlFwkDqdksBqXixTazUnW
	 w4UkSjUC+yrNNO7kBrqEtGR8TmNmyBHwfLNfUlQhVog9AzFoHJ2U0IPijBryQntnLjYUo
	 WscxV6zO6guTL8/JpgTieHUpJXVGOoPlwInlyVIlXjknEUdp3CMRzrQlsRKh0BLxBQmcs
	 431Mk37a0/D6VGy5qLFg+bhTSVuLEur19goa6oxzZ5FYSsltZo6CN7OtZUVHWQQIMpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126480;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=sBOk3zq3/sAxgpSLSLJdWXLaL1GWT/tFKJSdrQrw+zw=;
	b=16U6PdzrpcFSrmcPs4FAKRo0OG1ME2KA9mIzi0i+SxinrQyrT/wngRJMb973SVFQi7nv
	 BhRbWjHQOqP2wZf8+p5qZr+KvTa5soti1mVU8a6giUXyqbBCYxQ/WS7IH74HMJ/gptVNv
	 AAgaNFPNr253cjOZIxLHqxxzR22SRowkw2x1Y3AlRqp8eBlb1WUITb7b8lb2MFddM23ti
	 mnVXWcfANM17DnqEnJr2PM0PlLExN60XTHASR3sUYebiLrQptTbZR3aX7VLJvhMyDo4hP
	 f0GUqIzslIvv4nSb03z2lcQMZslsxE1rCPWzF9+m734MYsRLxY3C1uCQuqm0WMs+/3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bmPNfoBK;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F6F606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F6F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bmPNfoBK
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 945FD4E41676;
	Thu, 19 Nov 2026 22:14:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61FB16035B;
	Thu, 19 Nov 2026 22:14:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F07911BC0EF6;
	Thu, 19 Nov 2026 23:14:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795126473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sBOk3zq3/sAxgpSLSLJdWXLaL1GWT/tFKJSdrQrw+zw=;
	b=bmPNfoBK4zcS4Lzw9/eZ1ndS5A3d9cSGMxwpu9FbvVTzZln/KpwfiJq7U3jUBuhrrwrOie
	NxAjmk/Jf6h7rf8nuHEB6ugmJH/dnj0EfHsi/y6i3O7C/LmAxRkthOfjpqcjuGmUn7JF4G
	2nXy7LpYAnP/r9NavmHoahTUC96GpeWLv8wzSQQr/b1/VPcPUhM3LQ6U3nEJgJZ4q0b4Qo
	OVW9njfvt8Sj6BDNvu2uboDMcMDoCF08d6JTRVaxHRdg2e6eIQeTcu/66FvY3WBybN75oC
	1c/wPJt/Lj9r+c76y/qwyRFwIyEtPhkA4EE/cmRyG1zYFxLD6sTfkukRE7h43A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Nov 2026 23:13:54 +0100
Subject: [PATCH 4/4] mtd: spi-nor: Prevent KCSAN warnings in the RWW path
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
Message-Id: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-4-da72ad9c2d4e@bootlin.com>
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

The RWW wait predicates expectedly sample the "ongoing" state of the
chips without nor->lock. Mark the state updates with WRITE_ONCE() to
pair with the existing READ_ONCE() to avoid possible KCSAN warnings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 46 ++++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d46c18e4401c..623275637495 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -579,8 +579,8 @@ static int spi_nor_rww_start_rdst(struct spi_nor *nor)
 	if (rww->ongoing_io || rww->ongoing_rd)
 		return -EAGAIN;
 
-	rww->ongoing_io = true;
-	rww->ongoing_rd = true;
+	WRITE_ONCE(rww->ongoing_io, true);
+	WRITE_ONCE(rww->ongoing_rd, true);
 
 	return 0;
 }
@@ -591,8 +591,8 @@ static void spi_nor_rww_end_rdst(struct spi_nor *nor)
 
 	guard(mutex)(&nor->lock);
 
-	rww->ongoing_io = false;
-	rww->ongoing_rd = false;
+	WRITE_ONCE(rww->ongoing_io, false);
+	WRITE_ONCE(rww->ongoing_rd, false);
 }
 
 static int spi_nor_lock_rdst(struct spi_nor *nor)
@@ -1215,7 +1215,7 @@ static bool spi_nor_rww_start_io(struct spi_nor *nor)
 	if (rww->ongoing_io)
 		return false;
 
-	rww->ongoing_io = true;
+	WRITE_ONCE(rww->ongoing_io, true);
 
 	return true;
 }
@@ -1223,7 +1223,7 @@ static bool spi_nor_rww_start_io(struct spi_nor *nor)
 static void spi_nor_rww_end_io(struct spi_nor *nor)
 {
 	guard(mutex)(&nor->lock);
-	nor->rww.ongoing_io = false;
+	WRITE_ONCE(nor->rww.ongoing_io, false);
 }
 
 static int spi_nor_lock_device(struct spi_nor *nor)
@@ -1261,9 +1261,9 @@ static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
 		return false;
 
-	rww->ongoing_io = true;
-	rww->ongoing_rd = true;
-	rww->ongoing_pe = true;
+	WRITE_ONCE(rww->ongoing_io, true);
+	WRITE_ONCE(rww->ongoing_rd, true);
+	WRITE_ONCE(rww->ongoing_pe, true);
 
 	return true;
 }
@@ -1273,9 +1273,9 @@ static void spi_nor_rww_end_exclusive(struct spi_nor *nor)
 	struct spi_nor_rww *rww = &nor->rww;
 
 	guard(mutex)(&nor->lock);
-	rww->ongoing_io = false;
-	rww->ongoing_rd = false;
-	rww->ongoing_pe = false;
+	WRITE_ONCE(rww->ongoing_io, false);
+	WRITE_ONCE(rww->ongoing_rd, false);
+	WRITE_ONCE(rww->ongoing_pe, false);
 }
 
 int spi_nor_prep_and_lock(struct spi_nor *nor)
@@ -1333,8 +1333,8 @@ static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 	if (rww->used_banks & banks)
 		return false;
 
-	rww->used_banks |= banks;
-	rww->ongoing_pe = true;
+	WRITE_ONCE(rww->used_banks, rww->used_banks | banks);
+	WRITE_ONCE(rww->ongoing_pe, true);
 
 	return true;
 }
@@ -1345,8 +1345,9 @@ static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
 
 	guard(mutex)(&nor->lock);
 
-	rww->used_banks &= ~spi_nor_banks_mask(nor, start, len);
-	rww->ongoing_pe = false;
+	WRITE_ONCE(rww->used_banks,
+		   rww->used_banks & ~spi_nor_banks_mask(nor, start, len));
+	WRITE_ONCE(rww->ongoing_pe, false);
 }
 
 static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t len)
@@ -1404,9 +1405,9 @@ static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 	if (rww->used_banks & banks)
 		return false;
 
-	rww->used_banks |= banks;
-	rww->ongoing_io = true;
-	rww->ongoing_rd = true;
+	WRITE_ONCE(rww->used_banks, rww->used_banks | banks);
+	WRITE_ONCE(rww->ongoing_io, true);
+	WRITE_ONCE(rww->ongoing_rd, true);
 
 	return true;
 }
@@ -1417,9 +1418,10 @@ static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
 
 	guard(mutex)(&nor->lock);
 
-	rww->used_banks &= ~spi_nor_banks_mask(nor, start, len);
-	rww->ongoing_io = false;
-	rww->ongoing_rd = false;
+	WRITE_ONCE(rww->used_banks,
+		   rww->used_banks & ~spi_nor_banks_mask(nor, start, len));
+	WRITE_ONCE(rww->ongoing_io, false);
+	WRITE_ONCE(rww->ongoing_rd, false);
 }
 
 static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t len)

-- 
2.56.0

