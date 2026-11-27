Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789651;
	b=JMyFR0UbtEdDvhQRVw6KIErKUBXKjKDPODuZG4/gGu+HCHbighxAfqt+dI6/qOisoDaU
	 r5A0frKHm1zBz7QMKrvoHoRBvxbl1fZMbA/7/uCmdX25KNq/Xa5ZTjEPGZLRYW8JV0Qdy
	 nv6tvyr+0aICmWDg/NMoiLlnwfaXRQBX9+04x60ALCKFzJEXQQamKCw1674mk+pnVNR/X
	 JBqOKm6M7vB1kh//Q8iSigz40hsLIz8QLNSQ5y3J57QI77reWrfJt3tPe7BgmTIkAcVfC
	 cN0uD97tfz7xTKVches51/tVMYr9Ezu+4VtyH5M+aHhgVggq3tOfA2E4Pld9dJiVlsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=;
	b=1h/IQoc7X0PITDZIhRi36LAcAb2T0x1Gv9IExXAkEuIgz94IlO7oDTfi420IH11evFUR
	 Hb4Sh5WgOvkfca0tzks7wEzIQ4ghWxCiIk1mXdDT1jfuTBYmt9ieJ9b20RxP+/qFbGeUC
	 NyiiloF1SUIQN/ppTGrNyOmoOuLi0/U9/HhCAbil1L7M+6o8VRZW1VqjDA9uc2I4l+ML3
	 oHbQQscOO+UZ4S/4QmNoQvD2BqJpYyDyN8bpDxYz9TLKKiuBp1q8DQ8P+Gg1hnZdZN3Sg
	 Zxc3SXEC9DH4LV6Hy9lrlII1B43D0WuCJkoHrEJVvZiSXD8erUtcp+IZonh97nnilPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIi3g66+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="b9/KAsjr";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212F5606C736
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 212F5606C736
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIi3g66+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9/KAsjr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1J242376286
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=; b=cIi3g66+bwoqhM3F
	3d2o0zwCGyXUmNTuYG44OuMAi4OppCOxYlvs7WgYEJ6xLR0NzuKf3xnL7sbjUUbi
	GXDcIiP+oarqZwB3pZuohtrlPrCuU8EyckNJqhfxMC9rbuipKjSBupceyb7Achdz
	7kkvpn7uirLfIksWSR7kizv6Meh2jNt99OdkYn/IJpDYwwA4pFiIuE23KGB/VqQr
	VF+bX6l4Mglp3nDwwp5ieFFBXDBJpoaG39hvbY4N6Rqp5lkSEZ8r2OjkPLRFzepA
	GGmqMi9ZJw1bYOnC+pAQkcyEnlfn4MJOl0j2BpWQUSMfWQZ+BtZW64kTjVHThVzW
	dS3+Lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4huefq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:27:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945e8a244bfso87078485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789649; x=1796394449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=;
        b=b9/KAsjrYvPmTdtvC63MgRwhntd0u4hLKU3HEjV6iWtVWrnVMtpm/u4Asu5o3dU0Ud
         gzJQli2quABTI0I+kFogCu6Rt8MagAtuiNd3AD41swXthjAurIVOBB8PK/Hxd/LDNsdr
         l6GKrgiHq0TC0xsSbx0PFYjnlnFt+9n5lFZHT6OdkTDrPfta5hJK2pR9T1B96N5dBoyY
         DRPBjMcUwGRNT1d3wKcYJLZJqetdR/MHfjmjpbitvkCgze1MeA4Hll8sAh3I0u4EzJkJ
         FFydfY87DjfRnyt9xywQKM5VyovQORme/JzwvdGSVh5FEGFz9J+jD4mnRwMLmb0PtAlH
         UWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789649; x=1796394449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=;
        b=rEWekN6DMESe9Q3wAythwDP4GFn4d4XRekunty2dndUPdZdBiS8a436mrNjTNv8Jct
         XOxFZwJFbtNVEVOWqhys1aoUlEsOY8MPEwnq67SIIaqa32Vv0+I7yWjc+NoNrGluVIWu
         ev/zcwI/zpRBuBQnIUrfsQN/CFGWmQFQ5RB3H1lXGr52p6fY1QCRkuWiww4kPEwTWAN4
         uFsQeLlD2WlZeXoPGk7dPkJiSfIyIrRDaODh6zl7kVxs0a7vDPN2fQ6L2y2ebmOHSZxE
         yH0fstsdgmPNu3U7CMi5BiTFJnFNC4mtr6HHNzSzj73o7FiR5VVV+vOXnu4OKjeebE5Q
         2y0A==
