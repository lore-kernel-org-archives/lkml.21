Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065235;
	b=oFy+yrysdlN2yAJ3lwFuC3EXpYydCx/1Isw541do3BEN9s9P1KafFRn8CG1WxGtmib8s
	 i5f1ZaGMdXCIjOX/F9KOzJ9OeczfjIPq7revvkGQMEwg20sYVRaxgcycOK/aTe/UJTKRR
	 oYZcio0eultehpuRfPw4Uve4SrbLihbDJAXvJRbva8Agchl3aS3+WIH+B5hGWpzODV/b2
	 /9f8BuY6uTfSTdb/MiQtx5/3VigWJZ6O1A1ZAio2bER9kjyepSp9nVcbOHrXIHT64ji69
	 yg0eGy96H/2KwHaNWTwPUwCqq6dCMdWbK1rLOU+oGTs1HtU/easGb/q6PLEiHjVvbag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o7b3ZqIWyIBUvoaUcGUiUhdQeDWojerQ55/pCvga/6U=;
	b=aYorhggOwYPSrVpykk4KgcalRq52DJazH+2CQeQxw1d4+sx/OVDwIJue5ijzpyqzWTww
	 LGDizuJQjYx08XzpJpo3fPe0kf+tecZ64yHwQBjakTO1n5+Y+2h7QbVshUh8fIe70pnGK
	 jblKTdrbCRC+2PjrRro6JUtWDDj2cWGgdcbEFPMdFXeOtJcZwrG47pm1HHkbzW8JO/w33
	 JdiiqhhV5LZvxdo44K2SwPtX1tqtiHr8AlVeNebiD7LIDz/Z21JDNYdgwaGj0flBFDxr2
	 PnDd5HT0q+umKm+R1timAx7QoZCaeRYMNMNeFa+UEQaana3uc+2lwQVG2Uk0OlLQOew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WcicLFNZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zjalk7fr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B43606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B43606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WcicLFNZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zjalk7fr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B1vW261643
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7b3ZqIWyIBUvoaUcGUiUhdQeDWojerQ55/pCvga/6U=; b=WcicLFNZzc3tKHly
	g8AtOzeC2LZsmUrsC/Z4gWE0mH0GsLEOxFwxMgcaNXiHtXOE6qaqt/z983csEixg
	xY3Nsbn5QpA+RcGrjU0p2MizoiHB6+AZ0pANKsPJFxjrdY0gnCvIXcNldYZSj9QU
	tY0fhDLbTuqCuclFY1MPH1FZ4icWZJKTk/K8774qALYMmM7zT54gphIO7hILMchz
	3EKBUYtXMmtrCUy2k9gX7i9Qd8WdRcbrUmoP2U45TIP7pdy1J7+z0u/EY3OJmOfG
	CPMCIaW0YJXk2wnumcbv1zByv4Uw3UYXxgE2qRVz36dptdK6QVBQEKuKE2+HeWmS
	spn5xg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnu0n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efad644688so16446305ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065233; x=1795670033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7b3ZqIWyIBUvoaUcGUiUhdQeDWojerQ55/pCvga/6U=;
        b=Zjalk7fr7v0NQSD65cbwbWclDp9AzKx94rEay2vYkkLhVY+ns65Vncp4WOqIeQAVJk
         z5Ubx0qW6QERNdsEkffX97WoNHEEI7SAnaUEd08yvLXsrhNJtFF8r2JQ5Q3pojPdSXiF
         yjpV68Qp2tf9iHzjphi3FV+5Tk3U30sIegO/79D9+I8varKyF3SvmS7AHtuPyNmbeUMX
         M2F0wDRIATLWdu2MrvpMXgoyigB740BgI96T6UZmR1KgSAFS+DP3WS6mS/HnllLtaZfI
         CUsZu3aSmJ54pCro8ol7cDuD+DDklKmtbEA3rgNYs3qe7mYvX5kasi61OsiN1NHh828b
         lkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065233; x=1795670033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7b3ZqIWyIBUvoaUcGUiUhdQeDWojerQ55/pCvga/6U=;
        b=dJ38D6KNki248U9QfP5MqMUf6N4eE3JNkWrWhHf/2mljai0oVgpSTr3wiwC1F/TvHS
         1VvJ47smP5gyObuRaGaXbPeu7EjmDsIKDXkPddQqVzJmXWXU0VRPT7Nr+IsE1XRIEqhc
         W3awYsXdoYQTr7f8mXXB7PVtoS9RlQux3wyS5/OhKXYdJr244Uh2BTES7PhesJEcVlwp
         y31DVmf0UNG02K4/WlWC2A3lTn0JnWxRzPahH+qm2oclZBhGFQgG6xX8X7NQC5eJQcWY
         jXxrQ5yjVxD8KnSdAExwpmZlko7Z2awnN+KhkJpfoeaF9dgAYaKehhLDlIevXtKrlTD8
         2upA==
X-Forwarded-Encrypted: i=1; AL+hErG0pRaSA/NXqXw8esmTSoCdLP4iEUC7qP1RdKZl8m8f3X6TEP+dUgkFOh3RYMl5VsYyRB5cujBvbMoZvsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8inZzUcnbXk7WGggs+sKJCahNH9CNHWuFsbXvatpHHCYh/3JT
	V+DPTRCISsoLBoEJ6HMrIwZaXko8+apwoYVrKonOXjsiDJ7OzVTcWE70kHLUppWp8xwJKuov7Tp
	g7tCZ6z2bP5IoEA/NP6k3Nx0AH8vELZZmFrt78/PoniM5QXM9c3VkPbnL6mO0Sj7M9rguB+XZW7
	fgLA==
