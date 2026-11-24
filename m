Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550509;
	b=rJAk9JhYgSKjx70GBOb6Zmsu4W7CNnzYca6qyUvvrdX3y0Jaj5pk9d/nsZyyZrj/FHhB
	 mAqpfRpQDmOl2K2WBhaocUsPrFHzDL2OBz2JIoaS6vHVxBy27gwSOXEkuIkfZAr0/ArHi
	 1BYhg/R2AtOaDLSJgG77BwUp5W7FukFmf6389fzeV1Gf5DLQ+pUAxoRl/1Sw3YWIJ503B
	 jc/MenE44nwWBUHTL6F5t0rJewRamHCeZh4LnyDlVlcDFBPTRr8aGQrBVWNPQS9DUHkfa
	 d1M6S7EOMu+FbdZmAuL9+FYfZQPnqC0NuO2FQkJJp+0WXfsrvko4xyOtdEDl4DQXd5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
	b=T22zah3mXpTHaVImPW3mfFFyKqP1RX8T2MDq1bpki29erqAlSxTEXJ1LTxOtRdgy9SrU
	 hfzhsKO+bOFhiRCI/pqAegFi1NKhO4M4F893rzk8G9Dj6xJIbwVUGfHSm81j0ko0MDYgZ
	 oQUAQFpIWBfDHPnkgZJWBMhk17/ZAG6z9EWEYFg3H02YGLawP9PCRNt6hoMhZ/PKb18hB
	 5HWJUVZ8QfB1yB1SbSl9PQD1fFJ67v0DYADwF0HEBlCo0sw5MRLnUsa1xCZ++gdz+fYJN
	 IxwydGQkivtkKTHpv/Gsuju27AgziN5Qs243vFXMoIqW+bF1dxErepQVicO7hyRR9kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onxWI2js;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTbKs4Wr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2E9606A687
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D2E9606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onxWI2js;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTbKs4Wr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJLLfb1723194
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=; b=onxWI2js/qa0c91h
	l/J8lCF49XdAetJqFVrI7XmVpaEGNRwzO2ejLUesHar/CwxBp1Kh+WJTJ3pk+IwM
	QNIOCNFEy4ZV0Q4oDM1xZSAaghIxGoYZky54XgIduzeTXWeLjfg0F5jvi2MMJc0i
	ASDpMpSHAY+/j3aAWgTqMzMsFrH/ka6/FOQqDiICHDf4DAmGUaSFTdTK7TdckGGD
	0wl36+4VHsgOXuelx5nzd653eNdAEvk+RlJfOySyIuO8VUexEEaFJ+lLkjcgRSYA
	2Zuq5HH+mWIJWoGxjfkj6S2hrW51B0opt76jFqxFDj4CkfFHeErjgMGzsqoQy7hZ
	FSZwkA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns84qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1cf1638fso162152137.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550507; x=1796155307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
        b=eTbKs4Wrf4k16vV8tsUqx3N2+E9DTG8qsQG2oAC13SbJdcVQDu0QteXjXEBieKBAQG
         pGbFipEAVXkzdkNeSig7GkrFxvOc5HN6m+G8hXT4ogNPwi+iFSEDOn4q9wof7d5sxzea
         oSidk2pjDBfe1D6fb/bu1rqzi0yNI4BVpcsldwXMAYZIFvMqZ06nupU957ZrDm/XtdLD
         2TZW6NHgGVGoG/n8TxRXzA5Zk69fvNFnbmhWvSzBDzamgCNT+FtWO8L+k+CeRiTcpctX
         1Z2wyytXEjKK7wTIo+TOUnYIdcqBMks31cMiu/1DA1R9KNnnjzVWtNcq3uobdf2b7YVO
         P06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550507; x=1796155307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
        b=SqXjjb4kPg33nN1Xe4ycjFr7LeSAleWLhOt42MYeRDBkqd9710uGj0YjfNs/XvXPEF
         nxGu3rE5xY7FmpIocaD0kmBl2BDaPAPKv3jVziHiI2TzMQuaeGN6k+cG8+CmP44SJqZY
         guskiwDRc9SP6LxxqrMMfpBln6MpCH50FCwmpf5IEh1ThuL2by4SMBKsrKcNPT7vRJiw
         g5X+5hr5R7RC/Qr+8UNXYndo5U1IYCys9l2v+2RLhtKsRn8QcPud0suyuBpcizeG1+c5
         Y0U63EEzOTmgm4qnZGfyBx6r10s6poKU1FTJ2ekZb/bmH+doEts/AB/ZcOyAhORnpbgd
         JuZQ==
X-Forwarded-Encrypted: i=1; AL+hErEI+t/TbqrNBnJ0DU6XbAqGzJnLzqG4Rl5gUFUOH6brhgVtjxacZlkRQCQKFMUWLLTD6Vpj3rlQ3TkIeY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MetQLE3rqd/WcUU/5s320xg3YwEVngl5GsAK+P3yPZFbhBaXl
	4iDZUYoMzdCkhHY53VPWq/GyNfp9nFjY9nq1KVKiwzzhE1nFfddeD6/ib4d8rSkLsJB6PXV7kL8
	DbC5Hpgv3ANb5UIbh1yuXpGJ1Qhk36dKDgMcEw4rIrLFzBCCw+i3tChxYvijPAPIlcNo=
