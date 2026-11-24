Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502656;
	b=JItnGxEQvOxPeolKrFFN+gzg+TTH61w58o2w+YJirUxpxf9i+Tq8z6HoyEXo0RFWNVEj
	 yIZrrVQ8zzemEaoScuj6vcRWjuvGS758SuMusZvvuOF1lZioHAKO0DF+5kJZfm2ZI3YB+
	 pACi1JLiUZGQA4zjfGjFm/9Fhtv+UFWsDp3mB278dbXphcZgP0D8u3wojT9KRWjMHQP/d
	 SqZ0RFTGgfXtjz+/K+nn55BHStC0MLS3duabgO2oqOCjGZhn9Ey03GvTlXoEj7xRb7UoQ
	 vlT1iQcKPc6J5imXC6Vr+v1qaDYXRa3j4gAekwJWmPQK2hoY+cw4u8OKlO9clRLgYWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
	b=uDK1Xh1SaY4zXiMHg81IXyw7aVqUxItOzbnIr6pErwoIpHYW2x/0avuPFfVIenUfM2hs
	 b9DTgINsdUbqd2ZfcpbTeMErActV2e78MJslwDoIEaYssk/17aLRbK/STAi7fQ0D9NT2y
	 MdRLrpKyYDzBZypGDlv/z9A4DOM/XrL52FU9ARTVOsbSaG0KQ1mYPK0NZSmz9h7DvIEDS
	 DuGx88vg0eVLCnMX8BbSnAVc/vxsq+GGxc5AdG32AjI1ia7/vGaxSxXNHYroLiFfHEqjZ
	 eBGYM+KsqK2GBCry6ecZysjO1KewIG0sLxd0ENFeWY0cv6bUgHDm5qkkG+NdzvmsMjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjH7focB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfSWUqQA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8730A60A2602
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8730A60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjH7focB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfSWUqQA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k2Xn3701109
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=; b=PjH7focBiqaa0ZcR
	XISc8LNbhtosAMxTl3vqQzThZ0Tt4mgpcUFq3X36UlN9VFBNlAFbGlnp/tA/EbWy
	avzuliDj2EYdnjovzHWLoQyLv7UC7CJsPN/ZuA24/TsVmVFBzNzEiz5aerg2lvKU
	E9ab6LSiYiMKtF4LyErbvc44tMl0yf8fRVBpTtzDk8ceImycUTZ29a6zjL+b3Phy
	TyJ84eMo6yg2gv99WgDtahE/oQRslkBwKlrMocRqasgrBaHvOkku3cT9bksPMIDJ
	4Ex3yaU++NEuQY2u2J8SXAI6290UGQIwt3jmjpOGSalIdH+Hg8r93KmcwHzCgKw+
	xaIUjg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky13xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:44:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386c4e8b81eso23449eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502654; x=1796107454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
        b=VfSWUqQAvomUy/YAyZeUDz6wqYsZ+Uo81lZylw40WJeKjThMRRklwStkUoxO9mxjLV
         zweP4jLb4Qz2d65VhF/FaFogdqURtbUs3s+Fiwmn2UYwCQRlwPWv39AxGCtGVWqQcQNM
         gnD0WkZSzQrhac6Pm6VrJhcsWo6gHpZrAs1llP5YJdjqGab9PsvuIODKDV/TGgV4PjZd
         SgRkVzXxOb+GMEivStqwr+YbrtKpyMOpDapIhGSMr5nwhlPeM4cETcecYwC6r5MaXv8J
         Fz+iPiFk4z9BL4pPJ5I0siRiYxHB1sY6UNjqd9Pbd0AbUtTAlsx0+rEHA7s0pyQkuocE
         uzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502654; x=1796107454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
        b=QWK0gPK+buc/LIRz4MC7dAb7GI1XnIrFES0Wy7s4pvzzMqAqYkVL35ukC0Ebk4WMPi
         3SvbdCTAzHVVXYa6bmnOUvGPlGNmJtXNaRB1/gEvkeoJjYLhbI3pZPK7zc2mtC+3X+C6
         8M06ekvlQkBVhkyqcKyTOg0oa5/efFJpwVTbWaeHiO08JXUQTPjEqmpFBbI8DfwRv6jE
         C76ZjCol4kRhY+OgS5cYMrsMDQwM+SaIosNixWchTN8H92DeG4SQe5jEk8WYjYTElPgC
         I8TnzEFq3DOkWhMmXPWmnh5YQiX/Hs+HD7r8szKNhYxmM+nEUSX5U4/PFks3AryhHTzC
         NkYA==
X-Forwarded-Encrypted: i=1; AL+hErFoj0r24i/BoykXOLuQEobIAjgDaQt/HrxfUu07UZeqmj3I17jIZr6xhEX1Dfi93jwlW4CAFt29XaECTeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A3RoUNY4/W0xFgHonO/aLSAHEuNMWJ/9O1zVrGZ2PUt/7vvNr
	GjWPCpOUC6B+9Hg3/ec+yz4dG39GkCQrU/y4j8WF0jsuQjREEgvjxaU5JjEtO//6ESq4So+DkNF
	MQMGAb8y8IglOGJ9Ddz0boHUjOaU5e7YEJb11BPab6CAvdLom45I8qo2cj7DieV2zURA=