X-Gm-Gg: AZFdTZf1e+AlBJiK9jEIvBrRmhFlVKBzmdwNtxnXT2w+lNs2oqq6NVZ2euafM0U23yq
	pY2WNZVW1Lo6sxo3lCQiYcYmpuHyxaBLo+acykEi14PwTm3+JLLsSHrh3Len9mJl9wyPjshGYSQ
	BT5jfm/2mSBu0CMRVKcsKIFVCQ4VZyewO/EuuwD243QmGxyMHpQL5uU2UXdlVVXl3Tg075zHiP+
	Wc/ZzFzV+r7qa5veRxWSdGmU/HDer0SUR8rg8MiaUxcPzCn7HVdZhIsiZHeSAwoIFJbOSEDkRyL
	tj7/xX/7XlEbN+nWbOk3nv69kkUuYmSccgO9fKjDrHTYq0JxkA79nSdpun50ISg7SSWHzQ9NAxq
	VwaDii0nJFwlaJvIdvFa0BSOH23lT3eOWewmqhQOGv3vp4SjeQ9ICMuNbLi1iNSsoxj//+88jSb
	OuDl+S5tK2MOcDQ9Tg+grnzl89XQ0WiBCVdkAuW6KUr4Gglxs=
X-Received: by 2002:a17:902:e790:b0:2e2:dfb8:818a with SMTP id d9443c01a7336-2eff7574cbamr50789155ad.62.1795065232882;
        Wed, 18 Nov 2026 21:13:52 -0800 (PST)
X-Received: by 2002:a17:902:e790:b0:2e2:dfb8:818a with SMTP id d9443c01a7336-2eff7574cbamr50788815ad.62.1795065232284;
        Wed, 18 Nov 2026 21:13:52 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:51 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:27 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: maili: add iris video codec node
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
Message-Id: <20261119-add_iris_for_maili-v3-4-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=4558;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=3Vzy3adLFjNFEAYjDxg4QGwGHqNR5vbFLJ5s3PhkjLw=;
 b=7RYALyIuxnsQGdfGmqY3rhG4NJWTpdaGAGcYAc7nRQN/Ec4CJqU3EZX7pXKVRYcAHZipszSKd
 pHGXiJ+szJZBopghlCfRjlZNpe4aAXRNNP8y7BrGLzqwQr/gjPOx/Qh
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afe8591 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4Uxp26bCVegRMv0i2ZEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: w_gVJOd9iCFPZ6TwBEw9e6odKjr6K7Qf
X-Proofpoint-ORIG-GUID: w_gVJOd9iCFPZ6TwBEw9e6odKjr6K7Qf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfXyEpF2FOH1/on
 xT7Y4THT6O1tRIVDfcIyPLciK4IiLaEJAU14Oz41H1k6pA1nly2R0N36WTQi9oVXVt5scmADAB0
 KFXnFbBqEbVItOIRT5uq8vSkKOOofKk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX1nz4mFg5Q1Ro
 7hog0wbDESFKGWC1qhR7ds4Bw8DRKYyucjZEEzndMWn6q3n8qm+3i5OjS7xJCRaJh0RrIAWX3W1
 cTEGTa0LeID1WQBcEy2wwuWzOJeXiI63Rtx3OSpvJ56nKjpBKRExVlJ2+vHKzHzKz2q8zpxUfZr
 yQupPaZomgvCej6HfNHObIG7VCnNjoZYRVBIAPVEjiK/8s+0tAFIuoVnEGggzg1FPE14hOJdYt2
 wgmHwq0mJQHixULYGBPF5A3jLgvsH2QUEGjJX4dna75vYEjVgMaydct53dyuSfOb61BljSLrU1I
 0RT2ZlfoEpulXdvTQm9cmOrewoXk5t31c1Y1szfncDQPy4XJsPdqwDtuAFNu3nFrWm7EutilOgM
 KunxIl92MFu/Rsk9OVw6vHAqmQRuafxVTkU1iouh/1FJuv/M82tMIXdl0nZxAa6/MCJyQEsL307
 xbz0Q7cjLbsJhDPiJ9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190020

Add the iris video codec device node for the maili SoC, describing the
register space, interrupt, five power domains, eight clocks, two
interconnect paths for CPU config and video memory bandwidth, IOMMU
Mappings, and the operating point table covering 240 MHz to 1000 MHz.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 126 ++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 0aa5bd4ea21c3aad928fb89d5d7c454e4e120f93..1783fa90b12fd8b041c19b54a87870f80edea45e 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -3559,6 +3559,132 @@ ice: crypto@1d88000 {
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
+		iris: video-codec@2000000 {
+			compatible = "qcom,maili-iris";
+			reg = <0x0 0x02000000 0x0 0xf0000>;
+
+			interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS0_VPP0_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vpp0";
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0B_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core",
+				      "iface1",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec_bse",
+				      "vcodec_vpp0";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "bus1",
+				      "core",
+				      "vcodec0_core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffc00000>;
+
+			status = "disabled";
+
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1540 0x0000>,
+					 <&apps_smmu 0x1620 0x0000>,
+					 <&apps_smmu 0x1544 0x0000>;
+				iommu-ranges = <0x25800000 0xda400000>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1543 0x0000>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d2>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000 420000000 630000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000 533000000 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-630000000 {
+					opp-hz = /bits/ 64 <630000000 630000000 1104000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000 630000000 1260000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000 800000000 1260000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l3>;
+				};
+			};
+		};
+
 		videocc: clock-controller@20f0000 {
 			compatible = "qcom,maili-videocc";
 			reg = <0x0 0x020f0000 0x0 0x10000>;

-- 
2.43.0

