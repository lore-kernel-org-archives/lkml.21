Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695117;
	b=Ba5Kow+IqxIduY3zsk15UgI2KjXBtvYV28WjaFGpOINBKQ/VuvUui7MR0oYmQdnbvUxW
	 6WdFFkV5igeADBB8a2Y2UVP0UUdAt7TvqOHXybGOpW7y/0P2d0LU3yj8sd5uE4UTmRklp
	 t/iFM1WvLD97ohgoZITbW95FiBsYzrJnIqnZ4TJvKl7U1qVJHlc16DS1dRNYvyxy776mz
	 9GULipdMqji+zpM2DUTmlEUYlLM94AXUdkT2mFW0lYO5N90ar12LrsC5oYjXNar6o8OpZ
	 HWaUIwilOyK/LaUeW5kwNJgzk62GC+ZavQH1uYrBQzRZ/lkHJ+rzs8gtNyraHMMCLKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=;
	b=Mg2nqMgs/eL6uSIV58qUw6vFWZTgPSVpp8WjiTLEw8TOOgJBfSuF0dtcIimzLx12op2z
	 fWCO7wyKofyaIFlgyF03mtLZMdfaX8MRXppmhLqpwgfCoJEVU6NAQS6kFAxiJBOrby3Ne
	 YbJyUZf3tz0lgdBG0VmYJtz8UwQO+bYqMEMqQPPmvrvbpYzIJM4kIqBLtq/VihJbSi0to
	 SpgXfdfBtAQBwqX9AWhLkFFqxF5IYg5hARHvNSGP/FfBHBggj+E6KUjRCkVpwf+xj/EFk
	 A8gA7MNiqJ28RsaWXpxZpIV8FqI7FCUrQ4JDiXVH6d47x+0oIx0tQf/x9qod4QXVcRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmMNd4wI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dk1GPZEf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92B606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF92B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmMNd4wI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dk1GPZEf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVYBn4129195
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=; b=mmMNd4wIHPdOkwE9
	5OBijT+0u+AFoV4Y40Grtgrw8ql36kSzPNSArWeEy2lBL8D7PJImrAEJ6t8VN4vM
	aeBtmjanXnLjVY16QM43gCd36vTsSA3qxUOygCDGQplbz/43BsPDzXC/0LeG/VKR
	emA5g0+JhC0dEC9geNDZStWDOvZ+jR10Qdd8xmnUkedbaaSPNpC1KzgvsuWG3GRD
	YlR8FIs2EiKNUiei7fwNtiVSSXZS6pEfP2pGNcLpR4sJKEWkoApAEPRaSY2h8ODR
	58abhJ46pSDbG0uyzMqwzU2DXkmMHEbg/kspi/sFFGnHzUDr9SFq7lsVinU4LgYW
	ie8kdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vauuwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:11:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so1048509685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695115; x=1796299915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=;
        b=dk1GPZEfwosP0tv+mLh+acQ0fYpd6qdYdsWDcx5/Fmyy7pKgToFYyO+XiV8zSuI18U
         Mh1OfBZZrjL8QWw/Mxf3qzIjcULFbk+lBeIW5+3tpcqX17puxGyQwa7Xh/VN7rcnud3H
         vJsdPdrpHhJm9hdTwp3HGRj+Reca8+FmraHmBsG99uKvD+hGS41gttDfKFF+TwPJO9uu
         1QMUuVU3mR6K0YR6NkHxGF35PyFEZxxn8LdgKdSKDg2QfjmXC3W1nf8yFznccrPqSAAZ
         cTA7gKcLh8ePntfwn3XQ8D3gbQeanEBjwMqO3GjnbEUikTed3fHM7tGkDx4WU0vuI1oJ
         0ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695115; x=1796299915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEDxuQOxbmLRFfoTwtigXSIA0ABTesePwql9QImGq2I=;
        b=ksldNaODEX1JggQg6dMV41IdBav02e1C14u20VkNAGWMcfXPGupd4oaWaAPc1Rfctf
         TfuyyQ7TWLwzIxA5YglZ1YWDr0n6QplGP4TipKXN2rNRJB44xZQzQZ97rHXlJHwtfndE
         HGJAp2D30rInlxCHdkTij8KU8hu5lo51vsqCPMZy05r6H/xawSAmaZlLJhytVoGj/o8z
         WKgSGg+mFyw9vcDzXtqW38K6GXQLDYV4xdaEg0DxnImxTVrJQVY2L30fN+5ARm2PQU1I
         xmzeMwLWMB9EMgfLs3CoJnBBq1NEpTo7oaReXoGLb+0/A4u3JwaYTQ+6qP3HMxlQ+bJT
         6qYQ==
X-Forwarded-Encrypted: i=1; AL+hErHDAnc6mThcwKvlO0oJFA5S45P2bf+eUg2nhceHBKEXM4zOucTwFFmYuiY9uCWVyRiPss6pbIoTh2pOa6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BbDUE/2h9Uoj/98Q1LGzLoR1j4N9gNIFxI3KV9+kQtUvEMz1C
	eJz+XoaYeiUV2PlLluwN1J7UXx643rzNHuidVXp+MfwPQHshk9PSXGBtxRrpGmbPzi9fDhdqD6Z
	PpgblFoNT5/M5h+zS7P4xUB6om8dPE0X+SVDV3J22DGxAmkDOq7dLOFc3NUzaIU9vyUI=
