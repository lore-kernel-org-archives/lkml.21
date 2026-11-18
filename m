Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994940;
	b=H9a/ls7lvO9hbHLnKLwopo07xlXSkV99xsv6b9VMi0vEcnvsbwstDS1ViXdxgb/RhFN3
	 lIWOSD6+Lpg4tKKj3QB2ZF0gc/XoH2o/8+qmD149vB0W2oh7kiLQZ4K2zuJBiW8pgkmQP
	 RBRTvASaCNOdFRGTh5xCdV3pKsGUOjsk3sPcBeNPYAvZjqoBqb7EK/sNl0xgQtdfYdLWB
	 I/QEitviq2aIERA09KqTTLQoXKok23vlAx9EHrWIs52O2m7aLyNzqb7psf32I9JAuyQaO
	 OGnedGpDnjiimvzzL/U2un6ucOopgZNSaKkGXNT/4PjI099Tl5FxXIYdebjueO7UFLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=;
	b=aYIhjUl3tX3lAmnmwvCKhAlPksZeq3WYzVe0ZQXqT7NFk0+1MYRM5DD0exw1NG/cKJl9
	 /YBBkRU2vNEb+cP9lq+ZcQFeOyxKmJAtTsrRIWHZyLKk3s49Ghc19O/UHmZi3P8DCjHGt
	 OxDkTtvaTvhs9FmzjEKN2bB/hKuSYK2HDbuhvBRIs7MH2bPC1Khv8kCehbn89tVeoWRYD
	 aG8KGSlkj600/Pd+Y/hIvQT+zVkTZ0arpWDEYDY9EltGIwjqNe/dnSJgFlYnUdGMjemqq
	 3mLGC3IbQ9zCbOdj6y0txuidAXg2rHJRYrw2kicgDayoBPoDS7FMfX8dKjUMAOVtRpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HHhu8p53;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HBpu1MoA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C62606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C62606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HHhu8p53;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HBpu1MoA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8ekK2472513
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=; b=HHhu8p53OpsU45Ze
	WDb1GBUYM+QMjc27xIUrYs3uvY4b3syQCfU1Hez9vaxuyRahxXh2HBRGwbTUlaNp
	kxByh5ITk+qYIYeN0/jhCPw5rRWvVVXplq06S5XaxsfD/L3c7OgqW36nNRH6c4E0
	S054e59CDizCbWVpn0evsYq2uOvaXIPop9QTRMmj7dzqlTKgWvmZaJLeryDkf/4h
	209tPqnrDB+PRwHyvKdnYdih3d5UqL871NVjdlxaa/Jv9XKeGt0I0lLQybBsFfx+
	VLRWHoYPAQWR7eflx6lBnmMbVhCMAaceUpiy5xAgIQsNrHtatnZ2kqH3TO9SHZqA
	kDj6+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8aasg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ee04c49451so10596525ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994937; x=1795599737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=;
        b=HBpu1MoA7ywDYLlI78PzR/jxD4DABYzR/HI3jF4k1brN6j+I/d+fDs/TkFk6mIg/P/
         Xlgaqg6QS5kPrPMVd9yFRUmK5pUPeS07fGKwQOjG6ofkkXtiytSAoZiJBN2O+DmpDcv0
         qrVsOzuld7r4FfEvrUi0cEE9dnDQoa55oVGTsJlThr6WJUOzcXrtiHv6fAkPFUAOy79j
         uAtnrZQGu8gwq4ElqfXUUwwNUvv8PTy0oB7yBT8oOV2pzi/XC0jEaIEw74oDSFQd/x0w
         7ThyjK2749nFbZFptNrVjYpMuclXYuvdzABzAf2u8Oxe4auGj6EKcrGlA3ortt102xVw
         c6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994937; x=1795599737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=;
        b=A7eGR/NHcp5P8PIqlIhy7CiaObH9ISYzgm11+VGYwGX8oyYMvFsY1RPimAjsCjZKzH
         Qd4HIgij4ktkoAhDFdFe2JWNUcCYtNZvKn5YLybeUcN7JYMNF/rHsYwxq5gpy6DT+HN+
         AsbxlL95j4HvvMBg+mpJlSTjlcchiclKX//aT++/X2nEQem0n0j6my3geFL3YYiswWvW
         hIxsBL96xcxZYaO6Dn+6I7eKWIaBS1lMiMlhaV3BlQ22m+FI4pkAmKajEdksWNpVsM+C
         F6uoFArXuSLtzUbajwvZPfCg+dzumrdQTAgHNjwFdWd5erryVyBqVYWqiaEzBmTEW0dW
         aDlA==
