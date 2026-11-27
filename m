Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765685;
	b=O26N7x/k6pSMTwwHpQvKrAOylrAtrmBGX0diCh9m6SsSkXkUkudIaEvzOXmftI0a0LUb
	 qNPY9IlZHWrHAEBaW7rbay+6blQUXpAzOjQc80FdmBAJwMeRm+mNoEKQsugd7pu8hXOqU
	 rznx+EW7Pu1A1CpSRGp7vSXHd+hKCyQ/k6PVPMM64sE8vWX6Z6Cw7PQ0fEgNvXye/zjPS
	 e0AWTBfCEnqg8ODAVFRqzEqslIT/c1ft9M83tQGAOFuzRlqkS8sb7Rp9CtjkALjVPbwfC
	 c7Qi3j9R7jBPwyvwhIx2eTq6fOvV89K6umPapBDPm5Lv3c/uwrUsLmrkEH5cG/AhuKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iHpEgxPbFinlelTShydiqMdXL6WmYaYuO85mjvtFPkY=;
	b=IL1pVVjFORmFxx0RAASEExAtDPQeWYNMwnPpgWhZwvjDBwtoRoK4p60++cHUPqcQiDn+
	 ujdN9xacNItfiBTme235AM+cNMVB09hZLgZeIlKtg7rCkB1qG/3hjAV6oY05RjaoVhTq4
	 Vk5PEvZG+gflrV6OIeu4vdJoa1eUuSrnFomyCFVtBpGV2VCb2AWJGFcNts1AJt4Zxvjor
	 NtphA4ivGPclJJhQbVIibMyN7IpHEkAWV6/8nFxHxzwUlULtMSQQT6dypvqcGo19dLzT/
	 L/civDSgHix1t89ok3qYHzxtfKwjeMNpKg8OxImTj4V2QEmGaPDe0PfMmUJAq5+I/Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OupVADoP;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B827606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B827606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OupVADoP
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38622e0dae0so837567eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765684; x=1796370484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHpEgxPbFinlelTShydiqMdXL6WmYaYuO85mjvtFPkY=;
        b=OupVADoPKnIg4AXXB37j4VL8B8rv5yYKq/difhtktuffMV9G6qJ3kjxV5pq8h8uMB3
         hY+qOJG5yWp6Jn9dOkuQoGLLfVx6FQ3uywqIXSeZy0NGT4o3gMMim4WXE0vc9rUpXKgf
         btJzUf8dGl8kYoV9+pYMhXNSO0QdjHscr4s9QeDSyBuX2XqjXP5+kLs4glM81+v9eTKH
         216+KvY0djEkKpmRdzFIKP2FncJqJlSlNLJB4d8vsBjeHmJMsOzNpEeQLw4ARloKoRP7
         E5/OgilZytF0Xbj1d7DIobGx1P0tTu8BYBIuO/Srp80dHrlbhMj6QisJq84vVRjyi6LV
         DRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765684; x=1796370484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHpEgxPbFinlelTShydiqMdXL6WmYaYuO85mjvtFPkY=;
        b=KSzLEkWjy2F5hPjYESA37uk6C9UqmRD6ZnRxV70EcmvO8U+uIIfQ38TG/Syasm1adh
         vjbC7NZ98H2UKgswzeHkzhv/vChDQ+hBTWqbsZ9CDJvbXr5jnz3hbpxrqPNj8x7hbNS8
         EINS5g21SVuU1dYki/wjmnOh/q01oKA+t5zL47nQt7Mbii7RuEQ0+FhLN96yIprNBBXO
         5pPyLY5sg9WkLbbweOf0xdKruftzbftnBawVAHNY5GHZ1d1XxlhlviwlGjGv+wwlsDvb
         1ekgIO0XFU1IxZho3xQoF9TTDf3f8R+Aom11MGoTG+LOK7fhbZdyl0nHLaR/TIW2EMts
         jpWw==
X-Forwarded-Encrypted: i=1; AL+hErENDLJjlBi719RGFJsa0WWQuuCHkdnL9ya/hJS2ErkKM5ZEMsFdsk+OKnHAZ9PuU3NIU9GANZSqXqy292E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JxvfkvVTIWFIlnqQtRdNHIGRCdHmAUZ3YIVRznUiZz8zNSDjl
	jEMIO1C06A63Lbu93i05aTwiUgpq10zVv6VUKqY8/yveicTHEkYsazZ/QZEiueTx/3E=
