Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425831;
	b=afXo7zCST2oF6RzDxAArWl/LTGW6hdjgZDCqhg2aiQPm9Mk9mHPCTmHgPcmWSfs+/UUK
	 6Woh9soKwXJh90Lxg8h7itUSr5ABlPMcKbDDs8C3lDzeEiroKjbxfei/M0MNS6YutdfIu
	 mNTpHgbHAeopbZpZBCGNX93lKAmBmtplqD3+4O6sQMe28/Fm7fj9aJI+wBCsgMZKv9NGC
	 mVzGWh4AVh6HMeDUYTuvZkRauF10A4gIKSw0hR5v16Byac4Svph5mmKtOYWKh/jXLfxDY
	 8d8zN85EUQgHP6+hrMKGCdVToEqjP/BM8rH3aIgnG3f7hRUB1u0+SifbUQSDvDOmg6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ec1tqy+OijvQ1oTn+CcDpDl1Xq4ijIg/8Ri8zyKyFyU=;
	b=qNc3SAteKbH8RsTwQQnS7EJspasEb0qca9NvJYGO+m8/cWqOdK8JaFOtqe+jlMNvp/pd
	 T9DVlEqKsKxmt9l2McA0h7soYhYhrstVBTckpF8wDUpL2DNv/CgBNO2dHfma0+BpjcFLl
	 9PzUAbh6FL5J21DMdNh62Eh7gUCKzbF9XXDIBgVzaoo+jE8EUY4dqD7jdOhic1gRuwjnb
	 5BpiF1vqC7l5mf3bO3fVrR8GlyPp5eTOjj9b3N8xS63VlQSHBVTcjwes/SWuJqd9B6V1U
	 HYlASSUYDrLfQtwDceY3rGGQOmeSnT36M/dOZNlZsbW3d11E4DaiVWfPvYeYCFpwxvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OjFINcrT;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9961606A338
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9961606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OjFINcrT
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1947833f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425829; x=1796030629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ec1tqy+OijvQ1oTn+CcDpDl1Xq4ijIg/8Ri8zyKyFyU=;
        b=OjFINcrTP4JNncSN1SDqWhmGgXS7ins35F7MtwsmBhHHMpzBzA8KPKnHCtp6XxNRlo
         tZkqGVkzHTFnme1+yI0OD0RRPy+7ZjCZkZuEXjXeZIyISSE+HezF88Udh2W7ahx9EYv2
         6JxT7k4KXIJK9JVCqhMW/GoFFCtVDMobRQuppXPJ/PjaPViN7B602RS+ph/O4u0vMMnG
         BQPrMT8OQxpniSgNviH4Dpx/M1EbcURUF4c/oa0KDeFpx5ziQSSZftSOJO5levK6QY/S
         BEb13XCK38tYVvEFrkAnyXzxsM9KP4bjP0wtGrd7vPWX6KbB3XrFr2QxL4b403aD3vSF
         o1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425829; x=1796030629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ec1tqy+OijvQ1oTn+CcDpDl1Xq4ijIg/8Ri8zyKyFyU=;
        b=pfAMxUagZwqqv71vua+RgqkQCI5cU/Kp/I2eHI3qoRr71Kx6dfk2xnfmzvmugqYrw1
         4fzbdiw/I8YT0u+4lGcY02gAQYEj9A9P9F9OkjCTC6MgNcLecil8a5sNQV7vHpKh2DNP
         67UFhStcKM/EP9LJmNtKf7mwrsM7oOGtcXQAmC2ShLtnR0e5/V9Q00YBoafLMBv1XwKp
         znDEyPctbCcPR0SkcLlF3I8MT5+qQzO6TD4shURgjFaO0qo90d8ec9lA8jxU0msfXZBv
         l0B3S/QNa+wFfNwdZiAlF0cK62+h8K0Ic1Q1Wa4F9neVZwaA+Lyyv79kxc4ygibBNNwr
         WIBQ==
X-Gm-Message-State: APuU4Z/zRMDDQyf17Zz3/DahPRh3Su2Q68s1SfsCM6X3Rh3znQ793lN0
	mpTlXYsDkAAgnaAEGaBVXPApdCfxU+WsvsAoWVG2iraNgQ6YHoF7ySjM
