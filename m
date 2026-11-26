Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684045;
	b=nXe0p/mJh3Vw0b/S29MbXLwoA97Oh5jLBUg2NoEBKhdp6qpE64ZjfEgwNidTVa0EGg3r
	 sgYdBiGjYNpmFHZmGdJWxPmNLZ0KM5AW7BNelCu7+tk0k8FEw1mKUcaNiugatEobwhui1
	 C/FWv0A3HF+qomm2GPXrd0+ClVtlvQXn42PP0lccxG4Y92hK9S0rm0baX2lwx6+N9qLQv
	 qWaloZ+fTSHl6q5jecECrVwhqYtn/96DTdA6NElJFt/27GsdsOkXHVNgJOO7Z8DsaLww8
	 mykH1FWgnkiHZ+eBQMEFXjZENcO7HgHpFn+gmiNK7lyJsxOq8V3X4LQ2a1ucC7WDbmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+wwFoy6VZlzpHT5hFUyZG0YVsOzvP2dbjuSfoAkk4lY=;
	b=N1miXpUN6W2hw4c10or0FDijYKZUcf7zGD7ghhYWOWuQz/QbbVL1UIfyB6sWuNOslIIs
	 I6+ABmNUMJms/Vn9HzhdyJMxVKYMv9vz3B328IaqyiRIwkXfG7oF4h/lsxl4F6ewExjua
	 helPb5iAPhi2ij+5An2cwqESYxOLZfjpxABtRJwtOP3ZC9echkXEMPuAOhgjTleb1ELZd
	 pDzBoaGDXgRgpDSKdW39fovYO/iuJ25lHIeQFt4QV5MPFpLAWkDvr2yR+7wbxP2q5OZWx
	 wnVexM+sT6UTEkc3t1XuXwbF0aN+dHZTH0Lc9pey/YGknVP5Wux2PSzWo3qulg3Vz1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=QCkhFJ9w;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0335606A682
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0335606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=QCkhFJ9w
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38644aedba1so10186789eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684044; x=1796288844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wwFoy6VZlzpHT5hFUyZG0YVsOzvP2dbjuSfoAkk4lY=;
        b=QCkhFJ9wgbjSIyDzY3BA+I1f26dlLENHnxAmeBWpgFMzOELGM7MChIn6T0JhA4F0h/
         +lpv0iNXNIc0rXYyc5ggOOny+LhyEPtzjWgIHQdlIbExyuFDWF9OGE7SAySRHP4CmaTS
         QHwyq+QK4z6BnVUG5tx1knqPaCuezgEFaXHQdXBgG+pp45SF406HMINagyZ82o/6RU5j
         1I4WgHje6IOqmiNbPizu7IDnlywUBpncH9R/XRALH33ZxuDGlDZneX3duEV6dIf8Dju5
         GIEggnKW8jA91jMgFp7QDv/TQQIAsHXJYSp4OTJ60fRrWlupyasNQSmPPzf7Xb5lQYay
         RRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684044; x=1796288844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+wwFoy6VZlzpHT5hFUyZG0YVsOzvP2dbjuSfoAkk4lY=;
        b=y7TuWpPIhEm4Acl6pT8kt3AHEcP2fvtd8h2Z830FM4zcRVJ+RXTrQC+t1gDkPqpF4/
         TnPCi438cKmgxICDOLNx3o5aRM/JgfLMZThixlno3W0cNAltGkJpzA6S553BT6bubzu5
         kHjqnact+ILivnHeaEr7Mmho+7pgSGvnU9G0rvhO6aIPiwk+CHb3SxzB/AFGogyMjbYl
         lagyf+lkvT8BCNcO1Ws0mcIA98HHj5XCIfiJ+ts8q2ZXAlqhpgDJHaHCpTs45It8tEl1
         jfcbKPKPA/yb1oWUgQ5xjkAxven4GxiAEDGY+Qwc5FoJuRgJBZGEx4zCARCJQyD68Qnj
         iO9g==
X-Forwarded-Encrypted: i=1; AL+hErFQAJ8Km3frr7+/rry7SgRxf4FPkVa3OZ8hCIdpiuxWdm0g+bRxNczHFLaiGqg4Hr+X1XDJeYqutXoB3bI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OZIy+o4ANZ6McN/T09rZnFSgaSUBPrUEnIZMcBlFDy97FCAdw
	Xw+AW5MuWOBDxxOEgotopuU1/lAVGFy8iWUzrrvS3g0D0AyHjI1XftEbg2rhTNKPEl4=
