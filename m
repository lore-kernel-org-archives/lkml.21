Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169464;
	b=0LaceLlQKdDAkz2PHwIr7nynnLr2+QMfvFP0SBDjPMPCu5LXRi+Ew/2OMX/C7J20/egb
	 Er/tOJ3LuTrylnFiQeUwgPiQxVMswPm2j9hT/u+vzz1/VnXdv5qTqvkJw9JFYk4Vkf8te
	 x2L7TXfwZL6PYpl7uZkHhrJrFG+y74WzR45gcFR34tWHQEuT0Nlz/JK1Sn/Yw1y9qrrqo
	 uLtsvqrwgoIkLUVHZMwScSk0VAafPZGqAVrgjDCMoMHBDLuXwFg/5kubj1ftczZotjUCd
	 x7RQOfWiHPV5eSw8sRKV+HnRSRLR+JM2sK0O2JSm5an1kdrgzxUh7GUt3Y2emTYgWKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FmERSsGdijHPEpg70TWraIUuJ8ka7iU2Z/SCqAmN7f4=;
	b=2kNU+B8i8S/ZH5Km7FJINqp+wkP+YhHB67q8Sn/oMTJ+FlcCHcifa8Pl18T7NEMA98GW
	 DI0I9Tb5r0Xk3TcENcZbEfr5FFdLNwJsEooXanxCYcZvkZ946oYdsjlMYNNovjNdtyPfY
	 kzAHxoEIxgjDX8a677mrIpnbK5qmD5b2MP1pE0zooCqAWbwu3jyUp7TPyOeLv9ARsSCXx
	 DdkYOThOj8jfUA6N/cYmPnwp+dr5bZdYYZneoDw3ULPx9xb/poUU30z2jKe7EqiFd/erO
	 O7kraCUe/wpIzlRBzVZQcr32jxLa832nkE/ZArYyB1G/Tkzgh6Al3pi0mk+DOhjGe3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MT4qzyq+;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DEC60A260B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49DEC60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MT4qzyq+
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50a4a2132cso109206466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795169463; x=1795774263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmERSsGdijHPEpg70TWraIUuJ8ka7iU2Z/SCqAmN7f4=;
        b=MT4qzyq+rOl+HzFwCxY8b/rRr/wX8YGqDMPPdx0ArPgH9NoCfxfWUE+GtrTbHTKh9C
         kmYfUjDMBVknI9fXJQLedyZUpfzRoDJHeop3+4KFwXqe9Usc5yxoC2g275p/9EuqPAhW
         O+RtGxZtv5gmJtZmCI9jtvMqVqMziKGpAEO+VQbDw8qgBdNDZiduk7UFjd6TfMuus4Me
         8Su48PCb3W+Q8TZxZHVfAiSYqUlFrz6uweN8wd7VMpjBzXiBXRLcSDXLUQOQyUZjcS+Y
         3+P/QwEXdGuVwpxegJKdWF6POCaIPkB6rPrgT3Ebq3uqrztEoXRR1xhcnIQ5V65+/wFu
         l2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169463; x=1795774263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmERSsGdijHPEpg70TWraIUuJ8ka7iU2Z/SCqAmN7f4=;
        b=bOn/dmtuBsgf9xyYA/pOHij/521pYZxS9JOaCIU2qJHdfOXDJS//+uNeE4RGBem1qg
         N2RxV34YZFtnMoJ2cRlh00OBvpGRKYWB/nHSIeheZfdFGLA3YWDWM+XBc5+l5MKL1JxL
         I3FNqyB7aiH8xx5y8dnStnD5zgPlp9zkHM1uGV7Ib/gLOmG38MpKDi3k1AarxpMVtzbV
         a4IX95/bpb/zUlKtm+Ap1qys/WWcP2V1VWPHj/MKFZUo6UYHiIaFBsJhnbdQtSpEt2Ih
         ALEniPjWsQOZP8ngLvos/4y2ovsIqbvf/PA4GFbvJjZORe8PyJWqn1ZIsYiWcoAJRLvh
         8oIQ==
X-Forwarded-Encrypted: i=1; AL+hErGyuN/P3Edbm8ykqcivBDv3WQr8kXAg32kamHH2nUWqpQEfTWx/Ku7WC5Cy6UdotsakEektKbWPmkbz+xU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Paam8lhv6sjz5zgPfhYllGD5pfDdXcLLNENyYVZYiXSUD8QPi
	ooWbQD0mJBeeb6+dA1Z5Q+DxD6k7W4+9eaIWs/kW8T73jV47reWb73GMFcQ7GTgdA/s=
X-Gm-Gg: AYBFou0/GzWIVBJ8rg5tVaoRvkwjPCC83w7wbKkq55vUUtiYwdCfEpaH9JoX1zuRWro
	65Sq336NrlT2Jwgob6tJTqexiQu4MqV64xGxMsUc0WRLX+qpgNYrdWpo1Qww3yvLgXDqlCAvBPE
	n26EU2wSl4sTOQMAOK2nVFNMDtT4Q4EXVrrk7XKCUcx+8fZUKAlaY4E8d/L+gJFcpWOKJrVA5o3
	H1sqYGNtjRTWoSNd0s9SVggRWpoyb/2yhi5sSsiBijg24hzMG544FrsgenWiFwp4DcRSw07BsqZ
	HO6IBEYerTey/vTMHa5XAM9ypuT6KpCW78hGevK/aaN1utykPj3yQ8b2knQc9xmuSri/vPEMa/w
	yhV+1j2N1xROgjT5OOiO8ryjJIzoZZpCO6vqCyIdww8f1JVjOSNVDNyHshvFKN9sky+Z5ZBdH0R
	s4Z5UMk0BykjvjsjTSgCoRhLuUtVB3kUuVoPX0vwyvlOXY/x84d2Mnpqq90rp9z7PPjKlUK5Sra
	7DGRRhiP7EjDhnoJBsvesAi/wzT5fTByKIoLk9QiR2LrNUN2DHCuMS88B/IYnWw+Y9j3CrSrVi5
	Att/kWgkC6Qyc1qujMRz33YHgJyM0f2X9zqHyB4e/Q+Aa1Vy34A=
