Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684049;
	b=iVi713lSHcdJLxX800k+YqmR1AITsUtjE59uTxY3kjRW/dtkd2//2nLe7233q6VOYvLE
	 qQDucvbAl8gEbkxr5Y/RTsGUJMvNZNM5bz+O9HrnhHFs2unBXiReFNBCfJu/d6eZAlu6j
	 /LDITMm9/pwfVXdVsMuKeDnOs06ExBWDes+yk9DOuASTCLAMDBW2Po2mAgbIRqnX7eE9E
	 ZwMS+7YLCV3tk57EC1wxtZXvoxkrttlI8Bo5fb/e0n1iTOt8uZCh1ISdw0pCZbxox9ik8
	 /syO41AzxkuXB5BH9LM8bgchs0oygfax7itLi+a1sfuA8RhumozLPMjxQjqWKYh8LaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5eduOfrcMezccrel/htE1vCdBesOoz7m//Yk7KumNRU=;
	b=XZS4dEoh/CipfxQEGZErsSbKCimn2BfxDa6D/XiwGWj/UBsiH+zGkJuzHWUTkBlIuAha
	 zAwktY9jxZUIv2aGIbj53Vs2A3Eq5u9iOcymPx+rwgiVIbknrS9Auy/8KD+3p2PeqVjK8
	 39qD+VwJHz3RT3KeYzayYYJ/OIMRCkcvpwMUTH5iViTE/VLjjoMyjCLUWijEvy75B+JU3
	 mY0TfH5ZS+jigLpW2ecfv39N+qsIk+9LhrY1Ng0bMTWaFaQu9xjxCLHoSl4Nw0MgV35ZU
	 aS9528yskMPA0IPRZx6AXtQN84wMFpgkxTCcrQvq2cA6RpuZbTiDcvyX44tESKqMlBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=k6TRuIKB;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9997606A6B9
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9997606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=k6TRuIKB
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386d1859e1cso1341902eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684048; x=1796288848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eduOfrcMezccrel/htE1vCdBesOoz7m//Yk7KumNRU=;
        b=k6TRuIKBUbLk/LpImh72Y0v5R4+T292ndC9g7FBvotoVbLRjBLpOvOK8+kM54cKs+/
         mOO6VESRbM4PfMrDexUtf3G87LO2YlA9Pbx0iwhFkcAnAfvlPqpNR1JyZKLrqrybj0h9
         7/ByGRukKSNSDWm8SCKbE59gSYAiZStp3trFqgBQyPZQQxTHMCIAMobVaxH89Cfe9BQV
         OXcsBKDlmDzZgT7zpzhTwER7D74OlYOfxcyTNeAWiaEHpt0Qa3zMDYtpf8cwOGBQTVod
         qzwkJQ0dMTdy0bjWgZelTf5g2BtQDfDCWcJ+pcLZLgVFdLT6t5K+9s9hGAkf9gs5GHRB
         CpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684048; x=1796288848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eduOfrcMezccrel/htE1vCdBesOoz7m//Yk7KumNRU=;
        b=J9ttnqeiSl89K/+Zrdir6p3idXKh447ctHQedmteySUzsT0ri14LfWuouXQWsIMVLb
         ed4A0Iv3P9ZMGe3RUy7rZL8rF0zntKKyqGw+ELOxPhAMYYUrnG7JD0zR7XM6pHGkH19x
         aC1P6YLhdczbEOILbgihMr4vg0guvrqRslCYImxmVGZc5DVCRbzc2h2puQB4h9yAJvnI
         ehuBHgWOhTdotIBfH6NIwg6KX6+V/yqg6MlnTgybGwPDbpqIHTyV0YRgEIL1cewD9YUW
         PlX/SpgKuwGk6Nd7+4u4DE/XxOZDT/jQdonUhV06sezrHTXChv7bZ9fgY7PklOQOC9Zw
         5ldg==
X-Forwarded-Encrypted: i=1; AL+hErEaRqNO+oQavylRjYWoP6NfqYTHW0JjBuEFrc84QuPtqVZKs3ZGL3/VIHyZAvHgAum6CVuION/yorzKErE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jlV8/kgXELMW9NuksqqVrbQhad0lqrgoKRNEZFG1jCbzG8oUf
	51ZKivi0SI67zmq3L0GPUiTIn2vrYNczlv2Do7H+h/27iavUzMIyFXP7tqdzPk97+iQ=
