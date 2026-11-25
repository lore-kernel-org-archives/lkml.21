Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577143;
	b=YyfhXmSYW+H4fqGqh83BPriHXAV7O3YuUJF2G5tKRV0P7nxTQyUh2a9R8ilr1PM3VrCi
	 cJbMh22S4Bciy0A/I+vzPKMH16mRXkPUEKLa6bwKxGna4uub+FjqtVI/0zZAF5qxunLv2
	 pqG2jCLoQ2wiAIryh2AOWeXC3+jrrV7WGZGdRwcAh6H/ZuAC8KW45QNyVQKetQ+nNbvXx
	 BrChCDR72t3pDQC58qqjhfQByTIQXIiU7T5B1mYSBz7J3DDfw36kKhdD1KV+Vn1t7Kvzt
	 ED6YGSdT/SePDlRccxvRaTlaO13bw4lvGFu8TVgeFMJiqpsAENUNlxDx4T1WKxo/qnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=;
	b=ho6IrluH88wEx4dGboytGKGWOnEHgAXk3nXFpTAPlSlVmgoebs+VA1qoCuOfdnJafrjE
	 ois08fOD5NjmQ0h+F4HOzJIuHIgvrxLIWBfmctMybaUlddQ7sLiOyYuZbEnWrHvNN0cMV
	 uWaz5YUef2pxafYsie9jqrIbL0NpVSQ+wdG2jdYGPB0R7X38TW+h/833flvSAheN2aZRu
	 Es82jRl59EV6U4IBqK1HNeBwORrqKX6MfHbGXs4sLMES84PH+f1IQb1BG82qKW5F5v0yT
	 DyRbkSRei7p53wRhFjdUOJLqnW165Ta5y+V7T8sngMXS3z4rNFUm9fukIaHO8Kx9c4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8le7JiH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=epJPL5gj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7C3606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8le7JiH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=epJPL5gj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2BbFS2597441
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=; b=W8le7JiHltt8AMUK
	JegkdsWsJOUp9KWHiz9j87oiyV1gLWetiEM//EXrpQAfJdZ7MO6du4MlnaPkZDu6
	DKw7M8LmhW0ekovdNyHyBYx6IBojggPx9QF1msyC6ncFcA21evjwg/kNAz+2zdBD
	aevGyBvH5rIMuCU7WXwY63b9Gckxc0+JP3ugNmwP8oVswY+m/oc/rmb+WvmjKuFz
	gn8OhSt98H5u3hvzadFtvjK7zM09vHK96qu77JYQ2xhQVf8wegumXydWtGM2CIrp
	9ieo2IXPYeJtPn9JzHKdqpwDcyVUtXrjK/uuLG27ECbb40S4h3rzrc2PpYoPhwDj
	gcnsxA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns9ftm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:25:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so5566392b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577142; x=1796181942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=;
        b=epJPL5gjM+Pe8hbvqMcNiqgU71he4oqeMgGYImraCdxmt2SUtSB330MZQ9bKY6P6Qo
         uRV7OpZAyXguLTfk6uZ6hRhg1p58N3UsadxCxPRnBNRu5d+39S+LdLbaJ0tIyXN42PCF
         AYSpeS+pQhTEjNE/UfmbXVC5+QtGZAS7jzmet59TKw3RjyqZ+m36lYnSPD+t78asEPDI
         9HwQ+lInTERqNTh/hUutwnXvbV01HMznGrH1qvZUH6qtoCxiouQusyQj8UKV9B11MSji
         Eu8u3OawwwHt2GdjsvG4yyJCQet9mcj4Vx9DxdM0sHI0dzgclz2304UWCCYFXncN1+AR
         Qcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577142; x=1796181942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=;
        b=Rm0X0LAYZ4r7K5fQhjjDi3m5sDA3CfATOUhcqo6pebZMQz+nNYAx7tjqha6GvUkIuu
         ISpD4rOHCFBYc6RWZQ1EjjDtFs8FMKNFhwpnX6u+CdCmbuGCIDRsE6grF364NZfSmTsD
         p410AT7F7KnHUri3FeQU6Z7mGbjZwZrodo3YvdMCzk6RF10jKcfAD5CUpba+Etry7aU6
         IauChXnjSt4TLVlPkqy+xbf7bOS6LlZyugwkSolcVkVeCrI4IrYK8WF3hZtDysayJ84y
         qkwMf7+FRHYdfcPPJSUQNQcOyevFPbJbsIo9yX9d7KK5HdBJvgz4WeyfwyNiSIejlFCx
         7EFg==
