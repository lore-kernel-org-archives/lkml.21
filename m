Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165199;
	b=LyBtj168kTCYcXTXXG/cPVAX5E2gREJ1oCMalGet0uAH2QB86+Zazi0dgLCEbXN/rhOL
	 JHRWRrVLra1l2NKmCoByy+Fdk5QbHI+ABFavhQOiScugDep6P9qZZL/4Tx5tt2UqIBXw6
	 8cAoFseVknNiDIrEHfuLA3LJUYx+CG0WzG73Qhb6KKQW+j4Xgd99HQvrDFVLPh70fW8iO
	 J/cFY5XEwgKuZHucobcT/itRdotPxmEJUnr2ObD7IWPXqKOKPWovW9rc2Y0uhoNA69N29
	 ThqXVPhpKb2bdp8M8P6e+809B/UXB31LgoBD6cV0Tf+NgOYee/CEE7y+gel++LN5SCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=;
	b=GN/czUzQyYDjFDkapaDdM6ujG7ZhwQy2viySmQ2P0fxajF+e358RdpvqE+6292TLGYuH
	 DrqR0Vi6o2qi67YO1f0Zlq9qChH0Ubch7xOsav1yJ/YF1nQvwjcqQHwNRNXH8p3MffBbV
	 KxN9CHPH6pPAE7BBO9ytwKomTWgbnuQHhTk8MNk9DQZkguhBetfED97tnoCLah5PirviU
	 KUdIBsTWTXm0PCqE+snYL1dCAQXeFu8w3T8ALcchoXLnPm96gMLbpfR8XGs+B0Lp6eR5L
	 CSSuU2SEFb6L33ZlrU+nZ4rPy7DNkxYlVBDjLx2Gb2WYEJYp8FwelnlF0HtqTrFT/Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RswzydCV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSiAsk+Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45578606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45578606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RswzydCV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSiAsk+Q
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fqGG2695550
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=; b=RswzydCVwpRN0aTB
	hKXywHrnYYcvTSCB/seaXPvfoeM5J8GcZpTrzQrVMQvt3hSdrMXM5ZhGDyzCTVp3
	K1Aqh713GmyPhl867lXvmCQkn5RGuzFTmQz8QFkH7oKLMuLgHQMsNC3Kpji9wahm
	OZUKjKoa6uovVnGXZMCrmIJa9j7tUOMrKEPj7GTp4X4b3RFfA8kKT2dUQ2mhCPAQ
	9zMhy+tbsBArlQ3+jBJDVOf2dQ+M2p+qBks7y4TWnaYEeVzKN8x+g86r6MUi0BeV
	DwzsM800pbIZKxqVkZycHIqUpwgomPozrdxl1XIcwJrgFQ2BtyHxyI/W9jU7K7J8
	uE2Opg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au2u8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:59:43 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so1886337c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165182; x=1795769982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=;
        b=cSiAsk+QRq/Gfs1mAGfjoPbiSjUgl46pyDp2J30Eqjjn1Xk0JRjf6e6eDk93RJydJ9
         GoHL+SSfn9bUtIAa7/KujYx5UMjCh9B2DEHK6G2lfRNKph89OwqE3yCvKuAihFSeABl3
         oLEmeLnw2CDm+ZqWRzFgP9KDmGcYPKoNsIiPyaCvvYOfNIX4bNepy8+IcIZk4rrSMQUu
         Dq0jzEmZ9HT6mNJtSVnDVAn+/nPb4Zrgoqs4Gms/2XA1uIqsyMkJcW7/kfvUGWHMv/5w
         4jEUEzL1OhdPtCCCavyY6sXzxjL/jZEO5xZzshomrE8kSm/oivZEcx3LovQVc4pDzKzZ
         hdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165182; x=1795769982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=;
        b=XGixk0fgmaSeLgUMuINPQWZRcoVRIKAmLqaOW1vdOXFXsQ/TOn1PS5F3ZhMY8PwyLP
         jJ2QcCpdWCIzOdwiACm9WwU8leUsRN8J89nnQfIg0K/6wpudL649/MyzFxnIelN7NWuG
         CuHyskhzEekqaDPFBCfawRMuteBjmDWQaK+NjBdSajo+qw8Hg3tlfdzvFvv0nV+dRazI
         esfjC09/0CQwzFHkUJb+WPRmohYTAhWMsjSGHYwy+PpftKz4JbQAqu/iiGywWv4LhdNE
         CTOHW9cGBzUcXGYVj41P1uX7tspd+uJQX4rynoGvjctlYFPNxmiwORSQQtn9UJAA/Q1I
         MKFw==
