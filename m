Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001061;
	b=jU3Db/u3sr/t23NFS4dA96e0igckmQ0uYm5/h7ghadZIkyQbVmk60fUuogra4B259Ok7
	 EDuOMW+Y9GpLaj3ZtRlW9XAAVJB/X15JxBy3M6nXmzhsfj7oGgjA5A0W+l7KBGY2Qjyjc
	 MTgga1qmZmLGQvWeqleHutaJs44tBtQLBrQLnHnsQ4GIfVh7on0YcMN/u7w1rumki0Pe2
	 FfMQ4NdxjH+7+chWHoAxeRbCnxpx9lkxSWWFqkAd0kOU68/W/D+ljZz2lpUnV7v0Oo2aD
	 PA9b4vcBaLHvImiksZaBr/vnEL4XI66AAETF5/JMbnFoWa+r7RoBbmWtB0QKOD/lABw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2I+DHXwITsm8CNgQHFnpSZNFTs3D/P5SlVGIf4B/W3Y=;
	b=Y/exPpg/x3Q0EID5fdmm4Ir444wYlQ3BTst3aYNIxPsFtqEfEq5cg0lumpzIsAgd9x98
	 gURq0TAGuTE29bA9ufCrcG5oCDAAzAi9PzTtgCLFZtLsAnwnoqiulJhhMIVhNXY2oftNv
	 qXysqUVY4apTYK+j16viCzlnF5ksgXjyvI1WV6N2ws/RXwt5actYjY488i2FyCC1Y+Vhq
	 DFoPJiCLmkGIssCDKch3JYthuis5jWXOZX8AuCVYi0N1Q3dSSyhs/mwYOCnWaCJBYZW2S
	 eQbeklXzdlV4g1BIziqaXylW1bMMch3n9HHrZC81dO5bhCP4x8VgDXmHA9V/RefMgQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k65oliZF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NRhIqWgt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B257606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B257606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k65oliZF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NRhIqWgt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBL2hP3282147
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2I+DHXwITsm8CNgQHFnpSZNFTs3D/P5SlVG
	If4B/W3Y=; b=k65oliZFrcUSmKlMQQG0970K6+RRHzEVQE/jbIm21Qs74HDRrle
	zk7z3VuDmuVgvRlzWMsjr0dNmetUHQkyiQkgmJ8MDtIb6GcRcHVx5sEVqyqUmY2U
	eRNusZfULBOqmiSk+iYMpiScyhwmAdcjZHMseiFP8Zy4BEC9C8zhUbJkxLbYrf5r
	pKpaGuKPNqz1475lfeO3O7++iM3bskuQEC11lBBMVbgrS7ejTA4gFbQpTPXgsNNO
	zfODdU7MkLMVsqXhQClCTPK71vh0BZEWn2+ghEqUNLbUFmLTZSX96su1LZCpHyCA
	PLcBglxIZipZYThm79ZZffa7SD5PFdUm2Bw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8tq8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:24:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961511b61so182001285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795001059; x=1795605859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2I+DHXwITsm8CNgQHFnpSZNFTs3D/P5SlVGIf4B/W3Y=;
        b=NRhIqWgtO4nLX6FM64tnJQlfYegwEK5bVWKg2IFmzoIg2d4VY2vpMftA9+vAw1LcYB
         cFEj9BzEVzw55HHR/+Ei9M8T53bTGjqBryklpflt3G5fYcvPBHjGnLBL4U4lgvw+szt1
         0ZL9dZK8Qhbx2GJ6SSrG5apXD0MsLKnygxgl8irFukPgYjM5iaJlIn9UtHT7JFdLvJgz
         oTx0I+ubvvmLwZA4Hn/1UkGvHWrqhJA072CJz6Pgx+uXeIte3kHMOyk5ScS1h3s9PcsJ
         efb5X7ElZGmllaOqQqz9jyzlL4tmo9Ykbs9umuSC/vI1zhfp7j1+XxSF7zWByr+hyFjn
         8Ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001059; x=1795605859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2I+DHXwITsm8CNgQHFnpSZNFTs3D/P5SlVGIf4B/W3Y=;
        b=wNzYHb1a4Dc49s54D6QteyJHjMKzSJYLauEkKJ1u+8mfdMreHfgSVqf5Sa+uDDt9lU
         wBBWlKpYf33bPYJ37fMAQE8t7lZHx5rPIT91SZqWG8s7e+UplGOaivpEKOU+NyCojilK
         slVvgDCh469jtVCf76ZBzaEF5o6D0mB3X9KyZxHJ8oiivggMoq7aaeNvHcymLL6+B+dO
         jiHvGbTgD106lHR2PrEFD/otlOc26LnEkzWVmXNetJ5tkZitGIfUKf3LX3Ig0tYNgqpj
         QWeEzJ2gQC92heFq027yBJjSpMh8krBN36KwGgegwD1EGSWYuNJFe4MiuZ0Mj7n68TeM
         YH3Q==
