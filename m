Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684050;
	b=VLh2MBJoVtWQYoIzIkNSR9TK0UQRtmsFU513enj2FrZtVht9FYx282JMtKWw35n/RkRD
	 JKvfHtLr3zNqX/5RVqYWQr8hT/VH+MPAuERDC5PBrdvxR9s97BlBREb9Fq+9oLb1QqEJn
	 VcOC4TuurhNzdF2TSosLxKOXzlDz6L/qyPxyHE9OJfVx4YPA0i4GuYtVKt6Y9qcxWdOQk
	 Tb0buHU7yOZsVe1dT6KRLJmBXgXLBTR2QBU8UyvlpDigBo8J+AYGmKQGdYVEwT9d8Z76L
	 TTZYu1oz07OB6NJ5HTMgZw597vLmzgyB3QtFeKQyFX0sFlkRhDyeT23PurugFxV2Wtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=D34z4LAKYnHU9cCU4CpSl7aFm0LZ4mxwUeYBCb2GPa8=;
	b=SVtaYoA1N7p8g1360gxkvEDFwML7OewFeZep7MIX2yMWScCP/KmuBPe/hugdgJcl87ee
	 iZ4bktYWiLWC81IXw1hbKXxdmECNcLq4jIopobGXdLJBa4dKqdWSoFExSWhTm4ugYfUCt
	 pJP9Z4w7vDdGClELg+bjNHbB8i5/2ibXzGrGKb2h4frSHDM3WrPXDPy5rHBh5a5qOyu6b
	 Dt4vrxh1PjfSTg8PSnvESqwUa8U/h4dy3BUoX8i9ratztN2GH1teC+G2byDJYSEp0nkf/
	 Yy5jIpSpa1Dlo9YH8hqmCS411fsM+hzQ2jl4k/8QT/IYAfAOeTmFEtXlqL1yK7DeEhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ejpAtzhQ;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDEB60A2617
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FDEB60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ejpAtzhQ
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386c336eab8so3257045eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684049; x=1796288849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D34z4LAKYnHU9cCU4CpSl7aFm0LZ4mxwUeYBCb2GPa8=;
        b=ejpAtzhQJJfX+zeG609ydxFLuwyxKIE9hOlNLCcuH0EZyryg7JlBZpNMtIjWCAURES
         GBU0NWjhxMuITwnSXZ9LGKjZ3iu/gkrtbTR8uy8PSDBZ1spA+6sOavFgeuFklNGIZgf1
         PK9e86FndRZff9I8TYGFqcmGkbWe4bzyWRcJiptqdtg47AWFRGYkJAZ9vsvViIOoMULk
         R6mFScu9g8g/WTpdvVDlzB4tTuwPCOKHmTV5xTstq06aZCiaPy5GoNrG3SXi7BRg8gwk
         v51scUg4ifp4t5JNLZlXumQ9EpMk3UhKTFn8j2H2MpPfTrzWcm3Ppzm9wm3fz57IcnFY
         b7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684049; x=1796288849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D34z4LAKYnHU9cCU4CpSl7aFm0LZ4mxwUeYBCb2GPa8=;
        b=de2h0iQ1qioTwjMLizwrqdWJwt+QnXmmmkEXzkUEGrbYNN+nOyNXVx9CHsI1BmumFa
         uRkp63Al1OzKrxAEYsEkckPiPVmZMSgA6lHSSKecddvE8WoqvdAdlTBZrzyHoE90IdDc
         Zrb6OZy05kNcBGs4SwDlGmXFqwpzuf1+o8Cv7fEHYjuV+dRL6QA25zUaErPVH7eB7egL
         sVGO4GbYIVOkw2z/EXt08qqJHCECSHDAysK+busdgUl7rAl6kNU08dxAaNRDyMTUJZBo
         w2ClFKHqXaNd+yhAyYjY4beDrMyOSnE5mu6ALAyAHRIpxn0H/vWIPDCrsSFVhOe08xLq
         OLIg==
X-Forwarded-Encrypted: i=1; AL+hErGbUO7XvA6KeIFeIc1T/MuXbweqzlTAeUKCWJQoVu+99GtO3qPbdx90U8+8rlht8tBlOItWhC+enrXGGWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QZDrhu7g7w2KbE0/ViSoNJ71UydF3HNOl6Wiuz79wiJoi18qU
	iZ/Qzv69s4CuPKx5lvlrPnt1U57nb4q8oyiW3maCjMsljNlt8GiBMMUPvdpkc9oOI4I=
