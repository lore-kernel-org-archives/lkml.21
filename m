Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594875;
	b=G6V0cGDRRtZg9jl/jnnGMsnpiKCd2T4n0CjtX10jh7UO2n9BYnu8MRaHHI2wowzbpMsY
	 9lh7LBubGdau+tTZqaN4YpXJHBjKPHsqH7SHLeGQDjyX0lT9F3GX7MbkNWzpfT773G/4b
	 xD7UI+Rdq4O5N59NuZl5PFS5t7OkfYqxWTRQWNgqXy48rwESS8hVjXf6t3aWBvCh8tO9j
	 lkTcONV+je/xfSjd+KGkZCmbUOHhWcci3AAtOx6+tPNF/stadU+fgB9t6/6/ZlMpEHYVZ
	 jbzju9heuXb1BmjBGve9qV/5upe7BhP7YWEWi1BrtnfJgaZKfdZ7ZI8iNieWgzlLXTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594875;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9YX/v4KdXjYZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=;
	b=zrUCEgYmsNkQ3th1n/JJ0XvHpRt2LMxvRK1xbP7Ox9y2eBf59+ZzRpKBNOY9Eq7h3whW
	 uBiXoprwrk3glwMfNzU8qaFAeJF3DKxFS0AcMsietq/+ePzlmjf4+O4j3KVFpoQtFU5fM
	 6/ZDqXAVHd9X1SG1owqwpvThHAX4BeZbfzW79xi4Jv+L4Ci2MROukV5yNIre3L3RFfvkU
	 kvjbMGYvSQmETffzl4qmA0s/IUy3rBhsN3NldTrKppUyG996Dr+vfdwDu0DWLMomjNgTe
	 6hN+ioINKd86nureyHkgYoy/rsVnZz5StSDpL3flH0vX9jA+WB3QJmJSd6msYkce6CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jhadZxEY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LM8ULXLg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9462B606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9462B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jhadZxEY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LM8ULXLg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68h0T057279
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9YX/v4KdXjY
	ZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=; b=jhadZxEYV5CI5SSNpOiSzAglWkt
	k6r+va+QbFtvudZ4jbDFQzErTX+DemKvZoV9CdAMYepUDrclUwECiU2JSLmyPLzW
	mjoCJwsJHcIQfMcX0svpRWDHklXdwIfUNDocNcnKTUgiRZy21e2YrvfWT3jwp/PK
	lBFuCrDfl07SDEMNnHHkewX89UKfvEyzZFRkQ28Aow4hXmvIJ4bIzEyuYCetHkG+
	KTwYRB1aFNykjUKwm/MKklUL8nvGN1ba+hA7AuI9DqJRUeooiSCX5emPc6oxFdw3
	5MG4ObHz1b+Lw7sSgQH3gmiz4PLzPoHdagE+9fCSjGiw50lUGh7wQPKigSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnfaggr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f03a137f6aso48249945ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594873; x=1796199673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YX/v4KdXjYZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=;
        b=LM8ULXLgAq+/urlUzCvyZ2yXuScxbIImKze0fNmrAnkyBOOorfZpvL+OZACOICRLiL
         S16yMk1H1wQs1hfb66VrjsdAzE171R1nVeShsfT1ZIGGzjjP84n4h3QGU2+lBvIXp7Hh
         exTrV8YeZf1gRxBgo0Zy3RyWa+foKFJOVF6DBhGy0ss3JPdyKGkHIk6XMAW7YkWZqDxe
         iSUyKETDcNjTQb/lspBacaSn2uFzuoOtjpOmAoZ17iuZ8QBAurHr7piT0PxpGmXvqczw
         xjp4c65JpYKT6iS4k4xlCcNKWJkXug5s4XmKwdGVpz6uoijFx+lqkbavlrcIxwfsrTnc
         74FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594873; x=1796199673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YX/v4KdXjYZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=;
        b=Bfh8CIQXQig2j54MHYEk16Z5fd+R01JAQoi1a/OfkxQsoWdV0xmjjbBtpKllo1+Ijq
         qMFDlyiqKyOt57QGehyv6jZplSt11AU5GPGmu0Rn28Q1RQqv0U25NuqBsu/e/cW7oxVL
         Bjj3FgM8C23nvE2xhdkSunFa4GitTc7XbzQHyKBHl8kUSyl8RCUXH0JCsIRgrfSvO9oz
         zuKn51dcWlTpPPNN4Yyl55LOatLxBbl0jF7t82ZwBFeuAocLpncAPHMWN6GbhgWsSa25
         3Yjwv6H1DYBXki0n/d6+yCmfsdvCc/z/VRFtfUKNBdybpKfSFvWMtZ/MHEO/CRsGr2mu
         qUxw==
X-Forwarded-Encrypted: i=1; AL+hErFcY0kw7z5ClKz0u/ppjXT5mh7tDqaPZEVg0x3tIgJIEtqSH7Cv0DhlpX/kW8M/NXne+OGUaxEoNSvM/5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+48zTCI4t4h0esk0QekECd00wl/GQSdqXgKgiQN5lIIbgcDj/x
	eg3nu1Yhgcfy9o1/QaZlGsr19mcMf58c87ahwYfuE2tnWQ40F2CDre9/ZeX3a+OKHJ3gSpTLvvW
	5pcRm9fzIPJA5pFt6y9XYg5K6xTpVJByAdWjArHQOQWJMEjl8CnO+wRKrvPVmvR7nyhU=
