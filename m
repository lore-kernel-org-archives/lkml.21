Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329982;
	b=w4LYwUpnSeNUWF9c8v49GmEmDeaXEaH0SVNX7JcMPV9+0WYKxuT9vHWcUUDhpN8ViFut
	 dHSe+fxCvDBmwyv6p57ENm6rk4VwvwMIwi9ML4fF3oaalsGh++pkxNny1AHqunzXGdc/V
	 AxCCQX75WoB6fWwl66j218qVWDsfjq9tMVsvhyS3CJ4EwwJV4KHE//4pf3zpe32oWsm1z
	 4ArslHIkogjnfDu06QtD72du5oYu46vng0NBVGcJxtw6UxXZTBR197fuvpxPCmqQPLwrd
	 AsRny8UYXlqYlphvNTJeRtlwMFQRypqWe8ZPNCIDKBTENin5dfH/p4/Oi5CVn9AlkoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=;
	b=1krG+QlDd6KnhRl3tkIUrR97/ilaDeW35c/4zgnOKGy7LTy6enqoFBd0W/Cjap6Si+Qu
	 I3VGNb/D1wjSK4AsXEmAvqE9kB6WRM4hYP+QkwPcf6g8KeXtKgj3Y/Uhqa55lL0mfloK9
	 aQyfjnQ4LX65aA6O0D7krs3foKn3TNVv6AohmmOZQ73gAk7/UnVkOkNVZhIiPKYoSy23R
	 7SiU1KbndrBxqCcaGhzFFPCznsS/Z4oBYTofOi7ZPfnAglUOnJMf5rdPN90xfWn3SM5+h
	 yOBk6kbQm76WBgBxofyVFbsf50q0Dc88DBY1qq7XwoQlETTk+tl6CR6aRsyMca8oAqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsfZZWu+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZDpnzDZl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC107606A683
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC107606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsfZZWu+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZDpnzDZl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM3kI2w2612006
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=; b=LsfZZWu+YdfgIrH2
	Iegjwju0OOrYTkgJLKR8LbyqlXyDGSDloEDfcc5Tu91EUl3+CAakESqAG2TdEpCa
	9+lYy8oHhAlDTUs+Qdz9TH4Nx9OBNWaZ4A2g7m5TPGfaQIVf1OePi7ShwRkWenFN
	d1UtK8PvUkRSDD7Sm7IkMVQigJ3KT9w80lF9ThAYSVcu53nuhZTUtSo2NLkuqFxp
	AkpEUnz7V/FSpzjq5HMmQxmolRNA5QUqO0K8qEQxdvmjxFytJFL02IzH4syCIuDh
	GoZbyaHBwIMp/SOFyZsfmwMfuBjtfFMug2Ydn9vFyxg7sZ8hWVhparVv533OdLl5
	ARP/EQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328ru12q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:46:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso7494253eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795329981; x=1795934781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=;
        b=ZDpnzDZlfgqBHFCXd3XpLKU4gzFU04Yosf9iT3RNuGqXVslu0wmaopC1PgDpHJ+6jr
         7kZTqii5dk8yguoWnNWZ9iGXBbOtqhnds++IyqUll+PCqLd+MTEhWNENFsm+hltqk3BR
         TrkGls5iBwhhiviQNUmtxMAQzKuKJVHWjmzIZ9o9UsGJ1zkIjdg3jjd1tEW3FqoEfW6w
         f8Xr41Jut4iUXwHfvxsDFDN5Gv2oPXuUoyK/tUL0U+rNVUkk3FIYSfb9L2yrDungcxnx
         4gDN7ZskyoRVPsXIbX3k2Fr4a1zU0QLjG3IOTolGIvhwRRNk+6YAmawm6N7vHqi1Zsp4
         c95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795329981; x=1795934781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=;
        b=zAfQyuHtxXd3FJj50Uhf0LbE/0n86gP5UIDuoNEYvMfJN9cm/IJywS0kZp+LaPW86e
         YIKoyhiazXKU0sfdWwpMfyc6nqZL7W3THNA8rwQRW7/UbHuMFr0xUrhmBwhlXzGqulrO
         rVLBzaroQvp1NCQ06RkghPFaGQ2hQuvA1XTFG5+6Zfj6B8PlxKAXvmYdvvcwo+71h7Gb
         QapZTNTBfIrEgbHJ0OdqLtbR5yUTKcXUpslVcea7RRg+wQgtZDqkDDquqETF4RCZKWcF
         YOGRBbdrBnr+g6Vp3kbTD6yl57zz5k/ZXmOSfMb7j7h0QHzbMGrMW2X8dDllMHmN1Mpt
         Vssw==
X-Forwarded-Encrypted: i=1; AL+hErEDYn3XltOyYAsHUaMsSNlHVcTYm2NAbKaTW26o7ms2MQ/6CzEyVk9dveMm3MtX//0NQicGa3rt7B5S1Ho=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D8nPapMQaOhmyzb4MBF7fhZUU2oDZwlbeFTWboy6v1A03elHc
	8Zb4sN95F2nLyjKvjmhak7rNpQC67wdCIYjLYSsmcUrm3KEyhtYzJu+AXJ3e6HACQvSJ84Fzr9i
	tLmTzbBxuZ+lE/Uerzrlc61usNyPvMhND1YAcGrASkY3c5eiPswwo2k1QqEaPwMG7KM0=
