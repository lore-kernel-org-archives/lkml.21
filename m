Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612710;
	b=wIdiZmt2cRJUKDcdmxoo+Sblg6Gw/R4mbMiLuf+HoRq93yBNDf0zEhTF5udtEwnKaZdI
	 Pr4qxrV4dDE85II+omqUFfsRZPqa15yoTIN0tZ0rNFSiDW7dz6pyCQ9S4zTOMalD7rfFj
	 tUWnvdX/i6rTuC583TENHzzKL5X+n2h4gT/vZ2RZetJtrYTUKCspqSrrT4aYNt/Pq162p
	 JlWitn4vby86uP70bqL4jtYEY6n3YjJd0H5l9oOJHRgX3m3q3ipFki70hzMKPVmhWS/4E
	 d9NgUm+ULsL6YUy+YRcEryuuqml8zKCcbu8+6u4z4bKCd84bc4i3XGDsRT9xwHfOKOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XujrcBPg8iCP0lS9nyAmpKLbRw0s1l2SwZW5Nbs3TbQ=;
	b=43RU1QyvPK8fKuwwNBYiaLa9h5OQOARjOXqiri1ne9kbGafqvffcFYYFn01EAABcwO3g
	 bxrLKGS5P/v840GNZV88RWfuRBw3qaGBJAnToizXe4uam2kCPRTZqdmAz8QEl0ziNoxH/
	 SubwcfRMaCqf30ZC8H3KMVy4To7Pg1Em1bLc6fsFxkxEJzKypyRTpHw2WqICZ96EDtv7F
	 fUF0xdqYp5icklKtLl1QTd8ENxUE4xxWEPXxsgb3NdNYcSjndX0ba9poU7o8L0wYkCjFO
	 Q3IJZX6q8VE0u0/4OSYxQ7s0UfrbT+ietiMfiEtstIdbycJy/Fwdsutlik8kXgaIthg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JS7F1R3f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ps6Kphzj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0164606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0164606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JS7F1R3f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ps6Kphzj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mP7W555541
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XujrcBPg8iC
	P0lS9nyAmpKLbRw0s1l2SwZW5Nbs3TbQ=; b=JS7F1R3f3EewGY/+YloX8zmz8Sq
	7st1MXrHLahQ9nEASKnHih+b0ITNN9CJuqWlJOlYYbyxm695dQz5eAouFHsjvpGs
	V0iVn7uNsISnZQKgqfZ/IMAmqKubJ69SCwQZKDZ4BE96uqh/iudADJEKzFrICfKv
	cXM+Fq2to9z+hJnpKvtpKA0DlhwsQyURqLyxZmYHVWpWA83uR6O3+dMDzSZ/ksdL
	8djpSMmyZET+lqi4VPz53pF/hXxEEQinllSm1bGRcWbvtQ0K8DN/eTWOGKslTk0T
	mmxwbHBaYY+bh8vUFs+IjPDwl5KI4p9KqkxsK0VF52U6a8bWt1plOatLQHQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnry78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so1587933e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612704; x=1796217504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XujrcBPg8iCP0lS9nyAmpKLbRw0s1l2SwZW5Nbs3TbQ=;
        b=Ps6KphzjfuJIiK+HqpWFCy2gbnCitEwODxO8Dq2QHPUxrZ/d1+IlJww9I2yrS8dKJi
         4JtMRNyXgb7O/r5ifBgEE7ezlgO+IXNpJr0/UEOARSC3Rk3Wq1BvWT4P1RTSX7XQQT4y
         m4JUqxdcTZ4sTO5Lrf5ZWGHZa+2G7aNeY3v8lE3W9qZaL3VIlHsdBntASWPWprtm8VdL
         2skP7OG0q+oha0bZtI2T3Kas+6IDABIJdGVayvYhjSropyOzimG248Xi7SEm0qZhSFMJ
         Z8JAn/gBIHea/Sq9NDAVR4QasGbqEecOYEIjo1jnnadz0MEIzdCVQEv67m8G4lQ/FU0Q
         NMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612704; x=1796217504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XujrcBPg8iCP0lS9nyAmpKLbRw0s1l2SwZW5Nbs3TbQ=;
        b=SsAv4cIbnJ/qdQGg232KOHv9B0P6gtKnp2GOKbvpjLn9ngx+Ql8gFl1H90kDEU0FFd
         m4HhXFhLbvauwhZIGoBQR8UsHKsx6vs54yLl4vBJKhmoK/85GE4TPZ2F+1mL1b1SKQWQ
         Xs/BbminAce3EoCI1Wn3ItZwqv5QUmTx2CT4f+scxSmQAFk62UOh7NV9UMWtH7/xg12h
         GKrBY51oDPFZ+cNmehGjTVojJIxuJQmB0k+otZ1iUBizxHTTCAS2JbS83lewYOt56XHy
         7QAwCaZKYIg2zFbOMmebt8mhg1TR4tmKC+fd8K96L0WrrXdoOMSrNWl/av2P5BTzwEZ7
         ea2A==
