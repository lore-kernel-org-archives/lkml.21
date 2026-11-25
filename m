Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594883;
	b=Dwp+wiUKRTSImLpgnYdYByWbbf3VDjbHb2doiwi/r5O0gvwgaSiIDbQIFEkhilfqCHDf
	 6E5nId9xMmsorp8NmsISDdQFbX9NaCelI5w9Qb8Ylx+rY6dDPgD5RA8BxtReSNTwtZJi/
	 5gSQmHQUry68IbCkxO7NNEi3toNL8HeIDmYpZdXCwIT3Akb5+myzAWGG6GR3sWW63LPK2
	 7XAIOhWznB4NCZnMwanw5ZsuXDUsuF8opBaH7M1xcKWU6N1OiNOAvoZrGN2Ck1vByzS7U
	 les7vp+02CoRtE232cwD2/ZtS/FuH8AZFicvSutkdi1c0gb9eITGj80C77x6dcUvCqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DButlC9vfhwyiV/934aVxvWQylOVzcpu0HSHmaAFCVY=;
	b=dno3BuEvuHpZwRCTJLqphcWiaJ4Ws81ajv3J5xhVDEtH9wElOwDlmMzPpwHj3kWeU49B
	 4hzJllY2Uh85FioyKlkd/o+7K0mwvJXrM8n5HxTSrtJkM9ONRbSCgCtrnqwvQYkaB9QWw
	 uv5E0KkGAwMXIZzuaIfLPpdn5Nq3X+uvSyFZdUyQrIJk5DkMeel5XTYY38p7lZB3uEGik
	 kgznlC10wAVIxtZv2zoaBDY9s66mICrB6pNCBLUtToP8ObyorNVnHG7EJ5J7ih/W1OJ2A
	 PFsf7GqPsnRsriyxTVJMYwf54PT0IQ2MWe/d76VoHWHFjjohd3V7voIvLTX7IRpJL+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQ6V7ofP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWdcVufG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF9F606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF9F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQ6V7ofP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWdcVufG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68ckL3630251
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DButlC9vfhw
	yiV/934aVxvWQylOVzcpu0HSHmaAFCVY=; b=ZQ6V7ofPyXdvtRrBlR1dAKsM+B/
	pxuHJNTG1OaerYNKUmszsZPdRiXanp8MRsaZRcQkEl0nqip/Wu7NM0OThFtUhZwY
	HVP1f8JsC3heiP7gGYBEWr5v+a+h8nfZ2pBjKi1m1JnI5+8xDjeO1XihOcWsIpSO
	CO5agmh3zf8aeF+JUGzpVvD05kDvJ81gbOpbty+bwrR6axQSDM6sq2+Pqh9yFP2B
	vSS+kFLhK8E4YRvHWyTWhXLn6yzsdfrvbgvyza3vrl6Gqwh/uKKjd9dxDDJlNRnX
	GmnnLRIhDWVTZp/nZghTWbYwkJoUUeptI3uJTzS2mTQq0zQiRHq4hFXwwIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b804b5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f03aa5ff3bso72057425ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594881; x=1796199681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DButlC9vfhwyiV/934aVxvWQylOVzcpu0HSHmaAFCVY=;
        b=aWdcVufGrIq+6e6UthEfQ5GplQyXuM/jmldE4n1fkzImQhF0bF2QQzRltXBhpaPrhj
         9k4LsXwt9L09DH5SRySvM7XWPLvnbknfYSJ6fNpTnk0AzuzEzDDjt9Iw7BoFASSwsUEf
         NxY3v/exr9qULnbZNCeVSoMMoQ1xNN1IgluKbt3ScmOd9UoXlf2eC3nuCEBaDfdthK5S
         w5KRZuEi67b63HztpqBSKW45c5rgWQJOmfXn6pZ8+tu0GKvQ3P9AT5PzNUde4x5jeUGS
         6qUsNwC/DbT5O0uzQtYq9uJfBZCITXeZTVNPa47e7pqNSC8NPFjb2QZHba+UvoZnNGnL
         IA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594881; x=1796199681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DButlC9vfhwyiV/934aVxvWQylOVzcpu0HSHmaAFCVY=;
        b=gJSpjr5IuIxKZ3mpZN3HFo7/f6ESZhGKWINdNYuTJoDq3xM5fnJlVa3sFWueo+BUJi
         8E1CvpCwVXm77xqhzSUy4j4ijMpogv3nGhpTMIF9I5ZqpBWKdqlycHf20Y7Sq5NnvHN6
         IMhEFVf2TPzcUexfcJpLi8sKNjhWuC3mw8DFwg7ZO6DN4BDi0St+lsGTJkUS861p5zcW
         zFE8sAzGhtjqoDVxDUdLjwSYSmP+S2SxUoVIFzLedVwt5dCyQUPPqFkWKR34OHVXLgWd
         mKOjZ7QbjBTY5zQHkBD2dmXaFvkoptZhIeoTHo0pTULiC4hCzaY7sz+NGQHA65lNFjek
         T8Wg==