X-Gm-Gg: AZFdTZcDWBo+kT1VlF1rlfTxeef+WKQzmMV9+mKaaAE+ipEhf/rbnk5NkFXsB71l9lF
	XrwqZQ/MPMNGli7lcuEN8+VDOH3J3Wnp+g9wwZF8YQgrzsMkfMAS171u+ddLPa/+cKOl/iAjK7F
	xWzW5JIXMW9qoPq8HUlZ4X5+cBxHxcvNehuxkbZuLUL27qRYBbfP+yuWbCBry9v/IIZ2Vho+CRo
	umYfWskbdv2JCv36aT9dq9Nh9S4974pKI6GxtUKe1mCaHas0waRoCJv+TWmfcRWkg6JifFjgK2f
	M4jAhrlCiu8kgHvPH5qsloLpVxJ3zAk0A1uHkywgklbDuqrNOWxKNcOblTQdbiMDLpijU1ch6BM
	Nm5zjQmvnvznrRzMy6RCw7GMwK+rcTz6qZFmRovZN61+GiQhs0f6a/rCHeloOQxZ5p6g78jKVon
	PvEfNLNFk=
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr9654727e0c.0.1795550507155;
        Tue, 24 Nov 2026 12:01:47 -0800 (PST)
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr9654601e0c.0.1795550506454;
        Tue, 24 Nov 2026 12:01:46 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:45 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:31 +0100
Subject: [PATCH RFC DNM 02/15] phy: qualcomm: qmp-combo: Add USB4
 power_on/off to de/assert USB4 clamps
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-2-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1739;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=srDcbvCKmzTW6ZFC7dL4jM5RmKmDLk6L/F70k459R2U=;
 b=DfUOTBjSbX0G43dLFvbwRwSUp1QIURcaf26xg7MQFnmkwZFDhPAYrQBYi9bxMtPyd5DhHL2vt
 v/BQpOYKbSMBQSXZAZARt6EWTVGTYwoL/LONH9icnOTkbQiOeETL874
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: XN8dtnSfyuEis2MiOdL7GYvt-m-mxAXc
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b05ed2c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1SUI9jfhOX1tsDrs7xYA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX0pz2jHqR7q2e
 O2UWq3x9ykC1+Hcpu+I45Je+Op3tsttpfrJPOEmEDr/hufEp17kg0ClPMRjAruFZOv5CqIgT/Pu
 DPOmDCpgke0+3yI18XeNyzz45Wk4G68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX6EGMhsiAZTLN
 BZYodZFCEbQY4Q23GsyCDg+eB8RwBPVcWuS9RPGjXxgUOfwnf6hluO2eNjUXrnpFddZnLuamzQm
 MFZQp+bhTjqZfddnt0Tx05gf/dsZu7wTJyNYq2GWQbr/mzfU+sDYloNJ31hjO0YCCksojzqFbgP
 7s/gWpywSC3D46lX2tkCz04978lGdGxmxK4Ms3kezMk3J+T5BYI+96tTaNcSQngSY9bCgN/1R0z
 MuOucGOYkCSFQbtD/k4fty0f+/aE+smWfoOL1APWJ5bWneJabRj+cQKxRBuFX5+sxgpvceghajm
 tM8h6bqTlIwFBNlF6eTZ89SWjNLU5gHacVZcnXKpd8TRIMAMd9rFwLf9rMEDgpX6Qx/MBWI3Hku
 0uPpPN4JCbZk1VNb+8tORoIEkRcCbCO6k3aaV/4DE++MOuPtsOR3UElpk2j/z3/IWvwPrMNhXx3
 Ox1JUcjVycQpnUoBIsQ==
X-Proofpoint-ORIG-GUID: XN8dtnSfyuEis2MiOdL7GYvt-m-mxAXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

The USB4 part of the PHY comes with its own clamps, which need to be
asserted during suspend. Use phy_power_on/off to let the router driver
do that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 03fe66dae8b86837fddcc59956529ae374c1f6de..475b9a43baeeeaf18efb6e55d8151c170169c742 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -5085,6 +5085,28 @@ static int qmp_combo_usb4_exit(struct phy *phy)
 	return 0;
 }
 
+static int qmp_combo_usb4_power_on(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	qphy_setbits(qmp->pcs_aon, qmp->cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+
+	return 0;
+}
+
+static int qmp_combo_usb4_power_off(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	qphy_clrbits(qmp->pcs_aon, qmp->cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+
+	return 0;
+}
+
 static int qmp_combo_usb4_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
@@ -5110,6 +5132,8 @@ static const struct phy_ops qmp_combo_usb_phy_ops = {
 static const struct phy_ops qmp_combo_usb4_phy_ops = {
 	.init		= qmp_combo_usb4_init,
 	.exit		= qmp_combo_usb4_exit,
+	.power_on	= qmp_combo_usb4_power_on,
+	.power_off	= qmp_combo_usb4_power_off,
 	.set_mode	= qmp_combo_usb4_set_mode,
 	.owner		= THIS_MODULE,
 };

-- 
2.55.0

