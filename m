Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279173;
	b=pbO4lDZL518bK2tVSr7xdLXge5HM8M36F8vhLCE/7CgQxP3H94vcxY/+rB9hyzwJaxBI
	 SH+kPCRpmu4gRmfDaAJsZy0fR1xucKhTJqINgkoYAmTyOCp4GHpTarnXMZpW1FL8FUecC
	 oTfj2IQtnZNO0Zj8a/lyAy3PkDKxJ76l6NzzHV1Zu/anJJ5E78jzQ0FhURaJqdK8YzMBS
	 xslmAqxLTFhbZ17LIp1jPgRXlpfvz7p5FG6RrKbR0PJEnip2z5WqbhUS1ENtH3BA3EcpZ
	 G/Gh8CtOA88YAk/uHS8gIXiRpq+xLJnPd2CUC3eNogisjIcX+vbuo7OdykO7j6dPplg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pLQTRcXUJhUmLmDSMnhR3mvBdnibH29NsZJ/odBJs3k=;
	b=GVI9vJTSiv4cOToHSS42c82gAalNJH9T2qqPTGXCV6UO3JWw4t90cVzTAhMPrMmIWbxB
	 5B9e06vCHw7AcxwuNlmrk8b+/oBE7JidJC0lfgtuR2arDVhyw1Crj1lO+NyY4i6OEIA60
	 jMxzaU2zP/a4ftunjZoyx8XzMe6g6EizHHIVhG5Gx+lkBQnkzoll4FozHXwd+CLnBpEMX
	 lJpI4McMoWf9IG+95JpkpUKsqGU+jFE5+FwmVo7aQXpwgrIWZqy1grZq7FCV8giUMJ1uL
	 XRUXJP3n+kbm00faVvLiv73ZIe0GgEHOJQSmg5+hSCwZYkMpL72rrpR9DmmxHxEzRpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elwNxqNl;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236FE606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 236FE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elwNxqNl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so15694665e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279171; x=1795883971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLQTRcXUJhUmLmDSMnhR3mvBdnibH29NsZJ/odBJs3k=;
        b=elwNxqNlg9w5HA4LpyiiqlhnV/mtuNlaGEuQHi7q1/TQd1LxWvhsEROrLfyl+oUeQt
         RdhMat5q2HO24mh7XjReHGhzbHiWH5k04ifg8LlWxuel68EZ69OLJozB7gZqJH3PqD7/
         dyEN1Z2uYfE1PMdC4CkcLFlgejYSp/b+149udohvf91lqJk/weZkc/cdNPWIX3E7+x1Y
         5KIJyvRXSCSfQcz3klDvWB7u7gIC9qSNF2mM5aEY++25AaAwTzWcC2XS2EtgsY+uYWo1
         ofWKvYFwvgjEgKCL9PVjZ0VOU9LwZsYwv5rI6V+uokTIAXmN7uM5SFoJqmGm00TNMghq
         9gBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279171; x=1795883971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLQTRcXUJhUmLmDSMnhR3mvBdnibH29NsZJ/odBJs3k=;
        b=DGNc9P10hBRn3FK9CLKZ8eJy/JAx18cwRYiAVL4vsgFnJHO9M2qH7aJsCPD3mNLkxj
         8Bv8eD6l+BUQoDAIbbHUN++yVqRBO1Ec2l1K1c7C6cv6nt19EPF7QmZuOiWjJqCt6dOF
         TZIGQoxkxdKOPx5dWk75gC1vxqtryzQq2pPSqgUQNyJAbe/e0JVAMvEr8z1bOfgd6lNe
         C5TJ7JvIHthiHmcRehaZBseZFAkRNDWIRJnoEIZuWodHfbNXSCecGEYkX5gyr5Ma1wDb
         953p+um1Ib330wZhCxsLM3tRUm1J4VPd74Eil3DgB50d+CQmcCn0Dt99iDkxlMXYmWf7
         sLvA==
X-Forwarded-Encrypted: i=1; AL+hErHSMUW2pfBJ7sNvDGhI9agUz62Gj/CWI7liJLIPEMkkZORhHqBFAKT7a+ThJ+0khxgEuM/FqQoGwe/jD4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UP5upZZmnd7PxoUtxizeiwBUhW0LixXGjn+kwIC7l8ios8q3g
	g59ZYhwoDTIuWI6DpGS2U2pGptaICehvk/p2+yl9jj85LwTBB8id9NFg8OGTP3iDzd4=
