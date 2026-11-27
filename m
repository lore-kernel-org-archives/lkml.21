Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765689;
	b=dOLa2+JBHxkJgpsID87qxACSjUr5XVgQNMfikzuCOBDtEfzQ0sjC0++Ar0oitc/3R8Aj
	 8RUyCVuguOXvNfK7ldg04oZstRoKSiqh0l70sKI2FdGFDZeCZ+IZz/3RQ+Tn2pIrl+OaO
	 ATqmTT4kjUT99vrl5gXD+MV+MvzAu8mLfU/auIqab4pNhkCRl5HFSKCwMkVDqW1ZTGGfr
	 LhQ4cNPNJWX4+LHuZBMebgySlRFbAROsXvAuIVdRUpzw0PUM9I42KPVJAR5++m6kj3ci+
	 GvAGYZ6g+hVapvBOkC/BWV5bUzGZkBTTSE3zLty5aXARQzxFPpRtGnRivQr1wUIoFQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
	b=X2GBaUFTGriRwkausLZzQGfWdZsIp0IEDR0BKhyxGE2A3Z9IEp0v85XOTPb2RewMdI9L
	 YPvMW/NdDzIuPmgnsXKAJQRa/tRnpi94rG3Xyr45C934/ICCKKQrXzxSSFAwhg7Nz6akE
	 afSQIvUOUM+xhXqkw8Um+1Pc36+rpkE6skDg26Cxl9+DbVRmtVCiXl5OarV4vsTjzIQkY
	 76ARTSSwsjcRREcMLQ871F9f8VG//M+mBkUS8dB+EsPjWhqIyEkE9i0/qQKAISxIan9ai
	 v29MeZQ70vsWyWu3fguDHqPvGWsBzV/dkezGULmSGfjyuaM1b8t9D0PkRGqdufe2uEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRJGpkw2;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E5F606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E5F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRJGpkw2
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386b3524415so852025eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765688; x=1796370488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
        b=kRJGpkw2/isn4Rto+ejdc+s1Ctqa+YRZcqilUBNRR9aMhGWTK6XV54BCE3ST8VQnrG
         +F8yd/zE7BtnlzViBMkxmMxFcnPhPo0mhP8hQtP/W94FSPlkt1Jb/lbGfHIiNfPGnt2p
         iHvf+gI9J+QBtmHQt3PU5tRy34gk0xPa6V0AxrlJ348mtGK6ArDAOhua00ODIamcdlYw
         DQfGoqXKRqGxA95Db/+MiudKPmnryIB8bXrJC3MUPPTT0iUpaCOjw9u/EmB78k6JIFFD
         isTxVZJRO5tdEDrAoJtDSeTih7cd2vStw5BIkwTyUx7IaDxUmRJu3rNuKG01SjiZJl8K
         CCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765688; x=1796370488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
        b=HYPQjxsZUPgsKyIKoJwQAZBHIzT/mfnqKHkJNDAPZOMjyG6kBWpf2/evBtoUArFWi4
         dNCjwd8YS9DAFxyOmmKTYY3hNngS/4KuAMpzYWgu0njrJVo73+kj39GwTN7ZuqutoMFD
         LW2OgYud6CtlX/1ykoTrZDEhcHaWDEKBBOGf4apExpxhg/MF4BeEo99J5rBxnOtymd/f
         teHFikOuk2TNci7HfV9enfpRrKo5kPh+OjRWyjNaUqazHfWkc2znX2oxWqWnI52tPfDf
         qurtQDOFvB68yVh35eOQm6GBMSddGRBwDf6ubIHpQrfVsDMI91FCyuGtImExZCVp6/hX
         /CIw==
X-Forwarded-Encrypted: i=1; AL+hErFC99HJUcPYMe85ECtsJHrATggktMokJGt/lNpT2LYPJULYsF2QVeKj/bVX2RFUWEwYjoX9el4h2/Ly90o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FQfblQSrCqeUOh9Tbxy9rRVbW4PisNccNQi019kc3tNVop1Fl
	Mqog1X+Y63KvFPfDx8xkvqWGBwgtxxB6QP5+7MjKK/iOAGHtU1xPJAFv/STRHCAMQ0M=
X-Gm-Gg: AZFdTZcStWHWtT1pmr9jqzkHcAm+OEfRZ4RrCHI0EmxMhC3HtP4HlJJ5R0E7xdGgMa3
	Lqo4cteYXwoyW4QxbmOe9JkQJxVQVq3uHW7eODaUDbNbkmmsleNkwK2VEec9E3/13uZz/nBr1Ze
	7xZHncAhORUX9u4cpgKW4MLxrNY4R1kdxAsUhXib0SqO9Z7SgVqy+t5UE8GoxsVYZufnjHs/Ojl
	3LNhkjVwe5QkAEL2t7u4yPxt82DC42uYbnj0S/1mUErnmMPA9YfiWRsmyoKaryJ20LTr+JdeX+n
	2zvZF/sw9tWS7vNO4hpBc+thtnhKHxuDu80QKZ6Lnz0ecYZ4gRnYuu4WA4QF9ifjyHU7w+u7kjL
	Fr3NaMsUYolArxpbsc35uML5fiXrEOtuP/3jkYhhcpAhPFXU6b/oKw7TGj0P6SKL48yVIAtQBo3
	6d/MQ5IJKY25Dv5wkcfvC20q6ulPOag9tZT3HcmYmq/LGSN0qoVyWWqokuissjeOuZ0NUc5X1jB
	8SrFIgv37BBOuPJ+jIYXCeQIY3TRKBC4YFmQCDyygDHIUxhymxvWkm7VMA4nUQA4K7tWfl+ilDf
	N4TWnNwZU/ec5RSBxD65vNIkIKtUu3c3csxCXPtPvj2/wU5/JOl5ejSjLNzrMbLFiCALQRBOY2s
	8pytb0ubjmqCwZy6euJaQ8Q==
X-Received: by 2002:a05:7301:b8e:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-3856e245b2fmr30879256eec.1.1795765687873;
        Thu, 26 Nov 2026 23:48:07 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:48:07 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:41 +0800
Subject: [PATCH v8 5/9] phy: rockchip-samsung-dcphy: Move block-level setup
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
Message-Id: <20261127-dcphy-rx-v1-v8-5-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
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
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=2576;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=jtUxPRys/dBRdscqaMmdtwL+bhADXEXJWj8FzO882mw=;
 b=jkc37NZ76qcvOYh5agQApQZtcQNReG1ovWyKUO8AV4O6rA0hn5+ykfSDc3v6dCTbakuw3whoa
 RZekMTnabqABs36D1Fvx+n0lqo98RCypPDEV8yvtWa2Bk4UHKNDLy2M
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

