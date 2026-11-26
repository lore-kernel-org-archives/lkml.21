Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685499;
	b=PNAVDorZqfNuVBxqUC2BmTr6cgvsjTwRzRJIRLTDEh76SeOIalW4zH7COhkOOlYINldV
	 IT3FL2r8GI8wbiGApME0EyN+9VQp2u0WQ++v3HSQR5Hueaam5xpCcrt9F1qmxYilyh4YV
	 B4gOoYoCx70yF6MOPOclD69Y4+t+N8hkMnBcx88tllOkzU6UbfDSNEB/nEZm8cDtGi5s0
	 Qrw0e6pQpSkXsCuaP/qYPsSM73cIEFh+2IfbcfL0eysnNySWIuZDiPq0Us8ZocD6oBOmF
	 XLM29Dzx78yy/NA0lGQ/nf0VM3TZLHI0plXA6ReJlGGIxH55nAYZ+UXhAKyMhWd0cAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F3ixIBgx9rfehOEgpBv2CsrhUoWjHeLEcEcFRQMVILI=;
	b=bM1D3Yxkk9PMts326jYsnYWBTLoqno0KS2ZH/2h5iutqBC2J57q+KfxS0WuXzBIu/BjX
	 Th/BUWol6KbWC8fHqSemNy189mq+pOuKCk0oukZfQVvxG0EbeN17zO4q8NPeG4aOnG869
	 Fb/9q9swOLW5wk3rUxNuHfaJuQLT5MxJc8o1oJ3FPyzoCId9tqjPFr47VdbaMkwk7kcmA
	 aRJlVXjCyFY14xaP/PCjB8HWMPgLK6wgwW9cqiwy5PWiSTi7MSI5HYVMflGeNosGZ9UEq
	 K5Z3Bit/3AqWjoGkuHbpnDOr911aBpOUOg/bQdhfMbvZ1A4tjHtbOCsxKPClJ4l7aYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B98SFmwO;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0022606A69D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0022606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B98SFmwO
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c516a1623d0so728927266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685497; x=1796290297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3ixIBgx9rfehOEgpBv2CsrhUoWjHeLEcEcFRQMVILI=;
        b=B98SFmwOIyA4BOS4ZRIEXdzWqEHyXDOKNvGSbDbsoQq3izuTk+qgeAru/okUSiTO09
         q+IVKUdmwC6xuEnEY2FlW0zF1NrCCttQvBqXOnrw1NS8w2IdACsuyAEOawWxfIkYl/fj
         0Bmumb8i1pu9ujJe2J2o5pKItyIHn7rWj8tcdvE02qyaHmLaDT7lloNXvANs1xTwuzY5
         5fSRrpk6yC/SXLZnwRYY2/6fbhKMv1Q+oafucmXEyCuCo73fCRzNNdoaDvpNf664xfwh
         lNvO3AIVFU/NREGuB2E4Cz9/sYjFBIUvkowu1ur4qDNMjUwWj/VKVru6UcW0A1yvfjVL
         sttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685497; x=1796290297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3ixIBgx9rfehOEgpBv2CsrhUoWjHeLEcEcFRQMVILI=;
        b=MqZqhMppjNCFyvfsHpZ8WByiaZm453bsbSnBCwtNG3IOmoc9Nr1dvQSkKCSttEodBu
         0Xg4I8wCw0b+8bqQi3EtND9LiTGJJHv9p295bzkxhrWQX3TbWdeil/zKTH6QLoGiPzfE
         CZ5NhxOQQ99VK+x2bckzdMpDysyG4MKvvmr6fBkwnNl1LcggOXp0K70WJjMVpkKqeXyP
         GuDR+cH0YbCcw/xKqli9k3stV9x1xz3TAhLZqji+XC0mBbf2M5WuSYewyq0joMnuHIRk
         Sj7s5d7fUhTBp0JO6q4cYU2Z55zpfzjydpEqC33Bb4eCB1ZojxsceJ3cKMQSCSfwPbIN
         KOXg==
X-Forwarded-Encrypted: i=1; AL+hErEUSWfBMU6qcIxId2nIMUHpg4sTUXtZfNIIKiedl9fMSSJ3z5JnjfovfGJyPCCzuggiezyo0ZXtHxwL/pY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QwpNTzS4Ci0UxJrO4nuyjXlCVb6W937lD28q45nsl6M9uI4+5
	UW/BM52jro4gYMcTVNTscK6mShZpYIb57ltB9Y1bzp3G4Oluo9SE+x10
