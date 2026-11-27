Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789708;
	b=FIAbELonCu14s0ksvKXU7NsrK4lSPNCLj9ARSu66DrfBq3nO7IpwxtRdk8QB3hb4kU5T
	 /xrvPssNnFvIWZQpbPv+LLJBL78EPOcS6OyjNKCnLtHvPBn/H4SY9m7gjJ2Al0FPN7M1l
	 ERX8FHkxSF4VvF3Kg5BW4kZ+BsHLnHh4klrOhRRgynzR42B6z9re4EfifFeFIihpVL+Gs
	 +00mLwu1xZfSISqftfBQ0GgSZqo+lQ4H8VBYkygPaIhU+bTaXrwuI35Cwwtt5c4C91RGd
	 /rlhVVh9jkye6dXmey0FxbEPo72ZFcKWc4J9LMGbnX1vI0l2m/fX7Ac2qlSsLygLrwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=;
	b=u5/q9iECxZ6hnPN8cDWtDV/tAhBPhh7mgXXgtEeT2OODVBvtvIAc16pZG0gva2bbhNpT
	 XTvtDpnuQ4JS3WCofOnqKeMnA49ZFMTs0XlTDDF+41bIVBSMuEcoZU7mUvX+IOutGGBLA
	 reo1mpM0ea4sDukA4wZ13ifu8NTnfLr7rtzvg5+p1uz3b1N29EsPWxDZu/ygbmvhblPbd
	 WH1IsdFiC6401A/VEZdbCMHVB5N4xfsY/LWVyjDK4Y7g+X6wYPXMIF8EazVocSDf/10Tt
	 ySk8gH5xIwDt4/obcRoFok9EQqExEcEYoiP/uBBvz40iA9gD008qotH86BfvBZzHtEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPBsS79E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qg2qjCSm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC883606B40B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC883606B40B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPBsS79E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qg2qjCSm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1HBe2376270
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=; b=bPBsS79EvMz4ITgt
	ZIE9FSOFkFramLP0e2R0p2Nzd8F8UO2hZjbGFGgTr1PNVQKEZeJVZEUyVgqssqB2
	kvwbvJhN4IzWO+rF0VZTPPUUjwVmkv6oFAbNJZXEoS5BqTQseEqiRum6Uc9YvFIJ
	asWiZKJGLGkumLuTcUUS8qIafHn/sGvCZOm7+IxgHk59rd4ehGDLqE7Yf34j2IwC
	7iKN4boWKj855Whq/gkD4wxbvXMrHU60QCkhXmqx6MyB+uXgi79wIMBo8YQOZr7L
	loi56rLpUeOYoFI7vNYAL7bKS5uZMkAxFDDerHuHAUlJk/NhV2lo0WMkNIGUJkD5
	eZurVg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4huepa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0467a525eso61256975ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789706; x=1796394506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=;
        b=Qg2qjCSmpdyWkeasQGxhK7wFbvsdElEv8MHT7JUOxPcFyy0CAe+f0YcBcl1c8wqEr4
         t8QGMj4ZLIAKIQ5EahByd6sINERp1FhS/m/eGcGFVoc5kPtp5wHUnXXyQcK50hNSbrPY
         1v2IPEQyxR4IkhnV33mXaUg4J+yMP23vrPALQlV+pK0+eqcTgNI5JmAk0+HGkEnaUB1U
         TKpRSahA0on2YpeUI9bECv2iWidWwNDigBYPwO4zU2D2HIrUnM6zUmCNguM9G6dysiq/
         NoQVAHBkEsGh01z8Myxsp+uo89acEKub0bTDarq2pOlFxK3dkNpkx1a+5MsGczPQS1YL
         Gm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789706; x=1796394506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=;
        b=KKFI1F4xDSqnbCkoruy/wA9z1S8MoGMn9PTJSLsrW1jGUAXMNGQAI7bBHFYDMAspBK
         9Jtj/KMml7p+87g8mPlQbZgK8z4cC0qOi645mHuaC3S6mTY3M97hCrwxSeHBPh92BOE+
         FekUq8ZkvwdIzeNztEO4Xm06R1vlH9Tt1gSyccSTCANjyEZ2x99/IBaQJaBmEYztaxAA
         BR6MkJpxuTFVvhHEusAF+5vUUZh84SSpjFyB4/r8Mo6B+OBghSIsTn6taS8RBg5Yjd8Z
         myOKIr5FgxuTl3TW8VfpMr5pp7v0dnE+Y2yEgZIZwhVNmYOb3wlEQVz0SOXHOrBUJWh8
         eeOw==
