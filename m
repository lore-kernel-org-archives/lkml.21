Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285029;
	b=FmVEuMIe93XxMmgF2ZHXqkx3IFNx6s/YeW7vEiFhMz6uQdARHpZ7Ls0q90EHIoly05ed
	 yWNQ6sIbt9VR5ht7gkV7D9iQzB8rxU5e+caRO8oeAStE6Yg5mgaPX11Nt2G9t3eMh9+1F
	 opom7PnJkP1ueX5v1huMAKrxFrqlC/692dmGq6+Noei5nndbjvwI7KfbZtOJLfvlHvEXx
	 XYEJv54mnQFSmH1pNKW79t9wiFyRhO3oSV5lo3qOAXEXqAO6GSo6u/q7qS/JuvSrZsl77
	 JAl5WkPyYkSz8V5uogsUfFPlqr0xv+kXV80/ugcVChUMON1famcQghhxqKGXWwq0mHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UhzIB9kDRA/O8B0wyP5frsqnTbd8pw1jKQ9ECYnxkeE=;
	b=sdef0WuplS+YpHPnz9hfJgZh7jXVHd9PEen1cR47F4F8upu+tzDzbSdEpIY53obr7P3j
	 8MeWzPDNUR7v8jIHXhkVOqlTGSk1ygapQx67bis7JOw/Ae/PQjDNW1qrX0XofvCPzw+iI
	 CIMa8kH4wKDzNkxQ+DdNixJPi1UKgQ+0/07Y7HX/ddnJvPe0RqUumU5oLUSaDPhk0x/nS
	 WxN3OvQyELLPxpdDMsTyuenNxRyTdhgB//DnbzHFfpJOujQ5a81ZcGMTlec293Ke8ONU9
	 HUTG4ksA6d4B+v62y+Ng45YOU4z1dNKOf+smWq+463xuCDF4CAV785H3tZd0dfruFEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiLOvKEx;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4A606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA4A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiLOvKEx
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so19168275e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285027; x=1795889827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhzIB9kDRA/O8B0wyP5frsqnTbd8pw1jKQ9ECYnxkeE=;
        b=DiLOvKExvnJJabRvpakLyt8W+tMc4HkiXeq0BcKxPBX5QuRH8LhmvoqfCEApUKuzml
         SlxdL30qETTWMhy8wjpGveKsKvquE4kMAG2Pfh2hPPC6tf3hYuIHwHUdxfH8uYelVo7b
         n9SmpzAKedC6QTJwNTofa4A6LIl8cuDPqxEwrdk+bR9iCHRhn0BZD2Frvd5gCd1kdGgk
         cE3FpraODjDzSzMj2arwRw9Ck+FqAxAN87BEDxxAagdYntckh/YwKvCcvs8JzXzdHBej
         KyuMJmwVbBpWxIEmzOqy6my0Cy2LrEhSctI06IFTG35Z8nqq93vLlCEj6nDQD69h/5KW
         axqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285027; x=1795889827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhzIB9kDRA/O8B0wyP5frsqnTbd8pw1jKQ9ECYnxkeE=;
        b=g9N9KcDwtEeeA+DKEOR/KSnDoiwEQLjnnze8s/0rc+jpDx0fO8A55m03mJQ+nwqdSq
         x4IJqB9t4Z0bTFjrsLBvOCnTDQUJFOQ3G4EEEXlWY9C2L/nBzY9gHkgkSFKTmnOHWAcD
         zsOtBLWfSTDh5/xbS+BPEU7btX7smDfPw0sooda+CP0AczIXj+sfvx4MHx+hFji1TJgR
         /AoRHmmYbdUeRr+WWDUYsD3SiKkIYzcJbHTsaXfDF7rNmCBkhp+9enr1iRbak/6hyugL
         MZhMTk/x7W+ApsFe6XAhHcyPNsC8Z4QVxCQ0uSSiS5UGSk44zDB6VelsJO1F6HQqIKOq
         YbmQ==
X-Forwarded-Encrypted: i=1; AL+hErH/iln8YwogQlFgzPF2xWOVpeLVGX71QJkWDl0xz68s9/tqFIaeDY2+6FlnznpGKScP7BBcuDiTtV36UJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z96Hueoa0lQxZxijvjMud7duZe1Axr5gnFLG/rYKy6cEX6xeJuZ
	NIPQub8OmKPypAoelMSZRQQidgy5/oLSv0boKEy9if45H4cLYZbYKs32
