Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684053;
	b=x0uLXrPYHE1hrG7Qd3fNjDSA7qjo9Em0DPuzfLebxEii680MoaIDEy/jguPue3N0wWUq
	 pTCczWnzrqW1TXRPA9CkVm4+LMGqyigP6RnYXO4jeOYfIaPP+W53lmyrPgKfwq+rP0KFV
	 FFSFu73c6AiKEdOhNsdqyIHyjaLtw1Ns39Vj22jwjK6z4BxgBu6YxtyuQvvx8tqIzOI43
	 l7+2JERITSeX4Uyd/kHODNQ6/8iw80C3X/+S0bgYWB3fTbd+uNkVwHSp/n1fNXATpu2IJ
	 1pFmcQUBt1atYSHROV+2UwD3lyRHk8fDGKO+0BTmUIU7sX63mIJoMKvF4LgbHw11m/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VzYWNHwLyf/zZi3eZLCKNgKiDGvpaD8KYJ/QuAC6W+c=;
	b=OpWq+oX/1W7L7KpBLn2UWXj0ffL3vftcaIwbzIrsDdolA6P84NXpigpgUVst7CdPT4GT
	 d4wWBnUhDLWH6YBqyeMmmt0drzJ9zQA3vp8CLd0iyB9nLceQSn4Wm9VNtrNVDR8+mvr6f
	 Rg6gmhRpN4kz+Wh0Bg+XKAI2X+N/got+WMCZx55lvQsiCd2MMctF+e6iO8CfrsmQdnmMU
	 3S4CCRnD8wVcs9osLMCAx/rnpYEFjIbrJUsLgPXQHZTA4vOUZwHEKmdMVb8DoIvStP4b0
	 aolc8WYkHNulQ412IWRqaOu6uDGQiJYIalLPYBTCJcIfnHVStBhMCc+8G5nSsS71gmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=iD36uBXN;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F3E60A380F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14F3E60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=iD36uBXN
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso14417827eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684052; x=1796288852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzYWNHwLyf/zZi3eZLCKNgKiDGvpaD8KYJ/QuAC6W+c=;
        b=iD36uBXNpvXIrnAABL8igzKgUd//l5xA0BUYY27Md9jpHjBGbf0iQ8D5GP9MBt8/vr
         7ylK8AR62Q7QzB7spBOyPEs/OJGBltqueZ+pLmpakeFlSm+p9d1lxWQ5g/oumpLFpIRB
         UpcNnHhJ5+52nKQvO7zX7cTiDTAOYlGgRD6Z3gt3jZJwySa5Nv+Dz/SMednsXbnZ+MtG
         8f8BSVyXMnVoz76b3bAp13apaChzHDIMMqZm9NE9dF92MUKEnR4a+wADDhvRxskfegCe
         1bBbpjv7rYDg7UYPAsuuQ/u63zF8QbKD49auwxN5C+9Yoo4ki8aI6NA9sFaceXlfS95P
         PRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684052; x=1796288852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzYWNHwLyf/zZi3eZLCKNgKiDGvpaD8KYJ/QuAC6W+c=;
        b=WEr+daRVoKr5F3mgW0h5NOrSQVV6DaheRaxXHopU9rRsDph5GG43FurZelaKWApMQG
         1bozbIUEJw+WTNMkAERdrQPoI1oY9b9ntWEXwdzKJuWXGh+HQPRSDgEpYzfRcL8HKslJ
         FR2qDatvuTQ8xteeER4MzCXT21oy6mBWqchKMwJwiyYQwvBFm5Bro/YSMhlbgfkfiVTU
         5kMZf2IGm7p+6EULBTN0Yyr7Nb5LkjkJCU5Ajn1NMaGU0NbfIB8koRtzK+7DZPSkxGe8
         /jiRK/SNNyAW75T+a8IldGC6JSWjIqL6OkNBMYnsni+5V3ecH4nolie1l0+MMclbiqMI
         vs6w==
X-Forwarded-Encrypted: i=1; AL+hErF7T4wFKv7m7su4he9h1cEeHxY16Alp3sHjAp1rkZi7qn2djy0BM8CmIohR+zpYpSxKaVJn+pft4j0v5xc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7eN+E0hOQpQIi7QbjPXZ//OsYwMD8zL5C91Zq2IJM3kc9gAXP
	V3kxEH00MbHIWdfHd6smMIKc8ldWtXsIq9J0cLWDYNZNxaAonc0rgL1CnBnZoVW2WU0=
