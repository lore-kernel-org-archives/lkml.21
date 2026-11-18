Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981365;
	b=Ez+cANEnm3fehu+m806L6pCZKv92vmtimOQTN3D94FlNqxeYIYsKGa5k/I/lrMW/9wV2
	 hVkLceg3BtQVdPU8tbVa3MlWQpfreZArGygXM3abHtSO7dIS/iVe0NM/nHL9VHidZd1WA
	 FnuNLd+er7kl8wQLCqcAPVy3bA0P/t4bRr1VuptkJ8s7/60EW1qbmdBsOft+kwjWAmedX
	 ysF4mBuTTsD7eDiXS/3mqHfFwzVOyJRBQ7K92KTeNPmWhwShZ6l6rna+q9yfS3LAxGWKS
	 xEmIohik3Edjnh9OCNWW7Zx99s5JOGQ8asDBggWqupdNNaP2TrqxktF9vgmqU5HJS/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
	b=y8CpUmdYFWQiulT703tBAqZkZwp3VCuu4QPwhhu4eVPHY05uiPgeDKClnya/jPuvpgUv
	 TF8xsxsL30IWBinIdJW9r2j8PuYEq6+ckdnLUNWhrn+1QbJv2HrxFcoZ2Tv/1CVPHEH/O
	 Ym00WHfCtjfkJ9pjkkM+Fp543TFGnieBh5J6sJoywQCKbQUlKsmhk9Xvsv0WrNgMrKPLj
	 J2QrtM6SWoLyNoHQO4bn1HaR8KdhOOu65Inyi0kCTPbIJRJW5NLj06fwAJlcyJxzbEJsD
	 G+HsPiMGKZP05OubD3qj/oLlqJpBM3rIoEMwDyeXbv/2ieXA3VzX29OLfAl8bcrBJeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dOC//fK9";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A610A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A610A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOC//fK9
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89ecfdbe443so53636b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981364; x=1795586164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
        b=dOC//fK9yMGtyxN5kDHTnR9tlM7/jhsLLym3+nuXtPLjesXSYiT9qu/oSXHVL8jCRc
         EjzRFhuNY654HinehtCkBEGizuNIL+tf18KAJseHtk5t43+g/QBArziqYL7ToUf8w4kj
         y/EABkM9SY4UfKE9KTrZlPw1Ql1EsHJh+6r2/KJ4z8tUqHXhzCCJq87c61GNOE93kODT
         cnfUqHs96VzacqE3VXvksBb0HkBcZ6atsDomJx+bEW84zKEKuKWXqfKWfi/GbBfy7YSn
         wZ9jsnx6JfWzgyrVIl/zF42BzRdGZNAeuEzB8j3W/+WwVS582jYrQMFfVLRVTxfHSbeQ
         z+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981364; x=1795586164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
        b=mKB8VTZX9TjItEvGKOLlp0yMN+Dh+yskcmD8f6IwUMznjJX8tdmxRIcXJs38nMY6Ol
         MD43B6bHlrmxfMw3GkcqNlaWXnC1Jd7y6Yrg1huJVDX/Aal3WFXrSdTf9I9PcfnkIumP
         Q3p9AseDnyvCtbRx9JhqIhyFoFykwfjzdkhTu4CQ0f5P40sPlKoF9dD6bGanJLOop1z4
         7QY9ScezBw5c0ONUed2GbbmKmU9QzVQOQv8MvpIcUn6RzQQ3hoQAgF1kdD20sjfrbQ0u
         9EWuoVdQgmxAK+kpooKJSkDkOGj6KQxROmxyPHJP6hw2UlHAPxagR9phyat8+sfzk3tE
         NVQQ==
X-Forwarded-Encrypted: i=1; AL+hErHsBUgB8b2eK//Af95fLyLUKmZoJqIJ+aeBIuaQ/B/97Ho6g3XViLZ3k/ettZZLX6eDeGzaG6LR3i7e+Xs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X8fO29LakTZrFXdAdfTw6WPsvyrgzGivuptdzMrMmWzzW32w4
	X2vsV+0/j0tgalxPaVatovSJmuEbBoj+OdvJk8P9Mjp58qc/6oN72+2R