X-Gm-Gg: AZFdTZc+H/iV2WlqL9q96jZJK8cK3Qnyc2U6UiMpNfj5i5gxa39YRS3jSmQS80ZZvbR
	TVS+COEVmw6F9Fvw+Dnxt46TeDtm8Gf9Ni0Z0tLBuTMmNCYiI/fxrp7y8VXb4QL2MlPh0sWcZLD
	goSTfkRtLkZa1hw5eNDpFcCEg8a2BvbfzoPeyRZZUD/CUM+CsckT/IkyqLKhqE/9e1rv7oyAg85
	fSkMrV+mAmQk8btmmD1q2Jtubk3g7HM8ZDu1QVh20GJeKLLFyMhJyru+tYPwU3uAqM0nW4HNi9X
	wZJwULHWbzbChNmSTd1hvb5shxBr5ICE3+QvGRZRpadcykLvsEAro2OVmHb+iTIF1AqKwe6gPQQ
	6VPorCwcF44m+FWrS4vr+9LMfpPGuyji2t2zsqW5JfKtkpsP42a/8EufTkhDkyNaDD0J0UC383h
	Yhbq4iQ4Qd
X-Received: by 2002:a05:7300:8288:b0:384:f214:a408 with SMTP id 5a478bee46e88-3857044f2ffmr8905148eec.38.1795329980523;
        Sat, 21 Nov 2026 22:46:20 -0800 (PST)
X-Received: by 2002:a05:7300:8288:b0:384:f214:a408 with SMTP id 5a478bee46e88-3857044f2ffmr8905121eec.38.1795329980032;
        Sat, 21 Nov 2026 22:46:20 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm27598615eec.10.2026.11.21.22.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:46:19 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 12:15:54 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: nord-rrd: Describe the PCIe M.2
 Key B connector
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
Message-Id: <20261122-pcie6_fix-v2-4-2e0fe615d90b@oss.qualcomm.com>
References: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
In-Reply-To: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, alchark@flipper.net,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795329956; l=2116;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=xSU3owBM0txchkN3zsSOuMouYuY186IHzX74a8nKw8s=;
 b=LYm+5o9UAUI8UWrXpqljfX6SY+ut9AqqZn291W8ecTKj0wkOtXq/jb1fUcTPjNXSwpQLR2gaB
 sbkBZnRlP2uDiMw/ZSgBxEKMOyxnuN4sk8q70Lr1TGFdxZA0ZaxVyJK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfX5QinFd1tbftE
 cUy4bXsMEGa3A63fjkUYfmHppevrx2qdaY+iQCznJnNHdovT7YvTTjwBnISUV1KnUlIxhGJ44/3
 9d/ILrchT78l3GW3kaAnFpOxGEVfzUc=
X-Proofpoint-GUID: Ssxl4TUst9v2A7QRZRzI290K4F7NLZ0w
X-Proofpoint-ORIG-GUID: Ssxl4TUst9v2A7QRZRzI290K4F7NLZ0w
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b028fbd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfX/e1bJO0cv2qy
 Np4tMdh7qoosZWkM4tiHcRqb0Q52oi/f4ejaGSCFczExajqu9i3EFMecSMdFHKqyCOYnBm4cRVZ
 pKJ6CpqhzdhL+B243UjRkz5M6htxIgkuNE3fF9tXvBjL99jbv3elntfj4zYoIsI0SKbZawlMGzq
 Q4XwmWex+uxHkUj50H6vkYdvLN7e1l70pW85ddZ5yPMGHr374rISG7B9abAf01VpSEodyV5t8v7
 qPp/gAkm0mgxGCddpYUcIoAwKfaLRWWnq1IlaXFnTE+VpyLBRZjbRpTRV0j6q1P1MAnmIN0LYJq
 hiah9QzU6hXUGC5XtuKfbg+JoIKZAJ4U5LsQT8J9BXHWgwsDYz7kRf98AwHDG2oYoEt1532HoB+
 ALwaXpIUDaQuDFyV1tlTEOXcxaHRoX3+iFkNU1pdrh9N6bQ6yGVgOAyV1ydDf00k87AXKWpfFxU
 Z4jyJrnwj6Wgy7TNAOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220026

The Nord RRD has an M.2 WWAN slot connected to PCIe3, but neither the
slot supply nor its power control is described. Describe the slot as a
PCIe M.2 Mechanical Key B connector, so that the slot power is
controlled through the pwrseq-pcie-m2 driver and the PCI pwrctrl
framework.

The slot is powered by the vreg_wwan fixed regulator, which is enabled
by the MODEM_SW_PWR_EN GPIO. The MOD_FULL_CARD_POWER_ON_OFF GPIO drives
FULL_CARD_POWER_OFF#, which the Adapter treats as asserted when the
signal is low, so describe it as active low.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 827d3ba3a238..59a0210e7fbd 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -100,6 +100,40 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 		enable-active-high;
 	};
 
+	vreg_wwan: regulator-wwan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_wwan";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wwan-connector {
+		compatible = "pcie-m2-b-connector";
+		vpcie3v3-supply = <&vreg_wwan>;
+
+		full-card-power-off-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wwan_m2_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie3_port0_ep>;
+				};
+			};
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -537,6 +571,12 @@ &pcie3 {
 &pcie3_port0 {
 	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie3_port0_ep: endpoint {
+			remote-endpoint = <&wwan_m2_pcie_ep>;
+		};
+	};
 };
 
 &qupv3_0 {

-- 
2.34.1