X-Forwarded-Encrypted: i=1; AL+hErEp62CpuoUA1Ui5lcLimL7qqfRTiPqnY6YkkvtsjW1kbdzcjONaQSXPQRnn4p9/hXBjoq5bLyEpVVnKlX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vs/f7+LApzAffWb9QixlCjf8MMNXVxZEX2qYIXWJWnVXd1Wn2
	7FhIil2YYGpRiSZpdussO2dVahFAaCGO5I2jw/+luzwSnAKlB+HpAR6FJeKWS/tGu9/hg4yt/KD
	nwvCgtix5xDibCZQTd/oDRZln5PKPfLB+04Jg+nOnTcNXzhhGA30uGfouR/vh1RcJwjqItxjpfW
	wkAw==
X-Gm-Gg: AYBFou3jURPDtM+Ryfu2vR3U1VgI/Osqx3muwoUXqpnTmr03AUVgVA45s8WhhXIDcqr
	Bts6x6P4mLCiI18VA21Pkpmac7dOf+FFmd6InK5F4xfnK0O6gtWQgx7o9dMW5RSoGsqGozqqek9
	4Y06L4sKaBtP5pwVtfCjkCSbnk2Vf4h/EU0tvmk7y3k03UKi/lS+xiFXyWVbM98h8EaCqDeaB1x
	Ddw3xIRkueOHgnJ9t7mo4JvVVylcPwt35MVsSKh11BWDfuwrrbR8LDpcW7rEyBMCd/MKdeaffKO
	sOfSt47OZv3xAuACrrV8lUatEI9x2PZf4PAYjx/cj07I78zZtufFBMLsvhjCrnIdsJA9/WNSWei
	N78wUhZlagZqmZHNCSREKJh9kKE8n47T916NyXItcJdCOE1HYBnywpnxO35XEMpIW6AG0ldRvQp
	iBCrkEBVM=
X-Received: by 2002:a05:620a:1b93:b0:949:7572:e76f with SMTP id af79cd13be357-94999759b2amr437533185a.46.1795001059179;
        Wed, 18 Nov 2026 03:24:19 -0800 (PST)
X-Received: by 2002:a05:620a:1b93:b0:949:7572:e76f with SMTP id af79cd13be357-94999759b2amr437529785a.46.1795001058768;
        Wed, 18 Nov 2026 03:24:18 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3a7sm4569411f8f.9.2026.11.18.03.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:24:18 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Fix GPI DMA wiring of QUP SPI engines
Date: Wed, 18 Nov 2026 12:24:07 +0100
Message-ID: <20261118112407.103412-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: TDLCEmeOI6Rbop79OMQSWQ6Q6uQvvRCV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NSBTYWx0ZWRfX+4TqanGW4bFv
 iZXpiaVYny9C60kfPnVdZlmI3O/gjycAEa3K39OXI5MlF/Ledw+ppkNkpQ/zGAXE34DpKFohn5T
 0jl7EDTw4OsdCze6+FZias0dvtAgWhM=
