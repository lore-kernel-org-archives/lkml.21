Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956457;
	b=Dhs9N+9VADnhGkERxIFwyDTAYvhoJ8JB6uv0gK61wahftEMfxN+b2sxpDctOlxTM3HXW
	 Z0UHC5L4bKrF/jTjDOoHpuseKpD3nbmOT9fV9dIvIYqVajb62VK7BfqlfzxZFFf9N3mSl
	 rAsDcU6ga0sq98TUvECMBtD765N6KaZxFcBcjbMIsJpxSUJznSWXrRLNyoTRbqd7YfJhK
	 ErDbRMh7I7aPFHPCAEEbdlL9/Y4bxzMd2BDBj7yrdXAu1Rk3o3zOTEdahpLW8Gj0J6cwa
	 KOM5hSTYr7ak9g8qLNnmWHBzy61Haox4bWvaNysfKbC1KuHkP0/YL5v5SfA+ze6TB7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=;
	b=lQ31A7PCmxgl26NiEjcw1m83EAUh3Bgx/AYLxW/kcMkacMV6iv+/QXwuTBH5KEg9gQcp
	 voOP1gYlYUhOm6elzGHkzt27DzJ4Zaz2oTqbeOqcGfq8Ja5IUpB9Rvrb5HatFjhVXKUBu
	 tVKyN2iTYRMUbVvKL7v5iDwbd3kL+eu6Vq3ugo6Q+Nb1rWy226t28WXBwctYqQDYyZhh/
	 BCOMFoEPU8Qw1HofVy3KoHrt7nj+eLpt/v+BtJSjFwVxJL/TZXrWKL5euAqO4UKTPoTdN
	 nI+EaO0LZtJulMLjwc1bQLQmtY/+bwx1yVmrCsaumRmd8nA/yO+9MQZCPYNmiDDI7KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3iKEJDW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRk2Maon;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AAC606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AAC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3iKEJDW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRk2Maon
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMeslI4172026
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=; b=g3iKEJDW7pcwY9Tk
	3PkHwbi6tdb1uTlCZBxozCD6XYBTtFgBDgscb1reT0I2gVnqEidafeh4Oy/6HU7u
	g2zcy7qYmOOxZMVIkv9grByjJcGYFBoPQrKLuhNcBOUwEw+aq5P/sU23usM5OI0l
	94tlYEFv8CNwqinrXNxse2XsXSbW5r/dOn/w3lwt9MqBz+PX56EOnMaR8I3Z//64
	rxnfYWUnrYDaRUTXvk9uRNfm45wCSkJHsq/Gb7sieQGcC0Dp/Lm0sVVTddQZOAf+
	9sY/q/4dApYPuOv7BRBC+CqFhRq1um0ikoWaqteZ/uqPy//3SQYJdqcdU2Zc+gCg
	zDAN3Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv882s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:00:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3821eb27024so61192eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956454; x=1795561254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=;
        b=kRk2Maon/sG/r7pPgtgFQ8Z8mc3n0Ilp9nKDP9cHcrCtDsYCBBXivLU6zzopIFUPDF
         yXbAeLtRtwf+iMeWj3Cl4QtRyFyjMmuaAIs9I3tJSNpTBT6NO3wwoIHxmJyD9LYHTd4a
         4F3ZX+VYf6jSYeQfSPibZTHsAiHXLKx58zZERLPVoXfn3+4N8upZyKzqBYiTvcunRMV1
         dM9Kgx3S7aZdGG1mi+QCe+sYZXP59Y++1C6Ie4RzXnrORC5mJR2CnHZ69nSJ/2DdUkuy
         rMAam97nZr5wIq6xQmAJw7wNMznsmVQ4u5EZ3gsYUyeQkBMdIfBAySz/yQSAqT11WHZ6
         6emQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956454; x=1795561254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=;
        b=OyI95BjMHZ9R76/DxATjWkDzG6TpEMa8DgogN1+toyLUrmy2GcLjS4CfMVgbQ/cwn3
         USkEwt3lcSPbISU/armv6YjQ37SJJdAbxCN25HjVYPeWv7gxNcor91H/SPQb1sC2aJsW
         RbwU8iGLTYH4rFDSMSJGZd/Nyz4bS4ddmoJOi281gLkllFx+5Mt0fMT6FjQDkZeDLNvQ
         PzWhCK610aPEJ0Qx0HjHvw8OpXE2x2ZnP7EfdHx8t0nsF54ndNGE5LblE1yYfg53xmYc
         evyGhxDNZ7Qr9eRl5BA+SKanGvYqAjd+Wf1QasJZpau5mzJZx02RmjSmGchgAWUddwcT
         NNGg==
