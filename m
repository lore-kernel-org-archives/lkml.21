Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581464;
	b=m8Qw4q3ZVOJ0RgvD1pAc7xCc3mqfFv8rVZj/OHgc+CBNc2N/cappAWbfPW8VRceLcEyq
	 G38JTTd4b5DSsDmD/GX0Gena/chIy7jZDWAdqCZ5ECvE866F9zdGEHxIqN14iHebA5tBy
	 UxE7M5U/2AET6M+/pBjsBAC+xGPPQNukKbWkTFpxP/YUqw8Gww3I9SQQHJPoga2FAZAnr
	 ErmoK23q7rMF0ToUOALdpZaB5sqlXj4zxeKko3p6o+0bxGZ0Tmcy+X8EG1yulCZlcztNW
	 84riPIdthhk7EKgurti8Fq4Ehgxcl+ZiszPXVwx5IXahNTPjiHHgYCz71JPuLeZSM5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Th0U5TzJmX7EaDDFA+PHgDoYo8RCe0k6TY8cW8gRTLA=;
	b=O9j6k1TaqK49ZggRsYvMhiRt8eaep5HEPYXDWBcTPzaFHezdNCUEXhpmIuloOaABoUCY
	 CaoJ5p+PZCgin6EWn4vP08hmIC5Rk5786FOJQ3IvY1l6xSkA9VfE6qqg2aUb1OPZGXpPQ
	 EsNjaYxX7G3vM6xucM2XL1/QfHfMDssBJLgjMhlOBXjOp57b59qGBQIQAsBTyMf4FJvDJ
	 PiMlOjCFNmyin36CbiN+Q5T+hJPcy98Dfp4BcSevTlollpSim3UGStLkMVxJ3pK4DGJjr
	 RB6os5cDEKVEOgC/CEU2WuwZEXDh9tmEALzfifkxVr5vWjJruljVy5OGezunpbnPB/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydZwfXs4;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56622606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56622606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydZwfXs4
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f046b0adc0so29223455ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581462; x=1796186262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Th0U5TzJmX7EaDDFA+PHgDoYo8RCe0k6TY8cW8gRTLA=;
        b=ydZwfXs4itqQiYJPjgaUOOO0SQIyr1DBTGTbktl7OG2/yC5Dblolhcn3IS42km/rf+
         tVkzDsddKnEt2tLiPCLnhOg/KKr6yW0dYeWYUUgzJl+Ubn1XLTHgYqH3xvldlSDKy2rA
         mD+BT3arUSXfXqCSlhE6qWm+2gP4E+jZ5pXeU9aQeWLR3wE4JdQZxV7uIxsB3wpYRzBa
         VYiMQTNNXsMnGgJYUeP9YCSVmibS06kpZzwaCLjiheizhm32L19Q8c0lXmlLsUeVVl9T
         Jt/d2ovu1QdMREbgiVNGZzR+No7PtC13I9Il5FbUY3Vu+/PQ+P1iBCilGgZUYlrjlKzo
         ZWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581462; x=1796186262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Th0U5TzJmX7EaDDFA+PHgDoYo8RCe0k6TY8cW8gRTLA=;
        b=1QHD109KolD5cxZU67pl1kOxjZkzNRL0mDOFh+u7HSntH3d1dFSeRxLHEFevTjYOoy
         h4PX6aI4sryRmfG+rvrUd+XLpacz9vcV1pmGjZmQ1EzoSGugPoIGmiRvB+SZOGv1vCcl
         8E6oeK3WdEV3pclLOZzefaoRdiNzr0A/nw50h1M9KoZzeWB31+IgqFY+Za0PywRySEJX
         Ij0hEw70lseUsbRMx3K6BIQ4Ni5h8EZ8ODVoQZi22C2O3SVvfSmu7CMd7pq/t+1xylOH
         /sPt1x6bB4oM6caC/FD0aZ3BE2J/PFNMmM+IOWkP7gyLHhAbedbcmqoSrORByG9K7jSn
         vU1Q==