X-Gm-Gg: AYBFou21NKlCXjZpUa4FxBK0/hgdfVn6Mc2LH9x6paTx4IuuW0S65LV8zfNMtUQ3ceB
	0Kw8EQBvrYpmd8lv2dE/WecGKWwh/5ojVVnuMi9b9DeKECgjuzOdqgvx4D1giWrCaC5L4qdn7Nt
	JNl0GJXGN4cwZnZx+mr/tXxzhfqNAdYXGgQGqqC/39tzLnxfxGvTTGmNxafKoVpCkf9+lW6dxl2
	uYcy19kVC70TMdOiJ2yrwULxchd9on4a8nocU8i+SY+8jjNhTwSx4yVGm5F7LNNkyqLzWxPOUg7
	0rcxwphY6lzew9jV9f4HS/hYLjH230AvTj0Qz6Oh0tzxOst26ljcSyK7MVmcpTQq5NTx6H6wbJS
	+C9TjHNO5GW4mSUodBCmoKhBCZxqLrPqUUh08/uesHQdvKcaK96AleFkBSAyAnmW1zpz0hfSPsL
	rr/td0PpUD/DcePKfN+EUxDVJXzY4mIbUVdvL6YdqTFOUBIk/N4mPdqR60zRmDaVOjDHmeFdeMm
	80ISvQmBAmi23xnvtHyn2BVA6mpAp3SYOd+xkKxkDX7TbMoJnTezy5xYyPwsc5tnxVwxHEOOXua
	5tGJG3jAT7WKH/KQhglNZwYL4kOdRYrdFuZN51Bjj52huZ0F3qePfk8eAdDdr9PFIuJqrIcdGdv
	WAwjqvmCQCBfvxflSfVaD
X-Received: by 2002:a05:6300:270d:20b0:3fa:c9d8:658f with SMTP id adf61e73a8af0-3fe893f7618mr1954376637.2.1794981363700;
        Tue, 17 Nov 2026 21:56:03 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:56:03 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:18 +0800
Subject: [PATCH v7 5/9] phy: rockchip-samsung-dcphy: Move block-level setup
 to runtime resume
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
Message-Id: <20261118-dcphy-rx-v1-v7-5-8de1adac3a74@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=2576;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=jtUxPRys/dBRdscqaMmdtwL+bhADXEXJWj8FzO882mw=;
 b=UroCCPoJ8igH1/HP9OY6jDPFTILu0l5ZeEUfeBcqKSuK7zWUkiNd/OQKmsAoAfLFt2JaaWlW9
 jPr/Rva0/P3AOOYghEgZn1HzqiVjuMEoRxkhjnAOn+R30JcoqfjixUU
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The APB reset and the BIAS references have to be treated as block-level
[1]: both the transmitter and the receiver need them, and they only have
to be programmed once. They are programmed from the transmitter's
power-on path today.

A later change registers one struct phy for each of them, and a second
consumer coming up would then reset the block underneath a PHY that is
already running.

Program them from runtime resume instead, where whichever of the two
comes up first brings the block up and a second one no longer resets it.

This puts the BIAS writes ahead of the per-PHY reset assert, where the
TRM's worked example has them after [1]. That is safe: neither M_RESETN
nor S_RESETN covers the BIAS registers, and the values written are those
registers' reset defaults.

[1] RK3588 TRM: sections 22.4.1 (address map), 22.4.2 (reset values),
    22.6.1.2 (reset) and 22.6.4.1 (D-PHY transmitter start-up)

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7a009d87a665..d6acc3e2d448 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1346,7 +1346,6 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 
 	reset_control_assert(samsung->m_phy_rst);
 
-	samsung_mipi_dcphy_bias_block_enable(samsung);
 	samsung_mipi_dcphy_pll_configure(samsung);
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
@@ -1373,10 +1372,6 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
-	reset_control_assert(samsung->apb_rst);
-	udelay(1);
-	reset_control_deassert(samsung->apb_rst);
-
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
 		return samsung_mipi_dphy_power_on(samsung);
@@ -1667,6 +1662,12 @@ static __maybe_unused int samsung_mipi_dcphy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	reset_control_assert(samsung->apb_rst);
+	udelay(1);
+	reset_control_deassert(samsung->apb_rst);
+
+	samsung_mipi_dcphy_bias_block_enable(samsung);
+
 	return 0;
 }
 

-- 
2.43.0

