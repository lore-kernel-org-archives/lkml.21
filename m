Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180287;
	b=hjDWDvqUqShEkV8YnuICK3JvO83LEBT45NPiQwpK23rYpW15vvyUmq4FsYhvKdNPSewa
	 vvQBnJZGudxaLLtnTzUVplYhz6eGtvqyPEa4oNcyRvHSJjzF2lHmal7ny9KWZEHKxSG0+
	 2SqnaMonrEdgqnK0TQcxGXwKDBNjuVT21mBp2ISKffMcMqZLldlsYM6MLLEuRXhjg+kxA
	 G62EYPQQ9icdiEKDMg3VvsQzzcdI9U5s1Ry1FPs23ld0lkH7ocgQsYp6MqbSmAqkrWg+e
	 s2lMzfJtQHGAw3GWgYs6GXnPcPU5D/uoCznDUHssKOgotdNFQOldVv3x5bZJWf3vmYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
	b=qXNKekO3UOEfr3j+dIVKDTBpX+iFM1PdnD+5dkXLaji528zR+v3HaCTwvTiv4mYozIGI
	 ea6TWgJX/96UeVwBMzmSSqXZv3IHQTmMwzNL6i90jtdmuQCPgt6E5F1Q+qkLQ/Ct8ySGA
	 HLgLrxPHwLTwwtQ/Zv1taq+WvL1/mflLmoVL8fTrdvuXk40Lh0UDs28EWoUozVRtu7+0A
	 2V4a7XHlHPv383ignjtNaK3SxeIblhFA79MlwUzFgCJvbWTJmA3cvqmTzHCycJFSxFij6
	 egWz5OtnvPLnPlcrvjPpsvffloz3OdQkucl9lsuYnNjCajEgAbuwbRnbuXqc5arJAcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZR8gSfVt;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E9E60A2623
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E9E60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZR8gSfVt
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so6797055e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180286; x=1795785086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
        b=ZR8gSfVteoRFAS2zgu38I6kuI9bdzjDec0HgAjSyhrrIWdGtcPQVCw8qkUI0dAmeiJ
         q+9HHMlb0gRL0kePtGr9pueePzlT/XzaQWHFUbxGJoH1pq+ToU8pFI/vhcByFZj0Cvhq
         3JGZ456eeYkp0RD+D/T1eRKOEEUYphctlng/6tRxO/pDdLEcHY4UGrWjmpHcnLBZba65
         aubsIHhoh07iAD4eeR3Rqb5cTJHVG8Aav84pS54ijzwCiziyX2QZOGMwDgqVPQ2eV3nG
         bzlYWXJtp51hR3oDKi3LqnbKJjfg677KvDiC7/MOlgPC1zO8Z/EBm+ogO1o3XL3ZDKwg
         SdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180286; x=1795785086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
        b=VaDuZUbGMAkE0+B49zb50XkEUgGo2YWFPl3yueFCafon7x6EQtdCHIrwXBbHFrnS3H
         q/UMt77v82RSQwrUqVJXFOljcJK45NiwZFcYbXdqxk7r2AinUsoa54BUJgio1kD7UjF7
         uttTZrbXlesGiS6tVTT7w2UdBMrteMaU64fGbiGiff1qgliNusxu0mqh0ziQHAl/S+pI
         X8bTNYIL/z59daQR6D3gvajnloTQ1hIcqHNhKHNjgPuhp22nIv5TWO1dGUL/GQQoiCDf
         +kxRGyIYDqfHDM8cQtuB6OEeFrx+8YucKXlVKV5jluWZHgLBaGsXFEONTHKrlsvNr6+V
         1ilw==
X-Forwarded-Encrypted: i=1; AL+hErGEGVO0ustG2OcdVz/mG3JW8qOG5RyKb9u3U9LOgAIvq7RHz+iBxRizuGBtjjYSY2bKvAHbEfI1s+zKNmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c/7AGhu5LOhVZB7j5KyDIeErf/uMH4p0kokK1PeLdJIbXhMyV
	1aeOaUn/8/IwGygkBmsW1OZwoPPuf+Rohlk9IYOQ1pHcuvxs6SE7yW06uL2Xzj7Sxej8CvqaLzI
	bBiT+
X-Gm-Gg: AYBFou1phG0OdWH0Ny7MPYxS85mr0mzUphAvBlHjDINPBV8LJZWZc4ru7jwpgFuv0WP
	QDqEtbREQmaCcJhy9eN8lzqe+Q293N0uEayhdJ2kIYdSLGRlZV8LM8Dg6W2GasIohZfIyf93AUG
	FhW43lfi4SYt/Yvf8R/vb8kBpdeK4PljkhwuUwQ23t6Eh8fM/Gy2SvYJeuzhNsIxrNJcUBUlkgd
	EJnLZChYfQtNk0ChrlF99LcUFvk4arespQ3tzMH2mVdDTZxQMPYuaGZNTC/6oiVG19EB1kkrdFp
	VB4gmJmlzIxL4HWcohtcF0USeRyiOQEmCxjMEKOeATnicZJNxASEOedn8Y+8a7pDNoET2GJW735
	1RAEF7Ssg4EOplHtunveawsXL6onAbpB0Wl2dqxHksmtLNH1QcadjNJWmm9dNKgGbxOtjTkGpCh
	yecx35Q8VGtogxoYou9AQvufFPwEMFtzeNU6f8Npv7XFbhfI6gN7KwGrF+QOA47pFUVkgiGKv/9
	hAanXsKPXyYw4wfBjhnDNOZtHgns3HawQB3E9OdALpzK3lfeXrPxAcjp+aQHDdWDn30PrW8E3+x
	JCL9KrRu3v+Aj+j+6m0mYg8Kh/jik5X384dTCFTl0/lyLAaXFZotIRYzWmjiMc/1UEoqU7OA8ag
	jNftS0tc555St8qQdWm3TuCd4EKTznCnLmLLprRvI26fcNI7oD+RI8bMrz86c1ca8PxEQ
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr67265015e9.31.1795180285567;
        Fri, 20 Nov 2026 05:11:25 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:25 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:04 +0100
Subject: [PATCH v2 1/6] clk: meson: pll: Support PLLs without a pre-divider
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
Message-Id: <20261120-upstream-s7-clk-v2-1-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The common PLL code assumes that every PLL has a pre-divider. This
does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
meant to run with theirs set to 1.

Make the pre-divider optional so these PLLs can use the common
implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..44b33051405f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -76,7 +76,9 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 	unsigned int m, n, frac;
 
-	n = meson_parm_read(clk->map, &pll->n);
+	n = MESON_PARM_APPLICABLE(&pll->n) ?
+		meson_parm_read(clk->map, &pll->n) :
+		1;
 
 	/*
 	 * On some HW, N is set to zero on init. This value is invalid as
@@ -174,7 +176,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 	*n = index + 1;
 
 	/* Check the predivider range */
-	if (*n >= (1 << pll->n.width))
+	if (*n >= (MESON_PARM_APPLICABLE(&pll->n) ? 1 << pll->n.width : 2))
 		return -EINVAL;
 
 	if (*n == 1) {
@@ -437,7 +439,8 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (enabled)
 		meson_clk_pll_disable(hw);
 
-	meson_parm_write(clk->map, &pll->n, n);
+	if (MESON_PARM_APPLICABLE(&pll->n))
+		meson_parm_write(clk->map, &pll->n, n);
 	meson_parm_write(clk->map, &pll->m, m);
 
 	if (MESON_PARM_APPLICABLE(&pll->frac)) {

-- 
2.56.1