X-Forwarded-Encrypted: i=1; AL+hErFBXyxp+ORUP1vgbugCKoHdJm4bVpM1AbcRDgoB90TFcymYplK9rpzofxzrdACXLbPmNdh0SFBi5l887F0=@vger.kernel.org
X-Gm-Message-State: APuU4Z90ySsi4gsvXFeFOc9gPfyscf1CZ/2a0HlvlZUpRgTOpGNQpYhs
	eLAFFV3Hm9XopAWnioAEkOXgYGMiZzzLE8TuBF9yeu4ayBY6pnhPHNjy
X-Gm-Gg: AZFdTZew8gBUItfGJGi6To3xTTfL46mwSBOIbzR64DrDqYD6GobBvLmzj+lN7xApJzP
	M2Q99k13QZMzkEJ8KxSpNkBbrd3t/vPTWqcU9Qj0OuJAbmssHUh5Nkhh1BlOzlIAQrxsnyKAVip
	GXLqsKz+GqYlO0/E7SumbJF0FxUB653jJCT4EvSlYKiwM4ixbjtGuqhIj+aovw48B1+dtja7NJZ
	ANVb+l8njm0myfPOdEv4xBxf32KcqaWlAZLKyzWpz/aaYkRyrqpxchwCgfWSZkcHjteUNux1Hbv
	3lQtP7Hal50C+yQr/Kwg94aluzTZUKJ46Fe6h2XNRcEzbc93t3sy+DgnK2QTtzOs5bHHapUIkIf
	CtbfXY/g4MOk6xDPyGlc5mftHSUYWr2+DMBTo1B+0tBKv1O1awYPzhlj327vYRXK4wzcehNHohs
	WQ8ywSPp2rCZdXXv75wG6sEfkzSCdILZb7Ua+18vbKHLh68Y1aqfFNiUe0kAjNdq9EN4wdAV+EE
	aFBEMncaAT+8GtGcys0VWkxTbVpD6XQ/xTuT2Ow++H7FHaxus/slmyxYNn/oszxfLoE3tWB5IiO
	+T5PzCDoDiMzcinW9RoefmJcIFV0ZCOgyPac7QsOJL2tiiDG
X-Received: by 2002:a17:903:294f:b0:2ed:630:40ad with SMTP id d9443c01a7336-2f03f11826cmr93907705ad.19.1795581461579;
        Tue, 24 Nov 2026 20:37:41 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ad2sm78350235ad.16.2026.11.24.20.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:41 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 8/8] ata: ahci_imx: Use bulk PHY APIs for calibration PHYs
Date: Wed, 25 Nov 2026 12:36:39 +0800
Message-ID: <20261125043639.249525-9-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
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

The i.MX8QM SATA PHY relies on the first two HSIO lanes for shared
impedance calibration. Store these calibration PHYs in a bulk array
and acquire them by name with devm_phy_bulk_get().

Initialize both calibration PHYs before powering them on in lane order,
then keep the SATA PHY initialization, mode selection and power-on
separate. Use the bulk helpers to release the calibration PHYs after
SATA startup and to unwind failures without repeating power-off after
a failed bulk power-on.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/ata/ahci_imx.c | 57 ++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index 6aaa18e29abc..18faa033e44f 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -25,6 +25,8 @@
 
 #define DRV_NAME "ahci-imx"
 
