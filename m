Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684047;
	b=U2XfMivr+WU+v4iELkeos8niQKjxNxIvd9AZVrbOnQ2qKu3RKWE7JhNv0bw6x1++hbEA
	 vg2WFejW3RX9QqSKNb2HtoBA45qMEc4JxsEUhSlQt9T5GFugm0vC1gJe96wizy5yApSkp
	 HhSGHq2gLxpFHLSuZzYpFMAQ11MpsQv8RnDBTYE652uHsSx/DpT+SZliT1oAlR2lU91Ih
	 j1E2651/h9v2LoHelHPy9RvG29/1j95Q1LhERM6HVZg5TPNJfob98g+q51dmH8azmSZ4X
	 LcH6jSTYbXrM5GVTTCYzl3Qe29JGoVoFZ9cRji3bMKXPNXMBnpMMJYG/nWiSAaOYfsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zePae+AgwsxBTIqUJW1YaRElDL4kYS7QZ0ec/q5slnw=;
	b=gCUqOZdUC9xLGaZukvlY9siWrSB+8p7HGogtEvIyAInzSXuu/y1oFb1UW24fZIt2PcYX
	 FsEHN2ql6r6LO8rX+4BWJOxWjzvb+FfXeQS/O82MsrEk2W313j/6lPt6fA4air9sa3uhN
	 iGgSx22/f7bMXsSVpryA9moLLC+ruTaZBiU+4XLQb7TF8lQL/plBxbHESB1JfdsLEwigx
	 Rc0bCfKAO2Mg85ha6XjFUgVnN2WBKVegjcg88C2E9XVyJwz7i+KLJB6RiccqYHGfssqf2
	 PmHrCsZUYoacpHs7ZuOlFMCjLw/BHQdo4lUBNQwPnuF+le7YZu7Vy0FcSoG10aD5P5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=hHv8mFAz;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C561C606A6A1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C561C606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=hHv8mFAz
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b563e32936so2653547c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684046; x=1796288846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zePae+AgwsxBTIqUJW1YaRElDL4kYS7QZ0ec/q5slnw=;
        b=hHv8mFAzvJzoEeNvXlYjWXgKGgYVtMVe6lz4ToGV3M23A0dGYbOcMoOq2FlEY1Afma
         aRbtxgPQ2yFl/IgVHp0xa8WbU6iqzdeCXMcn046JHmVg6RQCRzb+hitIM1yf+pmk8ptd
         qwm3VaH6LaS8t5/FRD1JkmwLGAcPJfl21gTVMGonL4PN5kXHfmbhWNbuEDaZO63eyZou
         BudppUrg5MkNe5G9OWrc13IR6vVRcrmeuD2TNUZvBi1cM6iBigibF0sdhM3CSXndh7gn
         KsTblrHEc71h3xjG5xX5BkQVqTiSaSqYEvJ7yQBChlDqE3T7Xk1s7Uc4vxKOY3UtzJ3j
         WUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684046; x=1796288846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zePae+AgwsxBTIqUJW1YaRElDL4kYS7QZ0ec/q5slnw=;
        b=AoY6BhuIygDgRlaFBMFQlHuT3dywOHilZy3CfrGm0hm7c8Rp5heAyAoF5bRNgaAnQO
         qUXnUIrGaI+PdNC2Skqs2CpOOQZaVjqL+9uRMc+LOzi+31kIWm5tvB+dPlmHrxF46mMZ
         bN+MZHOAGHQMwd3hJJ9ly81vq5Ueja65HzQUqE2t/ZJEvSBg3e8ipPj5g5smX+yi3r1y
         Yjbo9bri4LCHdEWnFI4HpJ0VVNgENdTGIO1PGrDZXAlim8R7rSdJo7r1CSyAC0hRMNS4
         TpFY/TLr0noMvTV2mwAeMQRQm7dUBWjCGEha/SRzr6oejkm9gh3QV0yDo1Ac75SlHG8w
         xT6A==
X-Forwarded-Encrypted: i=1; AL+hErG4Mq+GtHjG/DLkoLo8GPVqY8bCUWmqZh4FhyuvN4XKvg4kK/w4kDnqafPFh5Zp9o44astfgdoO0YYIA2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ttCKu5jIwbioqqHSnp5z5Z4yZnwltNu3w7HmsPRjLI+3HqU/v
	3KrmMv7w8MyYT16qrVTGnn+xzVJd3DdbMTENhgn3P1Y2pHt2Bo/pla0t/I05W1MUMfI=
X-Gm-Gg: AZFdTZeD3elGqvrQFXBEi1LvHf7w7jRroD7hKoBldBI41G4yQc0jOXtwi86qyGS4gin
	jgvStLQrbted6xztDq9hWjMmaC2vW13bbLsEa9OILKzk0pNufH1eKFBvSBemQyRKxio/lxO/x+t
	L3Ct6X0Eo18aDo1k4Minx2rHY7QIxf6YT92qLkJ2ZA7im65UJe0wBUVydORgYC+T0yw86uRu+0V
	+I7IE073NF8YyuKEo9/UEGkyOTsxYPLYKfcx1LlEPIumOl73X1MhcCru5I+PAXi3jtX+M0xQsFq
	j0ebBzKDQVD+ITWDGJRPeHooJlqITQXZ3EbhQYiITu1bxRnEVkMUnweRPaq8WZF3Ey9zWPS0qy8
	HbNiyLlAaiwozXC4Pg2+xqm/3zyLOnFlu8wYvw2uJA7rtTPvy59gVbVSOpPc0oItwKMTDp0W1qE
	aR9RpAeopXpdQywWMdB9dmv2wPWv97QP12logUq5q9+dIcrKA+G5AX5/V7RcQkytWyHc0C6qhhL
	SfknUddCwvuFBwrAlc7ST3Ko53S23TDRNCKBGUeekyNS0/Nr6ofsGG5usRO55dJGjv4dtKqQK0h
	10xwrrAnnPPS1in+fd2z5n12SJImWk0C4QMWW+l3c4ot