X-Forwarded-Encrypted: i=1; AL+hErFZz1iaAD6jrmhjjFKzsEYtgrOfRPfeC0YCkvowFGAdGPdbmWDzMwGaBpyz0Pnl5yhBX6gGRQD80whxQsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KZcyoTe8MDINeOvlF/gkFnLGHHJ5I3E1oKfAYL1Hw+hCM+sW0
	MRKslyh5nNBMoBINPAJ+21F8zbGnYs8Qobk+WHsBik/lgkcvY1opPo+pizhdSQ8JBS1r/a/AqEz
	svJfbTd9pGvku3Sl/xI2KiMSkvWgzJ2+9kayblnXa5Bp4rWravyQH1foL87NWSrrMMN0=
X-Gm-Gg: AZFdTZdpPL3C9g/czYqCfp6IhNBEgvVAde9WyjB3JG22i6ktMqipyKGlGI/7ElGD9MG
	j9uORg47hgMnukJk7fQrW4X1nZkKmhQU8+gzs7qWphQaz+qISe3m3puptHw5aiKq9mq86ctB3F/
	7pZtg4p86sCfrUudFPgX5cbJcqmaPzxNOffmqctvjg9RyOWXtJFuH1dr9raPTURoX2qI9mMzk8j
	vUPkSGeE5uS6v2FiA4g/pbQfT/HZs0S74hqbghrmuANcwZK4pVmhcaEBnhTfnFGWQ/7Z283/gg1
	ihhy1boY2qsMMCgAOVvqOsruRQE25VEklz8ZCDX/niQfa4hNGkJm/0jpRU71nYXi3SW2OlCA2Rr
	tvMKhhcwepnVSq34VQZZ3btSs5by8M1upXPaBRrfVGZTjOEUSJdy0rDxWqjljc82Z1fqTY/mDcw
	ewO3tgpVNZhZrDtFA2R3oHbuazEwuNSwSwiT/FST/RHwM6OSdk
X-Received: by 2002:a17:903:1103:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2eff75237cdmr22721265ad.29.1794994937164;
        Wed, 18 Nov 2026 01:42:17 -0800 (PST)
X-Received: by 2002:a17:903:1103:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2eff75237cdmr22721065ad.29.1794994936701;
        Wed, 18 Nov 2026 01:42:16 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:42:16 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:46 +0800