X-Gm-Gg: AZFdTZcCFh+aUQbVzObbiyWHYSES+xuqL1mxgRRzJI3v45PGmLD4hI4c3GKdjtnQp+2
	McT1CpOwnODsfswKda/0CFvRcaLIeGBWyJG+nryZ7yyCLv5vHwfvkwiYt7Ad94WgKrueeNRjdD3
	BI8ZZkIiDq62u/un+gXhytPxBjqqvayboFFwVB6ntgExeyVe59bks1yr+YZxGjYqfVtNKMuC7qB
	hbKNpRxQ/OMxP9JVBUjrksz2jvSMDkZOf9G4MhFCG2xqacQVmaQPmCxx72riRlQH7SAa4bnNdd5
	fietPmfXYcPci+e5MRc3MeCP/0+gq+v+Py5WA0v93ezb+ZI1tt8jpVF/alHfqk+RDeXgAjSwGf6
	Z5GHieZr/fCnpDRPMldCJJ8quyWFuMoa9bwsOOW0JU7CQ9Quzccx20j3V26ruinfVUswNLYby7G
	ShX+lpcF1pzqKkSJQLRoX0IuuVgMyznWuXFQCqEUOezfgiNRK3TwPnp+wZXUd76rC3VkWetp/Ym
	o0x7M5z+VLUgJpZvu4WAZnYD5ZDn1f9RbGheAE6B4AKR7uyCknOF6kkUtrmMVq6El6gG1UuI2/4
	byPOuXC+XfcASyaXjraUo+GJ/heDN9iDAv9JgdFa3ORo
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr26613125eec.6.1795684052116;
        Thu, 26 Nov 2026 01:07:32 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:31 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:16 -0800
Subject: [PATCH 10/10] gtrace: rvtrace: Add copyto_auxbuf callback for
 pre-ratified encoder and funnel
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
Message-Id: <20261126-send-preratified-trace-v1-10-1e686fd75be7@sifive.com>
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

Unlike the standard RISC-V trace ramsink, which is an independent
device, the pre-ratified ramsink are embedded within the trace encoder
or funnel MMIO registers.

When pre-ratified encoder and funnel components act as a sink, the
trace data must be copied from the trace buffer to the perf AUX buffer
after tracing is stopped. To support this, add
rvtrace_v0_ramsink_copyto_auxbuf() which shares the copy logic with the
standard ramsink, and use it to implement the copyto_auxbuf callback of
the encoder and funnel drivers. The callback copies nothing when the
component doesn't act as a sink.

Note: an encoder or funnel component may be in the middle of a given
path, so gtrace_path_copyto_auxbuf() now only invokes the copyto_auxbuf()
callback of the path's sink instead of the first component in the path
implementing it.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c     | 19 ++++++++-------
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 10 ++++++++
 drivers/hwtracing/gtrace/rvtrace-funnel.c  | 10 ++++++++
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 37 ++++++++++++++++++++++++++----
 drivers/hwtracing/gtrace/rvtrace-ramsink.h | 12 ++++++++++
 5 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 6fe71c5cd0cf..7a818d647372 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -714,10 +714,9 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 			      struct gtrace_perf_auxbuf *buf,
 			      size_t *bytes_copied, u64 *format)
 {
-	struct gtrace_comp_priv *sink = to_gtrace_comp_priv(gtrace_path_sink(path));
+	struct gtrace_component *comp = gtrace_path_sink(path);
+	struct gtrace_comp_priv *sink = to_gtrace_comp_priv(comp);
 	const struct gtrace_driver *gtdrv;
-	struct gtrace_component *comp;
-	struct gtrace_path_node *node;
 	int ret = -EOPNOTSUPP;
 	unsigned long flags;
 
@@ -735,15 +734,15 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 		goto out;
 	}
 
-	list_for_each_entry(node, &path->comp_list, head) {
-		comp = node->comp;
-		gtdrv = to_gtrace_driver(comp->dev.driver);
-		if (!gtdrv || !gtdrv->copyto_auxbuf)
-			continue;
-
+	/*
+	 * Only the sink of the path holds the trace data. Other components in
+	 * the path may implement copyto_auxbuf() as well, e.g. when they embed
+	 * a sink which is only used when they are at the end of a path.
+	 */
+	gtdrv = to_gtrace_driver(comp->dev.driver);
+	if (gtdrv && gtdrv->copyto_auxbuf) {
 		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
 		ret = 0;
-		break;
 	}
 out:
 	raw_spin_unlock_irqrestore(&sink->lock, flags);
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
index 8d2f7ac5e0fe..a854c4695351 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -164,6 +164,15 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	return 0;
 }
 
