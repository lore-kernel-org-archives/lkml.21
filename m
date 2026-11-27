Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789434;
	b=vEm1doZlOKzikZX3brgkds/UlTYsn6TNg/mZWktXYwIN1EGk0gvtp01OTZY3GekoWum6
	 uOwGGHTmPggMZiVaOK5VHG84pYRWgRoSMPjdCdBIl4aCHFaR8TZgg3XcG370lJQxCWY6m
	 F3RhfiLsI3g+XLy5ahJYDDrE+b5C6tG8GDvcNBdW82ywemeMuMhZHeBjcN3KaAWzWYOGQ
	 G9JoetwkLu525QH2/eNKwYAOE23uDIBgfNqCvXzopoog79TF0J6DxP/3Bt7ZE5k6XM7Y3
	 mMRmT9u7lGS09+pseX7+F//5rzADYRYMZHWqINjVJOpXjwwhSrNhqJ2QrzGtpC0NWQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789434;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=rLV3AiVfesH7+JN4SghWwMFjSPsBHJqy3yngjEbzPMg=;
	b=HRM8sd/x7p0cDT0LFouczB9g6stJEenZPiwkg8qLu4P2rXOMGqDdzGrMlvthetU9qFtM
	 w+B1Bpb7P1H6pB+4YCfONel8uxhyRqSvEJjXqHOTWPgRsGzkLnGHr1M7r7Q6kxXCyq5fq
	 DjGf87YZy9F6ry36MK70igZ2FBXrEar6FuC64CmOdiXrPoeUeesnMBAKCJc21LZHrirDf
	 Omd2gh73j6WZkZGjSOEZJ2+o1TBjZ6eHa8XutT0L2I18Y9RVOFUG4NhG7Jv0poBHU/cdf
	 svz2g0bWOS3KyU5hQWCJNt/H2fwdhh27taQyV4d2/gduQYgKOu57TA1yQ0nL0eCuFew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VUC9H8n3;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA4B606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA4B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VUC9H8n3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 22E67C2AC4D;
	Fri, 27 Nov 2026 14:24:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 547B16049C;
	Fri, 27 Nov 2026 14:23:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6422611E68FDF;
	Fri, 27 Nov 2026 15:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rLV3AiVfesH7+JN4SghWwMFjSPsBHJqy3yngjEbzPMg=;
	b=VUC9H8n3pAarXQo2g6qN067XkCpnQwpm/9E/2Hk/I/tB2/1XjdWLGM9P4hBoCk9E1JFxvl
	7J73tquQz2tKFGE2WS1IAUZmedaT+KEy8IOWHjtt+NZ5NVCKpzAogmzQQ432xXmK788h7I
	OPnifGiuXyvdQgpKjfmZW/6R/gmGUXYAqZN5x8erH8kLD7UZmo88dREo0edxaZo7/VHVOB
	O8HcV8efoiegMzRWc5KP4Jp+8apQaRGkS6nhprcWVDoH/FjQQxuOI06RFltCq+Kqlauzdv
	16TuJt77aMuawELzzNmaPR/mVBrmDeGr+G1nP3Q9031kHufg6haf+aH0byuP1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:26 +0100
Subject: [PATCH RFC v2 04/35] spi: spi-mem: Sanitize mixed DTR modes
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
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-4-5c93f5e5d630@bootlin.com>
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

The following operations are supported:
- S-S-D
- S-D-D
- D-D-D
But the following are not:
- S-D-S
- D-D-S
- D-S-S

Make sure these cases are refused by the core.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 3989017dd86f..25f795d5e9ba 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -195,6 +195,27 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 		return false;
 	}
 
+	/* xD-xS-xS is not allowed */
+	if (op->cmd.dtr) {
+		if ((op->addr.nbytes && !op->addr.dtr) ||
+		    (op->dummy.nbytes && !op->dummy.dtr) ||
+		    (op->data.nbytes && !op->data.dtr))
+			return false;
+	}
+
+	/* xS-xD-xS is not allowed */
+	if (op->addr.nbytes && op->addr.dtr) {
+		if ((op->dummy.nbytes && !op->dummy.dtr) ||
+		    (op->data.nbytes && !op->data.dtr))
+			return false;
+	}
+
+	/* xS-xS-xD-xS is not allowed */
+	if (op->dummy.nbytes && op->dummy.dtr) {
+		if (op->data.nbytes && !op->data.dtr)
+			return false;
+	}
+
 	if (op->data.ecc) {
 		if (!spi_mem_controller_is_capable(ctlr, ecc))
 			return false;

-- 
2.56.0

