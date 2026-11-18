Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027844;
	b=3J6Qw9QuoQMxsVvQ6kyCN58E3ug1NdiZoCA1m5qE/7sgTfxHv4wgZDui3lmk98O6y9Hw
	 3YYHXXm0+J2NJblF/GWxE/SYrMfUYFqmjFobm5b4iZHG9q3eqwEQYHi+yaND0yKizMtJz
	 O9LR7ax320pxStFqEQIiIpCa8A+CwLVurs+/dMqr/zYMZkD+YGksxZ9A3f/yluK/2EQTg
	 L5ZqnYYPHA2X7qOneLDRGouTQWfc5LQX9/oR/0XvEn0TD7boVInpits/Bsr3R8mw8cfK3
	 9dPVmBJBqAv9W/mWv2SV73zeinWd4hZwfleYir2JzfEN/lqpL2RXxBeNjKUL8R3hoxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=;
	b=BYntWJknmAvqXcflYzpBMiXwz5jztus169CNLS43xEfLisTFAobJRXpOLG20Jd8Qygh6
	 foqgMPg/7q4Qm5JNm94/6juDe25CIOeWPyDWtXcT/J9TOHC6EFCEpQ5DxRX6+yibfpTHA
	 HknS9ZCbzrtmtdaodp5V7eLyE3iMz9MUR9xYSdAXEfRIazviikP/0tA1fs/28t5QDXoM1
	 3NIYXMIR57gj7mZyx4JgQwjKdmI1paEX6AdZRBSeCGoD0VjqTm254oXGaz7kme6BXTQ8y
	 J8/jEyO4Ho00cMXL2trWtMMAYsAPqZxnpZwa8guBa0hbEibnNQDI8w2wTEEAIhN5UZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iHsP0uPW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MmTpeerB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D603606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D603606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iHsP0uPW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MmTpeerB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AII1VWA275584
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=; b=iHsP0uPWNbZEl11k
	Q8Uuy0Ax70dRrgth9uQGkV9jWJCgNxJu9cKOmwRTbNJ+trEEMyMZextqDFnJkNCQ
	e9q1XghSK+7klBiQJvmB06OdHje5QRvR2J0hjMQlj8QgNQ9nosh9PV0YsmBpcA28
	0DpAHl4B/EhHU9XJUITKSdpZzktgBCPXflWFetqvKUnhoKdUZ8bmCAOI5qsr2fyy
	KuCwgX4DEYttanATHwSeMp4bL7LmzAbk3vsFY1aaI4hm50MArsxWoqSWmFQDMbEE
	K5nITVOPH93HT8ElbuFzXit7+26i+hjFvLlrO+295XTqZbGhvsQHLedkExmialxs
	R0bEUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcr793-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:50:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed2c307e62so16971725ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027843; x=1795632643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=;
        b=MmTpeerBx3ZM5y7+v0at/sAF7oavwOpRJD/PxgLjHXPCfCJm2zXoSVm0wWxn4rT8rJ
         OnpTGgL7lPPdqqeWDRfko9ohvnNXj5PXLeNV4BywFOZ2tzWtlgxc4ov9/vRHcfTLErb5
         egCWLaNbKhhkZBMaXE3InpTQSEvD2ZNwtFnl87VMeJnDQ0e3jgntyNXaQUHC1GIgfUUu
         dX1cspyYBWwzyOvMIYo/WI/UzTsZYue8ang1qDxi8IR/VZiPtVzOGmcfbzkI4bP2xoiY
         F26LfFTkHiC4e7sFfBC4VPSuGIxAD+pzG6ZozCzONLVgBZTsCyu7FFzufokm45K9DtH0
         xusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027843; x=1795632643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=;
        b=RbPFE9YLHdCwbY7TpMNsnWR6N9yyUt/qbR8sa2bM4yl8sdpS1mdwg+WR+3/iJ56b4D
         mCimJ+mKeSNbyNtFr+9qYJIC13zY1cPVnjgdykkXRewZQRIEaDxLqxTVGD2kNMITMfpB
         D1uX0LLji41ewkzDm8WnTXwKGPPOvy/CgYcQb4O8fepjhXrLNCPJTVm+Dym4gZLvTdDT
         iGppRY6ZPro3ue/yU/b3uHUBJI0rfX7U4LX+eytH6AhUzXHeM7nWW8Xc5FA2CWaMFEae
         8SRZ0YnM19BQwm3FQhUpuBaV4UAfBg1PIcR5IN4+1c+2F+3u/EP0q1jWFlgW9c96Reth
         3saQ==