Subject: [PATCH v3 7/8] arm64: dts: qcom: hawi: add iris video codec node
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
Message-Id: <20261118-add_iris_for_hawi-v3-7-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=5591;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=/5TBRph59pKfD2h5WA8MEaXGCzAw8RfNm6eiz9WCDqs=;
 b=5Q6Csze5qHNPJCLZINFtw3XjUN5Q9Rvvgz2IuWkxC0KU9OOy8LaWTPuRIwZ7tJjYJhF/K6nNS
 CUowujj1AmAB6bg7gSRE+15l2SHNKXzPxVP+3frwmTEnAwGnmbhVKxJ
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: 9purFuSELN02nnqy4KtIdHDRtejhER1J
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd72fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qJL271BKxqclmSQN1U8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX7OeB0CC+2aV7
 zH7S2sEfZ4tfd8KYAnGQSus43Z3jeV6t8IrIC66ecx4VgCjI/4HG+8qwsQIbEM9uhSByAmCr6uJ
 fb2yznRpUvXxKAn/H3Y1OC0V40OvK+CA14AX3JH8SNFrBMkgcfBR6p1jnj3mSjcUmT7U346AR0D
 Cx5APpcShNL/rWy/1vVbVnE2J4vSS+5+RWdAtETfeCEMm+A4TCdcvZRwZ7Kf+Fb61WS9m3okTMi
 NCKDHfefY9y3YFB7mew28qfnpY15DXukJSuQdgJBbh1MRohKYz6aPhhcu+t3yXDfZ+uGRXb8Pv7
 SNSk1kUI5mPLhPBPCWtHLeQflSAayn6mGTgJbDG7DHEioKuj7e/lQ6xVOhKcZq3v8H5jlmvCVM7
 6vgowYft689y/ZX7zKIDmEi/tgTBsLnfzWKXg55eGQkOsgrAHGToBg4KU2SlqZRE0ra1yO4oRiX
 1E8AjmvYzTgWiuaC8KA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX44hhTgzqj1ZA
 iDIh1eFnqv8DRctcAWHRBnpllINatdHgkd0TihFiWEvTU/KONmY3gi4X63sTvt8Bw900oxopQ+d
 mPW3QxAWZFdkoTnDq7nAVQdXFZf/DRg=
X-Proofpoint-GUID: 9purFuSELN02nnqy4KtIdHDRtejhER1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

Add the iris video codec device node for the hawi SoC, describing the
register space, interrupt, nine power domains (including the
VPU5x-specific mm-int and cx-int domains), thirteen clocks, two
interconnect paths for CPU config and video memory bandwidth, IOMMU
mappings, and the operating point table covering 150 MHz through 1000 MHz.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 155 +++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf74a1471a8cd25102f777aeae32000..eb64d60b6fdd88381758ad5ff5b97fb5ab5d9dde 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3427,6 +3427,161 @@ ice: crypto@1d88000 {
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
+		iris: video-codec@2000000 {
+			compatible = "qcom,hawi-iris";
+			reg = <0x0 0x02000000 0x0 0xf0000>;
+
+			interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS0_VPP0_GDSC>,
+					<&videocc VIDEO_CC_MVS0_VPP1_GDSC>,
+					<&videocc VIDEO_CC_MVS0A_GDSC>,
+					<&videocc VIDEO_CC_MM_INT_GDSC>,
+					<&videocc VIDEO_CC_AXI0_CX_INT_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vpp0",
+					     "vpp1",
+					     "apv",
+					     "mm-int",
+					     "cx-int";
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_DEBUG_CLK>,
+				 <&videocc VIDEO_CC_CX_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP1_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK>,
+				 <&videocc VIDEO_CC_MVS0A_CLK>,
+				 <&videocc VIDEO_CC_MVS0B_CLK>;
+			clock-names = "iface",
+				      "ifacec",
+				      "core",
+				      "core_freerun",
+				      "core_ctl_freerun",
+				      "core_debug",
+				      "cx_iface",
+				      "vcodec0_core",
+				      "vcodec_vpp0",
+				      "vcodec_vpp1",
+				      "vcodec_vpp0_vpp1_gating",
+				      "vcodec_apv",
+				      "vcodec_bse";
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
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "core";
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
+				iommu-ranges = <0x32000000 0xcdc00000>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1543 0x0000>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000 150000000
+							    150000000 225000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d2>,
+							<&rpmhpd_opp_low_svs_d2>;
+				};
+
+				opp-285000000 {
+					opp-hz = /bits/ 64 <285000000 240000000
+							    240000000 360000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs_d0>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000
+							    338000000 507000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000 420000000
+							    420000000 630000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000
+							    444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000 533000000
+							    533000000 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-630000000 {
+					opp-hz = /bits/ 64 <630000000 630000000
+							    630000000 1104000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000 710000000
+							    710000000 1260000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000 710000000
+							    850000000 1260000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo_l3>;
+				};
+			};
+		};
+
 		videocc: clock-controller@20f0000 {
 			compatible = "qcom,hawi-videocc";
 			reg = <0x0 0x020f0000 0x0 0x10000>;

-- 
2.43.0

