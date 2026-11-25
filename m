Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629132;
	b=zRi9+qPC2PW5pcWKnTDda9eEi4eJfb22i+/9MVpMm0Oamn/ZjTHgo+CRMts5jWXPL5tm
	 qkZR9jTQOMweLYxrTPc1+3wpmK9e6YD01WDB94bw8j4nnbsqvwYMCIxkZr1h5ZkgS/TLj
	 fwzxX3iCB+V5tcPMT4opzhRVH+pvZYtrB4QtG5myu+YoTdKqX8+PVAweyPeU7T+YgRQyg
	 84S5nivMNE0jQ4CcyyXkTkYG2sWq0gv7X2TJoA4OVwjmcWhncNJ/iU/vKtG/OEUYIw+k8
	 ZVSXwYQD5Pu1eYD4Hc2yMeAG7sJe17VJciyc3fEVjedjNqMHVGXQoysRzv2MnMJ9AYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629132;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=GRvEh7W8Gjjan8aSW0NgE3dBDol3XNo3W6oSUBUObAg=;
	b=drIQQbnN4HjndL62qoQN/aRtgLlR/BuQO/AI7GD4GtbW9oXGVQtsKeN1peCFG1DvJfxX
	 BkPWoCkeHyx2r0r3SZjfdLB8F6hoF2IvCEVzKBvmObRQ7YraESTlKiQOsAWOqnPF/lmsU
	 n0HxJ3X6H0dRcOl/MjC+e/l7B5ga++7hEwfiHuduwoJ/BtOVwy3UCZTZIGPaFg4VCUETe
	 hR1W9Ko5tsqO9H5XYsj4E3M3k9/sf2zlluJU/8JBhwI4Na/CNc0xMzwRqC7J84tPUFVbM
	 S4vJU8e9RCp3/VbPndoNtd/rw34O8PL11Ar+1pxZiwT/kJj8vuDUzjk5/WVtLQl6Axw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DvQ+ecRI;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA3606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCA3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DvQ+ecRI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 262BDC2BB3E;
	Wed, 25 Nov 2026 17:52:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 29E2760480;
	Wed, 25 Nov 2026 17:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4DA311E6B0AE;
	Wed, 25 Nov 2026 18:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GRvEh7W8Gjjan8aSW0NgE3dBDol3XNo3W6oSUBUObAg=;
	b=DvQ+ecRIp4ZWXBft+KDUn2D+H2bk1RLiRV5zLdDy2/B/IgMyTrffM1a08oJUWzk9B1IARq
	lJN01h6ms0R4PsKeOvFsXvjLSye+io6+SylDwxPDvcS91SPCCKsV/qo7s4fnFBaxUyHS8b
	jAMPrASVj0ZUglQN4E98MjSof9UB+0hEgGBkDmQjDwE8w3mFDnv2SQi2nsRGL8KYREyGah
	ZF+E5cDzbBMV3QBC1gmR/Tfs0wdIjoKwGQ8VL5FB7xkVZKqIGHucZDgvzQPlPP9NFHEm6A
	iFfZH09zSNv0zVBLRx6vkrXulUS/HjTucHLi2Mw8IXeqiL42O+UpgaBl9IKjDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:19 +0100
Subject: [PATCH RFC 05/16] spi: amlogic-spifc-a1: Fix a typo in a macro
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
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-5-fd036402fd37@bootlin.com>
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

Correct the macro name: sycles -> cycles.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-amlogic-spifc-a1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index 282647cd6b56..d99c72c7a965 100644
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
-	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_SYCLES, (op)->dummy.ncycles))
+	FIELD_PREP(SPIFC_A1_USER_DUMMY_CLK_CYCLES, (op)->dummy.ncycles))
 
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

