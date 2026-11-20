Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180289;
	b=kIMHBqGtt/g9a4ZSAM4Jg5v2fL95DMjQqiJJPeAAxdDAvPk339txaXDCgPYhOt5S/zIU
	 O70dvqBygyIJrIvyIR222xL0ryFioQ9NoUzX6FydayFZfEM3f0+BbxykWCqH24NfTOue/
	 D1pwHyWZlfJN8rp9axFn3aTl5g6y5pq5kDBjpLKjRUvvvpJD9XyBGIWXOowM29gyRYdT1
	 SPMPVaNsnrfP7qvl0BgwUIQYWg7dfjHtvzgqXIDz/9l7jiJqpIJzvWGOpIuq08/gey/Z+
	 Hl3VPWbC8PLYcN0f7ox5ZV6fpucChdtBei7e+8RPO+qAFks6h2+4Ha17PAt2nukuAuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=txuU+BiDG8UpQO0tFx7oAN1Lq5ffpuqfgammyKAXItw=;
	b=iu8F3j6xcTJ+ttlrZkPF2FkBzAXntpJHbAO7QH9evDOdAgpLFwBzQfy7tae9tiEIqne7
	 NYv8qZfFS1iQFmy1gbiasDZYWJYoplfNJDs1Lid+IOCwv37T2pWCSE4L6d2gK16XAzqum
	 3cd3/xVur2RtIzu3yLDe0TPnticfOqLV2/XIZI4XfGTEYLgn7Yh16yZiVFMTn1pzOCtUe
	 kZmL5TPeL3k9IV8XZLqd9oa+JDLdXQaMV6e6RICWD2IuTtHLSGsxLxobE04BxQkNcH3oe
	 bPgg07Ie/S2n0b+jgZbSqYyAyrhkOJFa2qGKYyTkzFyZL5yILo5IC7JfKA3y6vmyn5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pI3ysTKE;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BBA60A381E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BBA60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pI3ysTKE
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb606491faso4494345e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180287; x=1795785087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txuU+BiDG8UpQO0tFx7oAN1Lq5ffpuqfgammyKAXItw=;
        b=pI3ysTKEaZPyKZ7VIHMvESu7QfzGr46kaQ8oUPXTLMwovPJ+7GqfFnLgdB1Sk5IY7Q
         +XEbo+19WeLWZcQAMcgwmiGKeusA3yjI90IXvADVEqFcm4kZ/8XUT383lGsidEmgKb97
         JIz+jaxlxnC3jb3r2Ec/XK8WwTXdIyVDD1V1xrvYon5HG08A58mCnmlFCSMjjKvL6D1b
         utg13t+kUqqkMP0SIl+y6ms91ijLvjYK0chZWmCeLtagTHehZ3S9dAmXEk8aoc8IjhYB
         028jVmVYC/jVFSNhhZEMdpn0Py4I0EUha7ha0syRIvGzRq8koSy/TdBznNd+RAquTqxD
         uLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180287; x=1795785087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txuU+BiDG8UpQO0tFx7oAN1Lq5ffpuqfgammyKAXItw=;
        b=jc37h2PWZV3puzRRXgyC0woghC7QMtKb8QFtTqsV/u4OK+3YWL8uR4ZzsVBmjMG4Ni
         vATyUO+H2yzaxpMXAoWdhPk2XWbIkRlWssA8Pn2AoVAQuIzmkH4nI4Op57pr+9lA9IJn
         TmwAwfpbiCokzXCMJsvO1Xa0aED38W0CXPyjAlOa+GHFf3gkNi8IVR+1KEEpqrKOMGXH
         9I4dLwuIdRBFqAq3ArH3Xe2AxfYTo54RQKgp24eu6lwSQIKwa7HzWdgcHuKX24VAwRbk
         MXWkLelzfeJGxwUnPjR1W4aRYIPrta+ztt3SxufBzyWcVxxRCeA1k45SfBg/02R2t3DM
         3Vvw==
X-Forwarded-Encrypted: i=1; AL+hErE+dtwRf06cZ4Ny/iC3MTrm81CqrEMP8plvBqLMqsg8QhYGIs/GoS29hSjQxVvZRDnh5kK2MjKdEkONcaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I4zCdRG778Xaemajv6FQ9WFL1H37Y6xW1sAWPAfuQUncPiKHs
	6JJLSukJk7dD3DYBPK0BwEzEB3ntK6O/i5NgkMBFknz8jRTfXZ6DD+75K8ElPdwRPSd4LewWP5a
	hSJdr