+static size_t rvtrace_encoder_copyto_auxbuf(struct gtrace_component *comp,
+					    struct gtrace_perf_auxbuf *buf,
+					    u64 *format)
+{
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return rvtrace_v0_ramsink_copyto_auxbuf(comp, priv->sink, buf, format);
+}
+
 static void rvtrace_encoder_remove(struct gtrace_component *comp)
 {
 	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
@@ -261,6 +270,7 @@ static const struct gtrace_component_id rvtrace_encoder_ids[] = {
 
 static struct gtrace_driver rvtrace_encoder_driver = {
 	.id_table = rvtrace_encoder_ids,
+	.copyto_auxbuf = rvtrace_encoder_copyto_auxbuf,
 	.probe = rvtrace_encoder_probe,
 	.remove = rvtrace_encoder_remove,
 	.start = rvtrace_encoder_start,
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.c b/drivers/hwtracing/gtrace/rvtrace-funnel.c
index 463e504aaa92..48d1084957c1 100644
--- a/drivers/hwtracing/gtrace/rvtrace-funnel.c
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.c
@@ -75,6 +75,15 @@ static int rvtrace_funnel_probe(struct gtrace_component *comp)
 	return 0;
 }
 
+static size_t rvtrace_funnel_copyto_auxbuf(struct gtrace_component *comp,
+					   struct gtrace_perf_auxbuf *buf,
+					   u64 *format)
+{
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return rvtrace_v0_ramsink_copyto_auxbuf(comp, priv->sink, buf, format);
+}
+
 static void rvtrace_funnel_remove(struct gtrace_component *comp)
 {
 	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
@@ -95,6 +104,7 @@ static const struct gtrace_component_id rvtrace_funnel_ids[] = {
 
 static struct gtrace_driver rvtrace_funnel_driver = {
 	.id_table = rvtrace_funnel_ids,
+	.copyto_auxbuf = rvtrace_funnel_copyto_auxbuf,
 	.start = rvtrace_funnel_start,
 	.stop = rvtrace_funnel_stop,
 	.probe = rvtrace_funnel_probe,
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
index f183dcd71c7c..cc0a5785bda4 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -188,11 +188,11 @@ static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size
 	}
 }
 
-static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
-					    struct gtrace_perf_auxbuf *buf,
-					    u64 *format)
+static size_t __rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					      struct rvtrace_ramsink_priv *priv,
+					      struct gtrace_perf_auxbuf *buf,
+					      u64 *format)
 {
-	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
 	const struct rvtrace_ramsink_regs *regs = priv->regs;
 	struct trace_buf src, dst;
 	size_t bytes = 0;
@@ -231,6 +231,13 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 	return bytes;
 }
 
+static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					    struct gtrace_perf_auxbuf *buf,
+					    u64 *format)
+{
+	return __rvtrace_ramsink_copyto_auxbuf(comp, dev_get_drvdata(&comp->dev), buf, format);
+}
+
 static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
 				     struct rvtrace_ramsink_priv *priv)
 {
@@ -448,6 +455,28 @@ void rvtrace_v0_ramsink_release(struct gtrace_component *comp,
 	of_reserved_mem_device_release(comp->pdata->dev);
 }
 EXPORT_SYMBOL_GPL(rvtrace_v0_ramsink_release);
+
+/**
+ * rvtrace_v0_ramsink_copyto_auxbuf() - Copy trace data from the sink embedded
+ * in a pre-ratified trace encoder/funnel into the perf AUX buffer.
+ * @comp:   Pre-ratified trace encoder/funnel component.
+ * @priv:   Sink private data returned by rvtrace_v0_ramsink_setup().
+ * @buf:    Perf AUX buffer.
+ * @format: Trace format of the copied data.
+ *
+ * Return: Number of bytes copied, 0 if the component doesn't act as a sink.
+ */
+size_t rvtrace_v0_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					struct rvtrace_ramsink_priv *priv,
+					struct gtrace_perf_auxbuf *buf,
+					u64 *format)
+{
+	if (!priv)
+		return 0;
+
+	return __rvtrace_ramsink_copyto_auxbuf(comp, priv, buf, format);
+}
+EXPORT_SYMBOL_GPL(rvtrace_v0_ramsink_copyto_auxbuf);
 #endif /* CONFIG_RVTRACE_V0 */
 
 static int rvtrace_ramsink_probe(struct gtrace_component *comp)
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.h b/drivers/hwtracing/gtrace/rvtrace-ramsink.h
index 0c1b346af8c0..ff767da7f861 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.h
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.h
@@ -15,6 +15,10 @@ struct rvtrace_ramsink_priv;
 struct rvtrace_ramsink_priv *rvtrace_v0_ramsink_setup(struct gtrace_component *comp);
 void rvtrace_v0_ramsink_release(struct gtrace_component *comp,
 				struct rvtrace_ramsink_priv *priv);
+size_t rvtrace_v0_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					struct rvtrace_ramsink_priv *priv,
+					struct gtrace_perf_auxbuf *buf,
+					u64 *format);
 #else
 static inline struct rvtrace_ramsink_priv *
 rvtrace_v0_ramsink_setup(struct gtrace_component *comp)
@@ -26,6 +30,14 @@ static inline void rvtrace_v0_ramsink_release(struct gtrace_component *comp,
 					      struct rvtrace_ramsink_priv *priv)
 {
 }
+
+static inline size_t rvtrace_v0_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+						      struct rvtrace_ramsink_priv *priv,
+						      struct gtrace_perf_auxbuf *buf,
+						      u64 *format)
+{
+	return 0;
+}
 #endif
 
 #endif /* __RVTRACE_RAMSINK_H__ */

-- 
2.43.7