+#define NUM_CALIPHY		2
+
 enum {
 	/* Timer 1-ms Register */
 	IMX_TIMER1MS				= 0x00e0,
@@ -66,8 +68,7 @@ struct imx_ahci_priv {
 	struct clk *ahb_clk;
 	struct regmap *gpr;
 	struct phy *sata_phy;
-	struct phy *cali_phy0;
-	struct phy *cali_phy1;
+	struct phy_bulk_data cali_phys[NUM_CALIPHY];
 	bool no_device;
 	bool first_time;
 	u32 phy_params;
@@ -428,30 +429,20 @@ static int imx8_sata_enable(struct ahci_host_priv *hpriv)
 	 * Initialize the first two lane PHYs here, although only the
 	 * third lane PHY is used by SATA.
 	 */
-	ret = phy_init(imxpriv->cali_phy0);
+	ret = phy_bulk_init(NUM_CALIPHY, imxpriv->cali_phys);
 	if (ret) {
 		dev_err(dev, "cali PHY init failed\n");
 		return ret;
 	}
-	ret = phy_power_on(imxpriv->cali_phy0);
+	ret = phy_bulk_power_on(NUM_CALIPHY, imxpriv->cali_phys);
 	if (ret) {
 		dev_err(dev, "cali PHY power on failed\n");
-		goto err_cali_phy0_exit;
-	}
-	ret = phy_init(imxpriv->cali_phy1);
-	if (ret) {
-		dev_err(dev, "cali PHY1 init failed\n");
-		goto err_cali_phy0_off;
-	}
-	ret = phy_power_on(imxpriv->cali_phy1);
-	if (ret) {
-		dev_err(dev, "cali PHY1 power on failed\n");
-		goto err_cali_phy1_exit;
+		goto err_cali_phy_exit;
 	}
 	ret = phy_init(imxpriv->sata_phy);
 	if (ret) {
 		dev_err(dev, "sata PHY init failed\n");
-		goto err_cali_phy1_off;
+		goto err_cali_phy_off;
 	}
 	ret = phy_set_mode(imxpriv->sata_phy, PHY_MODE_SATA);
 	if (ret) {
@@ -465,10 +456,8 @@ static int imx8_sata_enable(struct ahci_host_priv *hpriv)
 	}
 
 	/* The cali_phy# can be turned off after SATA PHY is initialized. */
-	phy_power_off(imxpriv->cali_phy1);
-	phy_exit(imxpriv->cali_phy1);
-	phy_power_off(imxpriv->cali_phy0);
-	phy_exit(imxpriv->cali_phy0);
+	phy_bulk_power_off(NUM_CALIPHY, imxpriv->cali_phys);
+	phy_bulk_exit(NUM_CALIPHY, imxpriv->cali_phys);
 
 	/* RxWaterMark setting */
 	val = readl(hpriv->mmio + IMX8QM_SATA_AHCI_PTC);
@@ -480,14 +469,10 @@ static int imx8_sata_enable(struct ahci_host_priv *hpriv)
 
 err_sata_phy_exit:
 	phy_exit(imxpriv->sata_phy);
-err_cali_phy1_off:
-	phy_power_off(imxpriv->cali_phy1);
-err_cali_phy1_exit:
-	phy_exit(imxpriv->cali_phy1);
-err_cali_phy0_off:
-	phy_power_off(imxpriv->cali_phy0);
-err_cali_phy0_exit:
-	phy_exit(imxpriv->cali_phy0);
+err_cali_phy_off:
+	phy_bulk_power_off(NUM_CALIPHY, imxpriv->cali_phys);
+err_cali_phy_exit:
+	phy_bulk_exit(NUM_CALIPHY, imxpriv->cali_phys);
 
 	return ret;
 }
@@ -839,19 +824,19 @@ static const struct scsi_host_template ahci_platform_sht = {
 
 static int imx8_sata_probe(struct device *dev, struct imx_ahci_priv *imxpriv)
 {
+	int ret;
+
 	imxpriv->sata_phy = devm_phy_get(dev, "sata-phy");
 	if (IS_ERR(imxpriv->sata_phy))
 		return dev_err_probe(dev, PTR_ERR(imxpriv->sata_phy),
 				     "Failed to get sata_phy\n");
 
-	imxpriv->cali_phy0 = devm_phy_get(dev, "cali-phy0");
-	if (IS_ERR(imxpriv->cali_phy0))
-		return dev_err_probe(dev, PTR_ERR(imxpriv->cali_phy0),
-				     "Failed to get cali_phy0\n");
-	imxpriv->cali_phy1 = devm_phy_get(dev, "cali-phy1");
-	if (IS_ERR(imxpriv->cali_phy1))
-		return dev_err_probe(dev, PTR_ERR(imxpriv->cali_phy1),
-				     "Failed to get cali_phy1\n");
+	imxpriv->cali_phys[0].id = "cali-phy0";
+	imxpriv->cali_phys[1].id = "cali-phy1";
+
+	ret = devm_phy_bulk_get(dev, NUM_CALIPHY, imxpriv->cali_phys);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get cali_phy\n");
 	return 0;
 }
 
-- 
2.56.1

