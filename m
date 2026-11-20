Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217767;
	b=UocHdIU+WdWnXyOfMwDIfnKzlzuDPxEo4Du5RuW/fH1sCEsCzDuSLcU5RTENozvMS2DP
	 GvYmDZe+9hpbdA4DEVpPLn1eHLWD6Ddr7x18kRRnQ1rbq3tlx+5DqvH0bo9VWwZAiaJJv
	 FV6URK1DhtmiFl0RLEjTjiQil5crHpULuIWU95dXPH8cT2FPNfhrwj7mdaXKhiGJc2rMM
	 XC9lkp6exOdGjBC5Qc2md8wqFZwyGfr9eWvsYRwiJz2U3u5dlXKZNW9LCSlXaqgZVcTDp
	 C2B4LoNTXNk8D4jwYNGk341BJYCVi+j/Z/bBquDpp8TT6tg5eftS9lj7D0u1P1aWZhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
	b=RXs1tcdq6P4up0iUgQo42L6T8tpMMt/2dew9hQ5RfMzHHhcc+MAV3QmXN7dJnifuBysT
	 1M2vKbzPBf+7d3NOkHFWqHZr3+E/VcSPNDkhREx8+T+WXkOub6L70uQe32K8lQcgv7/M8
	 qbthYjx9gaLbn+bZRuPsvWNkzNCoRwf/LTb1lZUs0mMfm3ykcN2iAjr9sMF9PEqJsOnD+
	 6Mmjyp9CU92utX3Il0jlD3wqJt+LIN5bkGRV7NyLlOQ54wKEFR/XNppP3B/GJvrdUxW2m
	 Pws/GvunWQNdoT7rmS1muWYdvmcWIczWDA9hYcxApiBF5Gb5RaT4iwdMWfIsp23s6ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRF+4gQq;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3414606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3414606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRF+4gQq
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso13865325e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217755; x=1795822555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
        b=VRF+4gQq/DsUfw6+IRpgZ4aSpvTB9u6m+rhUmV0VTSRgpAthsI4uITtP3SJgvEwa9N
         YFdjn5C7MOR+Ma7vvWPTbPwCoTbAawVEhStzZ1+XtDir9LJAxXiYJP9kGF0Bb2lTo6fv
         Di2cyTe5GqRtGYylu5W9rzm05QgbWjT9+CO/Icn22BVWpV2wc/ZZI5QzE39XpfcrXAWK
         81Fx/oARUanrR9L22Vl5KZKAcjN0rKKmS5hEdT+U3mm856RWd/ejwU35WeP1AaQ88QVP
         G6ob1IUFwT/oyOkWe05FfAsm9+ipN3dL2x8p0Y75ag1x3rcSDsvJpsHhh4ar1Dtuz1me
         +ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217755; x=1795822555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
        b=nDUk9EuOzOpUOCz+jrzNNljZVzWwWyJOOuDzTLhF+XIfNjagj9Wu90NpQmUdwkp3Nv
         cydwQ1iHlWASc2mIdLdpltsUsQ4uFmeSorkG4/pWGhF75/u7HjxLfpi0mhHEfU5dtxU+
         R9FL5FTppcXqcUgrUoxULgMIbt9aw8feK5v7vnmF8busTykwxwDa8+p/JpOXYOlJGMtR
         9VhrAcrTJG+okBLMixRvbfmKkuHuOOi8A6tbrFJF9ZqOmlCwrdFZYpFgvXrTn8Zem76a
         XxWGGaYGVA2SuwMFOfSpQyjBWSWNUEA4Yo7ejltjzVgxZGEawFkJNpfXe6IUVq0m0u5d
         Dd9Q==
X-Forwarded-Encrypted: i=1; AL+hErHJ9obTVgDHLhd2Nwp0PPVvAISHhMgulzCHQ/128fkdOnsPeYWVsBCezJkF/NT3p3JpvEN4p3N/WK8nYp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JP6seboVJlpPnyzPSA8eNymHxRhuit4k579h2x0/Z59BAv4x/
	ngop4fUgURwDoHhFKsRAPe2Th8afsyuGNlfIFPmeAG3bvUYAl6E2lnuU