X-Gm-Gg: AZFdTZepNaf9ef6kMtgXK4EKvAPsLEr7loT6ISntUOtluABXiEo8Q2xn/31XPRcxoVr
	8kFBh6jgbYworS6TdJkmH+qLklixoa1JyRKZB99e/3LOcnYOFY8d/leanH5pAHToG8ZzXj6Fpbt
	HEPotZWKefI2NkTQZLK21fWgl7vuOddm5nINxbaEDD6oLj46xWsfR1DwucTSP73boH6MZE1A/ZG
	PG4CTCDZScUmBp8FWQ8sa0B7fxTbAXgpbklxQT4ju8yoLnpZrdxOB4pPXKlxyQ2hyaXQXyFqW7b
	VKglU/WSCuYa405uphkisGivvpYSOghLltkJJQiwR2jLOAEAFaDJJDQpl3v1xxAxDjXCBx0nTnV
	vnGDjTpDCqDK/PvQVUD0d9y3sWBW3KpwZ2vzbDTy6RcNxRODRaGHAyoR20wQLvGUXh6ExLEHbz+
	aurmVyyUdvZXcB
X-Received: by 2002:a05:620a:2a02:b0:949:70ec:7e8e with SMTP id af79cd13be357-949ba9e4216mr3538198185a.54.1795695114895;
        Thu, 26 Nov 2026 04:11:54 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:949:70ec:7e8e with SMTP id af79cd13be357-949ba9e4216mr3538192385a.54.1795695114410;
        Thu, 26 Nov 2026 04:11:54 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm748736566b.40.2026.11.26.04.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:53 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:11:40 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: agatti: add an EL2 overlay
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
Message-Id: <20261126-agatti-el2-v2-2-1ed468b4c52b@oss.qualcomm.com>
References: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX5Vc64vbzxerD
 0vz1jpcrIPsfFMfBmZSK/rlmrvM0We7sU9TmtB/VvwzsdzyF5XpRFn/B6+oIYudkI9tfBwK/cf9
 pxa5VLMRhvorXyOhdjH0dXJf0XVc3K8=
X-Proofpoint-ORIG-GUID: Gbl_jzDvgxBxu765_NI7QnxpQoUuusLA
X-Proofpoint-GUID: Gbl_jzDvgxBxu765_NI7QnxpQoUuusLA
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b08220b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0g1k818zwqbdU_kKEKkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX3dwEYB/BmasJ
 vH0PNaS0m2d8sEsN2vRYhs5stKWdd7n6GDIVYMIQoN80rrx7N8CbbxB0pDxFFfGBamJhThH6JuB
 rPCiG5RYFOlTDR9OiUj69tKn1vP35g0ZqkmmTql70uejV/nRt/MRqSrDgkW2w/YRV4ddJvdRVVE
 7h8oIaqRhr/IKKlTQpjYUUgANhISy+7q/daaU6bs2UmdWgOLNNBvACB4lfiWcF+U8wid0uucgLn
 Vcrythazy/IZ5EC+zCimKq/vi4HDfl/BG8/Lz/7Gbpajyla2SVi/qSDYHvJeQtjAKL9WgKnz43Q
 vIE3wrJAsz0aMKe0cgpTEHzaVQfnH/puHmU6LqB354eOVE7ehFyxQKAn2JXhh0To5B0pIwRLNx5
 IW8v1+d2MUbaoKOn/RfN8f2c+QD/ynnoeSdXFHIZ/Ax0PKI54cr7VpjW67N22nhjQCYgeAHqHec
 +AmyO+UAvJXpEXfIIIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

With a boot chain that has no hypervisor (TF-A and OP-TEE in place of
QTEE and Gunyah) Linux runs at EL2 and owns the APPS SMMU.

Add agatti-el2.dtso for that case, as the other SoCs have:

- disable the zap shader: at EL2 the GPU driver programs the CP secure
  registers itself;
- give the ADSP remoteproc its SMMU stream (0x1c0), so the PAS driver
  maps the firmware carveout and the resource-table windows for it;
- give the WLAN firmware its SMMU stream (0x1a2) through a
  "wifi-firmware" node, so ath10k_snoc maps the wlan-msa carveout the
  firmware on the modem reaches through it.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  4 ++++
 arch/arm64/boot/dts/qcom/agatti-el2.dtso | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..70e41313b4d9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -278,6 +278,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola.dtb
+
+qrb2210-arduino-imola-el2-dtbs	:= qrb2210-arduino-imola.dtb agatti-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 
 qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
diff --git a/arch/arm64/boot/dts/qcom/agatti-el2.dtso b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
new file mode 100644
index 000000000000..aa8e85278bdc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Agatti specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1c0 0x0>;
+};
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1a2 0x1>;
+	};
+};

-- 
2.53.0

