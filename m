Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693072;
	b=OSFULrQNseJ2paMdV1lfx2k8LT1hlz3Ol+YTyxltkiUgMarCpF8qkjTb5O00V/1Six1Q
	 VDBtUEeb+vo3WYBNAudXYAyw/dhtQS3tiLSD5VVbEPE8NCP85mT7CPPMn3PSDzv9xWtC9
	 35wzVDYswOMhDM8movstSlrHakinnbRVfMO/8BAbm5iU+xcmyn20KV84DLxo1IbHvIN/H
	 QW+IG3YNaHZl/+sCBuJ0fi/J476CZra1K/ejqXZLSs04nVnQ4TRd5Hza1kdDkAJ5G19pf
	 /z42DMzl9bfF65Ni+SBLt9jA16f8mStrw7SC7mNIeFz9QIzoEboPNuOjnTH04arBKeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=;
	b=SqhJAXEb0do2utB/tT6d+xHziIsH9PzKPlZjbSMSlAOeKmVyTi1O8I5IfcAmSpG8RDJc
	 GcMSyxj1MkdcUtaxiXDkFvODSmT+OAs4fc40Y7SweZs+9BsuAgMKQz3lLoJLQW70ypCUd
	 4nzBUO1GZGbM9lCbzuw0Ku19k/46xVrv/fhue+FQsNpEOAc0ZNg/PVxYQ0S2JuH1jLP5z
	 BbjUQ5zkye/+OuI14Roziy24v4eHVnL33DDfJpgbheIrHq/UFon4W+W/4tD5fgxW2ABxT
	 eLWCLyDwIlTca1SPyomRrlkG2Gj1JmqoGmmvvYECd+YuVrtXWA3ieZkx5EXGBEiJqFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8QTuoA5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="O2/JFNEw";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C70606A699
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C70606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8QTuoA5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2/JFNEw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVMGl3893631
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=; b=a8QTuoA5MxMafr31
	y10EVr80Awe2A5XZKK6fE++LI++uaPlgWon1SCHc0su84Gy8pshXliyFUvIlsxAe
	lYw+lcNIELJqIeoTUg+2H5e9Y/34g6josD/8uyML77ZIKbL7Dz04xAKOLNEG1sdl
	gEhFPLqnSju2NBl6nvJIdMX7r4hg4E1Os5BLA8cH835xNx6xVILyDZI+Cl3D+1Li
	9VMEtprBow/ocAu75IeHSDNj6L/OhSUwTZv02/WurtyI6L4zkD2H2oeCeUoR87vZ
	Jz+8Tp9xMCTFF2JQeLrNfuPrjSHlqUkj1JIz0jJMy08v/X7r8RSdkDj9AhNlC2EW
	x/z5vw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80mm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso1197007485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693070; x=1796297870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=;
        b=O2/JFNEw2ALn/fNrgxRkX7lYTfkTBZQqtPsqMLqJ0JD21RQb7/XeOJ8HTjlREaZtka
         zb8RTGB8Y+VYjDs9zpd7OuPz3PmS1L+hPo7zTiC0AxTKiYKsv4ERx65s1y0bKtkKVFMM
         6s7ObeFMO70d2Z/nm8mbIc754J7ZJKIsGhAkqVAEIaXg7rvNJKdc2KrLsoefINHNEGtx
         PEvg1HLuZe5sHbe5i838yV3I0ZSAVAhb/XJL8GUhIYD3ppzP4Vx0+HKx2wam/iBXjQav
         rHylcYMs7nMYww16B/PrYIg2OityMFLqoXUNrCjMbfeRFw2f4XjRb3gyxumWmSY3tFAH
         GwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693070; x=1796297870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=;
        b=f1Qcu0loMCNRxPv4JFxpFR5rNuOY+Fm39VOjlF7+BYtzROPZmQgMKRATkz+jELE110
         YiaulvkWwUqF/6RV7kW05sRhMjhM3CXDOaIeGrRHIlJ4vh985B+B5KvuOOhppts2mu+C
         1dik60amV+ueVQV0LLvKrAvBW1uyX6M1b6l0k8tolZ1R6xXl87i6MptbgtQ5/SJmrrYf
         C35zmze34HhGc5xqbU92LJD893LbNCV9WcvH9Rl2nSr6lNVl6vEbnI6u5Nd9UQWI6AV0
         1pyrSzDIVd4Y0Lh0+vWL3jxmWmLU+5p1vvnTQGj1If8MYxmbZ/0kek+lBuCTAKMX85Cl
         0TkQ==
