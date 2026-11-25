Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609313;
	b=MrNxIvs5L/tMdR2+tp2bKw2xr0UNxXy3pyxHvfjLAElcQMRF3XO65O8puKx/aKKK5fkd
	 JwhwAhEOJDnntUK01bbxZC6KwkhmdibTifTBjqLEpURRut+MCLROw1diMCD2AJIp2RBfe
	 I9+hblNXSK9yyMKySDG9hbLp10aOl2W9/7yIMgsZoo2KSHvzM/7C2VWClEw2bassqnKwC
	 B9izcHwg9g/UAZpU/PFukQv6W6ZovpGs3Fk12RgNg5p2/ER0useeqQxmkEkhhoJXPZdEO
	 SOD+kJ/AsRJBqNkDeaD2cVFWKhhMAuOCEP2BV1ee/yGmvH/OKZTFEHV45+mcPEjl3Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/QULW9udHfGSSQHhbWJ4MuomN45Oa80WoGrv85qAreQ=;
	b=Sal8wsKbpP9FSB3QKoX6MBwRpCMvJRyyNfZ/RYhkNldJWn6EHIYZYQZqLE6xjWOXi8X3
	 2gOxZnR2VRXHSMqlWPuy+2U3lVmw0sguHDa5H0w/8Pc1/dr6Re7JHlhB5dLUSu6IXJ059
	 lONO6kLC0pGN7mVDv+N0ag0e6OpaysRSP8+jVMALPVUxu3GqiIDuK8SlLyrzBqruthDZn
	 fi49FMh7qHDVmgxTsHYZkCJUmBtYvtI6Gp9t03S1Aa17F62rNsGaLKfOTBDOxiZV2AUUV
	 +DsxTPCnCv95Oq+VrahiPTVadkKeK3g3pouCi21k/7U52U2f9BmxP9pRQ08QI8Hzitw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UMlnYhc;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E25C606A685
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E25C606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UMlnYhc
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2969487b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609312; x=1796214112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QULW9udHfGSSQHhbWJ4MuomN45Oa80WoGrv85qAreQ=;
        b=0UMlnYhc6Jab6VMa6ttiQF8d1lJpBIB6uF3ONYklVOFBAMMaYceW7eneW9wUIq+95z
         pdgV6bHeTvavxSQlqGt2KaCvy4gWKsFzJBpBBi7NgvHFSYJiubeFCunkeRsPu+SLlBOF
         WrVWAfk8iiX55gpoJOE7c53RkG2Rku+Il7LCOgDCqVXxmr3IUEw0Xb/onbfD7JJ3KNH0
         725Z2qJvGe76W3I2j3QJ/CZHhxwAYrNJ7R5x+yT4PzG4xYwwwh/JrPeBeXLTBCt8D3ly
         PK0FeFpik5oq3Wrn5bVz7p0YCIOm9N1w8+Q20s/PIks6KFWZbX5wzMWjZ/zWIADA5azA
         rECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609312; x=1796214112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/QULW9udHfGSSQHhbWJ4MuomN45Oa80WoGrv85qAreQ=;
        b=yaD6YDabjOfnVLE+IOmnJCpwH7lURPrxlEw6T0Rsb1/A+zbwtdaPI6sH2YWPRFaGHH
         aZA70QsJlYqspQ9GU6Kul0+lyi2tGHhoUA3Qohw6c2LdI2wiSr2aOB9tISn5Y8V+KzsT
         BI2UXLKmnwDaadHFcoqT46Sg6V03b3yOZVzKI5BsS8ZdDBuDtab1ddzh1blvB4GxINDq
         MBnnAisxaBB9XvUKcA3gEvGf4PkNk80qU5J6dHN/W5CFEG0Uqr7ITvpoEqbIpjJz7l30
         7WqgFs/U+MpVvAcbB4pw+kK3RhtCc43e7xc7OP9IkE4elXmLgYIZX2OXs65uvHEk9T+i
         QYEg==
