Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413034;
	b=JmBGYjnDhFYiKmD/vP8GfnwFHfItAxrBxyvUB5WiQHH9v+Y0WH30dt5VvPWfIPqD8EP6
	 aiXzs4cWN6QNK5bMcYEdR9UELvr5E72N0+fODTC6HwuqtYhxi/WVEaymz3Ie+eudTL7be
	 cUxrYiURaYPMO9NPicEuiG8IK43CWl8ANFvYa/ZzMRJzBYQ8aLv4vQYKf8YbdKGYTsj9O
	 yRCTA2t09LGRXsrZ+L0o8JXHA1mUXWWeAj3qk7E/HUrXXkwcnSUD6jj56mgnH3aNvJIR/
	 54AtoYzJErlrCvwzQez3eH5r6cE4uX3j5F5YebPIbZZrl2lakqdtbSEz45PMziC0huw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gmnXF3v4tuK1ZqxzI4mf7SiDYhBDjm5JKI84VQtIpT0=;
	b=4IPr4hYk+0JVlkVBFls7JGYBRt5BEicQWpf2pVzDtnIbFgcnlLysnQHoykq/VLpcsWiO
	 ANVfcwEatIiMi2tt/kWwf6AQg9b9l1t2+aSaiciJTfQ9u6soJ4nalcTeTKYGy9YbIwOUO
	 9xvGLQAd3hJ/6PzH+4Y3wmPBjjv4bYFAwKbEB7aJ3rpG2SZZlEtaCLEmMZZemg4bAysGj
	 FyC09qZx4hlrw2HHxgvAq7J6kxnYb/f6fdfxuBjfaIB2oJXktWkA8RXQ9aK8wyHa2w26t
	 54nySaWW576jbSoaiequXw+AusLgfRBLLKl08dJhlefAM1QXLYb1eYmNNYmeXUKNL5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MaCefyWN;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC72606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC72606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MaCefyWN
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1312078a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413033; x=1796017833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmnXF3v4tuK1ZqxzI4mf7SiDYhBDjm5JKI84VQtIpT0=;
        b=MaCefyWNF2cOmGDz6mbeZjQJ/Jx+o5v5psYM9WcsUjqh7gfNMjSQYU3XOeiI15dGVx
         GCWtnaP78WuzGWRzneSUz4XtATw665rnBy40iMtzcbeR5Dre5/MGfb7aICf7Pgv865ZZ
         huKF9F9+18i+hg/ICQIeuKUe1THosKMrakQ+qhnqLe0Higfmd2BQ+b67jg4ENrbKmxip
         lrWQmbJMY/NZBAS79cJAPO+McaYp9WMuK+Sq3HdNfLkyMK2GZLjev4AadyIwIk1cvdsK
         sDsvbLNp3Qm9UJK87XshqU8LJUKHQrBdxx4J5k7apgSz3g2K8uBXSd0QIcuUHRzkrENS
         CuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413033; x=1796017833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmnXF3v4tuK1ZqxzI4mf7SiDYhBDjm5JKI84VQtIpT0=;
        b=U0REuR+fQz+0MP0Rc7i2P5d28ab4omEjbW9wPZWis1yseOXdxznjBfpFw5Ej3lCc12
         QZy7xQOwJJ03hfL54bK3qb4Rp5qCoYcOYEZQNmCVd6QGKBtGy4ZUam251i5MKAre1lC3
         3Sc2KWXQuALXPZU9c88suuVpU7wjU4q7qSsX5Y9MvAbJJD2xov+StSSRduhFnLWJZ703
         7GycitMgl0TBalrTBDEKX/+15ZkLvlmOJp3gDlL27gDd+vjhHLsxOhjS6lyngeIG3v1N
         UDr/0DO8HWDn38toDOBIWX2mRiUIUFENSnWW30yzQmgmk+AeKksg6RDONYOMYcYINlg0
         XQBQ==
X-Forwarded-Encrypted: i=1; AL+hErEB1whSIejC0AMIjJwgwMJCJ8NGO3O8XQ+0s0JG7N2fmbeOZq0n3PdO8sC2qpAqwLQ4QloiLN/qbiR+rpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oDRblW9uUuXZJO1d+for2QBOFupjSjUQJQqxHViQ5CVAssYh5
	iIoCqTC6o8iYyamgSopBDt9rkw2rX3q/+7Bq4YmmjNKBRnuAQkKf9896
X-Gm-Gg: AZFdTZdRDmgtV38i+0gPN6EYvrUnlbBImRBnxWtbeUliFBEcEsyjwR/oeWeG+4HRBNl
	60pJrhKfQKbyTusuJlv0ihmcGkPGUKdqFyWvImmU6j83JiAvO4Pr8nYSGi4oVU6Juvx4YsT/49L
	s4dp+JgeEHAzzkItEyfeR0cbD04DQvgX0mVtWf6g963K5LLe2HabsHvdcJFJAloWmFQtXt2TNLV
	StPsiZN6WhVHD1Jvai6xfGZjdCRrIxglx085Na+ojdCi58i/WkN2PiI1PzGo+gyuOuCPz22AklH
	k9wBCq0ZnBbGc/gEUsWTxMldCE4QnYyo3GgQbdCnRXbMnR2BysYKLUwS5oWSUzbUOo9UHUpgCVo
	brWuSfhkgN9o8snAUMuT4Z2+fWkLsGjxt530tmfuDdvr2Sk2RMsLkMz4YhKpfduKoAuS0OJ3Ucx
	Bn/zf2tM+JQL+30yTn+AomlRDsbiL6wwD0HBNuEjm+VHp/emxCrmVzbi64q/yCY/xHzIns2aFsr
	oAW5rMSu47zn/rc++IHI16i4DuhdsqaZuIep1I71J6oKVf41nnWe/7GuZAf8lrf7cIls8aKBVld
	59wkl+e6oE9mmQstzwk5uUr/MmjUjg==
X-Received: by 2002:a17:90b:4490:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3b41c7b606cmr9764335a91.7.1795413033347;
        Sun, 22 Nov 2026 21:50:33 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm46486325ad.50.2026.11.22.21.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:50:33 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 1/3] mtd: rawnand: fsmc: declare NAND_USES_DMA
Date: Mon, 23 Nov 2026 13:50:18 +0800
Message-Id: <20261123055020.1995251-2-ping.li@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123055020.1995251-1-ping.li@horizon.auto>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
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

From: Ping Li <leeonion.muyu@gmail.com>

fsmc_exec_op() passes the data buffers provided by the NAND core
straight to dma_map_single() when the controller runs in DMA mode,
but the driver never declares NAND_USES_DMA.  Because of this,
nand_base cannot know the controller DMAs these buffers and never
bounces non-linear-map ones (see the use_bounce_buf logic in
nand_do_read_ops()/nand_do_write_ops()).

Since the mtdchar MEMREAD/MEMWRITE ioctls allocate their buffers
with kvmalloc(), a heavily fragmented system can already feed a
vmalloc'd buffer into fsmc's DMA engine, which is not a valid
dma_map_single() input.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, as the other DMA-capable
controllers (arasan, denali, meson, mtk, nuvoton...) already do.

Fixes: 83208e106a8e8 ("mtdchar: use kvmalloc() for potentially large allocations")
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index eee00c6f43e0..2c3da9242a14 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -871,7 +871,7 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 	u32 val;
 	int ret;
 
-	nand->options = 0;
+	nand->options = NAND_USES_DMA;
 
 	if (!of_property_read_u32(np, "bank-width", &val)) {
 		if (val == 2) {

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