X-Gm-Gg: AZFdTZf0YitIRCBHAX6a/rsjtyWKbKEoosuzrsRY+XYhyLMYh70vR8Ihre/gkNXe5na
	ouDzbU/WJeuNxqbpPtwPw0GbDsIv7dZUVAy1N8yGjFU0+KhM8JNcRqFEyyqL2HhvUfs7+2gMi87
	k6OlFkfar9vorgQT4IVejFXoSBR0NDeK6yB70f2VMtHP0nhwN87p3tElm/JjAG/m4fCznyTcbym
	80n3PYPA6TMARqliosZvmp/KnSFULU2oJLqAzV5NwQ4aVYppWAQjVCmYMld++eDpO8P+1WB2Vhf
	l1QLfmsqLK2j1WOxPi9F5GLb/4mvof5U/F7PQqDfpwC9xT/Yw2ARHk3VD83nP510WqbyguaX//5
	wWs/NI274+RYtaQDq4Wth19ZBUO+GNXCD5orK+F8+05P/7MYBwMDUHz1hsYwWlT3a2NMeTUWKsI
	KBkzP8F7VM1C95k73slspw/Fc8v5QBfOEuChaWEwN+rFdE9MV234xWdnqWehrE5Evt/++RfcNAn
	MnlJZseWeiSz52gkb2lzcPA8Anw4ekLWR0B6Yk8/YiEDSE7OnKmazmUkM/M9/11gqi0OFnpvFwW
	M5dGBxeACisrTxccHT2OGU7a4icKAmkFDLmsKIqA1wlspwDR0LL+v4TXCpAXPc/oBM9NTtJfV3o
	c8fFSe91jJxpkQyXZZR2acOiXXWaF4LWpmg==
X-Received: by 2002:a05:6000:184b:b0:4a7:1fca:e548 with SMTP id ffacd0b85a97d-4abb7d46559mr21264569f8f.39.1795425829165;
        Mon, 23 Nov 2026 01:23:49 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:48 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 3/5] phy: exynos5-usbdrd: support Exynos7885 USB PHY
Date: Mon, 23 Nov 2026 10:22:40 +0100
Message-ID: <20261123092244.1792040-4-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
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

The Exynos7885 SoC has an Exynos USB PHY that theoretically supports
USB3 SuperSpeed, but all known devices using it only have USB2 and the
vendor driver has USB3 function stubbed out, so we'll only support USB2.

Apart from this mysterius USB3 capability, it's the closest to Exynos850
out of those supported. Unlike other SoCs though, this one doesn't set
the reference clock by default, so we have to set it manually.
For this, create a set_ref_clk_rate property in drvdata that can be set
to a predefined value to set the clockrate to.

Co-developed-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use unsigned long for set_ref_clk_rate
 - (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
   error.
 - Add Umer Uddin's Co-developed-by: tag for his improvement.

 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 26 +++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 087d552eb511..77bba791212d 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -483,6 +483,7 @@ struct exynos5_usbdrd_phy_drvdata {
 	int n_clks;
 	const char * const *core_clk_names;
 	int n_core_clks;
+	unsigned long set_ref_clk_rate;
 	const char * const *regulator_names;
 	int n_regulators;
 	u32 pmu_offset_usbdrd0_phy;
@@ -1847,6 +1848,15 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 			return dev_err_probe(phy_drd->dev, -ENODEV,
 					     "failed to find phy reference clock\n");
 
+		/* Some SoCs (e.g. Exynos7885) leave the reference clock unset */
+		if (phy_drd->drv_data->set_ref_clk_rate) {
+			ret = clk_set_rate(ref_clk,
+					   phy_drd->drv_data->set_ref_clk_rate);
+			if (ret)
+				return dev_err_probe(phy_drd->dev, ret,
+						     "failed to set ref clock rate\n");
+		}
+
 		ref_rate = clk_get_rate(ref_clk);
 		ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
 		if (ret)
@@ -2095,6 +2105,19 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct exynos5_usbdrd_phy_drvdata exynos7885_usbdrd_phy = {
+	.phy_cfg                = phy_cfg_exynos850,
+	.phy_ops                = &exynos850_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy = EXYNOS7885_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+	.set_ref_clk_rate       = 50 * MHZ,
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
@@ -2929,6 +2952,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos7870-usbdrd-phy",
 		.data = &exynos7870_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynos7885-usbdrd-phy",
+		.data = &exynos7885_usbdrd_phy
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index db8a7ca81080..73d9c509dae6 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -665,6 +665,9 @@
 /* For Exynos990 */
 #define EXYNOS990_PHY_CTRL_USB20				(0x72C)
 
+/* For Exynos7885 */
+#define EXYNOS7885_PHY_CTRL_USB20				(0x674)
+
 /* For Exynos7870 */
 #define EXYNOS7870_MIPI_PHY_CONTROL0				(0x070c)
 #define EXYNOS7870_MIPI_PHY_CONTROL1				(0x0714)
-- 
2.56.1