X-Gm-Gg: AZFdTZedI301aWKI3wvDcdtx1nUBaB16DeTMp1lqHcirRvSp9jeP9mTVKsrWAnb7x6k
	X7s6b+bss1aAba4e2hb3yIx65XaEgg2VlbDUgVUKdUEZ3ecD+ZqcFP1yfwKG9Af57oNvFTel9o0
	FHuzmIJfd7/KvQexGuMgNZldoazF8k9uQNSrA1/6RVWEDoONFk99mwP/5Uz4TiwkKCWeRNuL0PV
	7c24a6IP+R0Fhl9kUmVTsz+C0vSzpcKPgtzV4+mZLgHm48r2F0+2LRlGO5BgvGhyHJNgnaKS6dp
	Cdv/SyciTA2qpBT4GclblNyezCnf17dhV5PN5xfPEqmhTFAuCPgCYgNeHQBA562DGAI1p6iyLz8
	CLw1Cxb1uaUHkjhRtvHch6cyektq2aSVVXR22zxpJELtSmH5V23bZp7FCk1gyd/ydb2pr6wPtS4
	2zXgB+vLeq7hXpzqItTHKIWab+QiZDRWgOwmoru2hdQXEyogzIM+yMfyzObbn6kQwRlDgg8HBgI
	jbeAa8JvQcHvuHk7glpaii8QwP9HwyjCFryrU3PsFkr1oqUj6pyiYONrcGjBjPnD3PBycPaVw0U
	DkOkaD/WAOG+NK1kjhTT8v7rX7ENW02/DJ+JzjUFLhZAzLkfGg4zxg/SL/eB0Ex6QjXEsWg=
X-Received: by 2002:a17:906:9c03:b0:c46:2987:2169 with SMTP id a640c23a62f3a-c513a84c864mr1341631066b.24.1795685497216;
        Thu, 26 Nov 2026 01:31:37 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:36 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 18/18] sparc32,leon: describe the DS1672 on the GR-LEON4-ITX
Date: Thu, 26 Nov 2026 10:30:23 +0100
Message-ID: <20261126093106.1345825-19-linmag7@gmail.com>
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

The factory PROM omits the RTC on I2CM0. Add an rtc@68 child to the
controller at 0xc0000700 when the legacy ITX check matches, so the
DS1672 driver can register the hardware clock at boot.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/leon_legacy.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/leon_legacy.c b/arch/sparc/kernel/leon_legacy.c
index d4b3c48a4a10..f9fb35c3bb06 100644
--- a/arch/sparc/kernel/leon_legacy.c
+++ b/arch/sparc/kernel/leon_legacy.c
@@ -32,6 +32,7 @@
 #define ITX_DDR_END		0x50000000
 #define ITX_DDR2CFG1		0xffe00100
 #define ITX_GRVGA		0xc0800000
+#define ITX_I2CM0		0xc0000700
 
 struct legacy_bus {
 	u32 area;
@@ -262,8 +263,10 @@ static bool __init legacy_clocks(int cpu_bus)
 	return true;
 }
 
-static void __init legacy_i2c(struct device_node *np, u32 freq)
+static void __init legacy_i2c(struct device_node *np, u32 freq, u32 addr)
 {
+	struct device_node *rtc;
+
 	legacy_property(np, "compatible", "aeroflexgaisler,i2cmst",
 			sizeof("aeroflexgaisler,i2cmst"));
 	legacy_u32(np, "reg-shift", 2);
@@ -272,6 +275,14 @@ static void __init legacy_i2c(struct device_node *np, u32 freq)
 	legacy_u32(np, "clock-frequency", 100000);
 	legacy_u32(np, "#address-cells", 1);
 	legacy_u32(np, "#size-cells", 0);
+
+	/* The GR-LEON4-ITX wires its DS1672 to I2CM0 (board manual, 2.14). */
+	if (leon_legacy_is_itx() && addr == ITX_I2CM0) {
+		rtc = legacy_node(np, "rtc", "rtc@68");
+		legacy_property(rtc, "compatible", "dallas,ds1672",
+				sizeof("dallas,ds1672"));
+		legacy_u32(rtc, "reg", 0x68);
+	}
 }
 
 static void __init legacy_device(struct device_node *bus, u32 id, u32 freq,
@@ -309,7 +320,7 @@ static void __init legacy_device(struct device_node *bus, u32 id, u32 freq,
 	if (irq)
 		legacy_u32(np, "interrupts", irq);
 	if (legacy_is(id, GAISLER_I2CMST))
-		legacy_i2c(np, freq);
+		legacy_i2c(np, freq, addr);
 	pr_info("LEON PnP: %s at %08x irq %u clock %u\n", name,
 		be32_to_cpu(regs[0]), irq, freq);
 }
-- 
2.43.0