X-Forwarded-Encrypted: i=1; AL+hErHL96KeBpdE+2ucR7ejgwZMnXHMwpr6yJc8eOGauTZ8jznRf9yKW5nVN2B9rcHhKFR470zY607ATDsyuiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r5iJC8eFnoLjelYb2pSCxs/67yCLhPSXCxTmGlaLnMb7kwGUQ
	tr48L7HB1RcG4kM4b7VIbM4aFn7mfAsCJhQKY6IB7TeEgsNPZBP4NK6IOLNPOtcL+uRbEPlWwHI
	d2sA2omRa/JsHZfprr01aTZPlhWNxpXwKFV8Z61sDY0LaE9MP3zJamhDAHfEzDOOvdQ8=
X-Gm-Gg: AYBFou044ZPS1yrpw1AJPuu4zxvP4W2QRFuekqwwbyyxdD0uj/5I9QRe9dPueRvASll
	ZohgVcWX+NHgfQ3Vxic5ME1SKj5EOqwFVgsQ8OQYbAFpLrg/OLSHOFK2U94iKSFT4ryJ893yMnD
	BOKCTx/KFtc/FeVcwH0cPbkiu0OGkefb+8pwtE4RoQJp1WyhG1x7WkXwUr1hO8iKO1+q1B1DYKb
	zUdmmmANLZFfbQBqM87T4yUtlTAiYLyc4Jxxc//sL5XiG+T2KoZzgyDBI2bxsak1/J6znZ9ga3q
	IIKy5ku5vpxMiXOGv84tfaUIs9qD96Hr4KJPKPMYHlPJwv6BxlA1A3HKBH2oGHNd20CJHdwPxQ8
	zdiuvdpGfPY8K5PI0vvuHvfi73cqKwUVoWZWHOE/UznsgwJUYuVtxculPuLwwP5+b6+dd8k5O8f
	nMoO1e/Sc0HezGQ/WwV2XT73DsBQG8UERj1POYmS2rsE9Uvhqp5902F6U8oTb6WRXUXzrOTbrAF
	15sQ8N7CMI=
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr2130560c88.38.1795165182289;
        Fri, 20 Nov 2026 00:59:42 -0800 (PST)
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr2130538c88.38.1795165181856;
        Fri, 20 Nov 2026 00:59:41 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm9490658c88.9.2026.11.20.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:59:41 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:29:09 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: ipq9650: Add RDP488 NAND variant
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
Message-Id: <20261120-ipq9650_various_devices-v1-4-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
In-Reply-To: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX04fSVMqw+o9B
 ZiSq1GtCiniEAYI8vgL7zzoxvUU4g3SayiVsDisjbG8xjI/Wj97PWMBFuFjjbrjDF1SyK1Rpdae
 yIjhZmNldHDYivWINbiZ3cavtA6+qaybW/Hi/E7kzhCgjskeDTye1wNVywFVvwhPlh+t7PXCzIO
 M0z77ShaDwZe2SHUtp8uFhJKyt28dZu5FLd66IpikN+HLZ+Wd+gj63vRLgT40aUAxFSJEvbL0f2
 E0Bec8Pgm2U/DMbheu7LyiP+Cu9UVXurSAYG/+JBX8azYafTYgh3SGNMtOkmV3umIzxzQVPeeAp
 54/8r/HAUEfnhaAAjIb3J/cuaZ/LysyQZ3u80oweiBCp4hXy4hylRPG17UdZ55Z1sgSgV+2fGL6
 foo4wjgjwyAEwo4iNal9/RyEU4IrqOuzbgPhueY0AhK2/eUdWrxYLnmAUW6u4DVs1D1PksN9y4m
 Z902gBGkurrECRlEyPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX4v1lBsZVesfi
 pOoZBTFShf73fLGDslMNZXCpCfqcfGxifeHd2+hqfqxMm6JmfMR47C6PWIONTMvIYSqUKnWijXC
 sdxq2sqPlOl3BflO3FPubF+c0ZA0Mws=
X-Proofpoint-ORIG-GUID: iS7_pA4ggC5wY727oZSAjBaDcZDXoZ1q
X-Proofpoint-GUID: iS7_pA4ggC5wY727oZSAjBaDcZDXoZ1q
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b000bff cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yQIfAQVsIWg_aQGHYmsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200035

Add the RDP488 NAND variant DT file, include it in the Makefile,
and enable the QPIC node.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..f3d3de3a1f7b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -60,7 +60,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb ipq9650-rdp488-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-xiaomi-nezha-cn.dtb kaanapali-xiaomi-nezha-eea.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts
new file mode 100644
index 000000000000..fe592e04551c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq9650-rdp488-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488 (NAND)";
+	compatible = "qcom,ipq9650-rdp488", "qcom,ipq9650";
+};
+
+&qpic_nand {
+	status = "okay";
+};

-- 
2.34.1

