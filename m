Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789599;
	b=CPddHMB9r3H63Dzee757K6Fzfs7+j0p5v3lF6VqOkxXsINmGkexy6lnIG3CXeJ69yaXQ
	 Q23A1/n1JPO+APuTo0n9YocLzC31C6x1hn6AAYg9CWraCAhVDQDpP/ffB+0hx3tTmpNgn
	 npPGLxxZP5doTYBP5SSOxb3Yt2NTd5W5xVwAcmAEX0tjafjLiMhXBuru+9ClB4rCUytTW
	 w6QLSQy7heVjfMVyob3lOX+kauWV8kzo+SSNHnJOVcJAt+CG6ZEFOP3/a1zXoZPKnTjna
	 B0NVbRsK98Cdb7jbpLcM55XaPLFTBCfRTzLqfncXmZeDfAdR7I/5cpBosT9srDIKtYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789599;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=zu0lJYnLrg1ZYSrYUBUQpODtv+uDnit0AU11jYGH7x4=;
	b=ovi63ZwwaEOv05qv9X8yL5RFKBYq4GmapEEeiFF0Ze+JP5k1ZawjPdeMFXWHVCl8n3Vr
	 i0T0L2OrXvH2+7/pIlzuS8OiyPQoot5Q6BnSaTLXSxVSVARs6/Ru55jtEITKKRus2LHWS
	 IXREh5uPAv+2jYDT52h54iGjqxAYWd/kc2xoLhbqwvKYILQCX4o4JOp/1sfLzCakOBJrW
	 9s3f9ourD0TPLcjWmjxqtccx7V+vXAFpIGul6rovtk/jBRSqLPS667fCGe700ENWJ9eNJ
	 IjqSPfNCuzxmGtSXVIHfC31FIV7/35cbJlUki4fjTRe/t8/a218NoGfxViZsZiWo/yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=F5FxOjCN;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE9606A695
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56DE9606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=F5FxOjCN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C43F3C2AC4D;
	Fri, 27 Nov 2026 14:26:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 064DA6049C;
	Fri, 27 Nov 2026 14:26:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77B1111E68FD9;
	Fri, 27 Nov 2026 15:26:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zu0lJYnLrg1ZYSrYUBUQpODtv+uDnit0AU11jYGH7x4=;
	b=F5FxOjCNucjObr+WpOHDrEhkZVlYHLQEzVZPxyFtxTgV4dEIzIKnUN7gxonuOrhSqt9p9e
	SZgyMm5WF9oF5//bprUzP0wEVKjkXBG8brJ9Lpd2+pqj7JZf5RyAYk4IBBgvnOSkZuJsQR
	2T8fXKyTJ3NMrC9KryISZCkIhYemuPGhB55+OmsKA+n2yJRZLtZ27dyJXEsPCQDPyK5EBm
	U1IeQDQJvLpcLC73J9fuABHcni2av3M+s1RZs+HuC62rl4UkR6N3788pNG1i5gujetnks9
	6qTztonu2XIu+6i9c9N81L82lXcEsgVWSBH5jwUUiIgRSrss6FuwJ4DWNqf6PQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:46 +0100
Subject: [PATCH RFC v2 24/35] spi: rpc-if: Consume dummy cycles directly
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-24-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
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
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 linux-trace-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The controller programs the dummy phase in clock cycles, but the driver
converts the legacy dummy byte count into cycles. Advertise the
dummy_cycles capability and use op->dummy.ncycles directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-rpc-if.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rpc-if.c b/drivers/spi/spi-rpc-if.c
index 9a740342d0f7..fb27ee6064c2 100644
--- a/drivers/spi/spi-rpc-if.c
+++ b/drivers/spi/spi-rpc-if.c
@@ -32,10 +32,9 @@ static void rpcif_spi_mem_prepare(struct spi_device *spi_dev,
 		rpc_op.addr.val = spi_op->addr.val;
 	}
 
-	if (spi_op->dummy.nbytes) {
+	if (spi_op->dummy.ncycles) {
 		rpc_op.dummy.buswidth = spi_op->dummy.buswidth;
-		rpc_op.dummy.ncycles  = spi_op->dummy.nbytes * 8 /
-					spi_op->dummy.buswidth;
+		rpc_op.dummy.ncycles = spi_op->dummy.ncycles;
 	}
 
 	if (spi_op->data.nbytes || (offs && len)) {
@@ -141,6 +140,10 @@ static const struct spi_controller_mem_ops rpcif_spi_mem_ops = {
 	.dirmap_write	= xspi_spi_mem_dirmap_write,
 };
 
+static const struct spi_controller_mem_caps rpcif_spi_mem_caps = {
+	.dummy_cycles = true,
+};
+
 static int rpcif_spi_probe(struct platform_device *pdev)
 {
 	struct device *parent = pdev->dev.parent;
@@ -167,6 +170,7 @@ static int rpcif_spi_probe(struct platform_device *pdev)
 
 	ctlr->num_chipselect = 1;
 	ctlr->mem_ops = &rpcif_spi_mem_ops;
+	ctlr->mem_caps = &rpcif_spi_mem_caps;
 
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_TX_QUAD | SPI_RX_QUAD;

-- 
2.56.0