X-Forwarded-Encrypted: i=1; AL+hErHtZ+QBFhekVdl+Xsk+v0U0folJXgiGnivX8A5RyqwktFGJncfZg5ustyLjRiKBK6aFgay9u6WfXPln6PA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ESPFTZBLe2Pl3Er5Mamtb62Mh3K3XFuiqANHSeWHY2SSgEVo/
	Rp6QyYx9vUHivPQht1U9RT9fgIvg9R2m7NSHkx4LIE2dMPZNnRRw4JtTYf5asTO4ndxX4+idc5R
	zPw2b95OLK8C44saAMvtlDMwtpqEHUngk96XKfZsy9q7TCGL173vAbx83w6b+PigeXr4=
X-Gm-Gg: AZFdTZcAnY89R/pMMC7G4u1iFfA2o8raADOXfikM9p81hswMMlOkh41/sTEQnUpPMRo
	sDgoyzoetwhRRRU3OJyKeUNrEAQIE19KY3OoSCDq+U8RgtW6J2bTzTKJO+8bDJtkt0K+HLsgFm8
	VSeWAVYePN5go5oJwWyfrCF6nA9KwtoWTyHmFXkBZjjvGjAEyBJMqRVF3plp8sqdjNLNWqI5xFM
	8piJZ51NF9FqNMPulugTZYBkdYQwbRYcnwOPqgDbp8RdZroD3rFe7s1+QGeDmkWp8Xk1ypRxUUH
	n1hsrU9/3gQk7oobuNqUtzoJYm8qf/UX6SRhiAV76/aNc68ZIoHJXQxyxCQN64fubipGLla6/SO
	u9DpHajfAzaj+QhK1ihfrSAp44DjKH0KwIS76VLxdYgaggSbHMwwd4vQPOL4M7RlCMSZ319RTbm
	2BBB1lrtrYzcR9
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr3750480385a.63.1795693070343;
        Thu, 26 Nov 2026 03:37:50 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr3750476885a.63.1795693069857;
        Thu, 26 Nov 2026 03:37:49 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:49 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:36:49 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: agatti-el2: map the WLAN firmware's
 SMMU stream
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
Message-Id: <20261126-agatti-el2-v1-3-4e25fd64f198@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Iny_vcctyaYdR5Yo_sUKRF9Zmz8tY9Kw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX/tX0HUd4MJNi
 v0efiuW3IVyoQbs2LeVU3GshDcK4huGn4qJsUsGJLwRDuLpApfNK9HLVQQ8Ka0wQ4Z9O9rQ4Nyy
 3FPpUMSZ/lMHEaZ28BKhpFnMsD1a1b4=
X-Proofpoint-GUID: Iny_vcctyaYdR5Yo_sUKRF9Zmz8tY9Kw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfXxOzhkteRD6sf
 r2C5nZ2W4t3zwCU1fVniuZYTf3+CYkHNoxEjL+3gOWZ5MqOIOyvtY94IF+vxiKQv+5jX/uRWajb
 S9tvmuntDcb0Sdy7HhNMdKXobms+lFJSe+dZuFHr0PSM67c3oueTcPo+HBCQx+dl+lrlIqFiBvC
 Hiuw/+THEIEXGRvQIXkLqN97JFdFAEQYzlPQIxok3KsD2iFCJO75wrdsOKDPpCHDQ/WQvxcztXJ
 0btFv2avh5Vf1iK8EkYFcyZAS5GuyFnnk+JhXezkN4mQMunK628S0IWQcCKvBlnMo359BP4Mcpo
 rLL7nn8pZF3nk9fcG1O4LsB4gwFQXo/JUeHWl0PSlibu1+jU/ffyzusucXICjm3eMQFjSsFKsd1
 3HepPmBR3E3rIiduwP+XM2N1z5G2IWI8kRlBzCg568rTMoh0Hk6cChVibue0nWJH58lEQVZMSi1
 spr6c3d8ABLBGy398EQ==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b081a0e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SnnUt0fLhKprvfd8ow4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

The WCN3990 WLAN firmware runs on the modem and reaches the wlan-msa
carveout through SMMU stream 0x1a2. Without a hypervisor nothing maps
that stream: the SMMU blocks it and the firmware asserts 12 s after
boot.

ath10k_snoc maps the carveout itself when the wifi node has a
"wifi-firmware" child, so add one with that stream to the EL2 overlay,
as kodiak-el2.dtso does.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti-el2.dtso | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti-el2.dtso b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
index 60142be50417..aa8e85278bdc 100644
--- a/arch/arm64/boot/dts/qcom/agatti-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
@@ -17,3 +17,9 @@ &gpu_zap_shader {
 &remoteproc_adsp {
 	iommus = <&apps_smmu 0x1c0 0x0>;
 };
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1a2 0x1>;
+	};
+};

-- 
2.53.0