X-Gm-Gg: AZFdTZdSihWr35S3U7FOG1EdlcvAy5YTR6Bb+05fxkeZbpGjSI6LRwGkq2iHGvUI3L4
	PSbu19/sEPvWWj+dva51fi0wqmt6mnmvNFuqaqbPM9mcP+znjcHCCsohPOMXp4/9egp6B+3ouPj
	BknnT8KmAeZSoyTYKfseyU2kroyNkCB8MrvdeiLB70F7aMUhpUeQDhcQzSKjdtPdUbwyLXNsX2v
	V8DY4QybRXK5wsd23p4LxOjiNZB1q+1g+Naj7QjNkYzD4UjTZRNWXbfZ46uESMrBJFEGd9emhbL
	hBHGzh8QCxgpe/Ch/AJrd7aYJUDQm4JOUL2ybMaHn4+xSQ7n7bEdtNGciBV7bNtQ4eDoHNkcYb4
	cgrZGYRuJi9ZTNQQmlO2dgRiqAvC9ABohtaKFOfDaRfSM0vtckvPDtoHmoccHgb3bpiNqHkmfLE
	mBGIWe82ggBRjGNUCOyqPljN/+l4Pube8uyw==
X-Received: by 2002:a05:7301:18a6:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-3856e84e391mr21262534eec.1.1795502654050;
        Mon, 23 Nov 2026 22:44:14 -0800 (PST)
X-Received: by 2002:a05:7301:18a6:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-3856e84e391mr21262479eec.1.1795502653545;
        Mon, 23 Nov 2026 22:44:13 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm39265484eec.29.2026.11.23.22.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:44:13 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:44:05 -0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: mahua: add iris video codec node
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
Message-Id: <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795502648; l=2664;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=qjdIwYmv1raoOrxdhbIt/Aie3lUaYl7m0Yszv6aLmdI=;
 b=Po+I1K6UW1QdqQB2jqK1BLYSJklxWdpghSl8piBW/o3T1M44wR4e4eKuHpfw+fvmFEq6Y9V8r
 p+WfVltS/6EC7w9VLIgHImyunyKinqlP4wmKw1XAzFvGS7JvTb19vED
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05323f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2ggMmf_gxUOvV-BHYncA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: KVHDnB1Yn9tsvxEtTo5NgYbuWcfltHmd
X-Proofpoint-ORIG-GUID: KVHDnB1Yn9tsvxEtTo5NgYbuWcfltHmd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX/yD5PAKyEOe2
 nyazSgXSr9l/e2COJU9pIeJHDoef8CvGzv0Xtov53wf8OALhY7nz/8Xjzhv7hYCib9IBO38QpEh
 gmrVPRKARPm2z7742ioHZqsaUGrXj5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX3DL6ro50uqd1
 jWMholIDQlq7iwn3tToHfHPCjZA1v/6Z+loWjjMFe6z4eUdpKK831M5fantPmTaDzfOJtc4JFPm
 saJcC5kvia79sSN9nRJvWiGh7+rIdPO45yvfJTnGBA4eDnA3VrkksEkjXoPisIoM1awUwJWEoOX
 k7neRrPyQzy5Vh5oicvvXxhXobrrcQfEwqa1e92E4CMUn5jml1heupIpNX6EvdWtVfNwYewZM62
 /0y+h8hRgFTnZTBsdlCgWkxxPqdOmdaY2yB5nmEG/fKUs0B/bb2Hhub+MnClQhEngckaeqIMcLm
 1nD0H5c47x0zySfgsxTjyGMYXIAQ9B449A/PIfp+XdpeM/5ucuPZxa+jUNWALIuQnqbje+FE1um
 hfmdEZ5r6/JfGXnvRvz8ScTWWxQIPJCR0xPYyUDaSX8eofVmUG2coZeX8o1d4l6qlyG3L266nSQ
 X8onPKOw+nNY/pZ0eVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026

Add the iris video codec device node for the mahua SoC, overrriding the
fields clocks, power-domains, resets and opp-table reflecting single core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 67 +++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index e7141f8c9e0d372aa30f2ac1ecdc5941d249311d..4f018193be50a9f62bd9b0b403a5a6b0a9f6b6a5 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -150,6 +150,73 @@ &hsc_noc {
 	compatible = "qcom,mahua-hscnoc";
 };
 
+&iris {
+	compatible = "qcom,mahua-iris";
+	status = "okay";
+
+	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
+	clock-names = "core_iface", "core", "vcodec0_core",
+		      "vcodec0_iface", "core_freerun",
+		      "vcodec0_core_freerun";
+
+	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+			<&videocc VIDEO_CC_MVS0_GDSC>,
+			<&rpmhpd RPMHPD_MXC>,
+			<&rpmhpd RPMHPD_MMCX>;
+	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+
+	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
+
+	iris_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000 360000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-338000000 {
+			opp-hz = /bits/ 64 <338000000 507000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-366000000 {
+			opp-hz = /bits/ 64 <366000000 549000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-444000000 {
+			opp-hz = /bits/ 64 <444000000 666000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-533333334 {
+			opp-hz = /bits/ 64 <533333334 800000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_turbo>;
+		};
+
+		opp-655000000 {
+			opp-hz = /bits/ 64 <655000000 982000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
 &lpass_ag_noc {
 	compatible = "qcom,mahua-lpass-ag-noc", "qcom,glymur-lpass-ag-noc";
 };

-- 
2.34.1