X-Gm-Gg: AZFdTZenaoKwGLaANedAibVQTk7DfUElBfc3/3mfVHNyQgnnMZvc9jqSyGrpsp9r/v+
	Yyb3Gpak1UyFklRQRKQujUYlHVfIGW+70HrqBYrYUdrIjNN8iUKDJnnlL8c0LqenPCsTAhPQIpp
	tyG+PDN4pDddUjTaLgj6R6btNrsPFD/lQWSAfsDP5uRToCOQATKdc22tut2i/p9QdViESIsMSIa
	0yzBBEBNATUfP+r9I8hSgEjkAeQTC7wWNdAW1LBfc4c9zViBLOfspYVh7ULg3aL+WiFF8tg7dQ8
	19FZvkMpTi8g8eZaQzS+sIQYk49dp2CoGh29/PRIZuT5oYCfeXAvWOsT0MwwU/9mLtdTlQp28rh
	k0v3LoMDZhYde1rizH5DafI0uW8uuQRZwL8/RKUk0z2EzvUmK95v2Cu5MgWobo7hPETAKarZCLT
	Hs2o+LVUr5vfNYPRN69E9qXGaDTLUlJs9d20gQQPuEWG/dfmwkwxtG2t+906AbEYzpUgk9pZKDG
	LnCGKotrA/u5aSKl5d7SonGDXaYGUPhpr6AKI9C0Xc8XbF8XB5wm/HtR+91lKK0grC/F1o3rBGz
	nlrKRIBfwMTfBiPl5YlOKGJZN+Cr51jNv9s0G+W6hDX6
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr23988422eec.6.1795684047793;
        Thu, 26 Nov 2026 01:07:27 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:27 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:12 -0800
Subject: [PATCH 06/10] gtrace: rvtrace: Add pre-ratified trace sink config
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
Message-Id: <20261126-send-preratified-trace-v1-6-1e686fd75be7@sifive.com>
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

To decide which sink to send trace data to, pre-ratified trace
hardware (eg., SiFive, Eswin) sets a sink bitfield directly within the
current component's control MMIO register.

Routing trace data from a source to an output component requires
configuring the connections between components, and the mechanism
varies between hardware implementations:

  - Standard (ratified) RISC-V trace configures routing at the
    receiving end. For example, a funnel uses the trFunnelDisInput
    register to control which source input is accepted.
  - Pre-ratified hardware configures routing at the sending end,
    selecting the output destination by setting a bitfield directly
    within the current component's control MMIO register.

To support both, component drivers need the path topology when
starting, rather than just the component itself, so update the
gtrace_driver start() callback to take a struct gtrace_path_node.

Introduce rvtrace_v0_sink_config() for pre-ratified trace hardware to
configure the destination sink based on the hardware capabilities and
the current trace path before starting the trace.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c     | 13 +++------
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 10 ++++++-
 drivers/hwtracing/gtrace/rvtrace-ramsink.c |  3 ++-
 drivers/hwtracing/gtrace/rvtrace-v0.c      | 43 ++++++++++++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-v0.h      | 23 ++++++++++++++++
 include/linux/gtrace.h                     | 19 +++++++++++--
 6 files changed, 98 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 09b200bd1690..6fe71c5cd0cf 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -498,12 +498,6 @@ void gtrace_unregister_component(struct gtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(gtrace_unregister_component);
 
-struct gtrace_path_node {
-	struct list_head		head;
-	struct gtrace_component		*comp;
-	struct gtrace_connection	*conn;
-};
-
 struct gtrace_component *gtrace_path_source(struct gtrace_path *path)
 {
 	struct gtrace_path_node *node;
@@ -621,8 +615,9 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 	}
 }
 
-static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
+static int __gtrace_comp_start(struct gtrace_path_node *node, pid_t owner)
 {
+	struct gtrace_component *comp = node->comp;
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
 	unsigned long flags;
@@ -639,7 +634,7 @@ static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
 		}
 	} else {
 		if (gtdrv->start) {
-			ret = gtdrv->start(comp);
+			ret = gtdrv->start(node);
 			if (ret)
 				goto out;
 		}
@@ -686,7 +681,7 @@ int gtrace_path_start(struct gtrace_path *path)
 	int ret = 0;
 
 	list_for_each_entry_reverse(node, &path->comp_list, head) {
-		ret = __gtrace_comp_start(node->comp, path->owner);
+		ret = __gtrace_comp_start(node, path->owner);
 		if (ret)
 			break;
 	}
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
index 0a23c78c0caf..92672f1e7098 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -155,8 +155,9 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	return 0;
 }
 
-static int rvtrace_encoder_start(struct gtrace_component *comp)
+static int rvtrace_encoder_start(struct gtrace_path_node *node)
 {
+	struct gtrace_component *comp = node->comp;
 	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
 	struct gtrace_platform_data *pdata = comp->pdata;
 	int ret;
@@ -171,6 +172,13 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 			dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
 			return ret;
 		}
+	} else {
+		/* Set pre-ratified comp's next sink */
+		ret = rvtrace_v0_sink_config(node);
+		if (ret) {
+			dev_err(&comp->dev, "failed to set next sink.\n");
+			return ret;
+		}
 	}
 
 	ret = gtrace_enable_component(comp);
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
index 67b6779aacee..52aeb7626a55 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -72,8 +72,9 @@ static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 v
 	gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
 }
 