X-Gm-Gg: AYBFou2ICdOQvK/dohfayoji1eJKSNy71Lk9vhm5heL1/b1IU5umj1fEoOpZLymwjre
	VbGswBjj6RguMeUKZjmRR+xRQ4y+pTkwd8H+wjKhZz6Bt6vNTScGMp7AIwaogHLnQ5L099BCtBF
	a1usaPBVzg/ClFVGBcBtLymeW/BKdG3S9jezqQhLK9cp/0ohEmhnHnoO1AZ3WI/4KrCsSEGs8iz
	wWpnB5wh8A6oBiIAoDz1PBRpAyfcySKpzEtyBRsA7fPEUgh/ld+v0xT0RKwR3tBBIJhgfqWMfdv
	hRFbmds+zvs8cOU20I594kNAjeVyedc6hwyGO8Cl9bA+0JvJLGaWI6MO38yGGT2BMFBgtigjk5c
	LLq3jVr5pC6ov7lYvfcpKz2vtZLmdSm70tRfHz56KO/yhVX8ZFbsCGOAC7jxY52gbjqVRpWLYHj
	4m6oMBZ5TCbQW/m0weouNhGEXfi6och6cLExivWW02fUGdVrZiHOoiRSKCsAgJM12Q9sWmHLB+N
	krCExhRXwgVIFhR7MptZzhqwSmhNsMu0piX0vO+Lt2xDT14z6udBZ4vPcthHXkQTUU0vWxAkIub
	hBddrn4TVYAHL/WZ1vqJ1DaGJZcALscY9uD6eRqH/+BImgRMiubN04C/veZ0SM5j5DJKJ7Q34dF
	r7JcusAZUefMRcjkeVN41RkVq10cRBkQnadQo7NXxHPwI/pHPzquOBEiFIr9i5UOun6c=
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr71341305e9.20.1795180286969;
        Fri, 20 Nov 2026 05:11:26 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:26 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:05 +0100
Subject: [PATCH v2 2/6] clk: meson: pll: Support active-low resets
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
Message-Id: <20261120-upstream-s7-clk-v2-2-856cece3b9f2@baylibre.com>
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

The common PLL code assumes that the reset of a PLL is active high. The
S7 HDMI PLL has an active-low reset, and its lock flag only rises
reliably when the PLL goes through it.

Add a flag for PLLs with an active-low reset so this PLL can use the
common implementation.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 42 ++++++++++++++++++++++++++++++------------
 drivers/clk/meson/clk-pll.h |  1 +
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 44b33051405f..29b5222983df 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -293,13 +293,36 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 	return -ETIMEDOUT;
 }
 
+static bool meson_clk_pll_in_reset(struct clk_regmap *clk,
+				   struct meson_clk_pll_data *pll)
+{
+	unsigned int rst;
+
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return false;
+
+	rst = meson_parm_read(clk->map, &pll->rst);
+
+	return !!rst ^ !!(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW);
+}
+
+static void meson_clk_pll_reset(struct clk_regmap *clk,
+				struct meson_clk_pll_data *pll, bool reset)
+{
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return;
+
+	reset ^= !!(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW);
+
+	meson_parm_write(clk->map, &pll->rst, reset);
+}
+
 static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
-	if (MESON_PARM_APPLICABLE(&pll->rst) &&
-	    meson_parm_read(clk->map, &pll->rst))
+	if (meson_clk_pll_in_reset(clk, pll))
 		return 0;
 
 	if (!meson_parm_read(clk->map, &pll->en) ||
@@ -328,14 +351,12 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 		return 0;
 
 	if (pll->init_count) {
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 1);
+		meson_clk_pll_reset(clk, pll, true);
 
 		regmap_multi_reg_write(clk->map, pll->init_regs,
 				       pll->init_count);
 
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 0);
+		meson_clk_pll_reset(clk, pll, false);
 	}
 
 	return 0;
@@ -365,15 +386,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		return 0;
 
 	/* Make sure the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 
 	/* Take the pll out reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 0);
+	meson_clk_pll_reset(clk, pll, false);
 
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
@@ -406,8 +425,7 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
 	/* Put the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Disable the pll */
 	meson_parm_write(clk->map, &pll->en, 0);
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 949157fb7bf5..8384b75ae38d 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -29,6 +29,7 @@ struct pll_mult_range {
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
 #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
+#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(2)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.56.1

