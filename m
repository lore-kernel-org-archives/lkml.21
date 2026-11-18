Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021728;
	b=bJkmo8NQAZFoPaXO4Qcv0du1RgeqyDHz8RTG9vAhVtaLudIPYi0IMuxiPkkWVG+WVDUb
	 13JMZZtjw+7vR1z4+cxu/EfMYHxJk/mfOce/Rb9x39AWZ/fEgSQ/K/SnDTwi0J4MpC/Bx
	 ZY4b3hBd2BR/RyECWODLj7UBTevrxGiEkDP9uCFOW3UZqigcSgoevkm7zWiOtjAKq2TcD
	 I4YVs4fERf7ueyIdLIvREzYeEUwZL04wJNZJLeuIEDRXvuAsXWXHzm3CdLjfj6t6mUlg6
	 x8SpCHM1EwsDhMyvE0mJ9nETqi/koIO4jl3vtHCnbIYoEFo8ZoXa52lpT3ZzGPR3hEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021728;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=h5w2p/Bg6b5kyn0dfQ7CwRMHWskQibFA9qG03fWO+x8=;
	b=AU5iACcRqLMmiuqqgfSUUjH0ZMeVR4qxdJuaG4RYmp9VlpI2WMtntHhAH66/EjUyVPJj
	 F4kPxy1y6JmKb3W54NQDv8m2uYGRDwXXQV4aLKEWEqktcop/tAxraSd1qzFLksRNNrdW0
	 g/OKrxoLSYgmu6AgcjiBgzJGGg7JuxMjNVJ9Xn5YE18LIXU3+PCPWRr1O1GeCuds38KOP
	 NL80gGuk0w3YxXJBA5jTqlWOcdK/LmbwOFmBjy0jIiXv4XgYx9nawnTnCCkG57KiDcfYP
	 hRxZwAcDp5j8gVulnE/9t6DFHWdF7ma7azt4vpOAsqaWnbJELvSrviUnhJIh0+uTGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FbzV8Wqa;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213C060A2615
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 213C060A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FbzV8Wqa
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D3E2C1A169B;
	Wed, 18 Nov 2026 17:08:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A45F85FE9B;
	Wed, 18 Nov 2026 17:08:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5131211BC2A15;
	Wed, 18 Nov 2026 18:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021725; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h5w2p/Bg6b5kyn0dfQ7CwRMHWskQibFA9qG03fWO+x8=;
	b=FbzV8WqarFjQDQfsmSzw+yk8Q12D183IBVOTIzJp0EvcbHmelFgu4RnguGykEcMRqgpjhe
	k65ICiQDTjUKQRgubwbSLbw5yaKelO+X4LUZJy/aGaAMKZJmxdyn+JDb7ksp4q5YCSHz5A
	Fft7kR7vTKIFxi7LdG0bN/ReS4JMI5TuOHi4bxG7a4zzYufHR3lps118oyv3QYxL4nStLO
	OpIPbwjibLclIADKlZt7RoGcv0Jos95mwrZRcuB1YzHbhlyEMR5mHX95NBKh1S93045Kgk
	fu+KuYXd7koNuxOs79LnfOO5bJPrMYGrNvVk+PGUwFcCEOzb6grrhABrqwMZQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:21 +0100
Subject: [PATCH v2 04/13] mtd: spinand: winbond: Rename the
 ->set_cont_read() helper
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
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-4-55956313d6cb@bootlin.com>
References: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
In-Reply-To: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

All W25N chips (KV, JV, LV, KW, JW, LW) seem to share the same helper.
W35N chips have one more item to configure in their callback, but
otherwise are also very close.

Rename the helper to clarify its use.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 0288788ff0d0..95b6c3b80eea 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -582,7 +582,7 @@ static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 	return w25n0xjw_set_sr4_hs(spinand, w25n0xjw_op_needs_hs(op));
 }
 
-static int w25n0xjw_set_cont_read(struct spinand_device *spinand, bool enable)
+static int w25n_set_cont_read(struct spinand_device *spinand, bool enable)
 {
 	u8 mask = enable ? 0 : WINBOND_CFG_BUF_READ;
 
@@ -726,7 +726,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&w25n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
-		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W25N01KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xae, 0x21),
 		     NAND_MEMORG(1, 2048, 96, 64, 1024, 20, 1, 1, 1),
@@ -772,7 +772,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
-		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W25N02KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -856,7 +856,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&cont_read_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status),
-		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)

-- 
2.56.0

