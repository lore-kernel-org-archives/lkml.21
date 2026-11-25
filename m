Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618568;
	b=y0QInxh+bW2q6aceX2VcEfsY7focTI0kgvIdshAcUelqx8TIZMlMb6mHTPAsB6jt+H7c
	 TgAsjf4xGLUskIvfMQ785b1Wh0dpPpnkT8biBs9GK6oC5qoO/lylI4mndLhLVRcTjvVrQ
	 RpkfNmywc2QJ5udYiIVMA6WLOvCjt/thOd7a1trB/U1W29pUl1S6sZE/vdTmbz5GfMuNi
	 mvi/OyXAY9yhZr7vcusegJxZLy5QCU9kuRkHnQbNKuHo6TuNz1wTQVBzHgSI9pVv31Uen
	 s56dLnWQ5WjBFzBcikh+exrc5ZlGzVe41Y4nIW7kf7g0P8npFyS0W44PbgxP/1n90Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YYfMAbauZ3UyOtNrmZ1+mkqTtdWQRKsrJ13JpeqSsZQ=;
	b=tDbHLuEYDdKrKKIs+cqCb4s1VoPQvfz93Vd3R7ARgSmmxGNyS3txKLJt4w/AdaK7KsQ9
	 g9yugiSSP9Rtc2H1LMICilPrLagxaC7kdTeC8f43n7oBGt/7idPPTr1P7MZGkzOg+BJp8
	 hwlD7yVhI95shcboiOgJFT3HOZ8EcJEmdve5RppcqLtQ+WiEFLNeu7BB/tgjYqDsqSzrs
	 ija1X1BWkVM2bvd6K2NLpZptfv36b0f/PHqS2kqJdBE1bVEX6cG62YnNR4Q5h6GlF6Yqc
	 wwvjUj/c4POzEpeqo1C2g8oLeIdmMnuHF2VwTW5o6r7UIv6blFSQX/KweVHro0kO1+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TuBgTg3J;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C9606A689
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 370C9606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TuBgTg3J
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso5162420f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618566; x=1796223366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYfMAbauZ3UyOtNrmZ1+mkqTtdWQRKsrJ13JpeqSsZQ=;
        b=TuBgTg3JUyyIAyoQXtvcXdgiXRjl6DJC8D4UeEC2QblElmxnoci+S9OVaoh4LwtYDh
         R/vcDxUsVJ5yb/ptrfAE4lo+l/usinYp+7oBupNk8tLI8H2IXMJR5WXBEV4IkzStEWO1
         6YebM+lJdT7GBKrhbD6Rl/XDYVFT8QFzJWGpTd1uADXzYZrX+9BxcF+jtJtFltAXhSQ9
         7hsHI14WKa3vEi05UFv1nmBg82mUPJ0eNLPBfzMC3zLpoHs+ULYJoakj2w8FVVQLTPE3
         cPLe4cnoWiFBkzOV7/kqQJ0WNGWanqQmFVw/wCnJKrjU9SV5Wl/3rpy+CiVweEUiIGOl
         kSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618566; x=1796223366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYfMAbauZ3UyOtNrmZ1+mkqTtdWQRKsrJ13JpeqSsZQ=;
        b=EPFuWr0UKOUe3dDMuIoBaccbZfWd9buvTBnTLFxdjI1JZv/buzA2Tcgv/rLJXgbrym
         GyjwonplgpvScF/o1650bHv9BwtXXe5KzQiH9GN6QOfbrdTrqLxpMwN7Q1pv0BQ/jIN9
         0MwtHd3QGusZC0YHOKNj3zLgjIn1M6CU4rclaC3z1B2Nn5ytEz4wsEdXhHpLoebe4bMS
         9U7MYLwOadQl6/zitNA98ZBrDYaSJZ9H0cG6g2N9kRe/jQv3EgrFE4lPj0MbilFyA0cY
         EowYS4/ZUy6zbRcJDBgLTb1SsJ/g3xQYEjOmcbFACDHI8V51WU4em5tvqeOsWulIoJh8
         Q3yA==
X-Gm-Message-State: APuU4Z9wzb6weHXv0EZuTH3gIcIxscgTBJeqV+pE2dKJwE121OT0SKKv
	e3iO3aefQv8AlGF2UjLisqnc0SoseQ5iebw2YOOobe984GwnmpJwFd7W
X-Gm-Gg: AZFdTZcRUbjFa/CDp0A0CU0KIjoZH7cdd9bogyKVrY6THdc1+w2S3qGm/EJe2eTsaGf
	5aNLzYWImv/UtBsuHxA5J6ZfeWSYCClaNOswvB0u7JIrTX0mwKiCvcmDBMsLgEGnaCjaVuB+Yn/
	pr1Evut+nmN1xwa1PhRDBBLIB9cpUxTB3Qn8w90NUlVx/fjZaaL20kiOk+N4fh4Jj1hsYUmiE83
	j6/dU3d0LCcWvIBVfrZvSAe7eswuzzIixzeIZNqGxw4s+g64TDrTAxSJlBEL0DiHDBHUIn6rroa
	yzimUz7pfWMD9Mn3WmZ3GTGguYZs2seIff/psHfGVrz4wPPT82Dk56v27oMmemuwmByuPdPczQs
	vHsJT3yjlQ8NzCoUEQ6R+KMwghoILtSmmrCKqiHI2sqqb/flMBZ2IuImVRE+VrMsMdz29Upy4DT
	0mK1uI6dFU5CUaudsKpEG5ilLUzbzwlVsucrzaCyC9MykNDbpPNxJjtzi+Mj3DBl67rrsC3bdm1
	v4BnpV6cy+DLD1Ka2EtW0v2vsMAe3EM9cq+4OlHRb91Ur650t//wWnFay9ZGBJWgi4eQodlRMvA
	06xCHPd4BUMzv0OhIuYcMLbyO2QULorffFU0Z8EyZ1Ts8+X0fT+7HNr4WFY5ycsiHEAgSZuSDoS
	P6G5QA59BDkotBhCP9HG0uiOfbt6lmWXWVg==
X-Received: by 2002:a5d:5f93:0:b0:4a5:33ad:871a with SMTP id ffacd0b85a97d-4aba56f470cmr35093956f8f.0.1795618566479;
        Wed, 25 Nov 2026 06:56:06 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:05 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/5] phy: exynos5-usbdrd: support Exynos7885 USB PHY
Date: Wed, 25 Nov 2026 15:54:54 +0100
Message-ID: <20261125145458.2594179-4-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
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
Tested-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
 - Use unsigned long for set_ref_clk_rate
 - (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
   error.
 - Add Umer Uddin's Co-developed-by: tag for his improvement.

Changes in v3:
 - Add Tested-by and Acked-by tags

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

