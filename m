Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685495;
	b=keJAmuHleqrZFctd+7vh+OUWaMMBeVkOpK3LRPNkpGsBMtBodroP/AhiYF1A23eInmN/
	 o54GBbbTnTRqAtE03fABOMlT3nHnt3fUhiIxsWQobEZiYlZRq+cwoz1yNU54uTmnPrFqA
	 8LrvCRkxol1SUK4JoBAx2ULIBrYN1q87tr1DKlo465l4Jkbtn2DU+YqM4MQV4+XmMt9Mj
	 XkR05/lGyYVU7NKFHCo4DxPaCkh0K2yzaZCMT9gmjqhl5zj+e622i3iR+A1FN+eqYgIt9
	 46EL/Z4bDKJ8J8PBMkvo8bjt4MjRH8dyhU8nFmq+Ad0w1kMgba+UVF29c/IPF0LjUwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8lJsCQlmSYKnZqPo3KXfCYUm3hUgy3XldOvtmxhX/5U=;
	b=461tGSL6NxS6jbXWGY5iFpmmJEqwphj6fvxpQMQPomW7NXzhSHmxavy7wy1Bo2WbJ/Xu
	 pAQKZydNwayXDGbCEUozMKvTayKN0AzhAhNh4AbZ5g/f6f7SdNWeiK/gKzX8C1aOblgeN
	 ULREGK8bfvvRy0xl14d44kp4tPLFgYHwF4YanXl/amuDRFCz4+mHpFlvUmUIrCAvpAPo5
	 NEm3RPFIhk1WJJhWrBkfULJlbRl3dKInt1iAVnrfCfroXu8fGrB4IfhH5KrISPjKWnXHJ
	 nlGevwXUY1CvMY0DA95kRxvRFusHc4mlJIjFtjQtrYEhV/U8UZh3447EkGs+NNEm2Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIfwSMC3;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39D1606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F39D1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIfwSMC3
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c51a14bd405so265375766b.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685493; x=1796290293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lJsCQlmSYKnZqPo3KXfCYUm3hUgy3XldOvtmxhX/5U=;
        b=VIfwSMC31iCD8cVk+5pe7vnxLPjwT7enoDD0DE3wz0BW9qa6ipqhROzFP8phVAEesY
         qSLUhJciKHtailWOGsez0xlJfJe2KC5YUxP3rBgDOSy5oZj+GUNYCoiFlIOQBTO0HzWe
         LjK68XZwjQRjJjB8fUte0EVj+nNgradCSuVnxgmRaJqL+FPvApL3/cqUQA78Vc8rvGOa
         idYaojdEVbgSPeMAyOR+da+T+lcT7cFEWqgpQqCyZL2F1CublEBnIzgZqYjElWu7IbV8
         fn1mH2Hst5PhMq22LF4s3gMQeUuo7SfpWsgr3e88OEIarA8762obyYCKvcNWQuC40RcU
         DX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685493; x=1796290293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8lJsCQlmSYKnZqPo3KXfCYUm3hUgy3XldOvtmxhX/5U=;
        b=JObTTfTXkqsKzOUBh4Hz04BGTsep7AqSHw3v/cQNwezQor/W2eDPxS0stnO9Ft8KXS
         fS5uWZGw3nmk1IdI/YUod5LRpLmjaBRe3jOqi67MZ0HPG/7l6cji0SrIvTQHnW/0kFFP
         dp8+F69+xDaRAz6Pfr0ySEfzvS3BFspDlRl52WT81xcIW/f3fCY4DAdU4R8e4WAJsziq
         OJ6E+CzKFiJTXbMDLK+Xh1lkgWkk5k0NQ87NDUeEGB4O6qFttMs3WHuldElmfRel2fRT
         LilWCBGk5pa3JZtdjpVamQ2nWcU5hG8IKHGJbZOGjW2b64ZVldsdlDpo6wjqJlw2mc9q
         n8dQ==
X-Forwarded-Encrypted: i=1; AL+hErGwLnmKrVWrvwnStffa4FvYCshussZyl6gqkElpfZsUo128/iPARA+0PNPBWcUiR5eRPjo9Ll1RnGttFcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bi/CoIsXy3G2/LXD1cOvbt12shwzUNtk1guqkd0mZdhKwKOqY
	9hvQvhDXzpG0ylV6hy2OoaDySJheyPxRvRd1Zf0P/Dx3fRlkFjUPk6Xg
