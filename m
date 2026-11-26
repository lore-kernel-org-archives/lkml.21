Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720270;
	b=oO1hV4XowmlaVzglyp2DaWyazY4T+YeO4oCEN23vaZHLT9aCc0tRhVtVVP7piJM/mBTl
	 kc3uWzadKTJ4/0PCxqDZ/sXeWXvEKUDIYmlbT975fOzhSlZkbojfWghNDrh+5qbvnEptm
	 Az9dk9PVygV1ohY/7fkLk9ugI01jS7OgjJ0OUK3Z1QSqWIHKZAWYcOfZrr0auDarh9xeA
	 0nXofMBgW2PnWMuQIkhcQiB0IgajRrls1bg0vwgQt1AindMJp9MnojamHNaLPzY2ggswQ
	 GiC+MZUkOHzosFXEF67+At4IxPT/q9alpgDGCshpSKaRkCuVD1qvLVtJ32NXHg3cLBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720270;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=/M+HfMNi3TcbhGwOrAuJ9bcXyilkjFKwqsxMBnv5EpI=;
	b=qwhxJgfzLBDNXQDoIWuFN34us036MmBcewfwRRnZZWzUfQr687ZYWf68s3Hm7wwwLKlB
	 fk2vuaEC89RNyj8tt63hl/kJMvvJvMOt5bALG11J+Dec8CaA3kClwGtXCb/bR7/q8IIfr
	 dj61DLlusCCzc8cMM+Fpw2sEgXtHmPzkXdad5CkZNhBz46LrLSoK1m7z2XjTbHFyxx+lU
	 UxQTKMH0uOqJ/FsOWmtuxI9a65//lqEPUdd/0ZSateYvwB+nffdJaZQcYrljsNra5EwOs
	 3iC2d00A5eDZWxG4Da7dW21UnpYwcOsNcTi5QaYzxr+Gq7GydRHZ1wTwtmXpyUsmnFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Mmv91+qO;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52E1606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A52E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Mmv91+qO
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C1914E417B1;
	Thu, 26 Nov 2026 19:11:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0073F60558;
	Thu, 26 Nov 2026 19:11:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7E7211E691C2;
	Thu, 26 Nov 2026 20:10:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720262; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/M+HfMNi3TcbhGwOrAuJ9bcXyilkjFKwqsxMBnv5EpI=;
	b=Mmv91+qOiLKrIGNBpZKd6M+eVyf+7sO0JRHY0vUhU+ENb3oO0WfPB99X2BHhnbihfSmm0J
	v6V2vLx93smS0GkTp1XPcMcMunQA9ifroOL8gmYvVJO8lBDcWRPrpiAlWz9Wf6hfglZxGr
	Bup9d9XxjNiyms+qumpmt0iiXT416j/CPONuMU5HusooMDcIRhECS3iAej4+nHqIi1LNEH
	zRUurl+UTTCfPacswOM94xvnPc/Y4DO5w1CaDoIowe9ficpWxPNb/T5N7QqZS3U+q+dTSO
	VbT5eemGG7ygC7Tic7RdvcnGwM99CX+AF3C6NtKCAnuzA9VJZLg3wPaZKSWTwA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 20:10:21 +0100
Subject: [PATCH 02/12] spi: amlogic-spifc-a1: Fix a typo in a macro
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
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-2-ca8e924cca1b@bootlin.com>
References: <20261126-macronix-upstreaming-spi-driver-fixes-v1-0-ca8e924cca1b@bootlin.com>
In-Reply-To: <20261126-macronix-upstreaming-spi-driver-fixes-v1-0-ca8e924cca1b@bootlin.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>, 
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, 
 Mark Brown <broonie@kernel.org>, CL Wang <cl634@andestech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Yang Shen <shenyang39@huawei.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Correct the macro name: sycles -> cycles.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amlogic-spifc-a1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index 388bd2472dc0..c7cccc8de6dc 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -43,7 +43,7 @@
 #define SPIFC_A1_USER_CTRL2_REG		0x208
 #define SPIFC_A1_USER_DUMMY_ENABLE	BIT(31)
 #define SPIFC_A1_USER_DUMMY_MODE	GENMASK(30, 29)
-#define SPIFC_A1_USER_DUMMY_CLK_SYCLES	GENMASK(28, 23)
+#define SPIFC_A1_USER_DUMMY_CLK_CYCLES	GENMASK(28, 23)
 
 #define SPIFC_A1_USER_CTRL3_REG		0x20c
 #define SPIFC_A1_USER_DIN_ENABLE	BIT(31)
@@ -90,7 +90,7 @@
 #define SPIFC_A1_USER_DUMMY(op) ( \
 	SPIFC_A1_USER_DUMMY_ENABLE | \
 	FIELD_PREP(SPIFC_A1_USER_DUMMY_MODE, ilog2((op)->dummy.buswidth)) | \
-	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_SYCLES, (op)->dummy.nbytes << 3))
+	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_CYCLES, (op)->dummy.nbytes << 3))
 
 #define SPIFC_A1_TSLCH_VAL	FIELD_PREP(SPIFC_A1_TSLCH, 1)
 #define SPIFC_A1_TCLSH_VAL	FIELD_PREP(SPIFC_A1_TCLSH, 1)
@@ -195,7 +195,7 @@ static void amlogic_spifc_a1_set_dummy(struct amlogic_spifc_a1 *spifc,
 {
 	u32 val = readl(spifc->base + SPIFC_A1_USER_CTRL2_REG);
 
-	val &= ~(SPIFC_A1_USER_DUMMY_MODE | SPIFC_A1_USER_DUMMY_CLK_SYCLES);
+	val &= ~(SPIFC_A1_USER_DUMMY_MODE | SPIFC_A1_USER_DUMMY_CLK_CYCLES);
 	val |= dummy_cfg;
 	writel(val, spifc->base + SPIFC_A1_USER_CTRL2_REG);
 }

-- 
2.56.0

