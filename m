Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223473;
	b=WcZOspvDca1Qq8Ix75+/HDpr9O5UUG0CfS+DVPDFf3tmMjEQkvX5f1d4jFYVLKjghxCS
	 HnAJw8dvcYLivNDO2kjPpVWZCozx+8ChHyDaV1GtBX2gZ0ZaTE5SyxuGPULwFh0El0q1w
	 nDsJGztsnPwEy6P32seNs4hzp1b9Ni/6O5EISVVlg5btP83Jre/zmoKNTcsRdCv5jRlCh
	 m3wX00lCVLciaJMCz2xeBb0ZINZ+h8NMUM/lvcudlw+22m/0TRhR3+UmTNdgCeYm5j4o5
	 f0tk+ox535wNNIwOwDrlszSj6DeWJ9VYbqrl91COJ8lQLkAnVMhUTwXLtuBpr+yXkQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=T83jSZtlzKtrASqdJI86cD7q3EhrQGMc7SvJoDp9Zl0=;
	b=IOrl7Nge0EVOoZbIqOYd4q5FNDlowbwpUqGBTG67rFi1VYoPkXucTAYTXUAdDsEt55NW
	 vnxq0tv9MgU5iC4FimRbDKyh4imsdyOQKY4BXOxsllXkpO7GYttVSwOtTi824O72Yl2IM
	 MlAF4v6SGM+nLPlFeE6k6YKafctKz/BHooloW1DVIAJOMGJlNgPlz+P9XBRyP4UPeDaiQ
	 5PhWlZVQtkxRanJIcBF+TFCVT8NmxfsmSE1f5Lrdj4fQwjCQrqnSDbLqRcTEBmt0bDugT
	 DuWpZv0MWtUGWLl3ZyCOVdkHkVuV4h4Uk6z6kyFXadSKs/Odye3NyWKGVz7dBEKpSCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3Fv0Fqc;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200760A3802
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1200760A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3Fv0Fqc
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-55e02e89f78so587020b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223470; x=1795828270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T83jSZtlzKtrASqdJI86cD7q3EhrQGMc7SvJoDp9Zl0=;
        b=J3Fv0Fqc33LZ9TLsmirU2vflkgqL6Or7BuyACOzmZvXLwBLLei/PliL27zMfOLMU1h
         ggatctoMnjLrKbdKvStEU32PpBMWLx9dr9vljzyNqZ1AByffuQ83Y1TU4hTcgmAdxrol
         a4aVSQHUV2UZ1yv5vbTys3+bkeFOXuxHZrk7vv9jlzuCYqc8LsfsZVJmlKLglWeILlrg
         nGjwmNIZ0QFjb1A+mAvvbyehvRKwOmiX7y8mhZS5bQ33K6YI79Mof2QrOYP1zu90s6vH
         QtGhGQdiaZbTwhZ4RIEvpWbZoTWfhm5EJY5klqa7bVbepvFlOfNQO2iUAdx46HCITujy
         R1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223470; x=1795828270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T83jSZtlzKtrASqdJI86cD7q3EhrQGMc7SvJoDp9Zl0=;
        b=yaLU1JDA+sxCSS20H4HO56Po9aVw/a3EWBaMfz3ptCNNuf2waHS5T654lbDiVO6Gsn
         4mxnN0BBP1zEp9QdXUYV1vZ+LLwpKqvG87oIIYauQZzUgi3dKDjw0hG49agEk79w8Hea
         J34S95SNCwidScXxhnXyP4OWXedt+3B/5FZsi8M6AjAn/6XfP2V2QbkjI9yavxRWvdKL
         wngdBIzGin2RDwBCJrAVLUnjAX2nHt/GwoOlDgzPTCEV6hj98iuCj9DeIyRhhquLrj2J
         1PMwKb77h45MyKlnjeVoJgIBQcSQPDnMPVWmPq3zwKWQx8Nk7Lxvp50lu9qsXXwYNF+l
         XKrQ==
X-Forwarded-Encrypted: i=1; AL+hErGiCgkJhc1maS67nz2FioCHa/IVrVln5Sdaqu9pPiFNBy5tfZ7swJ7TQEw2NnovlB/+lPt1XpCFW2IVfTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PredNlfDMj6PqEwEGvY45xeqD6q/du4T8yyGWeQ7yXSPz4w7a
	rV9a81arjx2H/chhwt9IHBRB9q+L001DI4/q2fmco+tY/0kwt6xWb8C2
X-Gm-Gg: AYBFou2BxSwGdDN6BIQwuTLPxTRFbfmFWveKbGmxUu893XNX+hpGwZdlaRnpW3K18/9
	IZ8xkYrQyhKrzx3Q+Wuzj3V1Oo6sIq1aIoMpVx5Ny4fkp+gLDtrZ9x3WLcImfE6NPcA0EVlsY2z
	f3FCwFqhAnf7DiqwcgbWH2oTi1IxmE50h6u/6mpiMXqX56+pQWsPhSa2i4VC4ljjuu+Vn6iRFUo
	RNRSuD8gpjaMUCKjeSeDn97N+XcJtnNEeafR5RbtAoRTIdYSjkVmjLxcrQ+Va222xcmnait8l3a
	N9t9BZyNdjWpwssgBgoFkd4N1sWFf7SsRjkeOidxiap+v/n9+NjJhIdA14v8IRCiQOAjCHBgXHN
	zMhrBVL9MAGeGq3S78bvrKZXw6nDHBMo9FeJfzoH0mWQIX3dz/tCSQzACyFyfPsQARq8ntGBAUv
	74/BVzQIoBcxzY8J7WspxzOW31JjycsdKMF4XnanyeY3M4oxR8ak51TETUceO1vJbPBZ/ruh5l4
	Twn4TW8ktxmyQwejwAyMV87QdQ72VhrJb0Wac7w3TP+dkxphjicfHIA/iXOlHlDWt0oCnEo++kp
	ITTOmcqJKi+m3DYEF7c2W8bn5TL95C9yQafr4k2P3mcZqgOOkFJBsVv+b0uth4mNbu71PgTTHyH
	kU1wNJxPywVSi9ACi1A2Bzm+2HLxqaGP8FSnmecBHGtqDX8WY9+ye2wMA2oGkfckkRv8SCVyGoS
	+CZVvJznkPnBn4H+qXzlm0+HTfGv62pvKLL5cMmwRbilwf8ZbIMdBn
X-Received: by 2002:a05:6808:19a7:b0:55c:844:98b3 with SMTP id 5614622812f47-57a0bb53de5mr6320056b6e.50.1795223469671;
        Fri, 20 Nov 2026 17:11:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:33 -0700
Subject: [PATCH v11 10/26] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-10-9721b1905ef4@gmail.com>
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

A DMA read with scrambling enabled can report success but return zeros
for an all-ones ECC step, or all ones for an all-zero step. Requested
OOB can also be filled with the wrong pattern.

The controller reports a pattern-found bit and a pattern-ID bit for
each hardware slot. The driver tests the current slot's pattern-found
bit but uses slot zero's ID to choose between zero and 0xff. PIO only
uses slot zero. DMA can report several slots in one transfer, and
their patterns need not match.

Use the pattern-ID bit for the same slot as the pattern-found bit.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 76f60fde7a86..43c0796d953a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1086,7 +1086,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