X-Forwarded-Encrypted: i=1; AL+hErFjKkFfIKbktu7i8tBNsH4/E2CuPsRfnz562VEO5DL+vpJTHQMco2V+mIu7OhD2Vnl+EhBG4QtPkzzCWyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6LzkhBsxQjQGrhCOhzaeGbXmynNZzFBz+rOgNKJarbwiKhQgd
	YLAj20bUeYzO9Rcl6msyJ7QRPhcoRXrd0xDjI1tqR6IDbwlE1WkwZN1MfxHTTSth8h3fknfMyh2
	8bf6ooRg6odXQWjimAVZCYgE/A5OIFoKpCgQgjWrzOW/dR9zTYKI94mr39X3GiyoawmQ=
X-Gm-Gg: AZFdTZesl0ILphRqqX9NPzd7BGgNqFsorPi0FHhF5FWhOhtA7su4kToY/gmVJFQhUla
	DlGNjeuc7ZIhlyOYGCHV1J5axJdLhF+XIhs9oi0EKzva21mnaqyKr9jPnA7Fu2qJu8GsBJcYl8p
	3s3+mt49yBvp9lHQx3sLspyZQikB2fREP6XX+2CNeWICq5aYYlgDfpIvLJbQo2Tl6B9cYqqOtJv
	oi7fld9KBsCgZgqY+aCeissFaQo27wrkltw1MoIRiwZ9kpGhoPydO+cc6FYnpbLaTe+B8PGZDwH
	lwOBJ3Lon8AuPTuqgor2x2rQY6gQD5KPdN7ytuSIAFubJWZHBkKCYcWCSL1NBVLr7KZraE24RIq
	iW6IsIcBMuzhYhH3XQWyvDaxkctEJh5K6Fckso9waCjk3GHioACBoh1K5FwaErxG77Q8eb8I=
X-Received: by 2002:a05:620a:219b:b0:949:aa1b:1243 with SMTP id af79cd13be357-949bab2c992mr4628947485a.5.1795789649458;
        Fri, 27 Nov 2026 06:27:29 -0800 (PST)
X-Received: by 2002:a05:620a:219b:b0:949:aa1b:1243 with SMTP id af79cd13be357-949bab2c992mr4628942185a.5.1795789648977;
        Fri, 27 Nov 2026 06:27:28 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm9285824a12.36.2026.11.27.06.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:27:28 -0800 (PST)
Message-ID: <0a37b7e2-2489-4d9e-9ba0-f5545f962ab1@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:27:24 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: msm8916: Disable disconnected
 DSI
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan
 <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXwlCV9HSv9yzY
 n/mA6llGKE63GvfRrjT1iF+3TlYmiJwWr8Qynnjn4qg9ie6+ZJjR3twhf+9rOYFsKKV3zs5QvL/
 BPfr0bSypuWrvSUK2mmJhqEuSu63qpA=
X-Proofpoint-GUID: XBm_85DhbnqonNH5vdU3dcg_Fo2r9GF6
X-Proofpoint-ORIG-GUID: XBm_85DhbnqonNH5vdU3dcg_Fo2r9GF6
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b099352 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BO6MpYfuLILTTXtsdh8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXxZVZqZcR7tBW
 NZ0fVQhyfVlTYa5xRJZ0C9TWQzDiHgEFBzGUiRy60T3Kyrmyp7Y+Gv15fKip4dkXlKNRsb4j2DK
 6n7DmiBpM2JIUGKj3W7C5z5BGtzzVVTAccxQ1zLMBKydY5I1D+njc7N6eY1JkN5tB+aviI3mRGS
 L+y4x1hoSt5TbrbnXpJBPgW4UZnuLG1y1WxVEcgJbCtxaYVU+aV00/cdQ3rHAdtkdBmtzGhYTSa
 BMIyAPog08ASpWciZ+B+bgnW2yOZkAMrhJf8UNB2GFAGzGkPgFz0+RHTYQhmowhoYOj4P6W1b8V
 nUb+FMvO5rzqCd3ytOf/cecKGRUOQjWEivy/JE4QxymH6OsFkKaF+0AFTb6wpfHRll3MYigMxVH
 /Rr+Uldl/sa6+vFWO744YmYF27qglBFHiVU4Em6K1RnWG8QXle8Yr6nKt8KTBGgCpzRueyRmxCS
 zOf8DTJVFzBEPYn3L+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/11/26 6:45 PM, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

It's not useless in the way that the hardware could still be cleanly
shut down (which the driver could be made to do), since even a device
without a display may have the bootloader initializing parts of mdss

Konrad
