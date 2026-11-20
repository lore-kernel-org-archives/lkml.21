Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185727;
	b=L8f20mzmibCbBvZDRc52413L1+sHDwRhGe7IUroU14kwV5KTHXIlon+fIFVrRSlWQXGK
	 WY3y+mQTZo7GjbzgxTJYe392uhcgg7tJt5nqa7HpY7Ve0TVo9ZXPee9oyJP1coX5/i3Uc
	 WdSNuTcqOrMC/4GaknStQc7DSRKYM/9D3RH+AHOJe6j/mFsNgUoWyF5H2Js7ZfgzRZ1h+
	 D9B6HI0aB/pPQwbAE/r6JCIV1ijfOJoLNVZD44zLL313naGQgMU6GQVjuz9d02KNujwnG
	 sT0gYmvgDTa4ZFZpOmDHuaY34AI9FO6DGScpcUq/ZpTOzj6MtKgo0asrVSu6IJKHS1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
	b=pCvNqEwo2LA/tOKY+EM4azB0GwZFm2iGcYaFwdWA8/NoPq9FTwiu5KTzmvTvgm/AksMD
	 +tAqtLbkFpVPG2M1YFD3gSny8d4mCRaThS2UgZ6cGV/VeHJyhayFLf6ViJruvLpaXzZxu
	 PTyVmuHcdwKYnUoN7vv7e/c/4GMrpKw9SkwcYaJnw8NUMqs2R4VMBu72w0SweRPK9vkmY
	 SgB+Uab9encL6t+iI2YEKV1vA1AlMcIeAonW/e5k28CFS10eLVdF5/6RlYDGuQpdLEFHB
	 QyC3ocNhcWi8e+SBO41kc5KFdK1OA47FeIvP3R9r/Lx63md/aEj4yqVGmgADtEXB9jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m6cWhX/h";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97962606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97962606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6cWhX/h
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f04ad2c46dso3005675ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185727; x=1795790527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
        b=m6cWhX/h+b4vXn0BU65hYZ1zM6hIfx5Tbnm5Bv4U+zXZBnmCehNRvh8U2QNaXaJb2Q
         d0SAx0/VgeAnBdoq9aEBjAtKdSnOBiojRWOuacpCsyfzGqZdJX62SewIO6wagtcGd0dv
         X9MoGqeP5bKHbNozjErqxadLUf7+Ofe6EuwDLa9smiVJ4GeF+Uu8A3alGBCYD/OqrpZl
         JAyQHeRCXYOaFZwN8sBeQaAEeAQeokl4WreSuGNsd+OsMSnQXyBWruAWOunomuXNFD4H
         RGVy6leVWqPX1tRaQV6vHwT1NIoaZC3UsaaXEoEZP/tf1UWWiveMaCxRChwgp2Bdcec1
         i/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185727; x=1795790527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
        b=l6T8KWkVZXwLdm4A5PC0KxpYtLGqE6qR+ClQTmQU+fe652QRCVvcJvrKsIkG5/nad0
         Wk6Wi2KZuFC9Ho2rLdv+Ihgp9Xx/g7946ABoLXX/dgn5lwTeW9Vz7whhudA/Fk2DG4eL
         pCbJ46p4L9b2VCa3cNBYI0A8RIVvZ0mj3buzP0LcG+RZrYwgxd7apMNffZnoJRz5Trq2
         XqCq038bSJ41OJ+qFYOdPtAolGmcAMZgL2J5WytG/XQXgSQbrwD0UN1Tk0EvgY9NjN+w
         237A1omjbqjkW9urCR+FhXzqpaxyvFaGQklv5AgOVjy3m/y/LubTeLnidNBdv5k1x0yJ
         z3Bw==
X-Forwarded-Encrypted: i=1; AL+hErGzpFPLEc9r553Pbprn0lPy+H7DNpz1ZDOnFQUn+lWPaHtnzIONOlwQqWA9GXkTIl/W14YIeugTivi8G04=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jilUJBQG9HFU540n8BPTdAcPCO+ZYIh9LBABzY1ZHiGMAXI2/
	A5NtcSL7Wl+wpSnLsYy8gDuYq2RdatbCTJXUmXqi0CC0d1A5NxT0YrgI