X-Gm-Gg: AYBFou3RZKRoBUjLzeMH/qjUwyMwAdHhVOftRvNheUdHSK0Wz81uN+j6qPWlldn0md+
	9MDZi/qBgq7CJCOuJ1DVDBfLwKvRG4JqatKDNrClBrcMrXm63rwuf0WHwRb//mF8/ZXkTuUEcBE
	221JCiu35h4cXD9VfTcX9bqmZxIUt+oDEIQjLHcxsrkvlHlvsGM//5rAxzViL5ax/dx4zkOp2i3
	mqpYwObT9R+8EZY0LgT745IKXgWuhiWzjCra0ZDmk7B0kPwplInA8Jy++bWS4SLIhZiV8/mWkdh
	x5qztjO+1/46g48/Qk+TbNVYl399J9B9m7UhSZLp2oO6BQ6aR2L3OyRQSzoG55EEMJWs02n8z2J
	LD1a6zqSXAnZN3gPlRqROcrdoxxmXCysBPxcQRBhCQpUqwBV/DfrqWZniDl6aOEWbr65GUXaYc9
	FtkWdMZSeyNfjlrMMyiefUdVp5RlyhmRQjJXN03Xb2qVYUO9CEPHXB36JvNkm9U352gUiz7TlHo
	gd3tIwup1zTbZzP8u2c8E01LUZo4LWvdzOqErJMPj8Vn1M1g0TX1A0d0heVol6D44N8LY8VVhUq
	NnSMEV/7KIvyv4Ci+zIBTSHvSDf1pbOo8e0LQO3Sb0d6oRZkWykXF6FI4Jt+0pQjUPkRYdFQnKD
	S4fvVxkM4sPdLqXL9y+5W5hRdFSoGPtOhfdg/Mpm5zVmJ8+PgZsbo
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb8880badfmr103587615e9.18.1795217755114;
        Fri, 20 Nov 2026 15:35:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:54 -0800 (PST)
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
Subject: [PATCH v14 4/5] clk: en7523: generalize register clocks function
Date: Sat, 21 Nov 2026 00:35:32 +0100
Message-ID: <20261120233535.164885-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120233535.164885-1-ansuelsmth@gmail.com>
References: <20261120233535.164885-1-ansuelsmth@gmail.com>
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

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Rework the .num_clocks value to declare the number of base clocks and
increase internally if PCIe OPs is_enabled is defined.

EN751221 is updated to address the new num_clocks meaning.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 12a43562929b..a4a75b8063a5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -799,12 +800,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1245,7 +1249,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
 	struct en_clk_priv *priv;
-	int r;
+	int num_clocks, r;
 
 	soc_data = device_get_match_data(&pdev->dev);
 
@@ -1255,14 +1259,18 @@ static int en7523_clk_probe(struct platform_device *pdev)
 
 	spin_lock_init(&priv->lock);
 
-	clk_data = devm_kzalloc_flex(&pdev->dev, *clk_data, hws,
-				     soc_data->num_clocks);
+	num_clocks = soc_data->num_clocks;
+	/* Num clocks are incremented by 1 if PCIe clock is supported */
+	if (soc_data->pcie_ops.is_enabled)
+		num_clocks++;
+
+	clk_data = devm_kzalloc_flex(&pdev->dev, *clk_data, hws, num_clocks);
 	if (!clk_data)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, priv);
 
-	clk_data->num = soc_data->num_clocks;
+	clk_data->num = num_clocks;
 	r = soc_data->hw_init(pdev, clk_data);
 	if (r)
 		return r;
@@ -1271,7 +1279,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 }
 
 static const struct en_clk_soc_data en7523_data = {
-	.num_clocks = ARRAY_SIZE(en7523_base_clks) + 1,
+	.num_clocks = ARRAY_SIZE(en7523_base_clks),
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
 		.prepare = en7523_pci_prepare,
@@ -1282,8 +1290,8 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
-	/* We increment num_clocks by 1 to account for additional PCIe clock */
-	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
+	.base_clks = en7581_base_clks,
+	.num_clocks = ARRAY_SIZE(en7581_base_clks),
 	.pcie_ops = {
 		.is_enabled = en7581_pci_is_enabled,
 		.enable = en7581_pci_enable,
@@ -1293,7 +1301,8 @@ static const struct en_clk_soc_data en7581_data = {
 };
 
 static const struct en_clk_soc_data en751221_data = {
-	.num_clocks = EN751221_MAX_CLKS,
+	/* Decrease of one as PCIe is incremented internally with PCIe OPs */
+	.num_clocks = EN751221_MAX_CLKS - 1,
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
 		.prepare = en7523_pci_prepare,
-- 
2.55.0

