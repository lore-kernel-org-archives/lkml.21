Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693071;
	b=MUkbQPuCrvGa1QWEOrveXvj1rz6TaS3EJRiqlN/QESDf+p1EV3S8na0pVVmWkqR2TGxh
	 dZ75rHI9q+7zG82NUllo+C37unveusNcWIDbeTd1PcTAhufReWVs+J1QM5We2JlKmYET9
	 VZI29do8ATy2qHsApeFLR7B4NfMyw7LWdbRpQ6s/Zm+k8+MqLOVJyrrdfLmMzdfqT58dZ
	 PGL6BfJ9s3gq9eF8tH+9AJK9+cpGgP4Dk6dP/+rlAckWwbR2qGLZ0pAYRKwa0auiJGK1J
	 otWxfgySNFJLFP+ilqRhrVdlPilZby/YAjR7+Sz9ZN9qgbnOCvTGVPcBDhJqlBnbdTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=;
	b=daxWYWOQXKuftg8iIpWmk/JIyh8ib99U7pi5tUitefotQ8obzXnRyA36SVEM5sMbacch
	 Hl++siMCEKKOCxfKn8haW4/NSoN3th969JpgG+KtacBF86Opo8epqyKrqj4PwuN+eXsih
	 Ql4I49aYRLuglCAhtfiF8uK5J5af6Z0DfULdFXlDIAu3GDlxyE9oLTabM4V+ODDOheo2X
	 DsA9UHEWEe/bn5ynYNCSMIKiD7hYj7omSqxNrQdmfAeuhd7wYtqw4SlMo0WWQ5PVS0A+v
	 kuYLEJbOc3rEA84MCX0VnhwW3mnDs48CuwCarwENjJe4SqcD7X0rZ3eePNrOTQJJIrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFyF1npW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjpkUkGe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836B4606A693
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836B4606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFyF1npW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjpkUkGe
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVTYR2911750
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=; b=YFyF1npWBUPrpKGx
	03Idc/jl503Mh8IvsP5cFqI2ifkAzCGwGoT7W70dhyEwmZ6uCXi7aUUrsT+shyal
	M3E6Au5NGAqIzxvl5ZfaoUIONeJPIuyFFOZgTJ/sq0RWsmM1gd1Z3mlBowQGapet
	9LU13hvFbZne0zqgkPTN/8bbxOrnyE+PB/MtN884hr6SUyCT/N2AYAI+CmO6JJme
	p8nbl/7jqC3+le7yAfqkCDYNxd5CvZt6juOtwqAUIbJSxkoH0O30NLvGOSKsH2lQ
	vYe+pAk4Vcml/cv2nLJI1dgxBRtWafkOPuyIqODzaCznISGUI9fxBrBD8p+JTRsH
	AiADFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak0238s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so1165075385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693069; x=1796297869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=;
        b=OjpkUkGeF9F07UW+bXXzjvi9u6hM0DwRuYozxiUBsltmm7HiiBCuIHvmUmlTveQWkX
         koWfvHY5v6MuzwPCb/rzZXo82NrPwQHj0FZ6+kuS+BqBjxDmU4APxp1rBfvnhULuOkVW
         YJDFq4Mr+euX4O60VZmRZkrQxJRy+I0eNmC6/J4Xs4s3wxHBYUZPFgjdOYASFqEt4TfI
         tw6Gn6+HjssBMW8VyufojXOk1SZ0HeqHuhEbk9kGN2m4BKHa0tbh6KsJ0vSqoMqcjpM7
         gQEsuTNSNF/hKlpgxcbsb5YsD4x6QbrpGN3lMmNcnvc/kx61KZbVwnieEnlKyx0aLrRB
         Smwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693069; x=1796297869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=;
        b=wYxBsbXK4Mv95qcNGnOwwIXW3Rlr1FcYkoLfuadnl6IoGg32e5eZaLOqYEE0TMWv0J
         IZpRHhs1SgAKOT/o5cF9tyk+7OqikewfZJ0Bz1XdRn8QrVkAhZ5jz2Ql3Wp3zAytBEnK
         b5x9qtJlMyek17c2WConoOos1e6WqAG4iLy9DJH1ZfTlAglJtMV9UOF/HkGkckmm/q0g
         XUdYuNHXquOJgRCtHVQscV2Lo/GVUDsz9cCC+Z/fjiG1oIqn9QH3MIN94dhN0n9q9/M+
         rSgYjnEndD6/5T0j8bbzNZY6Cwv0wDANlK2u4Rcq0vxghDT9kWtldyRRbt313HZMmq+P
         aR6w==