X-Gm-Gg: AZFdTZcChvxR5G4uAdjhtqLWmiFJAMSSnNFYatG2iVoiCfP+Ee2Z7iAmhndG5EDtymn
	wM9rHW9kCTJnqWm1bde+zJBIXPDBT18g4QHscUtNe+lGnMxczo92vWIR4Ck107ocWlhslAasyha
	zavzJHkwnOZdYkzgk5hD1oqlhp893MFr1lrj5GWKvg2RdAe4vvmXKIvKO/T+8ARTagdbdedv9Yu
	c2N16wcjqwwZxk7uUTQiq0wk2kh866Panpjy9oQc3ZWcZ8TGK9Eor21f6T7YzTq4GAO7SAKDsw6
	DVRWVej0yt7xJzTLt9fXoVpcjj7fZv5Ytolwamyvmrp8F/NzOjhkLmyKmmrLHZmpC2cv6pf/m5N
	TTtYIdLVPhPYLo5oQEUQANta/+fckpvIeVxwWev3ljzA3k5ftgQFbEV7meLwlPaB5+vU4NaA5VC
	ga4X0i6c/Oz9Wudi39R8yuCqKSXSwC/P7bwyR9qUJV330qIZr9ox+dcrCLwKla8IsSOztI23776
	VwSW8328tEgXCmeWtUjjDTib1bgjDlhMWGyDZ9HA3zSqkXkWFop09QY3IAsw92XXvlqf4UCSjY1
	oQojE3+JRJmeUvbxq7i3Qx/DNzmC1fmx5RLbp6P6jMxK
X-Received: by 2002:a05:7301:6782:b0:385:2ea8:aac7 with SMTP id 5a478bee46e88-3852ea8d7d4mr29001166eec.23.1795684048801;
        Thu, 26 Nov 2026 01:07:28 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:28 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:13 -0800
Subject: [PATCH 07/10] gtrace: rvtrace: Add pre-ratified trace funnel
 driver
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
Message-Id: <20261126-send-preratified-trace-v1-7-1e686fd75be7@sifive.com>
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

Add the initial implementation to support the pre-ratified RISC-V
trace funnel. This implementation provides basic functionality to
enable the trace funnel, configure its next sink when tracing starts,
and disable the funnel when tracing stops.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/Kconfig          | 13 ++++
 drivers/hwtracing/gtrace/Makefile         |  1 +
 drivers/hwtracing/gtrace/rvtrace-funnel.c | 98 +++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+)

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index b1f9ca8f73cb..66fc2791d8f4 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -43,6 +43,19 @@ config RVTRACE_ENCODER
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-encoder.
 
+config RVTRACE_FUNNEL
+	tristate "RISC-V Trace Funnel driver"
+	depends on RVTRACE_V0
+	default y
+	help
+	  This driver provides support for the RISC-V trace funnel component
+	  which combines the trace data from multiple upstream components
+	  into a single trace stream. Only pre-ratified trace funnels are
+	  supported for now.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-funnel.
+
 config RVTRACE_RAMSINK
 	tristate "RISC-V Trace Ramsink driver"
 	depends on RVTRACE
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 0a2e2d1732c2..38dd96b3dc34 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -8,4 +8,5 @@ obj-$(CONFIG_RVTRACE) += rvtrace.o
 rvtrace-y := rvtrace-platform.o
 rvtrace-$(CONFIG_RVTRACE_V0) += rvtrace-v0.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
+obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.c b/drivers/hwtracing/gtrace/rvtrace-funnel.c
new file mode 100644
index 000000000000..2e0843d233ab
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 SiFive Inc.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+#include "rvtrace-v0.h"
+
+static int rvtrace_funnel_start(struct gtrace_path_node *node)
+{
+	struct gtrace_component *comp = node->comp;
+	int ret;
+
+	/* Set pre-ratified comp's next sink */
+	ret = rvtrace_v0_sink_config(node);
+	if (ret) {
+		dev_err(&comp->dev, "failed to set next sink.\n");
+		return ret;
+	}
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to enable funnel.\n");
+
+	return ret;
+}
+
+static int rvtrace_funnel_stop(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to disable funnel.\n");
+		return ret;
+	}
+
+	return rvtrace_comp_poll_empty(comp);
+}
+
+static int rvtrace_funnel_probe(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to enable funnel.\n");
+
+	return 0;
+}
+
+static void rvtrace_funnel_remove(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to disable funnel.\n");
+}
+
+static const struct gtrace_component_id rvtrace_funnel_ids[] = {
+	{ .type = GTRACE_RVTRACE_FUNNEL,
+	  .version = rvtrace_component_mkversion(0, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_funnel_driver = {
+	.id_table = rvtrace_funnel_ids,
+	.start = rvtrace_funnel_start,
+	.stop = rvtrace_funnel_stop,
+	.probe = rvtrace_funnel_probe,
+	.remove = rvtrace_funnel_remove,
+	.driver = {
+		.name = "rvtrace-funnel",
+	},
+};
+
+static int __init rvtrace_funnel_init(void)
+{
+	return gtrace_register_driver(&rvtrace_funnel_driver);
+}
+
+static void __exit rvtrace_funnel_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_funnel_driver);
+}
+
+module_init(rvtrace_funnel_init);
+module_exit(rvtrace_funnel_exit);
+
+/* Module information */
+MODULE_DESCRIPTION("RISC-V Trace Funnel Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.7