X-Gm-Gg: AZFdTZfN4kN/KSH+VFEu830ltT0rLbKIA8url6U+MZg/xqkPmoGZGpoCNmkKNq/8lfa
	7RaV66lP2kk7tMHtLB2XtK0gA1zQwxn/8TcPPPxYhzzu+pyROR6iecKaBrPOeimUqKLcubKhrA3
	ohKl/s0rBZgu6boApviR9wTybQNbq0yLXBNwx+QgRwXWd1fx19Wk6HInJRTcObytFVlkfaKHeud
	ks7r60lKcA8dXYgVTPqc9x2pLmq8q7u1c/pFdpgtT4p2c+fMSgHg/mAoqEYYW1Me6PKLOvpWLkO
	1Qw9jH8rnMVRXzpvNLgvY2O/CxQwwh9COn84NBGJVerRBQi0EsiPkuJrv5Pb8rEvDKtcpukvFOe
	BmJ5X0r3jdVmpfyOyF+jlhTQFWePYOj/hrw/YOzzK5gGXBhXGmpO7cRt0sZ3kn2P1DgywZxYAmM
	Mi0iyXN7eaWCkROJL742ufE9t6fbNYR/81T9RK6M83WdD0HdGZHFmEMpB0QYk9sRaQuPbl8SzUv
	Z/qiXZe4fHfbbP6sN6GKo5+sCG619Gh3KPe+5nAzSgSVxb9gI8dG+ML7mZ0BLfkwJarZl9NxB/m
	3/1QeMu5/+43R494nAPXgXhpqKArSd3/XRn04T8MmYNY4YLxn+ACDoZOYE4GrB0b2ye8OAg=
X-Received: by 2002:a17:907:960f:b0:c31:e9b7:f10b with SMTP id a640c23a62f3a-c513ab4fb53mr1665093166b.42.1795685493247;
        Thu, 26 Nov 2026 01:31:33 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:32 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 14/18] sparc32,leon: describe legacy AMBA I2C controllers
Date: Thu, 26 Nov 2026 10:30:19 +0100
Message-ID: <20261126093106.1345825-15-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126093106.1345825-1-linmag7@gmail.com>
References: <20261126093106.1345825-1-linmag7@gmail.com>
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

Describe I2CMST controllers discovered from legacy GRLIB plug-and-play
with the compatible string, register spacing and input clock required
by i2c-ocores. Do not infer attached peripherals from the ASIC system ID;
RTC instantiation needs reliable board-specific information.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/leon_legacy.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/sparc/kernel/leon_legacy.c b/arch/sparc/kernel/leon_legacy.c
index a9364708e231..fa978620f4a6 100644
--- a/arch/sparc/kernel/leon_legacy.c
+++ b/arch/sparc/kernel/leon_legacy.c
@@ -201,6 +201,18 @@ static bool __init legacy_clocks(int cpu_bus)
 	return true;
 }
 
+static void __init legacy_i2c(struct device_node *np, u32 freq)
+{
+	legacy_property(np, "compatible", "aeroflexgaisler,i2cmst",
+			sizeof("aeroflexgaisler,i2cmst"));
+	legacy_u32(np, "reg-shift", 2);
+	legacy_u32(np, "reg-io-width", 4);
+	legacy_u32(np, "opencores,ip-clock-frequency", freq);
+	legacy_u32(np, "clock-frequency", 100000);
+	legacy_u32(np, "#address-cells", 1);
+	legacy_u32(np, "#size-cells", 0);
+}
+
 static void __init legacy_device(struct device_node *bus, u32 id, u32 freq,
 				 __be32 *regs, unsigned int count)
 {
@@ -235,6 +247,8 @@ static void __init legacy_device(struct device_node *bus, u32 id, u32 freq,
 	legacy_u32(np, "version", (id >> 5) & 0x1f);
 	if (irq)
 		legacy_u32(np, "interrupts", irq);
+	if (legacy_is(id, GAISLER_I2CMST))
+		legacy_i2c(np, freq);
 	pr_info("LEON PnP: %s at %08x irq %u clock %u\n", name,
 		be32_to_cpu(regs[0]), irq, freq);
 }
-- 
2.43.0