X-Forwarded-Encrypted: i=1; AL+hErFkx/ZPa53c53OP34+A/dFDnrXwt1lQe7E2DaeeViNdZnLt1dhSZnbX20cjBq2mvQgiBxgyuLvznN3O2RM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kf93jayTa197zV6kj6c91tpJQXwAGzkBOEQ7hMbg6QMS/G1DO
	kKnZ0Cjmtx8Xmb1BzUotlClgYI9sduWu8OG93y+ymfzS5onqQhnjw+I8cBW2+4pKjH1/crsVGu9
	21lve0wraIwvKG2jWYRM1mAS/AxJ8Rc9drbNNbMfOhyRGn9ThQ0kIo3FTOiXYK7aDMI4=
X-Gm-Gg: AZFdTZd9cJooX82o6R7e8tkDHiTZ8PJZDm7cdR3tpqKR/u/aaEMn2qUtlj/iQbclxuK
	+Tc60ssNbWdm4QkbXPXpF3RiLhTIsPG8KR+5/Sow4mT3qGoByKGagCZ/3pLr09K9bH0u0lPbXBc
	e/TRLO016jDRLjv6IRPp0MC9c+Ve8hOJLFk+77IjFbDQQskbhh0Q9TrJv4aBYkSN5a9rlSdiHtI
	2ZxXFBCqKsx1oHyjfe27IzI2YJpYT60kgSDJc6dM/5UAfWolEtLLHAwtgOP7StC8I6Sw+kiFiCY
	N3NpreAvncjY5g8aUN6fHLQwY87F69+pSRnL9tQJeeXyqqeZQPraWIsr+fgN877aS81p7EOm9jI
	to0l7Odt0y3iPdKf/QCtdW74g1iWe2jVl3n+nfGbeyKK8qkw3FeUJFelk/ywxHHAuw8dH5S9KBJ
	M/XeNjF6mOEx8X
X-Received: by 2002:a05:620a:40d:b0:949:f8bf:b6e9 with SMTP id af79cd13be357-949f8bfb90dmr1019348285a.25.1795693068792;
        Thu, 26 Nov 2026 03:37:48 -0800 (PST)
X-Received: by 2002:a05:620a:40d:b0:949:f8bf:b6e9 with SMTP id af79cd13be357-949f8bfb90dmr1019346385a.25.1795693068364;
        Thu, 26 Nov 2026 03:37:48 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:47 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:36:48 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: agatti: add an EL2 overlay
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
Message-Id: <20261126-agatti-el2-v1-2-4e25fd64f198@oss.qualcomm.com>
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b081a0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RzYfMtsfNbY3csdru8QA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: aZ7gJszMCMRK7jSvhAWE-85VrjDU6OC2
X-Proofpoint-GUID: aZ7gJszMCMRK7jSvhAWE-85VrjDU6OC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX7lvltZZt9ug/
 9pqyOxehbz+gLUlxxd7CdIIhAWCFxRc7b9H231xE8FQTIOyXCYyPsBg5BNCVld1pZJhXR6u6ULk
 MFKiPb8xMvC9NWc3jcJwcBoRtXKRq8MgtfkGnjOcof5BFHQwLboY7DMaSZyH7PKV8MeKe5WfkYR
 3CQ3ChOPhsXskzrM8b9diXXRjrG++57E+bia2hh6vDIc45Y1fgaiayeMw/RGi1288EXuESNAsMq
 yZlOHmIgXTrnsCJJJ3pt3WoYVofdRBo+PuKQsq8iNJJCjEBCqE3addlDrzwdXVbAcUksWqVBMSk
 XhvowtJ57G47h9WZqcFtajY6E8BVuliykzwDKYzT4a77eIQ3RG9EnDBqYwLf74qQtN5rhDYP/9u
 tiKw5khuoZCycE6LKYvISf6W9SLY+4pOxTFpixmAVWglDq9fx7B+1a5rXFvsZzHnuELEv/FneIU
 mNC7xrBBkTCtkuygcCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX6jTsWzeHFq8v
 MI1G7UOmn+D5jHpCxZAuudU/Ad5/whlL+Hmq4IJnkd8diQsIIiYvcvj9FgdDeT7j6kAvxVP9wUg
 cAfswZWB/CcASBCtOeFGb1CGk7DsAd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

With a boot chain that has no hypervisor (TF-A and OP-TEE in place of
QTEE and Gunyah) Linux runs at EL2 and owns the APPS SMMU.

Add agatti-el2.dtso for that case, as the other SoCs have:

- disable the zap shader: at EL2 the GPU driver programs the CP secure
  registers itself;
- give the ADSP remoteproc its SMMU stream (0x1c0), so the PAS driver
  maps the firmware carveout and the resource-table windows for it.

Build it for the Arduino UNO Q as qrb2210-arduino-imola-el2.dtb.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  4 ++++
 arch/arm64/boot/dts/qcom/agatti-el2.dtso | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

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
index 000000000000..60142be50417
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
@@ -0,0 +1,19 @@
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

-- 
2.53.0

