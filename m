Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117247;
	b=DHk4dvS7Pcy0Br/r5DXvMKB0kD+9MmCIutFymEGjwd+iofyhQhU2dy1fLpXBrZ3sJ3RY
	 fbj48/a9c/253dqiEznh/QPFp2tGhb2FZ2FC73CYYZkZrGjQ/XWkf/zya84xSGzwWTmJc
	 31KVvgxtkkjLw/yig1TuklOg5T+m9FLHnz8DyGySFNAYX/Vr0wmm7ky3Vnbnsm1eGTLjY
	 705vq+kcVopOcC4e+Gnite5x0AQFq6ribRh4GWA54CHioz5Xc9KZymiiTkoSN17dw/UmS
	 6zXDjJ+VpRBvJR6yEqgpaJvK0gBkzN132ep0l6xBKA58bbAYsW4p8eKVUzhclnXReZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117247;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8nmKNXvKfXVV2+hGJX+cnp3hs/pqFkjNN9NDdDTn1gc=;
	b=2wHhTQ+OQKZPssd1695YkkTs7gQIt3zMkUDMLP9etjUdHYpycXS2ptyfTeCselMcJHu+
	 FmgdnaNgCIrB4u9WLLZJqe/qS31gF7sADecCIUs08TyYo7e88+yj7F6ba7kCxl4rVa+1P
	 1JfHK2FkkbnsaxUUbVKk6oItPupvS4FhgLCpvMLcub3dHWGpzQ5HWUP+Y2V2KTyFAv7O0
	 hxDN/qNd6D4k/GMezSF2JAav/hKjyh0OTi88JsfilzutrNBLMts4syMzn2o1UhLjE65Eu
	 iyVBKTaVvpayF7xVmKqsfGn9VEVcW1lQRWrEkPS3Um2j6OxUv52Ax1akKRCK8XUGrFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=R1vhd8AX;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A993D606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A993D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=R1vhd8AX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=aLQX+yuNJC189MbLKUqIECIf3ahma7TwwXSHD13wOyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R1vhd8AXky+ZV2rYsS+4HjulF+XD0Pt6aMqyGs5LFWhEzdjFsubDDFvLaNpp4tZb5
	 Mk27wru94iCTNvtR6IcaWCGMtU5Wl2WDxP/QGAv+nYAiVNd0LEaT7xdZLddv3WP9Ds
	 LQ1w8HLLTSwDPzv1y7S/MW1POA56wcEEEfaiph1TS/4b3N+czGT9cvrEw0hNRCxCmU
	 rQ3/yOIo42uX41qJ4HBbV6OACaL2bU40eJlrsi2RT4/dPDO9/VRL/HdsIfU5SwBZpK
	 GuEN+u0B4VANjFToewtRRvB2ZUbr19W0KGVsDW3GnpFAS9d931e0H8H6bjsEHsjSmd
	 /vgdg/Smnv2GQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF24917E0A27;
	Thu, 19 Nov 2026 20:40:44 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B3DCB480031; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:31 +0100
Subject: [PATCH v18 3/7] phy: rockchip: usbdp: Rename mode to hw_mode
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
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-3-fb325e336494@collabora.com>
References: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
In-Reply-To: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7146;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aLQX+yuNJC189MbLKUqIECIf3ahma7TwwXSHD13wOyY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULw7/ZADGkr0fu+wobSJAbj765iwyau+D
 QGUDMmKuq74YYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qaICsP/3K5wvfhZ3gNB2K/I0QlotRuGun5mBWFZeOgGG+Wu0T3PC2Vr+HTb7We6DLDDGYmNna
 8Px5Uki7gkSCSCN4Ug8BaNePaJi80z2Z15bri6sV8WiufrBozWB2qdzbYvXmcdLLVeRK0KbV11H
 C+FHLXl38CrY9XziVMMt2P5pTrrp7wWRvzzWoFpnOY9ty8jAM0sh6WRrf1vwjC0nnUS7Tf911M6
 4Kw5vbvRMo77gGu7Q0qNtEIVajEhPTrowqJNh7zQKltD0vOJpswk5eQgnTJZkK3OIrrvwDBQXmj
 S6+jtpONEDfQEQWAeq2PzW2gzGRIcG1YGZUKPNwKVDCve94awQYkRhnXi/YiXFclf8180f5Nsak
 YpwrBLKNsLJte5Kg/P085EsYsRVS7D+iAFRnFTxfzPt1HBkITWfmxDAsSeWfcsoDyI+Xjg3MKbU
 RigWbwOgiP0zlLa8pToj90Qs/dpo76yGEua4Xuyk+W0E951Ca5eb5ZWLVxWMw0ztEOwpyr1U3Bh
 SqGpTCna3VQrI0nCBeZrKY0r3/0sPs5aq27n9zN/kInbQv5eCa5f3bmX+FwBd59TqhJLau8rYtl
 64QwEHw5oo9Jf4TUJI96AIuwVAnB35P8k3pwmW6oqnIg3Lo/Zdn7jnZjDqNbx7K16YnUDlHM1XG
 789cRW1DGUePLb/jKLJE1Ag==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Rename mode field to hw_mode to make clear that this is the modes