X-Gm-Gg: AZFdTZfs3YEpB2elUGRa7ThcvT4jc/muuv3yqBcbEc2rQELGWJSbf/7tMhVU/vCqHmP
	6t3TLIKq6CWxyHJEXNekbIpoLMiIR6pOBnxuud4RqbaU8rfwYCMDVeDGipA1uS4B7KwrqxEOT/0
	QrTj4J1la5Z+loSnz5rz9L7v5e9+VK5DVFfZka/2nV3+gw3N1gG0ESBdBIg4RrhoIvGS5t1BPF5
	s5MguLIVrsfjw4UAeuz6Q/ouW3JUfygymM3ONcyGQmesq9Pj8PjGZqT2KHOUbgVugeU5RNCgHJ2
	zQTMvYLFyn5Bz14Ja4vTpUiAyEnFWaWH8gRBpv2WezfbLebSFl2WRatOr8f65XRe0zSAr6L5RgV
	aXeYRAA63Og2wIljJpfsj9rhfstk8Ev1CHhFbQnsxaCDOrMG/EtWtM8PXpSsIbQW3MAUxllT0Y5
	t/4/abqLsVX2tjaXcABGpp51NeCsXj+UrSqnfAfKGk6ca6CFgvEAYfg012kZX2O/4qw3bBiWak9
	19AlyhX9bUU56Fz//wVBQqQIgimP7MjxnwuXDPQhYREhFH1A43qyIRy8q6ditO9ZWB1h5s4hbBc
	/3HC36HpPKa0LJcFgN5iIi0pAJs99px9EwXtDWT7sBbsiKTZZFQeMt63lbE5Qtp+uyg94j9X
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr140075845e9.7.1795279171363;
        Sat, 21 Nov 2026 08:39:31 -0800 (PST)
Received: from localhost-live.home.vlan10 (053da81f.dynamic.tele-ag.de. [5.61.168.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm140114675e9.4.2026.11.21.08.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:39:30 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>
Subject: [PATCH] clk: rp1: allow the clock provider to be probed again
Date: Sat, 21 Nov 2026 16:39:15 +0000
Message-ID: <20261121163915.86681-1-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The clock descriptors are static and are registered directly. The
clock framework clears hw.init once a clock has been registered, so
when the RP1 device is unbound and bound again, the second probe
registers clocks without init data and oopses:

  pc : __clk_register+0x5c/0x9dc
  Call trace:
   __clk_register+0x5c/0x9dc (P)
   devm_clk_hw_register+0x5c/0xe0
   rp1_register_pll+0x24/0x40
   rp1_clk_probe+0xc0/0x168

Keep the init data of each descriptor and restore it before the clock
is registered.

Fixes: 6486341721a2 ("clk: rp1: Add support for clocks provided by RP1")
Signed-off-by: Joshua Covington <joshuacov@gmail.com>
---
Tested on a Raspberry Pi CM5 with 6.18.64 and the Raspberry Pi
downstream patches, where binding rp1_pci again after unbinding it hit
this. Applies unchanged to v7.4-rc3 and builds there without warnings.

 drivers/clk/clk-rp1.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index 1dd276dd2..5c3929e93 100644
--- a/drivers/clk/clk-rp1.c
+++ b/drivers/clk/clk-rp1.c
@@ -363,6 +363,7 @@ struct rp1_clk_desc {
 				       struct rp1_clk_desc *desc);
 	const void *data;
 	struct clk_hw hw;
+	const struct clk_init_data *init;
 	struct rp1_clockman *clockman;
 	unsigned long cached_rate;
 	struct clk_divider div;
@@ -2418,8 +2419,15 @@ static int rp1_clk_probe(struct platform_device *pdev)
 
 	for (i = 0; i < asize; i++) {
 		desc = clk_desc_array[i];
-		if (desc && desc->clk_register && desc->data)
-			hws[i] = desc->clk_register(clockman, desc);
+		if (!desc || !desc->clk_register || !desc->data)
+			continue;
+
+		/* The clock core clears hw.init of these static descriptors */
+		if (!desc->init)
+			desc->init = desc->hw.init;
+		desc->hw.init = desc->init;
+
+		hws[i] = desc->clk_register(clockman, desc);
 	}
 
 	clk_audio_core = &pll_audio_core_desc;
-- 
2.56.0

