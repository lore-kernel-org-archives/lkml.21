Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942972;
	b=qTka2+uvAEszsfuSmquh/c9uqEQODfOtTTcrb776/l1XEnNSLyJdl7p6LIuKOjPuLPQo
	 anT3117pFgWofYCSyg9P42SZXmTc0uRriyzfuM2z7QWyXcbYhHOpjVYaisQSjHOCLs+kz
	 UkKzh3Dw+vsLSBhGMnaMvA07kGEHBjMYq5Pi06MmEdzPo1WR2dWPIjetPBOLJN/PvSwKG
	 Kbm5o4VEbJwR/o+PZt70J+fDt/MiRT9puSjRZo1eXCSBRORpcaLz8+QHqYzbQ1E1hcuZi
	 bg1A6THvHrWCTMda/UrgfuUUWYGmNqYnIk11hnUSVrOrcJgdadT87ffkbI2D1fPC2Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=;
	b=47d+YP4j5kLXMkvGo/BAc92z0aEioKgb2pv4t/EBMlJDByuNanuUFQzU9OEvDiOr3l0X
	 Qx5it2rcQBqGC3ay9DssmcacG1xSIz2+SM8LFWKsuP+r8HXnKt1nEz5OVxI+h8SUMe7VF
	 suGU/0+w4VfDbxC2iR+kTEqiAuBhlsGPMhGAJYLY4/zitAEodHerF7d2+mt3qdWZvPmrr
	 MjF6xfEMqef8Xjb1LpP/2JrfZ2z81NmoqWYCjd+WnSISL3es4TfLr6iV6M9qbkj+5pNTA
	 xqWlOmRKORcTnhmcIegLtYhpl2d6wQlADUPo1gmVVWnM+WdvAgW97hSeUrmfudLOWeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GRsVoBV+;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB431606A88E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB431606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GRsVoBV+
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso2360155e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942969; x=1795547769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=;
        b=GRsVoBV+4cTrd58Fb+wnm8ddQzO4U7mJCL3utONuw5zCrgwa5oey8qvumuKwS1X6f/
         yRx7Jm8TWpEKyuWzS16b27xnQJpn0JPrbDqL1BN8W6a0QD65KOQKfLEYnVqch98eGqkC
         BlkLURhqZ83m7VfBO9wUTNAPpXdNC94yTPBfkL6O1v8Ay0B48iJPiTcb9eZfVfzdX2RU
         0tmoAHOuj6BKEYtyo9HK6n+pSqg+RmcqqvofNipV9MFZ6EpAXLVzXSfdDnN9VZJBKHRp
         wgI3G4s1BTP/6ImmI+Z+DE7v0uZebCnybfKjxFZ7cyTd4Ei+HEWuSZ+6blYE7up/VfZt
         uOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942969; x=1795547769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xw7u7BY3gKW/hPJk1lTv2E8M0UGoLRiDA10ri1AQ68=;
        b=jkAcN5sGKPSdbrT1OaEIGdDYM+ny1XC7Wm2+cbq+8lx+b5K6jvFgMFHj40svt1hhh4
         m0DjP1gfbQQ7cO+HHOdllFwp8z7H/Zb7oCBxrar+AdQ9BaTwNYo0VoEwo2nrSEQwyqaX
         mIBgDoz7khNShC7W7keTIKX+2uN1T8yxnT4wHOU8l+yAR5RwSjEgjlnqu4H8dS/lJbcN
         UVAjwXnQj5PuL+6H9+x4JeYXmPvwC4NBm6hVGPkEuxrNpJfrLcy/3kVR/3rT0a8QWtLF
         pjID4MrSz6lmz8ojbOu3CaAnCN+HP9HkuTgRywh1J/6YuQUR2E98wEwMFOAkGqrarKZq
         YsNA==
X-Forwarded-Encrypted: i=1; AL+hErE6RoGVzrXX2Aqe3pMijJlOGtlTK3i956aFGk4erE+5v1/WFVF+e2dehkxponhltBFqmRFa8JJfo5eBSb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y8Uab6lfWfmQAp9hp6vwQBFpbwMlDj13ajfQJO3s5TMCBYqtF
	YQaRjMVHZDwZrdiAAOz23+p4CjvJ4sgkkcdBoRubAE40kYUGINgtztk4klkINNwV9OI=