X-Proofpoint-GUID: TDLCEmeOI6Rbop79OMQSWQ6Q6uQvvRCV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NSBTYWx0ZWRfX217Sj66PcnZr
 wVmFbvqW9u5cW8WleXdgXIYESnBb4S/cIVx8gFfYDi9zo0bN8vIxwxzvLdaMPDvAfkwiV8MV+av
 dZ/RG5I8evvecbgw5Q1gK7eB+0+kLVkjlreiDjDFO6c9/sE7g2ewZxNS3+xcvc6MiDx2gBojbCL
 AWylR2g+GHPYx+xSv+khyY1DlgOeZaC5djclCVo5qaSVSKj862LpRE9xUv6Z5zCC6gT8Rt+xxXo
 wAfCTXH5FPbWUThIXbGSQkjzNZzrLvP8MI9q2kZyM4TT5epTfm0j3IjRjT/lv1AlnjLLvn59zhh
 GEUOCRMnPGVJ/YnjruC1W1/ADi7yrIDLob30AN+7Sxe4z4FMXA8SSCFn4JPUPY2BwqF3G9EsjvW
 CIY+JdvqSN5YapQ1MI9r+TYhtEJAWvU9kXJTGoOOMqlqgK1F60MX6eiSOub2bolgtSk+7k6uCzD
 tCfJA3dMh8tosIuy/tw==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd8ae3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=if-8UaqqpKS-Wo8cnIYA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180045

Commit d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP
I2C/SPI engines") put the QCOM_GPI_SPI channels of SE 0-3, 7, 8, 11
and 12 into the uartN nodes instead of their spiN siblings, and left
spi4 and spi14..spi19 without any. The UART nodes now carry dmas
properties the GENI UART binding doesn't allow, and 15 of 18 SPI
engines can't use GPI DMA.

Move the channels from the UART nodes to the SPI nodes, and add the
missing ones for spi4 and spi14..spi19.

Fixes: d8005dd04efc ("arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 92 +++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 39de48e5bff0..256bc766ea6e 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1136,6 +1136,10 @@ spi14: spi@880000 {
 				reg = <0x0 0x00880000 0x0 0x4000>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1167,6 +1171,10 @@ spi15: spi@884000 {
 				reg = <0x0 0x00884000 0x0 0x4000>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1198,6 +1206,10 @@ spi16: spi@888000 {
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1229,6 +1241,10 @@ spi17: spi@88c000 {
 				reg = <0x0 0x0088c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1260,6 +1276,10 @@ spi18: spi@890000 {
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1291,6 +1311,10 @@ spi19: spi@894000 {
 				reg = <0x0 0x00894000 0x0 0x4000>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1387,6 +1411,10 @@ spi0: spi@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1395,10 +1423,6 @@ uart0: serial@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1422,6 +1446,10 @@ spi1: spi@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1430,10 +1458,6 @@ uart1: serial@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1457,6 +1481,10 @@ spi2: spi@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1465,10 +1493,6 @@ uart2: serial@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1492,6 +1516,10 @@ spi3: spi@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1500,10 +1528,6 @@ uart3: serial@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1527,6 +1551,10 @@ spi4: spi@990000 {
 				reg = <0x0 0x00990000 0x0 0x4000>;
 				interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1623,6 +1651,10 @@ spi7: spi@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1631,10 +1663,6 @@ uart7: serial@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1658,6 +1686,10 @@ spi8: spi@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1666,10 +1698,6 @@ uart8: serial@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1739,6 +1767,10 @@ spi11: spi@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1747,10 +1779,6 @@ uart11: serial@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
@@ -1774,6 +1802,10 @@ spi12: spi@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1782,10 +1814,6 @@ uart12: serial@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
-				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
-				dma-names = "tx", "rx";
-
 				status = "disabled";
 			};
 
-- 
2.43.0

