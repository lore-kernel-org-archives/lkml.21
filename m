Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981373;
	b=uEZglU9ke7B8MyOgj3Q2JPfOpRncoRonKOuG02N03J/JHTkEqC4s/tSyxrTxXyoESVbp
	 KRB7tTqZlNafNctY4IgIwxhUU7591LYn8Em+vSxLkmTJmIk9Y9ap+QzykFduBzx+Y7mJa
	 Qlg9f4MiK/xOH/u4mTecWYLFQ00IdqTwduf9HDwIWvgcn1+bL7hBffaT4gm6gTmJltlYr
	 zp+RDwYjO+o4E6v/dqhRXhL37WIlDoJfXwmGk77Q8idsdlFH1SNJhxRpv2X6z8hPeCIh3
	 AsgyHsTzPaQWcPoca9ehLil9zwpt9aW2H2Fv4z1UQKuVRSmKixTSKJ93bqjqImT1PJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=;
	b=V9+JBYANC5AmcRSCI/vtI9jLJqtxpTkXp6sWyxRNmwRu2Ed5cc4Q7Nkz0it+EDvn/iTI
	 AN42kIymjqjK+rHZnquinGJvb4qH8qY4Tx+g4gV86LcntFl7OU1bQTd1aPP0jLVpWAoGJ
	 rvpVAgcbVhg5zaRmi29uY9wwR/pu2i+PExd/QCBr8IfTvX/862XhRFzpJnh71pWfUwWEY
	 B8TUnMfYm1x5C7cUsIez7Mptho7i4oExUI7h5y0IMpR24pUBc6pKVLGylw2YcIh/jTvgF
	 sbuTobFYhYv4bXAIeqQfJHU/Cc9Bg74n64MJUuYypb0rJLyB1pFqZHAOyw1eEOMijTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvBab54C;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A5606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 055A5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvBab54C
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2edcf6c3a57so820685ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981372; x=1795586172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=;
        b=SvBab54CdwyeHeoxJV06gudiItTA/4dy9BLZqox8SmOeEwdKvNPmuU3hShfLb1ap8L
         agg4AGDEkBRbLRMUbDz5AvLVm4hHdgNaXbGqjkg/1isKZ8b4Ik8kF/9bsyPak7IfYQn5
         sYUIndI0C/cmw8jTY8P8ValrSFKy4wx9rXhuxbpLPlX1gZ6wZp/JcVH4nxk8snuZ9kwK
         kpbD2isF0BzPs/jH0NL/o/PNQVIn30bEz2sDGuZ+ovf5Y+bS+r9B0LYdp7jdkYZVHul2
         qfhrpWZSUFa1vX6WXV9KLQKHLtgGhK+eoCnvlTi1zhDH4TIWXVriXrvNaYG5RnrnxmiP
         mfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981372; x=1795586172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=;
        b=TgIp+TKSZKPaWAbsrjgnB6QrSQW/9zs7fLvsq66Eg7k9PsUQdVz9LAukhPmR2OxITt
         TCK6IVqJpCqxxUiuTZK+eys2yys1o0rf7st491O609kf5H+QogtWT6s9bBX4m0wHusbn
         dPJDCkAc0WWX8zwmoPq/HjIpOahxLgv64cxk9ymC63n062st//QwxCVIDBWH/56ZraEE
         hjUBY9aL6rl3vUvJrDO9FoA765f/Xeaw9kym99xaaF1ddRyYqjg2uH43MYXjA+Svt6WO
         Sv4iSVtu844ZrltmbA+tU2Hwla65Z2J07zwbz6VFcfsCFwglvhvKqSZJ95muOg1ms4mH
         Q4QQ==
X-Forwarded-Encrypted: i=1; AL+hErHZO0dTfWxzsY/XLh3Fa2oHs0xmIhBzqlRHzpjPwaih7vtKNpS1x3Jny764F6VV4CpnaHVN4FZsTQD4tMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VX6lg5+o64ICJ8SIa+3/tglICvfKGz4n2C00T6axB3ifeN/Al
	UuAMlSIOAOz81NSU1p9doWmtJSBANRilbnIwAKKkZVPdB0Y4Ekez9sWi
