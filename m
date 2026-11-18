Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018961;
	b=JY6r4QskVLvYYSLbWXqOuLzEqUINBF6kMXK3t1LVSeej+g/VAq6zNGggONdt/HN3DoVy
	 UOFWMb4RIap17byfzCgIUFeoyuUuFx+Do8xP5sHlqWScdHMw7kcJxcNDNOnz0oMfOVtfw
	 7L3UdR2T89wbUbZdIGTPaUWSoiCfeLvQKjtfxdwDCUlpgV7PrMr3iEg0SrBdZaKqBvCLI
	 rK1VN6X+azfsT3CRobwLfUB9UOcVfCY02cBcjN/fE4NacCjZogqKD9jS+fN1LN617wDnL
	 2awvUfGvvyx6fyjO3c43APDJ3msPeir6anITptOWVTuUGPwmfvYDDLT46lAuBdlWPSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
	b=5bbFbSg9zrsHEj+U02+QN12udih9uuHb1ro17NUku2GzcYPHNAgBm4P86e/iYPurs6e4
	 EDprcM94g7qgzNeMZfd7IVSdy2n2oxI28cCMteOoT6icjKeD59sGh8YRFJBIA4WktF74O
	 cvgPoBrivkkmtBqK51sjB3tZsXlbWnTo9B69i81SH9yPMk7x105y5Xlrv8vMjT1P7K9Bl
	 HAEbsw1oRzkJUQu6NLQPC9Jv/+7OmZkC/gZLfFBBuXJai08GelJdyhOpEJWon/083O//0
	 zukYxnW9h9JyFP5cUIEK/g4fBbF2+f1tBDiwKytIE7WR7zyVZEivnFf4kMVUtzWnlWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rS6M7tr7;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DB3606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29DB3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rS6M7tr7
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso624544f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018959; x=1795623759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
        b=rS6M7tr7RCFnO3z1kH73+wDlxDWEXT/AFqz7BQ9nuLQj14vI8eZUE3ozk1uTWVElwL
         LwHO9v5HtUr52M+o/iopn5GXUvTNKCdo5z6Gv2MBMfvduVx40fcBPYL94bBq22YrvXc4
         IBhNcQjC6rDxpudq73u6Ly1b//Nxp9EuTF3DozYQ8B8FfNTIqGHnQ8njyrPYcpH/Z7s0
         +yjR/Z2ZTNaM0fzqKpPVSOFGz8AS2IrVSmSi00fYXGhIDJZHeRpMGIi4pODAunbWWdDU
         wDuE7Kqe0Dd7q42pugpj0wpKvpm+xyMsJCmhBYpWNg+tdhBrIcewDBTgZBg1vQCOFxzc
         O/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018959; x=1795623759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
        b=0g9FnliEOxWEp++mO5t47yUYN2/qIaNd+K9VTYqD+haM+6kFgFQW+o6s3Ts59oPZHX
         RO3YA0qEKoddy3M1nEpHarJhcJV/ydY9UtMe4gE/LiSsLU3VgYBYl8kFfDfGWvGnFWEM
         IbJOrkCdM95+myB8vaEGYklVQ5iN2FKpLN6Nl95xyT/lyTLME09z+fm/6J+YeLejp+TV
         EKLgp/g7oL5hndBnPYc9cB4wgTWuevvpvf1Gp0glK0ZFoXYnvhZJjow6GJuYKpEPaB17
         VrblOZT36q4I2WflZWNAv41oiDvJ4ih4T9UjuiMXmwe/Kc/jqDbZWR/RqeeIXC8epU+p
         e7cw==
X-Forwarded-Encrypted: i=1; AL+hErGVhl/9SgREub7w/vQbeH2gUSdkGZMT9AMs/mc6GvcdzTiTAD/kcT/hz/YAm80eEi4iT7auA0kSF9F+pLw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xs8tT+DrRGqNriNz2FcCXXvIIb6i7abQoNOiZwYuHaxoVPFEJ
	QGTH7Pi3OTZefLgtSqpivS6/xf8ho/EXBV1nt69YBxvdoSl1YIOzTyAd