X-Received: by 2002:a17:907:9903:b0:c49:cdc8:10cf with SMTP id a640c23a62f3a-c513ac754cbmr178323866b.40.1795169462412;
        Fri, 20 Nov 2026 02:11:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm4674937f8f.47.2026.11.20.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:11:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Nov 2026 11:10:59 +0100
Subject: [PATCH 2/2] regulator: qcom_usb_vbus: add PM8550B support
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
Message-Id: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-2-bbda7b708359@linaro.org>
References: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org>
In-Reply-To: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zBAUAtWRwgszoLaaEzP/mtjDOwBEAECtpNbyZWiYcu4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrAByz4/EXZYFt5/wDRUlOFYvBOPrPKz1sJ/flkYNc
 ZH1lUAeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAcswAKCRB33NvayMhJ0ZGYD/
 90xSEruhI4srRsvEZUWLQk8ktU4PEZd22u/DG5EFs4eKpCtiKIi6TJ0MOjUd/kUJ9cRoHbFhJ6gqiC
 H40jTa4Mqm8yxPKyBPYA9n1MDmhvYFcU/PS0c2R2JkEOHy6015Lb1MttTJrJi1SNv7LvB+fjPc8gD2
 DtqRqKH7btttJWrMCCIoTC7t2VJZD+2GGZ8X/Sm8PREqIrDjsih8POxzPjCayF5t+F5Ch9NcXUMaPC
 yafKjCmWBtHT3UObSvDxEbYTcrCUS+75W6c9m9IxwahAy2j6iGyskvat0TGI6vWlZ4i4DUmpLuS2Jd
 t3/une/QQYI1tr/NYXoDHZkeJKqSHeh6vAro8320KduU3419wvY4umYWX4OuBBqPNyAHtbH/KISNV0
 SoEUi09upl2MvWOJf8QsQQFW8grvLWk+B1y13sjDh9oTx7BfB0orI8mWAPMgcIy9Vz59yNKYLLlzFP
 /qLfYxtRYGsXN79JKFxCGb7WXm48YDFSEkG/sAmA+LdwAMHGDNhsY71C92zrZ2Q7MWeSINeWOsyZj3
 flWlkWsgULdYGoG+1TdFfQwOrtYhXSZ0lNg6ljFINRrn+oyzWT0MF79f75rpjyCFPShaVEeU5KkScF
 I7paUjDmAmJXYqWRZMndreFQy6q83ZtQfmu/BCT9rEUGs3CbrgjKUQVxyMww==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the PM8550B OTG boost with a different register
layout, supporting a current limit encoding from 1 A to 1.75 A
in 250 mA steps, then 2 A to 10 3.5 A in 500 mA steps.

Assisted-by: LLM
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index d909a6f2b7f1..dd149d28f62b 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -20,6 +20,12 @@
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
+#define PM8550B_BST_EN			0x50
+#define PM8550B_BST_ILIM_SEL		0x53
+#define PM8550B_BST_IOUT_OCP_THD_MASK	GENMASK(2, 0)
+#define PM8550B_BST_CFG			0x56
+#define PM8550B_OTG_EN_SRC_CFG		BIT(0)
+
 #define PM4125_VBOOST_EN		0x50
 #define PM4125_VBOOST_SEL		0x52
 #define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
@@ -45,6 +51,10 @@ static const unsigned int curr_table[] = {
 	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
 };
 
+static const unsigned int pm8550b_curr_table[] = {
+	1000000, 1250000, 1500000, 1750000, 2000000, 2500000, 3000000, 3500000,
+};
+
 static const unsigned int pm4125_vboost_table[] = {
 	4250000, 4500000, 4750000, 5000000,
 };
@@ -68,6 +78,17 @@ static const struct qcom_usb_vbus_reg_data pm8150b_data = {
 	.ops = &qcom_usb_vbus_reg_ops,
 };
 
+static const struct qcom_usb_vbus_reg_data pm8550b_data = {
+	.cmd_otg = PM8550B_BST_EN,
+	.otg_cfg = PM8550B_BST_CFG,
+	.otg_en_src_cfg = PM8550B_OTG_EN_SRC_CFG,
+	.csel_reg = PM8550B_BST_ILIM_SEL,
+	.csel_mask = PM8550B_BST_IOUT_OCP_THD_MASK,
+	.curr_table = pm8550b_curr_table,
+	.n_current_limits = ARRAY_SIZE(pm8550b_curr_table),
+	.ops = &qcom_usb_vbus_reg_ops,
+};
+
 static const struct regulator_ops qcom_usb_vbus_pm4125_reg_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -165,6 +186,7 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
 	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &pm8150b_data },
+	{ .compatible = "qcom,pm8550b-vbus-reg", .data = &pm8550b_data },
 	{ .compatible = "qcom,pm4125-vbus-reg",  .data = &pm4125_data },
 	{ }
 };

-- 
2.34.1