X-Gm-Gg: AZFdTZc5ONbIEl6OhuHm44y0ZqTUF9k/4M/KiNCQE0duxVzWKbc26tTA/LeOC2BMWlh
	clGmoQJ9VJYxYzKMLUTOKrFhDzkVAOGPOocwrDsbMkLRFFjYWzZVD70zn2EaH90dPQXKtFETipI
	/ibxGCntzvwzKDcP5RYGCEW4pM37a2pTgCBzJ+tAJ85PyRGRa3WTwIuuyUZmkoJWWZHYzOK8tE6
	xzhNfau1AFgVCNgLT+hJNFlSpK08ynZqyEQfq9zWK8c7T7PGCZIE9kKqvsyoRLBKlooCdG6rZjw
	fUrjRNWlD0HucDowCI2Pi7ghXkhU4BfX+oX0oHcDYw5PiJ7ed1OMb2ZWRDQS8cZlxSPUaHtfXx4
	C2Dqd3u3MMsKyHwrGps5t1RPk5+sf3P9XcT3fjc3Vf7bl9gaHSmO2ffa/LmaHzbc+/itUJqgoRI
	J30pUFLQkuDKdPXegJtRi7tVC03Q2SzWp+409yeiEQr+ltPgLI76PnYpftmG86HjRf/rFbntKXG
	Dvqt0pEqBzZWrC0JAzL4hhm+LPorOn0I+JqM5nRbTAM+14skDKmbhavtoqqonXnOPaU0JRNeMUs
	WPB/pQ1jh6ydWRnq9rlOI2UB+UiUbLuXVDg1GJgfS7jtvZW8+ciU3IFFXPtx4m0P4f7gArasN0d
	1vl7eSel19XE5nYUNTnXP
X-Received: by 2002:a17:902:ecc8:b0:2ef:de59:1af9 with SMTP id d9443c01a7336-2eff72e8f80mr25437235ad.2.1794981371982;
        Tue, 17 Nov 2026 21:56:11 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:56:11 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:20 +0800
Subject: [PATCH v7 7/9] phy: rockchip-samsung-dcphy: Support the new
 phy-type and direction binding
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
Message-Id: <20261118-dcphy-rx-v1-v7-7-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=3409;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=v0EnQCVIVEgPp9E4a7EtrkAw5gnRZVFlWGkYOQI4nos=;
 b=Hu6MAklGjeVCpir6ktn95rYPoDSD1n1uj5jiv/hOFAyu+4U60TwODMSVcfBTNTIl9RYzawGr+
 Dz0nfb1zvl2Agytv2YXgVFyTVXlYD4YF+cGciXq0lX0Bim1XPxIKk8h
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The binding now selects the PHY with the cell and the mode of the block
with the phy-type property of the provider. Read phy-type in probe,
D-PHY by default.

of_xlate() returns the transmitter for PHY_DIRECTION_TX. The deprecated
PHY_TYPE_DPHY and PHY_TYPE_CPHY select the transmitter as today, so
existing DTs are unaffected.

A phy-type other than D-PHY or C-PHY fails probe. A deprecated cell
value that does not match phy-type gets a warning, and the transmitter
then refuses to power on, as in C-PHY mode today.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 32 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7a62db810d4b..1228bd794759 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -309,6 +309,7 @@ struct samsung_mipi_dcphy {
 	struct reset_control *grf_apb_rst;
 	struct samsung_mipi_phy tx;
 	u8 type;
+	bool legacy_mismatch;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
 };
@@ -1384,6 +1385,9 @@ static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
+	if (samsung->legacy_mismatch)
+		return -EOPNOTSUPP;
+
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
 		return samsung_mipi_dphy_tx_power_on(samsung);
@@ -1557,13 +1561,21 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
-		dev_warn(dev, "phy type select %d overwriting type %d\n",
-			 args->args[0], samsung->type);
-
-	samsung->type = args->args[0];
-
-	return samsung->tx.phy;
+	switch (args->args[0]) {
+	case PHY_DIRECTION_TX:
+		return samsung->tx.phy;
+	case PHY_TYPE_DPHY:
+	case PHY_TYPE_CPHY:
+		if (args->args[0] != samsung->type) {
+			dev_warn(dev, "unsupported phy cell %u with phy-type %u\n",
+				 args->args[0], samsung->type);
+			samsung->legacy_mismatch = true;
+		}
+		return samsung->tx.phy;
+	default:
+		dev_err(dev, "invalid phy cell %u\n", args->args[0]);
+		return ERR_PTR(-EINVAL);
+	}
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1574,6 +1586,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct resource *res;
 	void __iomem *regs;
+	u32 type = PHY_TYPE_DPHY;
 	int ret;
 
 	samsung = devm_kzalloc(dev, sizeof(*samsung), GFP_KERNEL);
@@ -1628,6 +1641,11 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(samsung->grf_apb_rst),
 				     "Failed to get system grf_apb_rst control\n");
 
+	of_property_read_u32(np, "phy-type", &type);
+	if (type != PHY_TYPE_DPHY && type != PHY_TYPE_CPHY)
+		return dev_err_probe(dev, -EINVAL, "unsupported phy-type %u\n", type);
+	samsung->type = type;
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");

-- 
2.43.0