X-Gm-Gg: AZFdTZdGI9gpsReah45N9TySJLystYTmUj7TRO+xIGghpw7/Zsjo91GTwkZOBqshl9f
	qAXbu62lUqGtRtQRPUcRiRfhJsSuLeJ3s89wsRoXbLEH1LXUS/vU6va2hlz11NArP5vd27C8j62
	m/7mlEDdzvKm1lmfsBZLOJfDQDJRZ9WcYmYw4/XtgZvWh53DsqUalzFUpGFgqJEIMnio0YDxuyc
	qZpk1xakslXmKYoLjR/xhI9JTQRTv8B65z4MUDTBfane1IGgtyCPM7a3NJINZ2XWX671qad5KHT
	JOMSNHdorN+JEYqqpeOF71uLEFnMe+hnWvf+i4ERRq9gyEHFgPtpjBl/WniGlbW01HQzjilhAOg
	3gfUhOfHfWJ2mRj44CatgV7fFHn+KlV88uB4+EQU66K/XnBr5xUNTGxO9meQBVNx4NAkNiw1CpM
	RdJC4mJ6w/TqW/oocl4wDiMggpzSyjoEfSJK30EOjYYZVlpmdwMweANlKtemSxoPp0Sjgj37zAh
	g4WZhObsUp17Of72ZpdHbPq5RheYScmjj7FvYiMAhKx8+JxC58acE4mcErP22x+Gqwwxg+Prhk7
	rhUrMpBCM2ARtDaRvHecmQ0CLUPlzftVobTjVcFAmrVd
X-Received: by 2002:a05:693c:62d3:b0:386:de65:9969 with SMTP id 5a478bee46e88-386de65997cmr1466873eec.35.1795684043729;
        Thu, 26 Nov 2026 01:07:23 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:23 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:08 -0800
Subject: [PATCH 02/10] gtrace: rvtrace: Add pre-ratified implementation
 callback
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
Message-Id: <20261126-send-preratified-trace-v1-2-1e686fd75be7@sifive.com>
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

For pre-ratified trace hardware, the implementation register
bitfields differ from the ratified RISC-V trace specification,
and the component type is not defined in the hardware
implementation register.

To address this, add a get_impl() callback function in the
driver data to translate the pre-ratified trace hardware
implementation register information and encode it into the
standard RISC-V trace implementation register format.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/Kconfig            | 12 ++++++++++
 drivers/hwtracing/gtrace/Makefile           |  4 +++-
 drivers/hwtracing/gtrace/rvtrace-platform.c | 36 ++++++++++++++++++++++++++---
 drivers/hwtracing/gtrace/rvtrace-v0.c       | 34 +++++++++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-v0.h       | 17 ++++++++++++++
 drivers/hwtracing/gtrace/rvtrace.h          | 12 ++++++++++
 6 files changed, 111 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index e5b62d65e2fd..b1f9ca8f73cb 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -57,3 +57,15 @@ config RVTRACE_RAMSINK
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-ramsink.
+
+config RVTRACE_V0
+	bool "RISC-V pre-ratified trace support"
+	depends on RVTRACE
+	select RVTRACE_ENCODER
+	select RVTRACE_RAMSINK
+	default y
+	help
+	  This provides support for pre-ratified (version 0.x) RISC-V trace
+	  hardware, such as the SiFive trace encoder and trace funnel, whose
+	  register layout differs from the RISC-V Trace Control Interface
+	  specification.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 33274a1ed0b8..0a2e2d1732c2 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -4,6 +4,8 @@ obj-$(CONFIG_GTRACE) += gtrace.o
 gtrace-y := gtrace-core.o gtrace-perf.o
 gtrace-$(CONFIG_OF) += gtrace-of.o
 
-obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
+obj-$(CONFIG_RVTRACE) += rvtrace.o
+rvtrace-y := rvtrace-platform.o
+rvtrace-$(CONFIG_RVTRACE_V0) += rvtrace-v0.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index a5655e983e51..8c1503bd8d98 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -11,6 +11,7 @@
 #include <linux/property.h>
 #include <linux/types.h>
 #include "rvtrace.h"