X-Gm-Gg: AZFdTZd3QKlGDLhZgmvK3r2zgy0NIvO9+P9EVS/CKNsBG25FtyRviMMcExWFz+IA9el
	ZhMnInqlK2tVCxS5qbLaviHjTDHv8QlZrDXc73TjCsWBFeiCoAUGh8yG2zzodS/zeDuejEbF/wg
	jX6uSQB+RLgNdS58ajGBaBzsr0Dw148lFotV5gR9gMUXkLDnynGST2LdSCJXM95ezQkRKnaGcxl
	yZE64baJ7d6F4Q6BTzd6gnSBK5ukv35fihPd2OmlofOAHthQ/yF7Vy823I+lLpb2J5sSDCZr8tT
	jiY9ZwrGL3y53FvfE4yOGVifbBrL8MDjUJoBRG9PRbsLOGTWFns+5SW2LDOrJfamgaCsXQst1FC
	sktcOcBxEDywV6zPAEkX5reUFQKygbtJd+g4LAlgxS+7AXnarwIcBxDs7X9G/kcli/GjznFly0s
	VgcK/Ky3luPju1DqtmFrO867+g35WsGEjBu0SgrcKPQw92fErhPe0s7x4tVNMeeg9p6ynh1GTVJ
	gunmJRLoH+c4Zd0msT/7i45DoS/tNmWKW+CcqNlSfSPbFjHBN7SIqWBK6jHsittm2CCBHagVBaL
	+iMT77OQtCCehovGcbyndi65mGPE26Z8cMVncicFbtUNI5tfFU+s7jRG/ANRxUMREcetzWI4bxi
	U0nCpXfjrs/5RkmnU3szhHrwK295ljt2MnNkcCIiXyw==
X-Received: by 2002:a05:7300:16a3:b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-3856ef457b6mr33768253eec.2.1795765684101;
        Thu, 26 Nov 2026 23:48:04 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:48:03 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:40 +0800
Subject: [PATCH v8 4/9] phy: rockchip-samsung-dcphy: Always write the
 rate-dependent registers
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
Message-Id: <20261127-dcphy-rx-v1-v8-4-9ddfef99221d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=2791;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=jOoW884/QWxzl0iQgg361AUaX2tfS/RGrsDEUvgeOSs=;
 b=hPBLNjjuOTIc3cBAJzDu1xkrkYERbeogg9sjLO6cYL/B/adWhR2voAT0ohi5o9AAmx4T2DAYQ
 BnLtae7WCVIAWy0E6nd+AST0xO5XR/T4q9VdBMPusYv2+uqF2hwOj7t
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The lane timing init functions write DPHY_MC_ANA_CON1, the four data
lane ANA_CON1 registers and DPHY_MC_DESKEW_CON0 only above a data
rate threshold, and the registers have to be zero below it [1].

Today the APB reset at the start of every power_on provides the zero.

A later change moves that reset to runtime resume, so a power_on at a
lower rate after a higher one would keep the old values.

Write the registers on every power_on, with zero below the threshold.

[1] RK3588 TRM: sections 22.4.2 (reset values) and 22.4.3
    (DPHY_MC_ANA_CON1, DPHY_MC_DESKEW_CON0)

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 24 +++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index ce1bc62497c5..7a009d87a665 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1228,7 +1228,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MC_ANA_CON0, val);
 
 	if (lane_hs_rate >= 4500)
-		regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, 0x0001);
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, val);
 
 	val = 0;
 	/*
@@ -1259,7 +1262,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	 * under 1.5Gbps or equal to 1.5Gbps.
 	 */
 	if (lane_hs_rate > 1500)
-		regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, 0x9cb1);
+		val = 0x9cb1;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, val);
 }
 
 static void
@@ -1284,12 +1290,14 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON0, val);
 	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON0, val);
 
-	if (lane_hs_rate >= 4500) {
-		regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, 0x0001);
-	}
+	if (lane_hs_rate >= 4500)
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, val);
+	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, val);
 
 	val = 0;
 	/*

-- 
2.43.0