X-Gm-Gg: AZFdTZfcIB/Qrg89BQW1QsL+FurgG9AQWGbih8iLwCqzV++yEvOcIcJpCQEzjcnD2dV
	LZSaeUyU4qFvNp+iy2R398kJM5jolqWJkKBXbDa0F5d3rm5ZRHZER65KDdoKpDwCuyij+pSaUkU
	Fe0QC4YOsBH4s9pHSA/vdCiBKWvVwPnAEbOj7oY3e7O04ltb+1Hzt93nDU1owpUabMIL9bK9PrN
	KSRNJqvS/4hAOA1IArhrUKKznX3Sxsu2fNGFiVvhdh9D1nm7ivtzXQewJpxA5xEGv3W9I8zwWZ7
	1BLh8H2oBVGPQii3w5NOGjLAcHSiTOU+WLX9thIFb9WyUN8vj8Z2ti9xOp/AKwDdF5lVGc1T7rM
	jCwqPAsYR/OO5KlOANAys/5TjZdvWKEdO5KkeqX9azPNwpHF7HtYAMt2IaV0hy6gOB+QEfxj1kN
	iWVgucZsxdMlVrubx4EE2LRlzI6Q00FvXJbbx+1DhHQTGF3AjWsnGZnSm9a1v+GC5eBg9/LKIlq
	oyNRwS56a5WjSbWR41H8LeJUSS2Poq7rlEvOn6f6xL9vlIuph7Iv+kxprV5RlLPXzg2duIHBMi7
	U86g2L7z2xOQNjLgF2tWUuDCFO6EW5gYOguYR9guLYwFRXxE7BPRZm2WnotGww+4puPirq758jp
	ZvygDzFHiXS2yl9NeBbXp3DJMOujPE/g=
X-Received: by 2002:a5d:6f0f:0:b0:48c:4f6f:62e3 with SMTP id ffacd0b85a97d-4a63c65829bmr5664866f8f.18.1795018959207;
        Wed, 18 Nov 2026 08:22:39 -0800 (PST)
Received: from localhost.localdomain ([2001:861:39c2:e340:26a9:c0e4:d23b:6722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm5780458f8f.36.2026.11.18.08.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:22:38 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] clk: sunxi-ng: nkm: use div64_ul() for the rate divisions
Date: Wed, 18 Nov 2026 17:22:37 +0100
Message-ID: <20261118162237.1664352-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ccu_nkm_calc_rate() and ccu_nkm_calc_parent_rate() divide their 64-bit
products by an unsigned long (m, n * k) with do_div(), whose divisor is
32 bits: on 64-bit it would be truncated. The N, K and M factors keep
it far below 2^32, so the results do not change, but use div64_ul(),
which takes an unsigned long divisor, as coccinelle suggests. On 32-bit
it is the same do_div() as before.

Fixes: e9d9dae0d248 ("clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611151822.QXTOs54d-lkp@intel.com/
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Follow-up to e9d9dae0d248 in sunxi/clk-for-7.5, for the coccinelle
  report of the kernel test robot (do_div() with an unsigned long
  divisor); squash it into that commit if you prefer.
- No functional change: m and n * k stay far below 2^32 for every NKM
  clock, so do_div() never saw a truncated divisor.
- Testing: built with W=1 for arm (multi_v7_defconfig with the A31 and
  A33 CCUs) and arm64 (defconfig), no warnings; on arm the divisions
  still go through __do_div64 (no __aeabi_uldivmod). Not run on
  hardware: the generated code for the rates the hardware uses is the
  same division as before.
- Tool disclosure: prepared with Claude Opus 5.5 (Anthropic) as a coding
  assistant, from the robot report; I reviewed and understand the change.

 drivers/clk/sunxi-ng/ccu_nkm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index e5a8f22d50f5..a11d51dd0f2a 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -35,9 +35,8 @@ static unsigned long ccu_nkm_calc_rate(unsigned long parent,
 				       unsigned long n, unsigned long k,
 				       unsigned long m)
 {
-	u64 rate = (u64)parent * n * k;
+	u64 rate = div64_ul((u64)parent * n * k, m);
 
-	do_div(rate, m);
 	return min_t(u64, rate, ULONG_MAX);
 }
 
@@ -45,9 +44,8 @@ static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
 					      unsigned long n, unsigned long k,
 					      unsigned long m)
 {
-	u64 parent = (u64)rate * m;
+	u64 parent = div64_ul((u64)rate * m, n * k);
 
-	do_div(parent, n * k);
 	return min_t(u64, parent, ULONG_MAX);
 }
 

base-commit: 3f8438336a3b340ffbda9e89480630436423782d
-- 
2.43.0