+#include "rvtrace-v0.h"
 
 static int rvtrace_hw_enable(struct gtrace_platform_data *pdata)
 {
@@ -62,6 +63,7 @@ const struct gtrace_hw_ops rvtrace_hw_ops = {
 
 static int rvtrace_platform_probe(struct platform_device *pdev)
 {
+	const struct rvtrace_match_data *match_data;
 	struct gtrace_platform_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct gtrace_component_id id;
@@ -72,13 +74,17 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	int gtype;
 	int ret;
 
+	match_data = device_get_match_data(dev);
+	if (!match_data)
+		return -ENODEV;
+
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
 	pdata->dev = dev;
 	pdata->impid = RVTRACE_COMPONENT_IMPID_UNKNOWN;
 	pdata->hw_ops = &rvtrace_hw_ops;
-	pdata->format = (uintptr_t)device_get_match_data(dev);
+	pdata->format = match_data->format;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
@@ -115,7 +121,11 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to reset component\n");
 
-	impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	if (match_data->get_impl)
+		impl = match_data->get_impl(pdata);
+	else
+		impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+
 	type = (impl >> RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) &
 		RVTRACE_COMPONENT_IMPL_TYPE_MASK;
 	major = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
@@ -154,8 +164,28 @@ static void rvtrace_platform_remove(struct platform_device *pdev)
 	gtrace_unregister_component(comp);
 }
 
+static const struct rvtrace_match_data rvtrace_std_data = {
+	.format = GTRACE_FORMAT_ETRACE,
+};
+
+#ifdef CONFIG_RVTRACE_V0
+static const struct rvtrace_match_data rvtrace_v0_encoder_data = {
+	.format = GTRACE_FORMAT_NTRACE,
+	.get_impl = rvtrace_v0_get_encoder_impl,
+};
+
+static const struct rvtrace_match_data rvtrace_v0_funnel_data = {
+	.format = GTRACE_FORMAT_NTRACE,
+	.get_impl = rvtrace_v0_get_funnel_impl,
+};
+#endif
+
 static const struct of_device_id rvtrace_platform_match[] = {
-	{ .compatible = "riscv,trace-component", .data = (void *)GTRACE_FORMAT_ETRACE },
+	{ .compatible = "riscv,trace-component", .data = &rvtrace_std_data },
+#ifdef CONFIG_RVTRACE_V0
+	{ .compatible = "sifive,trace-encoder0", .data = &rvtrace_v0_encoder_data },
+	{ .compatible = "sifive,trace-funnel0", .data = &rvtrace_v0_funnel_data },
+#endif
 	{}
 };
 
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.c b/drivers/hwtracing/gtrace/rvtrace-v0.c
new file mode 100644
index 000000000000..a5ca9001bc08
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#include <linux/gtrace.h>
+#include "rvtrace.h"
+#include "rvtrace-v0.h"
+
+static u32 rvtrace_v0_get_impl(struct gtrace_platform_data *pdata,
+			       enum rvtrace_component_type type)
+{
+	u32 impl, major, minor;
+
+	impl = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	major = 0;
+	minor = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK;
+
+	/* Encode to standard rvtrace impl format */
+	return (type << RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) |
+	       (minor << RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT) |
+	       (major << RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT);
+}
+
+u32 rvtrace_v0_get_encoder_impl(struct gtrace_platform_data *pdata)
+{
+	return rvtrace_v0_get_impl(pdata, RVTRACE_COMPONENT_TYPE_ENCODER);
+}
+
+u32 rvtrace_v0_get_funnel_impl(struct gtrace_platform_data *pdata)
+{
+	return rvtrace_v0_get_impl(pdata, RVTRACE_COMPONENT_TYPE_FUNNEL);
+}
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.h b/drivers/hwtracing/gtrace/rvtrace-v0.h
new file mode 100644
index 000000000000..2d83c87936b9
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 SiFive, Inc.
+ *
+ * Support for pre-ratified (version 0.x) RISC-V trace components.
+ */
+
+#ifndef __RVTRACE_V0_H__
+#define __RVTRACE_V0_H__
+
+#include <linux/gtrace.h>
+#include <linux/types.h>
+
+u32 rvtrace_v0_get_encoder_impl(struct gtrace_platform_data *pdata);
+u32 rvtrace_v0_get_funnel_impl(struct gtrace_platform_data *pdata);
+
+#endif /* __RVTRACE_V0_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index e6be1ce303cc..7f9e88d99b8f 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -109,6 +109,18 @@ static inline const char *rvtrace_type_name(enum gtrace_component_type type)
 	}
 }
 
+/**
+ * struct rvtrace_match_data - Per-compatible data for RISC-V trace components
+ * @format:   Trace format to be used by the component.
+ * @get_impl: Optional callback to retrieve the implementation register value
+ *            encoded in the standard RISC-V trace IMPL register format. Used
+ *            by pre-ratified components whose IMPL register layout differs.
+ */
+struct rvtrace_match_data {
+	enum gtrace_format format;
+	u32 (*get_impl)(struct gtrace_platform_data *pdata);
+};
+
 static inline int rvtrace_comp_poll_empty(struct gtrace_component *comp)
 {
 	return gtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,

-- 
2.43.7

