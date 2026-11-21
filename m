Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223482;
	b=NwTBmpo7Kme+TaFR/NsBzduF2CbqnYoWGsNQhxaFTnR0+oxVwM4TGTFCTAL2ozVL5u5z
	 oVwEWV+COGmW0lQhHu26WMvqZU0RjVpZ8AwPtz/AHQGnasBo3p9iBo9JYAeErsBLJPJaz
	 gMCnugLLjeQGNet3f1nymKCoVl1+Rmoofvh3tLg8oFXD6PFiJFxeujy52XY067iLp3oij
	 5G62F5mmcfNx0MyXypTnkuPiL9/2XnZhM2cDxYbHDKO0yVj268mJaWSeJiPKj0LXfMJL0
	 4sgupI/MBN7Pl5gkhB5t44AP64iFgBFIcltJaZOkkrQSsj97Z5UlkFJPxT83R9pUOXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
	b=IEIs1uxgXLOajumDK23npSlptRfOh6NdkNTc9Io2OYIZobGKnU5kDzUkyPMx6/roK5zp
	 VGpwZ7aY/P3DAEFwfVXc5jfNXulQIR5in/THkpgUGV8307VkaeK495yyymMSTOH9b5Wh1
	 GA09W8Kzu9H4/2q+5whN2nVlpsHQBV6oYYGKLING8aqc/lr8NN+cOgMEKjcbEzBYFW+l4
	 5Hj9+GjNzGsRcx8XYlS//uPV1xLDJHaY5+HU7gx/UFMA6rW/v8dk4N+Vx2oSz6GPUhUZe
	 joMQSKgB+4EvsSDj8y3tE3kfK2u5UVleqINUOrmhhggblNdAgRA7DsYqoSvVA7bSVPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znugP4EE;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885CC60A5BFD
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885CC60A5BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znugP4EE
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-571888655f1so565443b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223478; x=1795828278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
        b=znugP4EEWaZd213fx3PrvnJuMx6s7G058ioZ+DOESVCtuUF8JECDL3ho4kBIzIc+kE
         wBn92LPLuVT8SZsvXTO6CPk6c87hk8qfgTvcFWW30ucmJxSyK13bz17gnRM7yzmp9g7w
         f34dvrndWu7B2wiCGvFqynhfnHQdglI7ba7AlNf5/VUskrC3YTGyIOrbwTzySHAfKEuS
         w97M5I/ZjTKtu141iEr+ezyJfkpDYgqhFOaW6qeJmC0WqPEa9ASuc35Sv0mv/0Lb7Eu+
         Bv5sCfM28y9XtWpCtlL8SXvfYKYrKSCTCR6sF47gk6VpncgSKj0AOIGiCHdZ56xqGHjF
         CmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223478; x=1795828278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
        b=zw0ZcpT32O/7OBnoJAgIUjI2+ZetYGWQtp14FnM0pyQlvzmoCVdQ4fHRt7Z5r6qhIy
         zl4dVMj6m+Z82+1lhC7ueGnEczxDoTP+NvnZqL2CoLWYAgtSl3V0vqkh5AP1fHHWvR1k
         qez+0kdalN3uj5mDe5SRdJhn2ChcP3kevV9FMp+SjPNOokclPUrwtgOesntZmdntekmc
         2b3M4ClR6dZdkz6nPZJGWxzm8jRKVjTO+ujL/z6fQkvuv/VnAG9asAO+75RfQNC7xl8n
         XjseR7YfiqlHbqRg4fmDIqfKXwWJKM9qXjgxv1KWfGirB4bqNf8H0dflI1kF8dixVF2Q
         YvBg==
X-Forwarded-Encrypted: i=1; AL+hErGontQpXCrj9Z7X8DkjeJQ1+y9K32OT0q+dF9nBr16ht3QF0PSJHA5xzdxyrp2s/sRD9Ge79VZ1cxXu/go=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YqXDBYmUAo5WISEPFMOv6MEg9x/QpvrVyRePOh2Plgr2ZnHnK
	eSTSdq9WswWe2r82cGu8SCOty6GVMYmetfbMAqisUCGRfR2J/HQLc//k
