Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718310;
	b=V2l7/xe8GBr9G6J31sy86L1d/E8n+a/Luo7/3Queoq396HlphfoDmiP0/qLy4vKOoNkg
	 YmPsN3OxsA+WUqKnVb4qM0EpD+JKs2Lfd8UIOrO0E9PhK74bdE6VrE/I7v/I2dldUhr66
	 FtExOjLjxAIlA1gPPQB2bieZGtZ3Dclf1aPmVBMJn+EueoEtno4drdxxavqt/6q52qGcM
	 ofcqD+qfp8nNi5OR5+eKKSc9VLzMfDT6y967s8sxbQ0+iac4RXGq62tusw9a9swZuew6E
	 09lo5LFhqv2O6wkFhrvBskfCYOUAOWu0VysQ2u4IDR5Nd2Z++w6QySoh7uLYOIGaaZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
	b=q1CKPrLI7LPT7fSwnIC2NTehzNxAgyuYMeLxcZFllFXVMGxiUJETb/YLnLSSSv7J2fRW
	 9vWfzYduHU68rzKdEQPFh+AXkYubRId5kHIVdXsGJDjXG7BEN2aEiLfWwhfcgDTGDlAlz
	 wRqgyL83dZhWv2g3KBy7/693uz42/VhpIDdIcc+JxQs5F+2onFnqQCsp+3wXVRCsvTTLf
	 xKZbb4GNJ3jssgYSphp/16BDQrelnoZelM1grA0NhrplTjWw4StANIpqy9Q/rCB9fHdWk
	 MlLwgJTXtMPCGtCu+8SoSQ1OxsI+6Ff7AG1YMtgLjThNJKspP0DcVdxsggQDbK0N98w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pmLM9Qxp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vg3UNItw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1460A2636
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B1460A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pmLM9Qxp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vg3UNItw
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu7XC2068323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RjJP/yVn5Zo
	3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=; b=pmLM9QxprgnHqvs1HYhjmUu4WiD
	p4LNs5nPNpj+SQHK9NtdgTLQOu3BKdFpqJpO6dw1mHsh+5DVDHENEWhdVhNhhnwp
	j+xe2Ypp7LGldnqPoJryS+X5w3hez2lP3z6dMRpPb23MboRGF3V+PeDKk6ZFH1BO
	A13twpH9ecuCJrKZpzuEt93AU8Vqb8zIRk2k6Ujox9nH6NkBcWS7jYnia95AMo7S
	Rbf4affIblFzyKdoSFfMTnOIi+2Dksvu/KVi0ApZ08ph88Kc24wlKvyvmNUN7lSC
	jSaRZoohE6vyt/DVhDh33TFIw1UqzJQpYGDzm+BkJg/XcytBLGaM2eOCy8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y4872-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495c71055bso454815085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718308; x=1796323108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
        b=Vg3UNItwB54bDE/elz1MkD3Ca1BjCbdI6D5KknQ7Dc3OpYGn44FwsFfzn0/0ZhS+8Y
         yA7nQR7v/DE8CGiwpbT5tNZtVdUGFWtdtXe25kjYXDeydCpAfLrsn4ywfxuw/7o9g04L
         xC2C2OYSysnoQOj/4L023nW2dxdCzvj5igW6ZbxkuegOtgHT3sQMjK9RL5Q2dyI3HtP2
         YwhhlaiNMueeaC9D6PqdztJSzhKZPKk95+TKF/PI0ru+rB/H+mUAn8b4wCA+HagMyeH+
         rpUYILmymXYRSQswvLN+P6+H7ehDeyAP7sh+hOE59+lkFbcxUW9afNtFgZCxRqoMV/1Z
         kDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718308; x=1796323108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
        b=fDFPM0bSNZ7U8T85unipM2kILL/NyG8xkIU/EtOHtd8KibSI9uU1DxDtcYD/qRUIfK
         zu26iI6za/iT5wuEqgFkY9alIhw//UuWIEVFNONF1ZAhq0kUflabzHB5eFNkoZiXL8Tb
         tMV9xiPVwPOzRxi9HhWKjj6sMznMngIsKN+0pFc8XoqAqj5E5G29LlRQe6GcbYHGraCX
         3CQ6fve0jnZkD+RG0UvijwmWi/RSkwVP4wBjztn9MngLLzhUWXdzZ3I9W/R+OTqMnFoy
         omiiqfrLxVBAhowelXi5Qrt1WuMVhBMXVhTs7XS8Sest4+5wNnin+qZG7MHTV3bwHDYM
         2cBw==