X-Gm-Gg: AYBFou0sHIAKw9upBxVbo7JV0WtdQ9alunfbVdwZeLwDV3LTbYLcJoCvAoQimSbufPK
	s1eCBT6legKI7UVIlM6JXf0/vDdRQbqnWZPdWKeqZzxHm9fSNXdZGezZEB0y/yHYtQoa/QrYny8
	O7szpTnUUr7LQwdS5tOgAzyFi7Azlsk1NtBCGJOqS2hH3sInNfwJAGJFRD+CKAnM6kGj3i+ZjR3
	slDyypIBNOFp8LPNVlfMZ3mDcuByHQBEJtKS3/WYZbUHOT5F1cuFq9Q05j5PvlR2wNukfQnqOWo
	grHKCkNdgniYNNfA8axzDrF+fDQqXphhqDpquN9RA3W/MZc26NXyZRVa/crLZ0vlmzKk8gEruyQ
	SMPKD8BH+phopNgoKRi+IfGvog5wRQ0W13ekc63usyR/6H6dTfR4KJlb10NLBuHsTh0uTwBSavH
	T94KRwTsJjpva7l70QP1VZv9mX7o8msyWvHm+cZ9W1CMK5pKIWwwAf9A4/l0Aucg0sA/I+DvaJs
	B6WMhLceaVn0jHtgCJlOdchsbJWLqrrmodCkzpYsmJKQ8vqNQ645OoGynjr0xJ4Gj+XjUjsNOqv
	+3Zb59Y8i7O5ZvjWaytFZH2+T6kuWD9tBVvQEpy+GanSZksvAdFMBaQB
X-Received: by 2002:a05:600c:8b83:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb7da55745mr2432765e9.27.1794942969381;
        Tue, 17 Nov 2026 11:16:09 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:08 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:03 +0000
Subject: [PATCH 2/3] clk: mediatek: clk-mtk: Add composite mux tables
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
Message-Id: <20261117-mt8196-pwm-clk-v1-2-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

Composite muxes register a generic clk_mux, which writes parent index N
as register value N unless it is given a table. struct mtk_composite
cannot pass such a table, so a composite mux cannot describe a selector
whose parent values are not contiguous, such as the MT8196 PWM source
selectors.

Let struct mtk_composite carry a table for the generic clk_mux, and add
MUX_FLAGS_INDEXED() to declare a mux with a table.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/mediatek/clk-mtk.c |  1 +
 drivers/clk/mediatek/clk-mtk.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3dfdd3a422f8..b426f7a36e68 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -239,6 +239,7 @@ static struct clk_hw *mtk_clk_register_composite(struct device *dev,
 		mux->shift = mc->mux_shift;
 		mux->lock = lock;
 		mux->flags = mc->mux_flags;
+		mux->table = mc->mux_table;
 		mux_hw = &mux->hw;
 		mux_ops = &clk_mux_ops;
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..c7822a8d015c 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -93,6 +93,7 @@ struct mtk_composite {
 	const char *name;
 	const char * const *parent_names;
 	const char *parent;
+	const u32 *mux_table;
 	unsigned flags;
 
 	uint32_t mux_reg;
@@ -161,6 +162,21 @@ struct mtk_composite {
 		.flags = _flags,				\
 	}
 
+#define MUX_FLAGS_INDEXED(_id, _name, _parents, _table, _reg, _shift,	\
+			  _width, _flags) {				\
+		.id = _id,						\
+		.name = _name,						\
+		.mux_reg = _reg,					\
+		.mux_shift = _shift,					\
+		.mux_width = _width,					\
+		.mux_table = _table,					\
+		.gate_shift = -1,					\
+		.divider_shift = -1,					\
+		.parent_names = _parents,				\
+		.num_parents = ARRAY_SIZE(_parents),			\
+		.flags = _flags,					\
+	}
+
 #define DIV_GATE(_id, _name, _parent, _gate_reg, _gate_shift, _div_reg,	\
 					_div_width, _div_shift) {	\
 		.id = _id,						\

-- 
2.43.0