X-Forwarded-Encrypted: i=1; AL+hErH2ZxJP9sItLyaWn5dMVjC6B21goIIslgm7SKwYQ3HBYnus/aE0TLJh9zr4C69OHZX+BdhDsA3owiYDJH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h5j/DihLk2JwzveQsTb/8qQnNIuJ0wKKswXPMw+oYu8RRJMZp
	wvElgyM/Tv5X+548kSR1CMKmQ3huwIqSJLlMhuOg1E3Vy16wncva7d+X+TiYSlnPYQBdYOJXsxo
	pvcwbA/sOfU4qL0ZACTJTkmWlTIQPj+fAv1y3abWibZABllsMZed7GnZYR/nGcAUeZ/I=
X-Gm-Gg: AZFdTZfOJ4BFEbpt4+K9yK1mbtz0Q/Ws269exGQTGG31gx9l0YgtkZLB+/25eRuEJ7D
	tngBdXyXk4/oPVd+XiE+zIXeouZFJx0PLRLb7MbaMg16UEmbNEzOEclwM4cvIQKrhN3/0ZeBL8G
	BLeElwmfS721xrfIbphiCWjEbFO/4opAsdwe+lw+lOfopxcmLXt4RDlnYB4lpvft1nX59BfL98s
	PJEUhvLIrBTKwr4e5UZ1Xp47X0AoHIZkd+rps5en5WVBMO2yFPNT3FCDuKHIrMYMxGQzYDRywsc
	3CjxkNuwAPG6iTuFydpc/L/loxr4Prw8P9Hzo22CLagUp4IlBi4vzOZQi7N6b7NStAs+PaP8muq
	FG1KfbBSayhN+pGC+NYA/NCG5+/oz+RyrwKOrJui8aYXnjWx2JM3NETA4QKLZnsMLhtiJ5B3LDL
	grDu/gni9KOg==
X-Received: by 2002:a17:903:1ac8:b0:2f0:a586:81d9 with SMTP id d9443c01a7336-2f0a58682a8mr170116055ad.50.1795789706106;
        Fri, 27 Nov 2026 06:28:26 -0800 (PST)
X-Received: by 2002:a17:903:1ac8:b0:2f0:a586:81d9 with SMTP id d9443c01a7336-2f0a58682a8mr170115435ad.50.1795789705484;
        Fri, 27 Nov 2026 06:28:25 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:25 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:00 +0530
Subject: [PATCH v28 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
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
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-7-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=2209;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0YQGDiz1F/FLEBDHTFy0NPa6QbvpSRgMVp0jR7EbIWg=;
 b=hH1f/4RdTgXXzUD3HLooxCXl7oj1YeLziyFQ1gZrW49x1biAd1StmoVIoK3SxAEPlFz4X4Fht
 FHtkMV+tGSPBpLein2a+YAXPEHX4HXgHfK3UpVGEududkLK7ut2VfC7
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX2LE2kMens7oE
 KjBnZ3rDzWpajV7J/37oD3D/Rpyc44oldpNb9e3Rr0o4zampb7MPebu+ZNrndjVKSirxhYQxNjC
 t42jc6a1QM6EihHWfWTLlNX09Djk7lM=
X-Proofpoint-GUID: 8NY9WwsZE7J4DZm_nCv0aWSysJXROdQt
X-Proofpoint-ORIG-GUID: 8NY9WwsZE7J4DZm_nCv0aWSysJXROdQt
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09938b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXyenUtUZ+jDJ7
 wMK001tKMt4HluJU9vbffu18pieaNz4YCrC1EyrU7GScW1xo9sNnZK5BpChlYDRMHwR8L4JP8mK
 eME0J0E22DIh873IxjYUQ90nd6PK++/lRF02JCPo153D/Rd2ePYWKg+zG4UVyxI/E69v/XryAPT
 HDisUjdm0tuoCOCqGiLpyQW4rfGEVZg2SW0qTCvCDZ9ZcGhIdi49xaOSHlG/f9TrXE1sbG+Inoh
 Kn7koo9MeCAvLa5CbJRIBiA8Ta+wiUfkh+PZu/wDNCAoXOOmKqIxljajGNENHN/CtLI+5OOE3nZ
 4Qw5c+sq+QwQrab2AB6Nmw05ODjPmcMiyQG6yY0WT6kabJdYqvH8y8ZklVfKLePokrKDPBjMBMQ
 h7Y7Ogs10wJiG8XGHPQ7k6yEpj88qywdvzZDiDSl28uqBrsj5T4eAh7suP/hXBeCddo5kDeYPiw
 pbQiz7SWvc73tz/kU4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed60..f1c27f9769fba 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -876,7 +876,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index cb90a83351c30..501e3c0d14028 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -791,6 +791,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 682bcbc0b466b..3c05ead3a7ebb 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1136,6 +1136,13 @@ &qup_spi3_data_clk {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1