X-Forwarded-Encrypted: i=1; AL+hErGO0RzZfaEum5twYAHdQcHwAiNBFJt7q00i1ltcYcfw0BUsyReit9WDe5yajovg7Aq402/o3J6wEnfbTGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z939RpXtCOviBA/ACewvHEX4q4rYx6h2SslS6PJDCXlOgMC/F5q
	B7uDD/zGTPlwXPpnmAV9f5UeWyzN6EUSy9oN6u5QwDbtNf3nHz3FUJzC5OKm7UFpJqLLS3+83WV
	7zeA+nQYZlxxowySjMHy/LC7Ms69YslHI5v8YYQMIQ7ZmNDL+HB4MDPyBzQEKr43GbBQ=
X-Gm-Gg: AZFdTZdp6H4ACjuuZRCAfzmDk59nGs221x5/lAIQJhCwY/4btxl50SWVqJUwLgpcT8z
	St0cARNdNMXqML0pknywmotnOGsgSnUT7p/OEuZej4nuNM2b8fwOKR92OEY9yhaaKr9jDoi/ZT3
	DaM7sdF8KyOXgK1yks3KxYWdUKoyC4bf9Dz26tr2QHI3TepZCFTDM6uMPoeD5YLJqK2n7ZkGinU
	xKiRO22V7L88LXtR9RwgbK7LEt/gQaUt0Y0Lc67x0CCUja+EdIq8SciQJ4tOyzVnQIIYT3hDLjr
	xS5NbHFmJ0Ax/M6glctsJcpYSqK94zOU5cRE4IT+2mquj6EigqJxUMsNVvXeZbk2n9wAcncckhq
	z3rEklF578/u/gsV+dzN1TbEUXlL8K4A5ucJsgHJUF+mGbbR093NwKEgE/BH62puU
X-Received: by 2002:a05:6122:4d0e:b0:5c9:a60d:3279 with SMTP id 71dfb90a1353d-5ee8aeefaf5mr9415457e0c.13.1795612704204;
        Wed, 25 Nov 2026 05:18:24 -0800 (PST)
X-Received: by 2002:a05:6122:4d0e:b0:5c9:a60d:3279 with SMTP id 71dfb90a1353d-5ee8aeefaf5mr9415391e0c.13.1795612703509;
        Wed, 25 Nov 2026 05:18:23 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 3/4] clk: qcom: Add lpass audio clock controller driver for Glymur