X-Forwarded-Encrypted: i=1; AL+hErEulGwpqWm39RtQkEDjKwfVi+YPCImn2YuKctA3AZO3vwaBWAdPgckdrekM0ZfPLIdiTAuK2cxN5lUxC2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HCd1n8cdQU8yU4wFKsQTpd8cgkwWZaxWCB6T9fU/1rekprOuE
	5Kzujofp1WFci7VSkX36B5zPG9sWe6caCdeEk2sJoRT1OkXmoISnumN/d8BY/S2smHIUFGzGSRh
	4i0fwQ0YNgoXLTQRJS34T58byplYExhWc/O56/1wZTpCKpE/u71JeIcuT8cpYGmcL4m4=
X-Gm-Gg: AZFdTZf7iTXljVrivgBkf2Ynn7YaboE8xs1iTYLSoyUdLEoz7Od1VLjVyUKyNyMXJVI
	qFHhvtPtp54zZryEJQ3p82xe4FKwo/xu1nhHEszRDJdDWsJWDBxMZMPbnGG3amjIiT16G6BI9fF
	AwykVrU1c4BEcyVoui0zEToNEeAXNbg0nsscaGiNUltkCFIAM+NFTReFIvgjvhvifjY7HjbpuZx
	IC2hyRtGxispQxAndDRK21fjG82BRY+D+m2nd8Ql9asgPPZ67blURE3RaF6F4SCbCZB4ZE2S0l9
	+7Jje4extAYp3Rldy59E2RrA1Irqt+DqRO/2ew7BwmHK49MBOjIj7NqFhfTRzknNZHd6BONINwf
	7i7MtlhAdTj1ML/awmbjYrvPkBk8fMHbAxIz5/WINi8KP1OlZgUGztJPhPDO73/1RlV8M/FrZR5
	wH7ZrM1GE=
X-Received: by 2002:a05:6a00:1748:b0:89f:d449:753c with SMTP id d2e1a72fcca58-8c87b4efacdmr16716547b3a.10.1795577141870;
        Tue, 24 Nov 2026 19:25:41 -0800 (PST)
X-Received: by 2002:a05:6a00:1748:b0:89f:d449:753c with SMTP id d2e1a72fcca58-8c87b4efacdmr16716518b3a.10.1795577141435;
        Tue, 24 Nov 2026 19:25:41 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:41 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:15 +0530
Subject: [PATCH v12 8/9] arm64: dts: qcom: glymur: Add iris video node
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
Message-Id: <20261125-glymur-v12-8-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=4448;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=MebE4ri6RP0U9cmAhNt6gjsjcHyTYxkK1wQgrGzXkyU=;
 b=+7RFuJjpDffUB0PDvKDLPhKmonL0WHF1M0PNM6U6o2hyKv2laLXgH+EvdNfGBxdBc17n1Ukp4
 hvRhIxxpD5HDvv2Zj7Yip30TnCAAb4JNlmbgMCnXeFAyX3HUfYCslnT
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: GcDsxdZqZdn1Oy_pgirHpM0g6V2IUVyk
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b065536 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XTetivXjGLQkQF9siiMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX24y4lPK+5kNB
 SuLAc0isrS6Ysrl31K0A9J3bkQbZ1RqaXnXzichy8X40D1dZT5+EAE1GkKkRx3J3OUjwdL/dznB
 ycnzIGvAa0/9mLPLHTrLxHqP3KDQ0yI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX0CzfreXe47AS
 tRqJ2DzlMsveeV7IfuQgwo2zvic17LOBk6Ru90hkj0s4bmvmV4edeBsi3whxD6mpe1n0ro30gzd
 BM12SFWV+VhMrxpb527DO5bQ7C6S7/LbO1vMkj4NWwZYs0jNLSsnh0ks0VTJxU+5SJP0i3iXrHD
 Gp5yFXngPVxOS8ZOtTzPlMvwJa5ghVnFz3fPddcgFRVwUmXXuaZT6xqrfAbu5J1erctn7671rlY
 sK5CGGzm9Kl72/EXhv9+KTTt+0WsfuMc/iIk8+v0i3yWyftIf8l1XwrnvGpIaMUgPfdstaiRBVq
 mEOn3EtlZf8Ag3ZrW396UtI5j0fTwJKQsXu2vjPd47FUw4bKwCU9ii3LTNfoKXbekG/fHG7wHX0
 1F+PSPgGJz2R4at2pVPf2SkzhBfYbUap2zoQWa18L54SRdms5c9DmCmVFH711UgABYsjzXdbaEZ
 hffk7VZluSPguhacMJg==
X-Proofpoint-ORIG-GUID: GcDsxdZqZdn1Oy_pgirHpM0g6V2IUVyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 120 +++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 165dfa11f17f..ab2b499c1049 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5926,6 +5926,126 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffe00000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>,
+					 <&apps_smmu 0x1944 0x0>,
+					 <&apps_smmu 0x19e0 0x0>;
+				iommu-ranges = <0x25800000 0xda600000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1943 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1