X-Gm-Gg: AZFdTZc0VqR7va+dSg1hm2Hxj+eEmTOb4n5cV5RbAGRdpWmEPYdaMm9uKIIn/owzcVa
	HYHrzBJrSxYIp6SZl4o4N+6A4CHu/8YwSShlPw0VXYT8Rxq4+ejkXYfQW3spiCSio+gVPwuDOPj
	JCeMnS/Ao9byAOEJkD3d297s8IPNw5/gyM++oVJSDXuuds5xpSxHvy3gO9nLf6gcr8s+eqA7ogI
	/dk82w2zLQWZP5/k4L7u3IfN4SMS5soMAA4MEtiP+CoJR3fSHt2ztvjrnvYFEhaUx00We9EkTz9
	xRSbmuvGS98naeZYtXZTX2qs2CQ4QZqaMAPaTfQ2/brZywl7TfoXxPkBVWRam6tkCXL1P3Dm3HN
	5G/J/RvK7nvq+qLNW/SO+p+nl4+L4K420YEF4ecSBCCtiAn9f6jJcmJ3xxVEr99JSJJwEFDsQ+R
	ycCQdEHY9Qz90gbIobSKBnz6uGhm84r087i/dKUQBqTE8TKsup3av562/wJigHfEW5lQCyNO8zy
	Pd5vlRBQtNIHpGKDHWZRP4j0nQ5Z0WPXrWAzgcxupbPisQGymsRkq8w5lXWIhMnZ3hHvpOwsoTf
	VH4vNLVmpZtIP+y5MfZH7DsN3rMNclBTbV5j/+glJcviZstFUFvZpc1NJK39CAM/wlWjdRMy
X-Received: by 2002:a05:600d:82c5:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb88822642mr168886035e9.31.1795285027487;
        Sat, 21 Nov 2026 10:17:07 -0800 (PST)
Received: from localhost-live.home.vlan10 (053da81f.dynamic.tele-ag.de. [5.61.168.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm152782155e9.0.2026.11.21.10.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:17:07 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>
Subject: [PATCH v2] clk: rp1: allow the clock provider to be probed again
Date: Sat, 21 Nov 2026 18:16:50 +0000
Message-ID: <20261121181650.143474-1-joshuacov@gmail.com>
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

The clock descriptors are static. The clock core clears hw.init when a
clock is registered. When RP1 is unbound and bound again, the second
probe registers the clocks without init data and oopses:

  pc : __clk_register+0x5c/0x9dc
  Call trace:
   __clk_register+0x5c/0x9dc (P)
   devm_clk_hw_register+0x5c/0xe0
   rp1_register_pll+0x24/0x40
   rp1_clk_probe+0xc0/0x168

The clock core also leaves hw.core pointing to the freed clk_core on
unregister. Some clocks refer to a parent that is registered after
them, e.g. clk_mipi0_dpi to clksrc_mipi0_dsi_byteclk. On the second
probe, their parent lookup can use the stale clk_core.

Restore hw.init and clear the stale state of all descriptors before
registering them.

Fixes: 6486341721a2 ("clk: rp1: Add support for clocks provided by RP1")
Signed-off-by: Joshua Covington <joshuacov@gmail.com>
---
v2:
- Also clear hw.core, div.hw.core and cached_rate of all descriptors
  before registering them (Sashiko review)

v1: https://lore.kernel.org/all/20261121163915.86681-1-joshuacov@gmail.com/

 drivers/clk/clk-rp1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index 1dd276dd2b..c261306dcd 100644
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
@@ -2416,6 +2417,18 @@ static int rp1_clk_probe(struct platform_device *pdev)
 	clockman->onecell.num = asize;
 	hws = clockman->onecell.hws;
 
+	for (i = 0; i < asize; i++) {
+		desc = clk_desc_array[i];
+		if (!desc)
+			continue;
+		if (!desc->init)
+			desc->init = desc->hw.init;
+		desc->hw.init = desc->init;
+		desc->hw.core = NULL;
+		desc->div.hw.core = NULL;
+		desc->cached_rate = 0;
+	}
+
 	for (i = 0; i < asize; i++) {
 		desc = clk_desc_array[i];
 		if (desc && desc->clk_register && desc->data)
-- 
2.56.0

