Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939898;
	b=0aCuBoKLNOAH0Pdb3fatHSaytDSetjQGDAIAh+YOi+6Tbg3B4la45aZ7Gzg14t376nSP
	 H9Xm87jNsKigGKswqw3RpAjP93SgSu++yU5Dv0HrxvZb12BK6n3nkLBIpyfv3fC5ldcgn
	 HWilwSr4Nad9FsmfICCTg/4Rf9gDW48R3zvlZbWnmG9sJAfIAp2yJq8r0mDZeLxc1Ptsb
	 ElajpN6hlgZPnalqtFqXPtafpA1oF/pm5K3EEcGq+eZqtqizK2wo/Y7BIKysgfMreZ+Dx
	 iRUBEmVqzchOjCXsnKq9g68Bym6fRAPTcvmEZgusi8mBx/wCHFSCOLUp0eTrTcr+ieQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3T0UtHpv3iva10MQL4+oovUpl39KWNdB9AOhKqGwH84=;
	b=zSSgJqj990SOkPnOFJ/IEVUBaaZOG8EoXTaOoQjbla+miw7jcMA8rVWAtA+8s4D33dWd
	 iDvU2n/sMPf3l5LsFEHJYUYXgBuKNscTQCs6ja333k2eCfBho2SphXwBt6a1kZ7AN9k4T
	 Y4ehzQA335B3+Dpd2Fl5hCWqXqEFGUeC0fD8Cxokp9/iPcMGRzsSwMIw7sTsrJ1Om9FKv
	 QB2JloEKe0XVZN4W+ogV7zqnbKI3JGwvC5ou+eVfewXx6f2vB7fN4AiJrSx4ma3E2vfSk
	 XIxD+LyVr8QXRiieet06DBh2AqwbhET+/ZYBAmTbrYe+qybVLrY+wqyVJY3OVYTbTOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSeXD8Ic;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07247606A88F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07247606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSeXD8Ic
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49d64a88222so813814f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939896; x=1795544696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3T0UtHpv3iva10MQL4+oovUpl39KWNdB9AOhKqGwH84=;
        b=HSeXD8IcFiP/6H1TpvFfMVsRVZcLHCHbDQpV7AQt+9sOW+UhwgZTIuwbrtNGfo36IT
         pcA33Z3uXJLhdFJvOUlPpJcIf8/DRhKZ0xNenjB5puKyrcgWg3tXFMkN0T63Vz2k5oak
         CyLmoaJMKDdmjp2hhkDvAbTYt6vb6pBVeafFwq3UBRi13io0Yz6vupvGvQ/jGV+aSP1B
         lvO8odpXLNPPzSvEhsyBRzb0zAw3EF8Rz1IPe3VYRXmK5+Wb65GAGxNJj8x6K+6THusq
         K+QwAHwWsCny05m+QOJJ5eQNOE/HUuF9Yx7jlQoqLz+DywdLZghZWypOyVxwq3HvuwBI
         haWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939896; x=1795544696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3T0UtHpv3iva10MQL4+oovUpl39KWNdB9AOhKqGwH84=;
        b=yPGFeGd5iobOuE4UweZqdypIRGCFj/aZ5Bz2vXc51qixADPTjZvjimiqzg2m4o5m1w
         eZIr1/qOztvWvtKXOiQXinrpnBl4yEFLSvurcfGDxaLTEMEOMzZJp5+7ZtNXEmgjhCXJ
         CiAwbmsQDdQqHeVDzUP/ARteeFcsPFv74d6BPaPvEVxr+hxhtKZT6mHWApf2/GEi85iE
         yzga2yMtlsVKE4B8NE8272nyot+9eARd1R4qoex7nstqV+zAsbDlpNn9jozdSzPYsUiq
         p1DQq7VveWYfi5haOFQX7GppxanEPAPP5KxmyyU68wcRnLrL5ZR5fxi/yGYYzcFDfs+d
         tEbg==
X-Forwarded-Encrypted: i=1; AL+hErFcmocpnI2ZqB2Kfys4j1VAbKo3Z+pbcJGf+ktisuCbhxsNrb7b6CNQp2O9b0Trc5+s8P7EMjuA/bW3VTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mH9G1VCZuTpPIS1UV/EIr7Tlo3a6qdDt1yoXU6YN9jCIGEbo9
	BLcd6oKXqd5hrDtxhjp3rXsfGZnRa7Ya5805Bq778t+DMPhGa3L0PWBW
X-Gm-Gg: AZFdTZdg10TDg70jBIVQvZZAqHHu9RKvF7bx6tgtIGheau6KeQniswHqMO4qSqKc1oA
	yqOkzKQJTA/1WJL1VnG6FzcoUe6a/HbK8GQ9ky/+EVKwvbV2XGcwtexJDP/jBRSU4EN+1qdVF4n
	xAwXh1wlleMzyhLMouSUIDQXOlQGzxmwj1QpQ0sfGl1h1YGEcSHaVja6dVZVgtNMKY7nqlmx2Q5
	dmNZhifVDHQ5a1Fxtl4mcPOo7cXHt7fgNyX/xKyERTzraT+p/rjOIIgF/fpNLwrrkDfaTgqWsO3
	G2RKt6NpinUgUhYI5Oq5fV5V9gmgFvDfDa7Xi3ZI/bUP2mh4oEpevKA37JsfOYAXQmay3IK748B
	YOebJxDO7aZ6PN68uiuSxBDw60+sRlU3jYY8RKq1qIgbQK6zsphczVorVVw1Vcd3lW6JiBCUmjz
	muWJIRJeJ/CH+LtZInTAJwQN8KGAq5O/zvb0tfLq/usIKWSeCiiodDA+x/l7u4GHAjk+No0mpV2
	J8IuDoKyxZJ+2wcTmk/+2N4RPFnQ7txgPDW5bAMFm2B+bxxdFxlCsGKcyOLbsQTSARoFtAAiyg0
	jqVmwvrab1aAQq8DNVE0aG7rhkbgVclkX60hOeGdZnUe588zWCNR6WgS1AKwQG8XfGmoR7tCTtx
	NBBq1kYTXGxLWCJSLJVwys5n22Y89obCj3w==
X-Received: by 2002:a05:6000:4b0e:b0:48d:f852:c66b with SMTP id ffacd0b85a97d-4a3771eebffmr7414445f8f.22.1794939896438;
        Tue, 17 Nov 2026 10:24:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:55 -0800 (PST)
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
Subject: [PATCH v13 4/5] clk: en7523: generalize register clocks function
Date: Tue, 17 Nov 2026 19:24:42 +0100
Message-ID: <20261117182444.103123-5-ansuelsmth@gmail.com>
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

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 6aa6dfaf414e..f12b69f8d453 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -802,12 +803,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1286,6 +1290,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

