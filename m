Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223482;
	b=n/H9T2wgA3xIJoS/LH0Yx6KKiBF630Hslp+dRlRP15SxKcRV9KsStt4mVvKXp9v+Vn2S
	 wjIGLTOffYtGLfyxhHJWSI/Dpf3ga/ANvmVPSZFMq+FAFmQCvCZ2muR1R6OiUL7QvJT7y
	 VnLDL1f7afJ3lo8zD6H8I7XKSs+5s6RoE1uZS47+o8RJbXy3kNccO6HKVaUxWrGjv+Lhg
	 RxQEcBGVVnEsEiGEoe7PCil3KXnNL9BsmAD3XN7MCTQ90j5fmtOCC2LkwCp8ONXoe8ABn
	 UdmlFNPT0+s7A/hzF2ImX8vs5EjjcXQ/wDA+DYjjmQtWk8nkUzvzqP84YRYmzZGZiaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
	b=DtgnQwIPl+iNopZEL0+VSQyXrWCZcy6xXpbgICKYmNIkYbTHG8pbz/IfsiPqy14JNTre
	 HphtVyXGVq1Hsn8VSvEATP9T0jesopv7laYc+vSsEcJrGDkXpfeK4iERm1U/4Sdnh9Ixh
	 RcVeEwae2JA3fQXKlppOztGQHObLouGaQL/qUMfUOT5iezUWnXeZRi9Ee+7cVrBLRf3Oa
	 pCObJyG7nbN/nRcFrWXhy4LLO2vqGwl2Yayex9tKaDDwnyJlo/PfXSzdRnXbUqq8L0WpX
	 CNu279SF7S92XRsvrDdONnU0K2jUxjkUEMCpFlO4QB4Hv6ygJkgwnGawjxeOaMlbt8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLlkzqVr;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFA660A3833
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CFA660A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLlkzqVr
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-843cf077f10so1967021a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223475; x=1795828275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
        b=xLlkzqVrwIvQ/Aq4hZS25GlBJqOwghvMTImGsrw4s4VdZqerCIRCIRX/EeNmBJlRbQ
         x/u6646LcMJIvq30v6Q+U+RDlgNe7roBsE6UYr2qxE5iblqnzpN4tdPmJ+lg45kpvV7F
         5lfIQGMrBY3FyoSdZmV4HOgRjYcypLsHxSkqkux5/ioOQWaXVcMzhWwNfhwLJOpzoH4I
         ukvdTTNOt4NdrJ90yuMs8WvTTHD9JPSkL755U7uyjOsqpaRGyGtK2JItCVrdAeTvpYWS
         DmRrh/ZnvJqkBnQ3X3gbZrFIvP3KUNPs04JEonrCc4Lk12x0SOeXf1sqcEwRB2xXL9oI
         1fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223475; x=1795828275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgxsAtXFuwPIOpoqITa/yCw7bucmWGSvP7CHXYFl5l4=;
        b=N4UBqnF/tbDMHFUWi3QdxUUNn0NGKavq5SHFX/El7inrcygoormn16/9UAqj1fNtTB
         GA+Xq8wBIsqUfQUsJuLMdBr+1DBeQ63vOstB6swlKeMK6OK7oCRSrrsNiGYrqjjjbXlX
         S0Si8VSXwnzspGTfSanCwyD3NHI6QRMmSg0gkqGV1bM3HIY4EZXH9VLEDboinVlhF4hH
         y5s3zJCCDi1F1sPbtVNzUsgqgb7hIhqNoG/Fpfdhe9h009sFiI+lyW3GCwPWqc6IeuLg
         Xndg3rCeAZ3AAhRl7TObA1c4WMk//DlkFzIaNNc5XEXaCsZj9yrNtC/M4Lweu+B5FMXa
         KVJA==
X-Forwarded-Encrypted: i=1; AL+hErE5oaWYLECHbImuhWEqZMImDhkYu9GF69rrSKaG8KTwh/y7A1sxHJFvoejE+PKeCYpo+pqbM/deo7wJ88Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vxYN/zu8jvMDzr6+ZTYYvruOQu9HF78vSdP7THv8luq9ST43p
	HwxCZZ+HUBUCc1qHPgTQHDNc0F/hg/b/pN8fGatRbZSMCZ8u0J04BR1F
X-Gm-Gg: AYBFou3qSpnWfTaSSoaXM9GDhsR9UeqmhSLne/mHbvwh2zh6JMVaGxKQ5aBixHOU86A
	c6883Uf5ZgLeKcVFW8leqE+O3hd7Y2oc14/GFc1J9lwqkQgPjRsJoOk9nIVS4ShGLjHO2a+bHLj
	6Oxbm/X80dWEJ3i4d7Q6phkAAWy0fnMzRzUBd7HrRmrB+OJIzMMX2Of7jfwhTfgYeg8VeBC0+Fw
	v1jyiDM0r+9mc4uPv1EUbAZgsH9renKlbfE8JMlibFtWf/W/Dfk420S/UuVCnbaJga4PLWYEJty
	lnHLToI527z+pK5VDP0D4tY4GAxDkSLwJZORKbks1eryh0iP7AReQ5GNUCocFnKA0FAJpLC4IiY
	c4ghFKY2xbS58HrE3kHT38vRpc76yhwB9UowxGTtvSJFke8+2JpJnDFs08ZFCaeSZt2oV8I1CCv
	EXcPVHCYm/iuGKTngbyNb54IO+ksouSPJdY+wzNauxA/MzSkEtf+tUSpKWuWsqrQngxcZxwxcmZ
	wWuy9zH/VPMxAIYns8AbItrunEVp2hTOeD2kiaMpC2GUzNs3+Cs8UO4iXPEMwWWGGB8+LPSf8EX
	3bbLb0byjRQegtpYTWrlvQ1yO8bjlFeqt3CgQCQtBzE/rpNi5tUsEbP9+fcyddAYouEESgK3Erk
	LDFgYRZR2tRYxNngcbVXq8WBKiHleIuEV3FabCGSBFdYrOwWah8QzVyFwNDtrbEO3d9uSzSVkta
	5IhI6AZ9FH9KcA4ixb/ZCRyyEZd1x03NSppXnDd1EovPMifUZV1QJJ
X-Received: by 2002:a05:6808:23c3:b0:567:f5d0:741c with SMTP id 5614622812f47-57a0b959e91mr6046198b6e.34.1795223475472;
        Fri, 20 Nov 2026 17:11:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:37 -0700
Subject: [PATCH v11 14/26] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-14-9721b1905ef4@gmail.com>
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

An OOB-only write can report failure after the NAND has already
programmed the page. Both the PIO and DMA page writers issue PAGEPROG,
wait for completion and check the status. The OOB wrapper then issues
the same command without another program setup or data transfer. If
that second confirm fails, its error masks the successful write.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 712648864407..7f9bc0237cea 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1779,15 +1779,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0