X-Gm-Gg: AZFdTZdL2v4D8YeCC4/6V/YRhk1N3zKWvYTbJRUhTbqHuXYEfzRquAfSgvdaj9cpkEz
	7igNiX97sl4j+x/qvf1rBgE/GiVQGADwcLhFViLPI7YvDV4JItz4z49jZeQM3dDyOPvEEhZ4wP7
	BZp5F93VvKn9rCz1iK/uLSHHn2LR+wk9NvmKeqteuC9gVKnQnu9Sz1qLuFZEvKSFr5fAYkLLbig
	VkTfCWIrVdaM541ghU0W7Z6Jpmtcm7S2G90WXO5N9w0i0KhufOZRyGxqCzd1odIaq9y9JxKj2wJ
	bnsTCqlvmflys1I1HnluZ5rfODjRrIg1+wbOIFh+P0RNIgtvhmNpd0uZIN9WBc+xItaNfFMmNMY
	SVBebqOqKwb7lP/grCD5iFO9d5YwL1TBM78lnSDlGTfvvgWhpZycsKQHzcCut0G2rlrt7tteUmv
	BRm6LxMwVkwjKnqDSvP38j9UfO2WBjWHJ0wlDAb68uSoAYaRBE/xG98XJdKnRwShf3As5sh8VJ3
	x0ZQ6X0o5SP3DnNUFKw9y7MFJAPECTyMCtv+NuqOqdUx0ehdD+ogcztSMdBTsQuFBIp0pQEpb/S
	VOZAN7yj22E6Sq0HWqU8nTzqImYMmUU0FuqEhw==
X-Received: by 2002:a17:902:eccf:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2f03f17c766mr37267005ad.19.1795185726811;
        Fri, 20 Nov 2026 06:42:06 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:06 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:44 +0800
Subject: [PATCH v2 1/3] clk: mediatek: mt7629: move clock counts out of DT
 bindings
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
Message-Id: <20261120-b4-mt7629-rtc-v2-1-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

The clock counts used by clk-mt7629.c size the clock provider arrays.
They are driver implementation details rather than clock IDs used by
device tree consumers.

Move CLK_TOP_NR_CLK, CLK_INFRA_NR_CLK, CLK_PERI_NR_CLK and
CLK_APMIXED_NR_CLK into the driver. Keep their values and all clock IDs
unchanged.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c      | 5 +++++
 include/dt-bindings/clock/mt7629-clk.h | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8b..517c43b19f18 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -17,6 +17,11 @@
 
 #include <dt-bindings/clock/mt7629-clk.h>
 
+#define CLK_TOP_NR_CLK		108
+#define CLK_INFRA_NR_CLK		6
+#define CLK_PERI_NR_CLK		22
+#define CLK_APMIXED_NR_CLK		7
+
 #define MT7629_PLL_FMAX		(2500UL * MHZ)
 #define CON0_MT7629_RST_BAR	BIT(24)
 
diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index ad8e6d7f0154..cff9a02e8302 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,7 +115,6 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
-#define CLK_TOP_NR_CLK			108
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0
@@ -124,7 +123,6 @@
 #define CLK_INFRA_DEVAPC_PD		3
 #define CLK_INFRA_APXGPT_PD		4
 #define CLK_INFRA_SEJ_PD		5
-#define CLK_INFRA_NR_CLK		6
 
 /* PERICFG */
 #define CLK_PERIBUS_SEL			0
@@ -149,7 +147,6 @@
 #define CLK_PERI_NFI_PD			19
 #define CLK_PERI_NFIECC_PD		20
 #define CLK_PERI_FLASH_PD		21
-#define CLK_PERI_NR_CLK			22
 
 /* APMIXEDSYS */
 #define CLK_APMIXED_ARMPLL		0
@@ -159,7 +156,6 @@
 #define CLK_APMIXED_ETH2PLL		4
 #define CLK_APMIXED_SGMIPLL		5
 #define CLK_APMIXED_MAIN_CORE_EN	6
-#define CLK_APMIXED_NR_CLK		7
 
 /* SSUSBSYS */
 #define CLK_SSUSB_U2_PHY_1P_EN		0

-- 
2.56.1