X-Forwarded-Encrypted: i=1; AL+hErGC0wuND+nT1lY58zm9nAJ+Za1iDjp21kAgaC8XD0k3HmEn5v0oKP8TGX4FVcGMabI8HFOhOjr4AJBCzAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y9qvKkLJsdgjS5o1RavgLHPRhp0jMU53/BrKL+Z0qhTmSqm4U
	eWG0Z6atLIVILpO/3gkl1Q2NoLDjQ+4VKzqeOitaG7KpVoz2v3cYHy6WButFuG8X988v/hs0/vO
	crTNjYCQuut4oTOauQvjVYOda6mhb4Dw1uAr+WmTgjvMMb2eAGk6+r41LMpRJJWVAJc0=
X-Gm-Gg: AYBFou28mu7TQD0hF1MrNpjtdnn9K149Fz8rjbWPSmpIgUBEC3hkPd+ssh20dcr3D9K
	pM+BdCfF7KUnNXRFpK8lXHI7gR51Lajw9qeN4Ssz/8RkdgpTNY9GF6ODIEqUClNVr1GKH1wFtYO
	Qk+alElZ/0+TEeNLMdlV9Oa1qy2Kyfc+OgL/Wx4MYh1cHBcwMlJLGMs5G7XRhVe53LJNGSfhCst
	GXrUyaMQBLhJ8sSUGgMHHKAaKohj73IiNeXRZNVFB54YlOdFj53eHukzrqVmjZ65dEpkG2RUP3Q
	j2EEsjDs1Kgyo5h9GlaX7LIcnnHeeoyCot4dI9i3yA9NtDaRy6Gw10gdDX7BxyYLwllJKbVdRqk
	k0T7CYLu7msfBNZkbER3S2HlIqyzvZdyCVGYBXxBxFSX6eGHv/rEOXoalH2trxcANbB3g1Ph7LA
	==
X-Received: by 2002:a05:701a:8458:10b0:151:2e62:fe4b with SMTP id a92af1059eb24-1b543cdf789mr948006c88.23.1794956453958;
        Tue, 17 Nov 2026 15:00:53 -0800 (PST)
X-Received: by 2002:a05:701a:8458:10b0:151:2e62:fe4b with SMTP id a92af1059eb24-1b543cdf789mr947951c88.23.1794956453138;
        Tue, 17 Nov 2026 15:00:53 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:00:52 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:06 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: nord: Add GPU and GMU nodes
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
Message-Id: <20261118-nord-gpu1-v2-3-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=4762;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xyYYgqzcHaqG6oN0uFpCZ3eFSIuUWGDcbZDkjY5Kcic=;
 b=5UxRY37gGgict8xRQRg+ixx8UaW6DFONQtSdqc6NcTDJvUa9OR3MHLVLYYFAcnS5GdS1TuycV
 fEobgq7L4YKC2N62k/Wh8HGLMHpWCdcDZflTH+YN7AEQNagWDkbr56q
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 3Z0-pnYZtFKIjvxrgC0lIq1H_bCsT4ad
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afcdca7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FdsHoUj-PjsiTO6IAGgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX/ceiRaNYieeV
 UPtAU99kdnt1kADYphmKNjj0RKK/jVszDme8PWXFvcdJI7fNdo0DPPxNMaanYWL9SyN4Im9VcN9
 9e3gHVlgUExKDvgk22KDLhw5Sp1/EJpms5PhbhbV6idhdwvCBO3LQ4vba7EE/awboQL91Qlng4x
 uS6OjfCmw9oTjWzEs8M84II7IbvcYOZuUH0OP0C/ltFtvAjnaigVpeao5FOEUW02Q+e+BrAaKiX
 NkFfUzhl6Ts96fUwUPZd1LjUuHNQc/S3eyShlIYR3NLRjq/OOKHN39ksPWtyugHuAiVfyjNinEM
 h9Sl3zL5IgNI3hkm8ohw4DnpiRQBHIysGVyvaWcSscSWS1kepBDxSLR0Qp13h+NOnhQlprZAus8
 r7gUuaQBh9wLRQKAI9DPXLEjCn/wCo6ghgrvh/n7ccU9p24gG+GQgjbPy/2vsYPoR3jIUG6W0H/
 TcMA/DnY7fDS1Ezq0pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX6rhcW9RpdQTJ
 40Y5Ro1FVu20y/zewsxlkzbka7e6x3viOX7427sAYUTgVk7gS7GXUPvtoEwQ34Z4cRJ9IJv10cg
 z+mWFjnPrcLFo7RgTnc1qmIK/4vtTok=