X-Forwarded-Encrypted: i=1; AL+hErHcd1NfBIopC/ckddE45n2IiaEYCC/zHJhpDaV48ryWWxAvHigTq8XbSc+mbnr+7BnjAQct3tYMVf5kJSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MKZZwvh00rR+IHM1NO0clkB97BstPh6L4eGQ0gYAJ4j+scOam
	2m+cpcYbLJXtTcZqSWJqZ2cwI2FI0ixJIhulW5rw79a9nmmei6RdcL2L
X-Gm-Gg: AZFdTZc84GJwt9M/SaWdyGlcnhYvAJo6n4tL9Ruz4YILbA41w5w4iDGPM9rnRLc8j+T
	H0PI4DMxP0wvrLBe8GKhnL/xJAKzABntHU+lAyiDiRhygN+tCzlB0mLat/8Nl24sPzVC3wZl7Js
	qyAsUmKfS1qpQqoKNHG8zOuCk9UGpKE2HpWYiII+c+f8A1qAX1iTqCM6VGR4RZ+vZ1kBIiB7LbQ
	i4wfFPdwDtU3pq9eKa9clYWrG0kX3jNNz1Jf1FbRTrN5NfPJXCCz1XPo8Xt/SjGEmAymhLRdEGU
	U+KOAB3fuBHb5BJTPYH+ixkJUUN3sRgCzxh5xcVVPOwVorvuvtjaAZdNveJeuqNPDDVglZo2ypZ
	ZBTTkg8xahhThmcQeG+RF/ifKledXkeOrbjjlCJSMoYaQ5lYsudQL7HxlaERrS59dlPSvmafjsT
	HUMGbexLxCA4NltkmmlVUab+XVawpSfHKoW2PSQ/kIbvxtzpWobznE8LP3qnZ790IOwoCD9Q0Cf
	gJrDXjz5hBo1Me3iwAejSHgnpdrNcfdI0f/oNuHangGVM2l6rJNtXNWFoA8EgbuL8/13rgbWaFs
	2QhHBhjL6/UFM8rE6xalNTWU6WzyBtPtew==
X-Received: by 2002:a05:6a20:7489:b0:3f9:a6b6:e16b with SMTP id adf61e73a8af0-4014c94a618mr15927591637.21.1795609311859;
        Wed, 25 Nov 2026 04:21:51 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm8688656b3a.13.2026.11.25.04.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:21:51 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 20:21:35 +0800
Message-Id: <20261125122135.44696-4-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125122135.44696-1-leeonion.muyu@gmail.com>
References: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
 <20261125122135.44696-1-leeonion.muyu@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

r852_do_dma() feeds the buffers provided by the NAND core straight
to dma_map_single(), which is only valid for linear-map addresses,
but the driver never declares NAND_USES_DMA.  Because of this,
nand_base cannot know the controller DMAs these buffers and never
bounces non-linear-map ones.  Such buffers are not hypothetical:
mtdblock's write cache is vmalloc'ed and UBIFS passes vmalloc'ed
LPT buffers.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, and advertise the hardware's
512-byte alignment requirement through chip->buf_align so that
misaligned linear buffers are bounced as well, like the other
DMA-capable controllers do.  Both only apply when the controller
actually uses DMA: the PIO fallback path does not care about
buffer addresses being linear-map or 512-byte aligned.

Fixes: 67e054e919248 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..c5a3622cddf6 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -640,6 +640,11 @@ static int r852_register_nand_device(struct r852_device *dev)
 	if (dev->readonly)
 		dev->chip->options |= NAND_ROM;
 
+	if (dev->dma_usable) {
+		dev->chip->options |= NAND_USES_DMA;
+		dev->chip->buf_align = R852_DMA_LEN;
+	}
+
 	r852_engine_enable(dev);
 
 	if (sm_register_device(mtd, dev->sm))
-- 
2.34.1

