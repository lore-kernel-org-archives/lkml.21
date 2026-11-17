Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939895;
	b=v0OXzvOhjs9lHybSEbg6B4PpoaV9nErjl1fMnpf/w72RGU3vOmTCe0/EnUMf/D8sXa33
	 O1V4r8jEDQBnROeavsYUgBILWcSCYsM2KPTGSMdEfcPp2nDAvAGO/ucUENK8pqpGMIte6
	 tdU07UdSya7K56jmL5b5O4CEe3fX2t1gxeBXhsW2Rxn0Pnyks/dQKHnQxdTbF1BjqDv3g
	 ken8UU8Bw4eIBF/hvLGMlcPm2afWMAfzt8drnSbtnesAJ0jmvRq/c5Wd1xERB/2krQcQ1
	 8a+FND+r4/HA/6dq1WyW5AZ/JkQ5ulKRY6m8VkywDWabQZkGu3ARVbwKMbOXXAe+BAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
	b=yU4o2INORj4yqQZW7y0COhY618oCz3TWLA8KcDTLYfrK8vpv6GTvc1fd7idNWTOatbUF
	 wmYvjJePkfiMAu9kMv3GRU0j1KfQwliPIYFqNqACCRcUkQvHTtxJoWW4IY8goDaiwnkHJ
	 HEa0yd7VsUcf2mPkJNE97GAT0py3FmstRARkNJSYxL0BuTTSQnTRANvHV4AJB6Q9q7juW
	 l9kmmn0i4vYsIDWEciDsIQeFeYeSH2vlu+XaCcvwOOPvZE9V4Fcpr+4vcsUdOixx3+6Bb
	 tqYbqvu60jnZSEhVNgQBbG2ARVjsWicFQfY6J7EbDBibY7NzPYkFTxKJZGOtE1h0JLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ1WGc9D;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01179606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01179606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ1WGc9D
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so931235e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939893; x=1795544693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=dQ1WGc9DNBqDAEUPg0aNC8KIXUWHJew2ixZ77l0HGgOgqHn9PiCbjqnXTxB3llBzHi
         GUvzLA+hwOWP30Hu1S8qsxTIj7LjOfIZG1Ou8Qt6t7zqvoD1gjT3hjcxa6oYlOI+/72i
         9yMlL9/sywi6eJsebPYcsBRzstIaduVNLGMzOoiX7cgBY0o9jMiUD8BjPlfbA62Rih+J
         JQYAXwEMV672sno1P2kdNJSPLn2FKvw0Yp/ZstcmkJpozFJoBjc55CiOMZANSqoLbp+F
         pos2aSzzjdXrJp3vYqwWfsgWFXyFzjOl8jtfWNGIjeM9NACZppGMtZkCN1T4YmbOCJb4
         8eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939893; x=1795544693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=DQR7l5nCGnm/ib7ejP/s+OJvabo1P7bbpm4R/iuogcN0P6U7BvXRfX+Zq3znfCp1ex
         0WAtolxSQoodO9ku4HhkCk5q6u9ocrLS8eeMUQtWtVlvFrJeJtPViufdkG4URsOX5dSs
         yGCjPpTT4LSOjDDyBcqBZhuFdhEZcD5uKf5M1KBffq/ofi9CvvFgUxyW5d0OpOAenVA8
         s1w2WmzXt3EuF76L5l+p9wTh1+pFZ5xD2rK9exrfUlIztWuZLnjATtNRI/xfxRs8WD/5
         AHY2HJqJORIjBtMnHvgFVzG/FBSY+9hr8V96UBcBW0FpIqxoiqVW20ljt5qFezigldqH
         CAgA==
X-Forwarded-Encrypted: i=1; AL+hErEDkLJ/QmoZnrxYlx3JqVckrxNIKcsGFVU9DWI+XEvtArl8Kgnur8WSc/EpS4B7DYBYU7eGp935zs7TxA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iKYXJjs/5JOyyUBdyQTr333LYcdE54o8t17JNPt5R+N8t6xY0
	Jn7ob9rTrkP/hpBD0PkBYx5Lx+a/QP3DZ98smd56fZFj5q9fYPFB93Cb
X-Gm-Gg: AYBFou0UzBDn0rJ9Zxl16KN5hp8HAhhrWMfETe2qeUXagzuyd+jxFhT768yGf8g2YU6
	AyTzhurZIiTq+eqy7y8KPseo/ySw2Fb3MR66O6KVn7zgaIsJwFjBGVDBudQ9ItN47sdLRWo4HzL
	KpqxGHLjpIhjtG0bQ6patmpA6EAdI7aAHrEdAYDFBD0AdC6AZGlsnP4GqdcSoMgL5GSo/+Cmnxo
	9CbkauaAtPvALv21v93E9aqgutAS5hGLAZVXbIekaHe1bhMylUp/oRS+WTvyXebm2WjgtxD2w6P
	N/1t4ppdNFSuGiBdIMIH4QNHGfBsjZOZVGW0VfIOpAzrbBC9ENiU/vT3Odi0LNCtdf9wIUfouiv
	ZFDbcTricbuP6FKzkIpC6pCL9xPgrlEeiaYEzIRgV1MGDU5UqZxQNlXAERK5WuZkizTSNHmHZk/
	9O9xhCAlu6yrYrFqhgGS1OfAUJo+LBwvs4/Qw5Cpm+3CpnfKN6hG9NzH7ROFwXdiBQfa5NzEJBl
	VbCy63c2bsgqv9h9Ig6xj5tiMrZDeHF0NKKKRT+daAHp2I1ETAPddJOMvF5OZlzArF8nVTajqA5
	6CXyYNUrStMVUiavWxdtPXIw20b8utoQ/GQY2LH2KI5kT8JGBc6a1ygYZp5IvloNPoXQRDdlJmV
	Owdthopd9DUk4OhtiyExJ1Y20wp+tilxiXjGkfhr/v2BBfoGSiy18AQE=
X-Received: by 2002:a05:600c:a07:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb7d57770fmr1674885e9.0.1794939893246;
        Tue, 17 Nov 2026 10:24:53 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v13 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Tue, 17 Nov 2026 19:24:40 +0100
Message-ID: <20261117182444.103123-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117182444.103123-1-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
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

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..9e92586f207c 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -707,7 +707,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -769,7 +769,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1103,7 +1103,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