Date: Wed, 25 Nov 2026 13:17:56 +0000
Message-ID: <20261125131757.1163466-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX2WvcdNG5SAH5
 jb3cF+RtOmmhRhdZwWIbevMZqhPfbisCtWsecJv/GdTgRSQ2sRhKNc5uqho4TQBpQjTLhewJfBX
 5k5070/6TTGrqnrrlArMxJPShreZwQCirJQA/4AHcstlkOdCcIe8yWbVqgOgI5iUZ+Gs7qvbfWF
 jdn3+i6IxZMkeKmGbT74kVhWS5vCl0Do7+mOWZS7W/s12iG8fBiKXcdEpYYtnqHh/wci2+Ud5vl
 WYK6urLrG9tT5xrgVxDUl+P0o6T2eYKroZYT79f69sgWKGxztUGD2fLN+FQFSrpdGwDMnFSIDqT
 q+3X+LsF7UbSz7RpvcXRSroTZ0HZKHQAKKJciJ7I6SfJf/qdepJTqWoNVnwWFlH4pp1BpQT5kbD
 PMrxadw3Yxd5F2I0QQ4m9cvHIaiNR5UPdNK/TidNY07G/cA+KIJOXJbA3PfrTDYBHz3f/T0qZNT
 GmHXG/Q18+uctZWbNJA==
X-Proofpoint-ORIG-GUID: 5D5YRMt9afo1hhutVDWGrGsrkDMPeRH7
X-Proofpoint-GUID: 5D5YRMt9afo1hhutVDWGrGsrkDMPeRH7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX9rigdHjOvsDn
 FX/IO9DjLYmENgC6BjrZ7B6IeWerChp7beWO5RYA1XSsCeisxxTII4MfzRkqchaD+NrrMcW8p3i
 +TnXvKDPvqXdm3VC3gKpN9YTQGVTIK4=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06e020 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=7GdS1con5BCYmhUutoQA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

Add support for the lpass audio clock controller found on Glymur based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          | 11 +++++
 drivers/clk/qcom/Makefile         |  1 +
 drivers/clk/qcom/lpasscc-glymur.c | 68 +++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a..89e6a636e497 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1274,6 +1274,17 @@ config SC_LPASSCC_8280XP
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
 	  controller to reset the LPASS subsystem.
 
+config SC_LPASSCC_GLYMUR
+	tristate "GLYMUR Low Power Audio Subsystem (LPASS) Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	help
+	  Support for the LPASS clock controller on Glymur devices.
+	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
+	  controller to reset the LPASS subsystem.  Required for the LPASS
+	  audio macros and the SoundWire compute-mode controller to leave
+	  reset on Glymur.
+
 config SC_LPASS_CORECC_7180
 	tristate "SC7180 LPASS Core Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6affb5073f26..0c7a67b9cee3 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -151,6 +151,7 @@ obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
 obj-$(CONFIG_SC_LPASSCC_8280XP) += lpasscc-sc8280xp.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
+obj-$(CONFIG_SC_LPASSCC_GLYMUR) += lpasscc-glymur.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
new file mode 100644
index 000000000000..b7fdd76df2f5
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+
+#include "common.h"
+#include "reset.h"
+
+static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xa0, 1 },
+	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xb0, 1 },
+	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xd8, 1 },
+	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300c, 1 },
+	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301c, 1 },
+};
+
+static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-audio-csr",
+	.max_register = 0x3020,
+};
+
+static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
+	.config = &lpass_audiocc_glymur_regmap_config,
+	.resets = lpass_audiocc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
+};
+
+static const struct of_device_id lpasscc_glymur_match_table[] = {
+	{
+		.compatible = "qcom,glymur-lpassaudiocc",
+		.data = &lpass_audiocc_glymur_reset_desc,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpasscc_glymur_match_table);
+
+static int lpasscc_glymur_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc = device_get_match_data(&pdev->dev);
+
+	return qcom_cc_probe_by_index(pdev, 0, desc);
+}
+
+static struct platform_driver lpasscc_glymur_driver = {
+	.probe = lpasscc_glymur_probe,
+	.driver = {
+		.name = "lpasscc-glymur",
+		.of_match_table = lpasscc_glymur_match_table,
+	},
+};
+
+module_platform_driver(lpasscc_glymur_driver);
+
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>");
+MODULE_DESCRIPTION("QTI LPASSCC Glymur Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

