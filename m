Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531428;
	b=cSP1V2lekiqvDh/9om4i/smBUAaJw0r+0pek823+CEOAV0dgDOQrZa6nwKyYSZlfkwVr
	 2/iiTwA01TwWcnHZFbUNn3AmDVT9D3XYjZr5d73FY3i+vWNXpZCzl93XAVOlC77jbg/Dz
	 D1IXOKIFGrNNzGWa0XOTmE1IByTvDZ04s4ldyz3f2xjWrMVmLns2cwkmJ8bYF4cNOavAT
	 xIpBLXRwR0XFrgn/mRb00rFIQ//3oYKpGwI1MdqW+CNMHuvm1tA8f1HsjH1RxPBuU+e7N
	 tIe/pTZXUjwuEOJbUWrMfvtY2DnBseQCWzdlZTqjs3RqZuwYo+8MVX0KTQxcmM2lzBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531428;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=JtGhgqBAQuqqN1KtexCFqV91pTqo3Nnc4XqxMUDBzPI=;
	b=gxHXyk1FzA+J2q+oJIxroF95uFFPlzIhx8ACq3VThtfmNZ5JTz0ApiaQCOE3xl48BoV9
	 BYTIW680BOMKrKa386vccgfYQG28lG5qaCabVTX0r6PXeYOaOYn4X9Jf5/DFF9EbL1qpv
	 QAsHZxoFlhwdZpxgN/IjmVVb7iKaMd5KRNDmGGvtTk1AgxKQbyLu93Dh4FZg6x6wxnsGV
	 aPedUlelFyF986Kzb3euqMuSdl1hQD+LGJuJ/4ewhbrx/xMQjaBeM2OW8myphpHa42iJy
	 3Ylv+XuA0pcf6y5ZQxg68fQYRCCQD3QBeofEc1Z0qc5EQcGB9gvSqWD2/R0AiOUQdRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=trqpXtGI;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25A0606A6A8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25A0606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=trqpXtGI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 19DA4C2C65E;
	Tue, 24 Nov 2026 14:43:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DA2D601E1;
	Tue, 24 Nov 2026 14:43:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 068D111E6998D;
	Tue, 24 Nov 2026 15:43:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531425; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JtGhgqBAQuqqN1KtexCFqV91pTqo3Nnc4XqxMUDBzPI=;
	b=trqpXtGIsqg7UK+KQZ5ZBMwauS50UfWktjROQpsjI7vjgdt41G3luHLFPdA6zVf9mQRIzc
	U++NBM9IUlHGihbUP5rU6fQAAQLyV8QuQKXZdcxSHLlxvV2eSs4xJzQ7VdwPmUF4jua4KF
	/sQvsG2DtuGRsdtyZcECKY9CGWJELkWEwcq3ic2RgZsJuApV8pWLO4p+rrdQphozLwGJbF
	u506w12QOEmr6xrur8Jx/MYLeOZ8JqF/Tm9bU+lc9CucIUcZcP1PV3tfZnTKqHj4ehtxUt
	RRJ5ZWI29K2uH8QIOj2vCS+0/StB4LDvCvvCuVeqQGllqdEkqaCzUP+sxlzhaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 15:43:07 +0100
Subject: [PATCH v5 6/6] spi: cadence-quadspi: Advertise DQS support
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
Message-Id: <20261124-winbond-nand-next-phy-tuning-v5-6-261e0e712857@bootlin.com>
References: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
In-Reply-To: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The Cadence QSPI controller supports DQS read data capture. Advertise this
capability in the controller memory capabilities so that
spi_mem_dqs_is_usable() reports DQS as usable when the memory supports it
and the DQS line is wired.

This lets memory drivers enable the DQS output only when the controller is
able to make use of it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 44d96b8cf8f0..6b4363466388 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1739,12 +1739,14 @@ static const struct spi_controller_mem_ops cqspi_mem_ops = {
 static const struct spi_controller_mem_caps cqspi_mem_caps = {
 	.dtr = true,
 	.per_op_freq = true,
+	.dqs = true,
 };
 
 static const struct spi_controller_mem_caps cqspi_am654_mem_caps = {
 	.dtr = true,
 	.per_op_freq = true,
 	.no_cs_assertion = true,
+	.dqs = true,
 };
 
 static int cqspi_setup_flash(struct cqspi_st *cqspi)

-- 
2.56.0