X-Forwarded-Encrypted: i=1; AL+hErE/WSJKlM7u/0wr2RqygJPFntXnlPwc2S+ugEB0jr1RfH7vPKkCxsezezcKC45jo8SPs7BTzaxaWQnAxP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XEOVk+N7Jv0SApzWjnG26sfbEmxQhy6as/swBfpp48rDW1goF
	yJFGRHJoE/1b86kSPuA4pb+MUqw4FY+TlZlwQQ4p5UVUDwL8X0gtLAN5p7Rg2pyrk1ItBEcXtXG
	jgiFuBhOnCJLTvspgoGbLsPF/azi2rtHkQNAv4Me3CS0MagwSc0AElwVfuhYGGfH7HY8=
X-Gm-Gg: AZFdTZe4Y2mu+qgHEsr42Qwj57SQhkkScgpQpmEaXG88rsU8pZ23uGc/zDkZlS1OiS1
	FJ2dcDHrBIsp+yeJKyzm5Svren376T1GicnsQ3GV4xhazU2Fa4AITa4sAxnvBvUO6ky4e5x4bI/
	Cm+mzA4eDbhhyHUpS3ly72nZuLNbmA1f9sAnw2D5GqsnG7U/fZhFTjwUVQHyFsZUtIXH/WmZepP
	AYZNs+a7gkP+nDOuEbZZzm59ftUi7tdNIc21he6AOM/GK9wsBiNCvoqeMlbIhOOobDgNoPYrT0C
	NPXUN6XiRJfbSsQtnJzD+gRKvgLuxKT1tKBQU6qXX0hnRJFiLv5WQBLdvAP57+qm+LizRdo7AC7
	wBq5xHzlsCu1T7rPfwEf2NwfEYCsr0yG4K4CKPvomZWkBW/73KP1fORJtBnzRB7O0
X-Received: by 2002:a05:620a:8089:b0:949:6d95:f62b with SMTP id af79cd13be357-949ba9e753cmr3683553685a.31.1795718308458;
        Thu, 26 Nov 2026 10:38:28 -0800 (PST)
X-Received: by 2002:a05:620a:8089:b0:949:6d95:f62b with SMTP id af79cd13be357-949ba9e753cmr3683549385a.31.1795718308034;
        Thu, 26 Nov 2026 10:38:28 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 7/7] arm64: defconfig: enable SDCA class driver and WCD9378 codec
Date: Thu, 26 Nov 2026 18:38:06 +0000
Message-ID: <20261126183806.172485-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX4IpA9BeNTLWy
 bbJ6Fx6w5MWTvC1EwT0SMtCrudos2Xfur/L5/MBLws3e/V+QId0dKLfOz0XPORVWR4xS0NnMC8t
 RImbZifHPudYSXeZo9GkDk4f2SBP1aeJmPC+SYVdRGwkCr9AQKbOo61cihGvhO6W4Sv2MIOgg7X
 FwnT3Q3SN5UBmb/5Rx9/hBawDrawJOkGqSqs5YEsoETb91W7jwDsb6s4eTlJ1xvzc8oOQ+GIKtw
 I7q3Cb/aOqNCyeTb81WQJPBVdDS1h82yoIiPIGyIpNZ8vWniBSL6/klrCJOcrKcrzc8WPDjoIlp
 iQnpcNGpeOr4O5Y91it9OrBcxbTglk4Dn7FUZcjeuMx2Z4bU203NP+7p5D5fAxTeBIyS6d/od2F
 ub9nyR0Ru6rrd7nuog7MMvo0jcdELxAc9f0eZiyImx/B5EqmtH6x9bWf6fePda0uaCL4hFH0L7Z
 QHwHtdwQr6pKxVKwKmQ==
X-Proofpoint-GUID: 5ZdHDUWq3W9LlhhLmkMQd34FVwEVkXCO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXxXmolUJjJG1B
 Pa6eMGfRWDfVVtuKSzusfAQj3MdYkVe83SPQmC1+0kIruXn11hikUxYVduVU3fwc2AtohaTLYVk
 dHQNZcSVSaLJXTKPeXTngYja09jDOP4=
X-Proofpoint-ORIG-GUID: 5ZdHDUWq3W9LlhhLmkMQd34FVwEVkXCO
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b087ca5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Lb-CJUeqFN5ILZ2-pT8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops have
working headset audio out of the box.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..86b33019eaa0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1184,6 +1184,8 @@ CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
 CONFIG_SND_SOC_RT5659=m
+CONFIG_SND_SOC_SDCA=m
+CONFIG_SND_SOC_SDCA_CLASS=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_SIMPLE_MUX=m
 CONFIG_SND_SOC_TAS2552=m
@@ -1194,6 +1196,7 @@ CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WCD937X_SDW=m
 CONFIG_SND_SOC_WCD939X_SDW=m
+CONFIG_SND_SOC_WCD9378_SDCA=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WM8960=m
-- 
2.53.0