X-Proofpoint-GUID: 3Z0-pnYZtFKIjvxrgC0lIq1H_bCsT4ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Nord SoC integrates an Adreno 753 GPU as its primary GPU, belonging to
the A7xx Gen3 family, along with its Graphics Management Unit (GMU).

Add the GPU and GMU nodes together with their OPP tables. The GPU sits
behind adreno_smmu_0 and uses the gen71300 zap shader, while the GMU is
clocked and powered from GPUCC.

Following the existing Nord split, the SoC-invariant properties (reg,
interrupts, iommus, zap-shader) live in nord.dtsi with both nodes
disabled, while nord-embedded.dtsi adds the clocks, power domains,
interconnects and OPP tables that are only managed by the OS on the
Embedded (non-GearVM) variant.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 79 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 43 ++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 5a1520e436c6..e9e830bb727a 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -76,6 +76,85 @@ &crypto {
 	status = "okay";
 };
 
+&gmu_0 {
+	clocks = <&gpucc GPU_CC_AHB_CLK>,
+		 <&gpucc GPU_CC_CX_GMU_CLK>,
+		 <&gpucc GPU_CC_CXO_CLK>,
+		 <&nwgcc NW_GCC_HSCNOC_GPU_AXI_CLK>,
+		 <&gpucc GPU_CC_MEMNOC_GFX_CLK>,
+		 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+	clock-names = "ahb",
+		      "gmu",
+		      "cxo",
+		      "axi",
+		      "memnoc",
+		      "hub";
+
+	power-domains = <&gpucc GPU_CC_CX_GDSC>,
+			<&gpucc GPU_CC_GX_GDSC>;
+	power-domain-names = "cx",
+			     "gx";
+
+	operating-points-v2 = <&gmu_opp_table_0>;
+
+	gmu_opp_table_0: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+		};
+
+		opp-625000000 {
+			opp-hz = /bits/ 64 <625000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+		};
+	};
+};
+
+&gpu_0 {
+	operating-points-v2 = <&gpu_opp_table_0>;
+
+	interconnects = <&hscnoc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "gfx-mem";
+
+	gpu_opp_table_0: opp-table {
+		compatible = "operating-points-v2-adreno",
+			     "operating-points-v2";
+
+		opp-468000000 {
+			opp-hz = /bits/ 64 <468000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+			opp-peak-kBps = <781250>;
+		};
+
+		opp-625000000 {
+			opp-hz = /bits/ 64 <625000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <6075000>;
+		};
+
+		opp-735000000 {
+			opp-hz = /bits/ 64 <735000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+			opp-peak-kBps = <8175000>;
+		};
+
+		opp-854000000 {
+			opp-hz = /bits/ 64 <854000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+			opp-peak-kBps = <10687500>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+			opp-peak-kBps = <12450000>;
+		};
+	};
+};
+
 &i2c0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4..36a422db8ea6 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1712,6 +1712,49 @@ tcsr: syscon@1f60000 {
 			reg = <0x0 0x01f60000 0x0 0xa0000>;
 		};
 
+		gpu_0: gpu@3d00000 {
+			compatible = "qcom,adreno-43051701", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x2000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu_0 0 0x0>,
+				 <&adreno_smmu_0 1 0x0>;
+
+			qcom,gmu = <&gmu_0>;
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_0_zap_shader: zap-shader {
+				memory-region = <&gpu_microcode_mem>;
+			};
+		};
+
+		gmu_0: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-753.1", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x35000>,
+			      <0x0 0x03d50000 0x0 0x10000>,
+			      <0x0 0x0b2a0000 0x0 0x10000>;
+			reg-names = "gmu",
+				    "rscc",
+				    "gmu_pdc";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi",
+					  "gmu";
+
+			iommus = <&adreno_smmu_0 5 0x0>;
+
+			status = "disabled";
+		};
+
 		remoteproc_adsp: remoteproc@4c00000 {
 			compatible = "qcom,nord-adsp-pas";
 			reg = <0x0 0x04c00000 0x0 0x10000>;

-- 
2.55.0