X-Forwarded-Encrypted: i=1; AL+hErEv3TKnEnAHbgWJZo10+5N7i3MuYSQXSZBoItraZAV1zP8eDFXGmp/lxrrhdJ4Fq2OYI+jhcsr+Bh54mtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LiI0hcTP3lE4Bo3MFqwKs+YHFrd3oGU+lp+AmhDlJYKDSSVX2
	qaPZV65JvNjXN/WaFRLmXZf0CJiH4B2qIKJFGltKbE64WAk/UZWnfemVFe8c97MBhg1bRANWZSr
	SxrUrqkNOzy51r5Av2WczKis1EhlNH6QXiLu4SaVFJD3LJLw+QMiZU+eaKfr2XpCTvYU=
X-Gm-Gg: AZFdTZe47VMLrVTcJhj99acDtmhgH4+u/lt4i2jOvvZax+1ZhKl3CQP3V22K28hYyun
	GhHkRUDOsGyHTquzVQsoUSuNlJAhSV2jhZWqcwXOSGJYwkdWwDtDwssE+9VS2zHsZ4Lpo8rEkJ+
	HsQNyRU5Lx5hRnuu1KdRIHSkrKKMDmD1TEGu/Ii0ljhfzzy6BE/Q2t/FDt4wZ+5qGQKOov9689n
	4Nrat9yC/9zq4uHGFx7LBstkSApMAg33OcEAxw1HREYQ7NnXt3FfBuxgQ9VTaRP2QX41h6yWqAO
	Q1Dntq61HUF9RxQ7VWLekInqbR4FQxPv06S6WA6adBmommfQGwAFH/nc+0P2IWLa0Jj/H+p6X2q
	iDctiB5f+R8eh3ihVknz/mP5qnTEMGqKLoQwKVejJ2oG2+iFryj58K6HJ2AvHn270vqF/g+5/TA
	==
X-Received: by 2002:a17:90a:fc50:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b3d07598f0mr3522918a91.10.1795027842676;
        Wed, 18 Nov 2026 10:50:42 -0800 (PST)
X-Received: by 2002:a17:90a:fc50:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b3d07598f0mr3522890a91.10.1795027842199;
        Wed, 18 Nov 2026 10:50:42 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f6bbe469sm469942a91.11.2026.11.18.10.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:50:41 -0800 (PST)
Message-ID: <3b9e65b1-2b7e-4310-924f-ca190a0ce91d@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:20:33 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: shikra: Describe the GPU CX SMMU
 aperture
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afdf383 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2DaYFnQSzUVrrlYHPwYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: k49-34oX6kA1d0TMC1NXfLy7MThwqqFY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX/+lIqxdgyEfh
 VIt4D9VIZoVOhZ1TJ4t59iz4jIRuEGBZB8d5uy2HgSKYgO0/NdBjE/1snwZMGzI76tCkkIqXjWO
 MqsLVDpSW6zOMMKJnhM2EMm6Viq8nCHRlYOvqbIK6wnY9qJ0LYd9dCunvCQV3fqASN1psmLxPBj
 IEL9NWI0UFJsrrZ7UtJVIjLAe2BajRQ/VvHqmcXBV1M0XFNomQoJ5CAAYzfItfDaayIZyehLcN6
 aDTd8ZVz8jvffJKKrkqVGRVBXgWTqmqlvImRQCXmWo0BENcyZhRONw+4w8F5cF3L4iPQeZ4zvJI
 U8UODCPzdVkYBBDDmhnWTq4QSBhUlR4IQa68xZ/9GYs1cTUjOzwTIENh0HdsBiJB1ZWgDImKwxG
 I78zwIrRwLq63vuIPHiq2DV69CNzGkphweYUPNnCNSOLUripsAU5xRrr3ZjpNXXIjI8QIzwoVYm
 t2EnTUJvfQeqpnjYjHQ==
X-Proofpoint-GUID: k49-34oX6kA1d0TMC1NXfLy7MThwqqFY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX35dTEmeCy3XI
 AfFepc0IwmotTe6RLehT9gydm5oHxgUqxA0K6wl1EDTLvMGumIZ0BZPIwq6KBa/WsCitAlsy0oU
 40PI9Ytk/rnYiaefjB/o1tjiZ1+zoa0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180075



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 0a95ad5a5582..ebbe5e23d173 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -2647,10 +2647,12 @@ gpu: gpu@5900000 {
>  			compatible = "qcom,adreno-07000400", "qcom,adreno";
>  			reg = <0x0 0x05900000 0x0 0x40000>,
>  			      <0x0 0x0599e000 0x0 0x1000>,
> -			      <0x0 0x05961000 0x0 0x800>;
> +			      <0x0 0x05961000 0x0 0x800>,
> +			      <0x0 0x05960000 0x0 0x1000>;
>  			reg-names = "kgsl_3d0_reg_memory",
>  				    "cx_mem",
> -				    "cx_dbgc";
> +				    "cx_dbgc",
> +				    "aperture";
>  
>  			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
>  
> 