-static int rvtrace_ramsink_start(struct gtrace_component *comp)
+static int rvtrace_ramsink_start(struct gtrace_path_node *node)
 {
+	struct gtrace_component *comp = node->comp;
 	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
 	u32 trram_ctrl;
 	int ret;
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.c b/drivers/hwtracing/gtrace/rvtrace-v0.c
index 01e62642c245..c9254e71a972 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.c
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.c
@@ -5,10 +5,53 @@
 
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/gtrace.h>
 #include "rvtrace.h"
 #include "rvtrace-v0.h"
 
+/*
+ * Pre-ratified trace hardware selects the destination of the trace data
+ * with the teSink/tfSink field in the component's own control register,
+ * i.e. routing is configured at the sending end. The destination is
+ * derived from the trace path: the last node of the path (no outgoing
+ * connection) writes to system memory (SBA), otherwise the component
+ * feeds the funnel the path connection leads to.
+ */
+int rvtrace_v0_sink_config(struct gtrace_path_node *node)
+{
+	struct gtrace_component *comp = node->comp;
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_v0_comp_features *data = comp->id.data;
+	struct gtrace_component *next;
+	u32 val;
+
+	if (!data)
+		return -EINVAL;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~RVTRACE_V0_CTRL_SINK_MASK;
+
+	if (!node->conn) {
+		/* Last node in the path */
+		if (data->has_sba_sink)
+			val |= TE_SINK_SBA << RVTRACE_V0_CTRL_SINK_SHIFT;
+		else
+			dev_warn(&comp->dev,
+				 "Component is last node but doesn't support SBA sink\n");
+	} else {
+		next = node->conn->dest_comp;
+		if (next && next->id.type == GTRACE_RVTRACE_FUNNEL &&
+		    data->has_funnel_sink)
+			val |= TE_SINK_FUNNEL << RVTRACE_V0_CTRL_SINK_SHIFT;
+	}
+
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rvtrace_v0_sink_config);
+
 void *rvtrace_v0_get_comp_data(struct gtrace_platform_data *pdata)
 {
 	struct rvtrace_v0_comp_features *data;
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.h b/drivers/hwtracing/gtrace/rvtrace-v0.h
index 5abdc4788f64..d1dac2034a14 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.h
@@ -10,6 +10,7 @@
 
 #include <linux/gtrace.h>
 #include <linux/bits.h>
+#include <linux/errno.h>
 #include <linux/types.h>
 
 #define RVTRACE_V0_IMPL_HAS_SRAM_SINK_BIT	4
@@ -24,6 +25,19 @@
 #define RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT)
 #define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT)
 
+/* teControl/tfControl sink selection */
+#define RVTRACE_V0_CTRL_SINK_SHIFT		28
+#define RVTRACE_V0_CTRL_SINK_MASK		GENMASK(31, RVTRACE_V0_CTRL_SINK_SHIFT)
+
+enum rvtrace_v0_sink {
+	TE_SINK_DEFAULT = 0,
+	TE_SINK_SRAM = 4,
+	TE_SINK_ATB = 5,
+	TE_SINK_PIB = 6,
+	TE_SINK_SBA = 7,
+	TE_SINK_FUNNEL = 8,
+};
+
 /* Number of SRC bits preset by hardware in the Nexus messages */
 #define RVTRACE_V0_IMPL_NSRCBITS_SHIFT		24
 #define RVTRACE_V0_IMPL_NSRCBITS_MASK		0xf
@@ -40,4 +54,13 @@ u32 rvtrace_v0_get_encoder_impl(struct gtrace_platform_data *pdata);
 u32 rvtrace_v0_get_funnel_impl(struct gtrace_platform_data *pdata);
 void *rvtrace_v0_get_comp_data(struct gtrace_platform_data *pdata);
 
+#ifdef CONFIG_RVTRACE_V0
+int rvtrace_v0_sink_config(struct gtrace_path_node *node);
+#else
+static inline int rvtrace_v0_sink_config(struct gtrace_path_node *node)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #endif /* __RVTRACE_V0_H__ */
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index b8826b25d35a..6b2ff2a63694 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -258,6 +258,18 @@ struct gtrace_path {
 	pid_t				owner;
 };
 
+/**
+ * struct gtrace_path_node - Representation of a node in the trace path.
+ * @head: List head for linking nodes in the path.
+ * @comp: Pointer to the trace component at this node.
+ * @conn: Pointer to the connection leading to the next node (NULL for sink).
+ */
+struct gtrace_path_node {
+	struct list_head		head;
+	struct gtrace_component		*comp;
+	struct gtrace_connection	*conn;
+};
+
 struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
 struct gtrace_component *gtrace_path_sink(struct gtrace_path *path);
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
@@ -291,7 +303,10 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
  * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
  *                 reports the PMU specific trace format of the copied data
  *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
- * @start:         Callback to start tracing.
+ * @start:         Callback to start tracing. The path node gives access to
+ *                 the component and to the connection leading to the next
+ *                 component of the path, so that drivers can program their
+ *                 routing registers.
  * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
@@ -304,7 +319,7 @@ struct gtrace_driver {
 	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
 						 struct gtrace_perf_auxbuf *buf,
 						 u64 *format);
-	int			(*start)(struct gtrace_component *comp);
+	int			(*start)(struct gtrace_path_node *node);
 	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
 	void			(*remove)(struct gtrace_component *comp);

-- 
2.43.7