currently supported by the hardware, but not necessarily requested
by software. I.e. it is only set by either the USB-C state machine
or device-tree if the PHY is used in a fixed routing setup.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 48 +++++++++++++++----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 025c8d52d72c..de8f01bd0467 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -174,7 +174,7 @@ struct rk_udphy {
 	/* PHY status management */
 	bool flip;
 	bool phy_needs_reinit;
-	u8 mode;
+	u8 hw_mode; /* modes currently supported by hardware */
 	u8 status;
 	u8 sw_mode; /* modes currently requested */
 
@@ -583,18 +583,18 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode)
 {
-	if (udphy->mode == mode)
+	if (udphy->hw_mode == hw_mode)
 		return;
 
 	udphy->phy_needs_reinit = true;
-	udphy->mode = mode;
+	udphy->hw_mode = hw_mode;
 }
 
 static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
 {
-	u8 mode;
+	u8 hw_mode;
 
 	switch (state) {
 	case TYPEC_DP_STATE_C:
@@ -603,7 +603,7 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		mode = UDPHY_MODE_DP;
+		hw_mode = UDPHY_MODE_DP;
 		udphy->dp_lanes = 4;
 		break;
 
@@ -620,12 +620,12 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		}
-		mode = UDPHY_MODE_DP_USB;
+		hw_mode = UDPHY_MODE_DP_USB;
 		udphy->dp_lanes = 2;
 		break;
 	}
 
-	rk_udphy_mode_set(udphy, mode);
+	rk_udphy_mode_set(udphy, hw_mode);
 }
 
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
@@ -748,7 +748,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 	int ret;
 
 	/* LCPLL check */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = regmap_read_poll_timeout(udphy->pma_regmap, CMN_ANA_LCPLL_DONE_OFFSET,
 					       val, (val & CMN_ANA_LCPLL_AFC_DONE) &&
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
@@ -783,15 +783,15 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	int ret;
 
 	dev_dbg(udphy->dev, "reinit PHY with USB3=%s and DP=%s (%u lanes) flipped=%s\n",
-		str_on_off(udphy->mode & UDPHY_MODE_USB),
-		str_on_off(udphy->mode & UDPHY_MODE_DP),
+		str_on_off(udphy->hw_mode & UDPHY_MODE_USB),
+		str_on_off(udphy->hw_mode & UDPHY_MODE_DP),
 		udphy->dp_lanes, str_yes_no(udphy->flip));
 
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
 	/* enable rx lfps for usb */
-	if (udphy->mode & UDPHY_MODE_USB)
+	if (udphy->hw_mode & UDPHY_MODE_USB)
 		rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.rx_lfps, true);
 
 	/* Step 1: power on pma and deassert apb rstn */
@@ -828,13 +828,13 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
 
 	/* Step 4: deassert init rstn and wait for 200ns from datasheet */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "init");
 		if (ret)
 			goto assert_resets;
 	}
 
-	if (udphy->mode & UDPHY_MODE_DP) {
+	if (udphy->hw_mode & UDPHY_MODE_DP) {
 		regmap_update_bits(udphy->pma_regmap, CMN_DP_RSTN_OFFSET,
 				   CMN_DP_INIT_RSTN,
 				   FIELD_PREP(CMN_DP_INIT_RSTN, 0x1));
@@ -843,7 +843,7 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	udelay(1);
 
 	/*  Step 5: deassert cmn/lane rstn */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "cmn");
 		if (ret)
 			goto assert_resets;
@@ -902,7 +902,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 	num_lanes = device_property_count_u32(udphy->dev, "rockchip,dp-lane-mux");
 	if (num_lanes < 0) {
 		dev_dbg(udphy->dev, "no dp-lane-mux, following dp alt mode\n");
-		udphy->mode = UDPHY_MODE_USB;
+		udphy->hw_mode = UDPHY_MODE_USB;
 		return 0;
 	}
 
@@ -931,10 +931,10 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 		}
 	}
 
-	udphy->mode = UDPHY_MODE_DP;
+	udphy->hw_mode = UDPHY_MODE_DP;
 	udphy->dp_lanes = num_lanes;
 	if (num_lanes == 1 || num_lanes == 2) {
-		udphy->mode |= UDPHY_MODE_USB;
+		udphy->hw_mode |= UDPHY_MODE_USB;
 		udphy->flip = (udphy->lane_mux_sel[0] == PHY_LANE_MUX_DP) ||
 			      (udphy->lane_mux_sel[1] == PHY_LANE_MUX_DP);
 	}
@@ -1033,7 +1033,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 {
 	int ret;
 
-	if (!(udphy->mode & mode)) {
+	if (!(udphy->hw_mode & mode)) {
 		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
 		return 0;
 	}
@@ -1050,7 +1050,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			return ret;
 		}
 
-		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 
@@ -1067,7 +1067,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			return ret;
 		}
 
-		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 
@@ -1081,7 +1081,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
 {
-	if (!(udphy->mode & mode)) {
+	if (!(udphy->hw_mode & mode)) {
 		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
 		return;
 	}
@@ -1349,7 +1349,7 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 	udphy->sw_mode |= UDPHY_MODE_USB;
 
 	/* DP only or high-speed, disable U3 port */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
+	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
@@ -1372,7 +1372,7 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 	udphy->sw_mode &= ~UDPHY_MODE_USB;
 
 	/* DP only or high-speed */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
+	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;
 
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);

-- 
2.53.0