X-Forwarded-Encrypted: i=1; AL+hErEyJicAxhKfn4tq7HwANu7U+KQp5Eijq3mXQT922twqMirGLvVV0bH6pCeJDeJ7gfxzLc7lTu2lK7X+Gk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CJNlXG6P5DoLrUUjcDPr/uJRtuHURK98q+4ia8SuFZetDiync
	ZMW3fg0G2MRTTamp90l7nv+ZcI/2DAe+2ficL5CmOENBtvpx+edgDvEVZXRSd13XoAsZUN8FQ5w
	NY2NZO9G6VIZFjB3ordX9YUbUR9PEiwtng2DVkPmhNtOpBidZnuk1jp893m768V9JAbk=
X-Gm-Gg: AZFdTZeGmfrzgmVfZcpeC5lZOLw/RyaLPp4WexaweRoH039rDJPYM1sLITRwwEcQHxt
	/eXoo0QGBO39OJO3hlWcyLmDZfZ5cazafSZYz589TS832sW4itq3d5RslfwiZulF4cpluDNSrys
	3OmQRnySm1mMbQju/2VvTRd7ENCN02jcc8xv5bHZld2AX3vxRvk4/OFk+ZCaquxQFR74kOp0vK/
	badqLIoaGQhXxlLBixp9DAAAc+99PPJFZbKUby3WDFA24AUCt8vE3qrxxmIrEli2WXyULdLEtIi
	tMVttw+AFrH2OK4sGu//7mrfAJo3Mx/dOB5ubTmlJ5kVc3CHjwx0ItbsYAEWo7eS2vpPw8mUjGH
	4+fCTiibsa0K7qSUi7Tsjnj0cG+iOFE6y/ye82eCk+hF6136D/tHTvNSJCjLDAb2tkh5M9Wsgw9
	c1eI8Z7WDT
X-Received: by 2002:a17:903:2acb:b0:2f0:a7c2:7d7c with SMTP id d9443c01a7336-2f0a7c27e29mr78192505ad.35.1795594880916;
        Wed, 25 Nov 2026 00:21:20 -0800 (PST)
X-Received: by 2002:a17:903:2acb:b0:2f0:a7c2:7d7c with SMTP id d9443c01a7336-2f0a7c27e29mr78192225ad.35.1795594880465;
        Wed, 25 Nov 2026 00:21:20 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:20 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V2 2/3] arm64: dts: qcom: lemans: Add CQE register region for SDHC
Date: Wed, 25 Nov 2026 13:50:54 +0530
Message-Id: <20261125082055.488583-3-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX7P2GrNeXXYua
 Rbtw9qTIM5Gy0SOsR2YDVetD2owWGOHz8aw2Y5C51tYTnoJmkPQlzm1Crzr4dhMIJ9XUL9XgGmU
 nxpP0v2yMl1gtuI5fC87aeAytn3Qcwd4ekIFwv+rei9nqevnWi2+Q2cOb/7cWQJC0cQ9643exBR
 035vBzhdRNBQOiub7zdIiomkgiGrNTBsTqmkLR5JoR3w1Jk4LBt1w5tP0yKrDwaMLtC0oNFAB6P
 aGdGrnmnVcUCJJ/J6AeLSIgnlnLykqqa9O3BtR7+kp5VndYncKy95Gb3E9Y39sfPVz0RH69GXHf
 eUpK170K2fb+E0bP8N9rwZVvNJxgW1rcHuNVP8i1BgSXpknJVVsIZWe2O2lQ62oOqV30qSN3Kww
 0axZtd2+zxxvg6OZt9yY4CYxIR9phnRk33UYcpWYAQmWktjdMzPxWHYX4mtCrHo/dolFZdFiBnM
 OB+OgIZRDogc35YaPRg==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b069a82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=cLkUB6twTbeO1ZdPm1UA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JgBwHgLUFvw52Vq3xd5IMb014Z_Ox5k4
X-Proofpoint-GUID: JgBwHgLUFvw52Vq3xd5IMb014Z_Ox5k4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX1jBw33RwIt39
 ugwHNVicgQgwegtTNpejQbZU1uCzodA0R9ht1wdBfC+qRi6G4XDyNV9kmXE1HPCxiiA5FBz+MQi
 NbhDGws0HFocqFnAYY8G4YdKhafu9Z8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

The SDHC controller on Lemans has a Command Queue Engine (CQE) whose
registers sit in a separate region after the host controller registers.
Describe this region in the sdhc node, along with matching reg-names, so
the sdhci-msm driver can map it and enable command queuing support for
eMMC.

The controller also needs the XO clock as a reference for its internal
logic. Add RPMH_CXO_CLK as the "xo" clock for this purpose.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 6 ++++--
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e..2ae492455fae 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1636,9 +1636,11 @@ &remoteproc_gpdsp1 {
 
 &sdhc {
 	clocks = <&gcc GCC_SDCC1_AHB_CLK>,
-		 <&gcc GCC_SDCC1_APPS_CLK>;
+		 <&gcc GCC_SDCC1_APPS_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>;
 	clock-names = "iface",
-		      "core";
+		      "core",
+		      "xo";
 
 	interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
 			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc..2946853354f8 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2937,7 +2937,9 @@ apss_tpdm2_out: endpoint {
 
 		sdhc: mmc@87c4000 {
 			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0x0 0x087c4000 0x0 0x1000>;
+			reg = <0x0 0x087c4000 0x0 0x1000>,
+			      <0x0 0x087c5000 0x0 0x1000>;
+			reg-names = "hc", "cqhci";
 
 			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

