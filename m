Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765681;
	b=42gqui2hFV6xHRoBo8bDJla3SEhlUpxY+/ANyfAuB/DZ2x/IoFho0TOR9qQ7z2MGVBk6
	 MRnJ4bC14JXfISuu923d8cyjiaaBM69uW0g+Lvt/TnPb+Jp45mfM462gIIWcIPwCLUlKc
	 Q+fq1ncOByJiSTeTFuUCU0m9g4DESWGE9nNvsgzdEyVlD06Vzk6ZWmWg6n7v7Vc3jkPxu
	 IEjzjJ+9Ukt0O5ns9lVTu38V69AVV1Po9tWsj2kWxF9UMpJzR7xr+sBQt/FdCrdC44PZo
	 yvifL2uNdLPmtdJf2yNQEP+OSB0I3VSCLoI7p4QbjQOhN3lUkunltWedjdtb1x63CdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
	b=J2/1q7dWxr/Klu1fjLx87alIonF8KUX5+8pPp2AFrSyoCWlLI0VUWqCDMC0yKeCQBQ6e
	 hmrxY9s4amtacxS0a3VJaZCuO4GZdHLS5fx99dCN90KJSdlMToY17yRKcM/MXm6Sk8OpL
	 G9UorZrdVQmEn1LZwbOOjZhtfhGHRleqq9MfMkGx13MsbfAr9QfuAmr3cVE+lGrXrAP4K
	 ggbqVs3ZVh1cilR1Lah+XdYhsirlwr3aDysIHIrSNQp1z0nzdx9Sup2ShMiIyngpz+sbl
	 6WoVIlN78zcKDUwlEkQ5eR9wO1GQ+Pkp8vNT5UCwHhVCsADL7QBJWeF6MTAnbW2GNjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLvBM9Ah;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9272E606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9272E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLvBM9Ah
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386d36ac055so367238eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765681; x=1796370481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=lLvBM9AhneyYjbormb7D0Ve3cPfe+mL/xgDelbQaaQ4E/vif9YwY5/+I3h+6vmH53B
         ke4e+fWChGckjjdSFy0Zg7IGFcJC6T7eAWbaDCgxuYTGdiERiXlnFguAOyPn+LjptnSq
         g7Sy32YajUJWtJTdnve1mO9P7/qouSuG28twUZKQTto4ToboujSOJXwgUcA9+xUH3vBN
         kw0Y7fmjFZ8EFdcg3TMcxJSDO86YqGrXMlF/cZyWXRrVy/rywZSQDQcDUAIvahaPTjKj
         kDI6UNAxBNdIitHFXG/gTNYXIwyFuj9PY5JQ56jv9d2tIukRoeqs7QVx1YZ7xiXofMUh
         ZlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765681; x=1796370481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=ZRL4LTWq52RJX2JeCz0WGEh2eKAndfmrtzQ69TcHez5BOMNvWQ7wynRNz9VcP+OCaH
         kTTrl5mSsFkYJ/gEwBa8HCNG3AUk0pDzdmZKpEFH1CtRg2QedCsyVcoC2+/KwteRs5Kd
         GtAIpHYmsTkFZY00C0/y0lobzynviReGlArrzDmxF6xOOwTvwT6ngHVHmjaGRhHePZu5
         v9P4Q7FRu+ioM99mpuoTR1VyuN4uihSGMmNYf7KWKnJsz4XCT37MuS3mpl7wCBOwRUjK
         KopnLwTjJeHgXO1kbLJ8mL6Va/oS2Gp9Pv19TmY2hJxZKqKNGQnE6O4DMC9wRuxIQpZb
         YMDg==
X-Forwarded-Encrypted: i=1; AL+hErH3bSxQfcTEkAXrvvzNXvWZCmHe31k4yu0ZWA2SqTT1OjPM6HHxuhgDWHM12CifwvoCJx3Noaz3UKE8xUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dLeBkeuESX0i8im0KhI5uVxMokI0StvVRBYyFyAnmbBWrlvqJ
	n5Pj+/9QMDf61rBn+Fd0mYBwL+K7VbpuqViW43RyVBnl1kDlDlLK+r33
X-Gm-Gg: AZFdTZdsbsFKLCvQ892Gw+yNatBtVUzxuCAGYsbFbNTbPUXaIbMLWjZE0+p+/14wEME
	y5xy4YloKp2eQGp7yV28d8Yui53PcQ+qnp4gJd/bA42Iwm58JW74G4jYK29KFzZy6Efo+krwTgc
	mO99+/4IAJ+3MLKoaJcFxk+PSgb1iUdg+2c7zRxZ01KmLcaUiUc9mCJlEvfeoqJ8OowPsjJrQ6M
	Cx/+ARcVrH7IYuF1nzEy4aUgR6qYPsTOVJrFpwfEV+mAjq5quggHA5qhJYz9zbkpd/oW74bDyLe
	4L12zXcjo4TPyRD1tuQd74JV3OIah0xJ57CZLjUwUkthEOovaw45IUwazDgO/7HivGj/k3/4xRL
	wtNLC4uhr04h2gBjDRQm3QDFbCnwdWrW7YYbWKoB+yssnLNTAtCW4o9PUNzYCJkgDj80FpWc09w
	k6M3YAmmo9tR2thRxZDBLs3/b+SYPYbeXWINyKp90PIK1RDH/QKH/DSkWF6nFSe46KEBGrRlyZa
	fRmT+QxuPALqU0/WiC1+Idt4RHXfGwZQeVTo6WK3uu50SilAvtteZ+qVsWTSY3PJJ4wQi8A3cec
	0jqdmuttjNhAxiM00TbP19HNnGL2o6JUIHaxDRiVSU2JcUsrMGw2XEbRLAMU5mO5ckaKahNmH6j
	J3vHisIx+nl2eU+mk/mh3
X-Received: by 2002:a05:7301:2624:b0:385:1a45:47b3 with SMTP id 5a478bee46e88-3856e24682amr38261091eec.1.1795765680315;
        Thu, 26 Nov 2026 23:48:00 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:47:59 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:39 +0800
Subject: [PATCH v8 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on PLL
 lock failure
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
Message-Id: <20261127-dcphy-rx-v1-v8-3-9ddfef99221d@gmail.com>
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
 Sashiko <sashiko-bot@kernel.org>, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=1650;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=W4uqFjWfli07BWEGnXyu4qteuMVlaJHZHz3TMUadK50=;
 b=Gu0eVRuDgeu70F7RSPjzHKcztPH+YfJNOX2TmitsSMipP6dmk3XLTBw0qxoOQ7E27z/ZVeIVL
 49W0elPOCvABZVdIcpA/1gyuWqHTOki4wOqlFDrQr9OYlLDzFUx3Z14
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

samsung_mipi_dphy_power_on() returns on a PLL lock timeout with PLL_EN
set and m_phy_rst still asserted, and the PHY core does not call
power_off after a failed power_on.

Today the APB reset at the start of the next power_on cleans this up.

A later change moves that reset to runtime resume, so the leftover
PLL_EN would stay set, and regmap_update_bits() would not even write
it again.

Unwind the power-on before returning the error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-174059@kernel.org/
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7382043e1f31..ce1bc62497c5 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1343,8 +1343,11 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
 	ret = samsung_mipi_dcphy_pll_enable(samsung);
-	if (ret < 0)
+	if (ret < 0) {
+		samsung_mipi_dcphy_pll_disable(samsung);
+		reset_control_deassert(samsung->m_phy_rst);
 		return ret;
+	}
 
 	samsung_mipi_dphy_lane_enable(samsung);
 

-- 
2.43.0