X-Gm-Gg: AYBFou0RzkDxGFOwGyhWfS46jlAjen3hx6SDIThOPqHLXoYTybh6ieKw1v3iaJEgvXm
	8h2xc0T9eun5hpDkVGfaYrktYrCUE3eFJUENB6J5ehnC9XdIwI9RikW2QDMslCsXCj5usGaSCny
	yj4thMQ8Ibethz5yHaYZ2h/XNaXS/jC5QkabuCj3tUNJcJtzRVbeLFvUGjM1g08GpsxkT4VqSMz
	7JKzkzFTMyU7HmfdcxHjBA9TrcQjehDJhjnRFMZJfOHY/N6LBxWzVzAcgdSTgAPkrQ6tjLL9ncx
	eGJkMawJqAkV2IhF7sSrCKCxNO6aWZ1F+xS+CXCRM2E4CCorTqGW3IKVC1+MqSu7daJVrqgSAXl
	0K+Vt4k59QxQej2uALkSlYMhc+MCtL96MVAXNV+EiBzklHLKAw4qYihY879V7NIGrXuVn9NiECl
	Eof43AyqaweS86DtbQ0e8hvLUS3YhD85w4UuUWwR1yKx4dUC2tsVvBIoozSK96Bx3YhSajWDi+l
	Q0HbKy9yXqS+1p9q6eaVoPv1/0pcpXFIBn5JBEOXCcdwnrGZDJkyq3mLu8y8kQZPAoY9W4iqV04
	0GY/ramIDTyt1uu85BQPyfmMMXFTfz0Yj+R5+ibyp8esCzxcaXH+SR/wi7t9qO46I3k7kpDolde
	Iv+CHF+fJTxJZKFgmSTfDHAVT2ArAORN5z/flz23l8esvf5M0EKx8wBzNhMwlELJNI3bEINrZ2N
	FfXrhgfIKGDvnf2ugP/J+kf9MX75cy5lbIDRQ61rSBjNKPiEd7/LV1
X-Received: by 2002:a05:6808:4f06:b0:53a:9d3c:caad with SMTP id 5614622812f47-57a0a4079a5mr6188187b6e.25.1795223478418;
        Fri, 20 Nov 2026 17:11:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:39 -0700
Subject: [PATCH v11 16/26] mtd: rawnand: sunxi: limit DMA subpage ECC
 results to the requested range
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-16-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

A read of part of a NAND page can return -EBADMSG even when every ECC
step covering the requested bytes is readable. The DMA path transfers
from the start of the page and accounts for errors in that entire
prefix. An uncorrectable error in an earlier step therefore increments
the failure count that the NAND core checks for this read. Corrections
in earlier steps can likewise inflate the reported bitflip count.

Keep the DMA transfer unchanged, but only process ECC results and
perform raw erased-chunk checks for steps overlapping the request.
Keep hardware slots and user-data register indices relative to the start
of each transferred batch.

Fixes: 2de85e733601 ("mtd: nand: sunxi: Actually use DMA for subpage reads")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7f93ce226f24..5415ac6960b4 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1106,6 +1106,7 @@ static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
 struct sunxi_nfc_ecc_read {
 	u8 *buf;
 	int page;
+	int first_req_step;
 	unsigned int max_bitflips;
 	bool oob_required;
 	bool dma;
@@ -1234,6 +1235,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		int bitflips;
 
 		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+		if (step < read->first_req_step)
+			continue;
+
 		if (status & NFC_ECC_ERR(slot)) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1294,7 +1298,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	for (slot = 0; slot < nsteps; slot++) {
 		int step = first_step + slot;
 
-		if (!(status & NFC_ECC_ERR(slot)))
+		if (step < read->first_req_step || !(status & NFC_ECC_ERR(slot)))
 			continue;
 
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);
@@ -1451,12 +1455,14 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
-					    int oob_required, int page, int nchunks)
+					    int oob_required, int page,
+					    int first_req_step, int end_step)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
 		.page = page,
+		.first_req_step = first_req_step,
 		.oob_required = oob_required,
 		.dma = true,
 	};
@@ -1464,8 +1470,9 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	unsigned int failed = mtd->ecc_stats.failed;
 	int first_step, batch_steps, ret;
 
-	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
-		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
+	/* PAGE_OP transfers a prefix; only the requested steps contribute ECC results. */
+	for (first_step = 0; first_step < end_step; first_step += batch_steps) {
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, end_step);
 		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, &read, first_step, batch_steps);
 		if (ret)
 			goto err_stats;
@@ -1618,7 +1625,7 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page, 0,
 					       nand->ecc.steps);
 	if (ret >= 0)
 		return ret;
@@ -1641,14 +1648,15 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 					     u32 data_offs, u32 readlen,
 					     u8 *buf, int page)
 {
-	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
+	int first_step = data_offs / nand->ecc.size;
+	int end_step = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, first_step, end_step);
 	if (ret >= 0)
 		return ret;
 

-- 
2.53.0