X-Gm-Gg: AZFdTZfIIduFDFR0bSqmAWI4jHgbgRFcu+1l/JRBB6gsjlIOciVm6qzcOsts0F5akCa
	PZc9tE5BtLEThwvx3gNgyk53vnaK2FFugwqhmY52ok2jzErnLFzkAL34Wn9auf+/7tSFbt5CH4h
	hdtGYSKhYb8Pj57BHkTTALF8ONQgeLptmC6Ay2qvq2VGMaTc9/3nZEFacr1Qv1BJsP3ukjKp/B9
	OnZ4af5tOIsdWKXx/loTrRYi1zQV3Y1m/rOWP4Wpfw5y3XwXF8TzJwzlPE+dXFJPLvHBLYfnO5S
	UG4iT+adrAadC/OBfqMitYE7KtMzUpTRI9INXRC3aY7A+6rrrxJpfPwvZR4EqwNVSYUO1wHnbOp
	TLNANn7PuE9143GZWwmAMcM9Z176oEkG6Nzk58Oc3EqFLCB6whlcsmh5JXpByt6NRvELf9Dr2OD
	Oa/8SZOM8b
X-Received: by 2002:a17:903:19d0:b0:2eb:3522:99f9 with SMTP id d9443c01a7336-2f03f15664cmr225684935ad.17.1795594872614;
        Wed, 25 Nov 2026 00:21:12 -0800 (PST)
X-Received: by 2002:a17:903:19d0:b0:2eb:3522:99f9 with SMTP id d9443c01a7336-2f03f15664cmr225684625ad.17.1795594872169;
        Wed, 25 Nov 2026 00:21:12 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:11 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V2 1/3] arm64: dts: qcom: lemans-evk: Move SD card support to overlay
Date: Wed, 25 Nov 2026 13:50:53 +0530
Message-Id: <20261125082055.488583-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
References: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX6frRg+BgGCm8
 m/OFfiUI/mbZ+wGzhy7XBfWyJpyK9+MEsGYBJ/nzhN5y72gGIT7/lvunFeg3XU/vUNV1/8XiS16
 TB9kH485pTbQl9NiJRUX9AQ9tu/tdik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX5Ws61rQBYLjU
 HGvY0lws+xb/GMGMKWgppw5TBIg/PDeRjFRoWNn8sGkeG834lt4/uQuzvFMkHOJB4gdXk2WXsZ+
 6DVMxZzcY5cyho9v0rUoq8qD07jN0YTog/pEX4MmSS1N2S3LS0ozhUFFV/m58IC3ZRqPUBnYy/w
 YivnG0DSq5WcFgv2p7ZU5X/V55JfdXOjryh3TB40Kaqpi05Oz3VLuw8p/bewE/JRs/YV80TkYEW
 0vnioBcCTMYulmSOCjHzV7+Q62f5Rkk1EZqNYteWiZ5RIAMKuywy4cD081RF7i71A/MBolFp1xE
 MAPFw99OGTOVm5p1LhvLjQvGuKAe0EGPrEH+ruT6mjvP+j/DifvcHpZnYenjLE8YseViFyrKn66
 5vuErf+ICrbAbRQwf070pVsAEPFMdB1DOZYJAv7Aa3IrcRXVG81PRJF9zobjE/7MT6h/WSlk1qw
 t7BukPSz2JyAnsdg3jg==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b069a79 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=1d3nOwRa87lU75lj35AA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: BsYTCkLHFGF1ftnJwE8VvqEBy5aMnhN2
X-Proofpoint-ORIG-GUID: BsYTCkLHFGF1ftnJwE8VvqEBy5aMnhN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250033

The lemans EVK board supports either eMMC or SD-card, but only one can
be active at a time.

Move the SDHC node for SD card into a dedicated device tree overlay.
This decoupling allows the storage medium to be selected dynamically by
applying the appropriate overlay for either SD card or eMMC support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +++
 .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 ------------
 3 files changed, 28 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..fb894ff002c6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -67,6 +67,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-xiaomi-nezha-cn.dtb kaanapali-xiaomi-nezha-
 dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
+lemans-evk-sd-card-dtbs := lemans-evk.dtb lemans-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-sd-card.dtb
+
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
 lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
new file mode 100644
index 000000000000..007ab6347349
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&sdhc {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 603a3fa18994..05a6e0c27538 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -962,22 +962,6 @@ &remoteproc_gpdsp1 {
 	status = "okay";
 };
 
-&sdhc {
-	vmmc-supply = <&vmmc_sdc>;
-	vqmmc-supply = <&vreg_sdc>;
-
-	pinctrl-0 = <&sdc_default>, <&sd_cd>;
-	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
-	pinctrl-names = "default", "sleep";
-
-	bus-width = <4>;
-	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
-	no-mmc;
-	no-sdio;
-
-	status = "okay";
-};
-
 &serdes0 {
 	vdda-0p9-supply = <&vreg_l4a>;
 	vdda-1p2-supply = <&vreg_l1c>;
-- 
2.34.1