X-Received: by 2002:a05:7022:b0c8:b0:1b3:a22e:b74d with SMTP id a92af1059eb24-1b5569225afmr18971488c88.34.1795684045709;
        Thu, 26 Nov 2026 01:07:25 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:25 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:10 -0800
Subject: [PATCH 04/10] gtrace: rvtrace: Add pre-ratified encoder support
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
Message-Id: <20261126-send-preratified-trace-v1-4-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0

From: Eric Lin <eric.lin@sifive.com>

Add pre-ratified version support to the encoder driver. This allows
pre-ratified trace hardware to leverage the gtrace driver framework.

The pre-ratified encoder has a different register layout for the
source ID: the SRC field width (nSrcBits) and value are preset by
hardware in teImpl, while offset 0x8 is the read-only teImplExtra
register rather than trTeInstFeatures. Add rvtrace_comp_is_v0() and,
for pre-ratified encoders, derive srcbits from teImpl and skip
programming the trTeInstFeatures source ID fields.

Another difference is the encoding of the trTeInstMode field,
so set the corresponding "Optimized intruction trace" for
the pre-ratified encoder.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 42 +++++++++++++++++++++++++-----
 drivers/hwtracing/gtrace/rvtrace-v0.h      |  4 +++
 drivers/hwtracing/gtrace/rvtrace.h         |  6 +++++
 3 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
index 1f06b1a2b412..0a23c78c0caf 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -11,6 +11,9 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include "rvtrace.h"
+#include "rvtrace-v0.h"
+
+#define RVTRACE_V0_COMPONENT_CTRL_INSTMODE_OPIT	0x7
 
 #define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	0x7
@@ -95,6 +98,23 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	if (!priv)
 		return -ENOMEM;
 
+	if (rvtrace_comp_is_v0(comp)) {
+		/*
+		 * Pre-ratified encoders have the SRC field width and value preset
+		 * by hardware in teImpl. Offset 0x8 is the read-only teImplExtra
+		 * register rather than trTeInstFeatures, so don't program it.
+		 */
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+		priv->srcbits = (val >> RVTRACE_V0_IMPL_NSRCBITS_SHIFT) &
+				RVTRACE_V0_IMPL_NSRCBITS_MASK;
+		if (priv->srcbits) {
+			val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+			val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+			gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+		}
+		goto out;
+	}
+
 	ret = rvtrace_encoder_set_format(pdata);
 	if (ret) {
 		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
@@ -123,6 +143,7 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 			priv->srcbits = srcbits;
 		}
 	}
+out:
 	if (!priv->srcbits) {
 		dev_warn(&comp->dev, "cpu %d trace will not carry source id\n",
 			 pdata->bound_cpu);
@@ -141,13 +162,15 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 	int ret;
 	u32 val;
 
-	if (priv->srcbits)
-		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
+	if (!rvtrace_comp_is_v0(comp)) {
+		if (priv->srcbits)
+			rvtrace_encoder_set_srcid(pdata, priv->srcbits);
 
-	ret = rvtrace_encoder_set_format(pdata);
-	if (ret) {
-		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
-		return ret;
+		ret = rvtrace_encoder_set_format(pdata);
+		if (ret) {
+			dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
+			return ret;
+		}
 	}
 
 	ret = gtrace_enable_component(comp);
@@ -159,7 +182,10 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 	/* set mode */
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
 	val &= ~(RVTRACE_COMPONENT_CTRL_INSTMODE_MASK << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
-	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	if (!rvtrace_comp_is_v0(comp))
+		val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	else
+		val |= (RVTRACE_V0_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
 	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
@@ -204,6 +230,8 @@ static int rvtrace_encoder_stop(struct gtrace_component *comp)
 static const struct gtrace_component_id rvtrace_encoder_ids[] = {
 	{ .type = GTRACE_RVTRACE_ENCODER,
 	  .version = rvtrace_component_mkversion(1, 0), },
+	{ .type = GTRACE_RVTRACE_ENCODER,
+	  .version = rvtrace_component_mkversion(0, 0), },
 	{},
 };
 
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.h b/drivers/hwtracing/gtrace/rvtrace-v0.h
index 0681405fa414..5abdc4788f64 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.h
@@ -24,6 +24,10 @@
 #define RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT)
 #define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT)
 
+/* Number of SRC bits preset by hardware in the Nexus messages */
+#define RVTRACE_V0_IMPL_NSRCBITS_SHIFT		24
+#define RVTRACE_V0_IMPL_NSRCBITS_MASK		0xf
+
 struct rvtrace_v0_comp_features {
 	bool has_sram_sink;
 	bool has_atb_sink;
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index b0cf2e1d875f..308de9fe39ae 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -72,6 +72,12 @@ enum rvtrace_component_impid {
 #define rvtrace_component_mkversion(__major, __minor)	\
 	((((__major) & 0xffff) << 16) | ((__minor) & 0xffff))
 
+/* Pre-ratified (version 0.x) components are identified by major version 0 */
+static inline bool rvtrace_comp_is_v0(struct gtrace_component *comp)
+{
+	return rvtrace_component_version_major(comp->id.version) == 0;
+}
+
 /* Map a RISC-V hardware component type to the global gtrace type */
 static inline int rvtrace_type_to_gtrace(enum rvtrace_component_type type)
 {

-- 
2.43.7

