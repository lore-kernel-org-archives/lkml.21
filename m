Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629173;
	b=dOatay1DcAJUbkfZ4k1oWS7y6F+fMUAWiRprKztq/aYZ4kP2hsFp2DKsgGUeUT9lNeZX
	 adwskH5z8nn6Ac4vovht264XUu47tcCN5Xbt9kvwuZJHoUe3L1SoVIP6piqLaDlBZp4Mw
	 9c7Nvkq91amIq9worWQWQWE8Til6LaRfuY8rDiGfWJBReT/8Ly28VGFzM+rsJFDDerQ16
	 Pp5SQz48Hn831NH+orY8V71TEAUU2JATKIPcDVIXlPmjE1BVI/of2W4cs7bzA2iOgYp8I
	 SB1mUNDCullWbWMzfZTDbXaUHzB5sFHgSVQOKwrswtMzEezncVeLfgs07FHfJ2NP0mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629173;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=HpXPXHLNQKnCKm1KDIi186rpwyG3ClwcXK0+xR+nAi0=;
	b=QsnnKeFun8r2MXOrZbNdnsAN5sYdrIptwy7t4sHz8crUe5Rq+cPmhrEXRGMLOjs7B/pt
	 zcLlUNlxA6QGcML+vSb0zkVV5rRV9pSal9XHUEK92/i0sWAu0gtnIWmz9/G1/tCq3tSe8
	 55wvnTNRCVNy9h7zkg3TTOVHyyH2w9/0haDBbjlSBFVPYHRevR165/hzXhV5oW5C76S9l
	 Qq5XfYC1zI69MM+43UgyZQhxy/l2meZDq1qBmwcbFwbMvPFvKwo8Kw8DfdlA9HHfx2qxT
	 xzBizUG7jKQHehk70ldCcrQUyd4T+i+kH/yfu5o36gwDJm6hLlJX2gYNXq7Snsnkg/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uOVjcbep;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E0760A2635
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7E0760A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uOVjcbep
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F96F1A17F9;
	Wed, 25 Nov 2026 17:52:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BFC860480;
	Wed, 25 Nov 2026 17:52:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06DFD11E6B0AE;
	Wed, 25 Nov 2026 18:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HpXPXHLNQKnCKm1KDIi186rpwyG3ClwcXK0+xR+nAi0=;
	b=uOVjcbepMVghU3Xt2SG7QOb3JSmFCzapwgCUKfCq9dpEuxMxrMF93Wnd+O30WhLzMFIgFc
	JSLJPATYaztrx0hrKJSs9Uyl6NXlzRaSqjgJApKdQlTI2ZycKuiR61ZvZzef0QoxSK31ql
	DXHYqcajgfd7cM5w5si0xxNxXmbT4hn1jBHeLQKGqeaquYILRvY8HgVg16J3e9TztQ7l83
	+H/yh+E0k+N/D0A2ozCcCkRXpVswYatbiSBtrPcDSim4vsMez55JCsWw1wKFhPX11dhEqX
	HdyGKYUmakcaHCNQ7oGkWsYEnoGbkdKwS197xUICWrQ+RwIvAEpmZmtrKFlA/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:27 +0100
Subject: [PATCH RFC 13/16] spi: sn-f-ospi: Consume dummy cycles directly
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
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-13-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The spi-mem layer is now capable of providing the dummy phase in cycle
units rather than bytes, provided that drivers advertize the dummy_cycle
capability. Since this controller is consuming cycles and currently
converts bytes into cycles, flag it capable to consume cycles directly
and drop the extra conversions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-sn-f-ospi.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-sn-f-ospi.c b/drivers/spi/spi-sn-f-ospi.c
index f0320e96fe23..ecfcf228c587 100644
--- a/drivers/spi/spi-sn-f-ospi.c
+++ b/drivers/spi/spi-sn-f-ospi.c
@@ -114,14 +114,6 @@ struct f_ospi {
 	struct mutex mlock;
 };
 
-static u32 f_ospi_get_dummy_cycle(const struct spi_mem_op *op)
-{
-	if (!op->dummy.nbytes)
-		return 0;
-
-	return (op->dummy.nbytes * 8) / op->dummy.buswidth;
-}
-
 static void f_ospi_clear_irq(struct f_ospi *ospi)
 {
 	writel(OSPI_IRQ_CS_DEASSERT | OSPI_IRQ_CS_TRANS_COMP,
@@ -348,7 +340,7 @@ static int f_ospi_indir_prepare_op(struct f_ospi *ospi, struct spi_mem *mem,
 
 	f_ospi_config_indir_protocol(ospi, mem, op);
 
-	writel(f_ospi_get_dummy_cycle(op), ospi->base + OSPI_DMY_INDIR);
+	writel(op->dummy.ncycles, ospi->base + OSPI_DMY_INDIR);
 	writel(op->addr.val, ospi->base + OSPI_ADDR);
 	writel(op->cmd.opcode, ospi->base + OSPI_CMD_IDX_INDIR);
 
@@ -553,7 +545,7 @@ static bool f_ospi_supports_op_width(struct spi_mem *mem,
 static bool f_ospi_supports_op(struct spi_mem *mem,
 			       const struct spi_mem_op *op)
 {
-	if (f_ospi_get_dummy_cycle(op) > OSPI_DUMMY_CYCLE_MAX)
+	if (op.dummy.ncycles > OSPI_DUMMY_CYCLE_MAX)
 		return false;
 
 	if (op->addr.nbytes > 4)
@@ -580,6 +572,7 @@ static const struct spi_controller_mem_ops f_ospi_mem_ops = {
 
 static const struct spi_controller_mem_caps f_ospi_mem_caps = {
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static int f_ospi_init(struct f_ospi *ospi)

-- 
2.56.0

