Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083822;
	b=Az8JEufv8gXlngeto9fpIcSHPBwdHzc+GAZ1ooMT7SAleMwWBkyvvBs2A3536Duv3J6D
	 8de4fgh+WTw9bQpQuY/1eue/+UPaaSh2UaxqO6wbyyFF0svDs8BcLMkzrL38FOlW5TAeg
	 SAwJTSF5+x9t0gMxEcx48HJPCgLlARCPxNjJFFXpUNe9oMFNSaKk+oGV9z8AA0Zl33bZe
	 AhLtWBmL7SW+uudKF0LDz68k7+aJl/bJIIfsHeXftCFcyCPtAHScijtQtHDUucxuhVRSi
	 Vn9DE9o3qWZvsy61qWs0Wvu3Y8z9V9Rwt20CR8RHbrIF3G/jopGvG6eUc1JPk3Th/zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=;
	b=yRXpQBqo2YSVGLiPzZroyTMi2qRiELrBYe1aREM8UB81bbgSiQTdT80O0vuRTc+CiYQk
	 hVwo1rSMasxd3eejXi99s6fU0z2r+ONrQS0QbKvxEFwHUNnryNZF2D/LGZeSq2PPKI2dS
	 Dv2ZBiJA4v5HyvzdtUvF2mR5DkBYG8R+yeyq88Z9h8jVYY5XGL1XQ03kMS5kCuuOnTPHY
	 OjsV9KeM68ZejiE4XM9C2EzATb06jms3LwQbfhsKGlaSkRRh69W6/x1wqmi5Wc1uRUY7B
	 6fE20MPTWam34AVqD3Xn5GS4j70j8xlfb5Y9WY6ThVkriSLZlXCOJLNwRqLTaEj3/3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=beZQtvH3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EjIlDMfX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77493606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77493606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=beZQtvH3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EjIlDMfX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v5vq1962395
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=; b=beZQtvH3sJoaN870
	1xzUQgkcLknbaAM6tOw9AaP+i+/AHWFt0eLB26Y+hikYIKmpxqw1fBJzlFPJenWH
	m6rcZ0X2TQYbGQR6FIm4r7S2mnRPcL3n6hU8RLW8AVP9MjAniLH0S2uz8vZbQJHT
	7D/7pxDYih3AHmOQ/U3GebGVN1+5moN/mTQzCJzezYHG7eGU2WigiGZaNjnj0nWe
	alcdIunbDmplTRqz3JK9LM/Y01ZhVVFGX5WOfxRo+7/mnA3dSrG4NzuqzuOYMZYq
	JDSdSnIldwBY0L1IoB+0Xjh5CXyupWMbSotwRtMalPbdZ3do5PBBhtDQf2W6qkjG
	UE5Fwg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcutre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:23:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1503757a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795083821; x=1795688621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=;
        b=EjIlDMfXBKyH435iO54N4RfcqpKVHmKXOsJWJOZ/UcIVAjRbC3g1rRRCF44E6fClVu
         Kopr5XVaHM9hKAblC+lju+Fy3c0YvFSpTyIP5yxwtWqcmGRYoFvnsXraRKXT1pmxluFy
         6wGDXopmndV137rkue0vGuk+0pMDmIPM3v43QA5YXkx/HxHOzWq0DNn4BAuYSaOA4Rja
         4g/c3DZt3kmC/nT6YLHGhdjvTX1rNjvM4CLDr+waoArcHdWJkYwBTIr7RUpHJN/GE8mR
         TndUpQ/2GUr+pMLKow7TntZ2X/N9RsixvTY+f2tXIMTsryO/F2EFtOSsT7qFNdSKjnvE
         5GiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083821; x=1795688621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=;
        b=vtHDX7JRbAWffag5g73jkTrquZZF5k3EIiOD89lAxVt1qUtdaJi3NqfzrbYf8k7Zhm
         S8dRMFEEVlI0XNEelZNv14GYNWiWjFX0ALAQIUfPcfbCb5vAcPzX35Z9HAEIRZY3mIcr
         YyF9VwjL5ofXmWrOdGth9/oZuXVgmHi+iv4L+tWlRTDT4MEdaWnW4GmghyzMD2NclqV1
         lYGCC+BRzeW9i0CRV75GlbmQh5ljq9mcQSNUgnRNmHtO40DibZfmWteKtEiQAVWQs6Kj
         SQSpy9TmKPi+a/Vb8821B9ORD176Yee9pBi6F9OVyZXsmKrjmpKxFA2BT2rVh4NNrYBT
         rZ8A==
X-Forwarded-Encrypted: i=1; AL+hErGCn8k5jr7sJCO2na+HA4HYG3VnS6VO1Jt/0JZuR6TP8FrE+KaRpfwRacMYUml40nNCuxDEuOIvMUUwf1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Dh3HwoJ6S0iPy5WmAiAV5WMg8L+YOkyBq3ON8z0Am+tHfgg5
	bzQ7Vyjur03oOARnNB5D9iE6GTqGtqAQeu7wUCgLMoBmFQ8M7Fa5Em4ilzG7pG1mbtBptOGFeAe
	akw9vOyasKVXRtJ5lxLIyAegz8ovwQfd44iqQYfpdIZUVhSIYVCAB4NvZ0HwRgVeGgXU=
X-Gm-Gg: AYBFou1YVfBX0pJ9MU4NlYv72y1RUK58Pg1n5k2Mv0V9h2pY+qbikSDXVn8zavwPelp
	XTGDQGSL4WOfGpC0rA7f7AZ2uPRi8u04I85XwSS5+Mm7+jacNQ4LOBQ0o0xF7DT/r4KwlFjulex
	QwFeKX1lkRs4QhQqIvpgOqPkBzT0AAQORkp1HXKgHgYqU9swSYymxMPth95WL5ja3AFtwF6z8Jf
	rL4KBn8sLiWdglJzPSJObssFugGFryL2dk+TV8MFTMsHatRtSA6knVRoIiuAFBbXPHoTCxLZhRz
	lXd8ZetCHtsXbwH4GLPvO9azF+gcGY+G5c7rqrISGgWgM1PaRxIgwnWOABtR4qEGC4eM/F8Kc63
	iYzXht9oEcq/xK4S6jjH50+/JwuOpUk6I7YiaOq1N1I/sZbfb1e9pH5ARdiCSRd8gHlwQUbi4D5
	qyJF6NUJ3TTL9VIfvz7Eq1jh35qrwUTyIz1fXxxZXqQQ==
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5626917637.47.1795083820948;
        Thu, 19 Nov 2026 02:23:40 -0800 (PST)
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5626893637.47.1795083820409;
        Thu, 19 Nov 2026 02:23:40 -0800 (PST)
Received: from [10.133.33.68] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde5336844asm1476471a12.4.2026.11.19.02.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:23:40 -0800 (PST)
Message-ID: <03531283-aedf-47ca-ba19-6756819d7b14@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:23:35 +0800
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
Subject: Re: [PATCH v2 0/2] cpufreq: mediatek-hw: Fix initialization resource
 leaks
To: Haoxiang Li <haoxiang_li2024@163.com>, viresh.kumar@linaro.org,
        rafael@kernel.org
Cc: hector.yuan@mediatek.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261119052811.2877720-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261119052811.2877720-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afece2d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yEmRr5OKUZuCAoPvvFgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Wg-bPWYEC42FzVK3R8qiuJgcJ1mObT_i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX2aiFJydmSatS
 jNoiZC1HLvN0ftj6KEbNWSDomIgO5ToNSNWR3piSyQqHLLenJ9NUzMsTOrBwdMpDpFiSn+1nVsS
 vXm130QQ9Qh8BXLhfwLd1yWbNGls588pmydZNummqUrE4YRPA4Kstg2ckpOu+PGP/TI2ZTN7fmy
 +gmPTfIGCHSS6vzDXB1s1fQv9FLbJLX2t3Wkv0FIh6qKe8v/gXFZn0tCWSLZKz7nCVAJ+vag39Y
 0//xY+qeJLcVKoBwM7dKP6oD+EOGmiCrPcl8bkA3Ma697Yhx63jSWf1OYj8idMdvFsw5FQrwrXz
 O20QWXo+gLpfBPIRZ6N6ERwMUmhpO9jQctD+3QqUsndwnTo50Kf4EdfNM1kaHLkqw5szXUtx+Z4
 MlG5dSiu6we2q39DhaiDI5dmbSZ1DAu+OMkUzYbLL72IQ3oREUMLQJjCN02n1x15Rc7Mjz6VpMv
 Ym+8kizukqI+EqBCZDg==
X-Proofpoint-GUID: Wg-bPWYEC42FzVK3R8qiuJgcJ1mObT_i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX1tUEH3d9R1Be
 VIAFhJXGgQTCi2C/mmgCSIgq9J0Y1xIIFivUdyXHBRBoNdC8FJNkQdEoU1GvFfd8M5+Gmz+2FsQ
 828VM1J3Vua4L04KYRSIyjVXABp6woA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190041

On 11/19/2026 1:28 PM, Haoxiang Li wrote:
> This series fixes two resource cleanup omissions introduced by commit
> d776790a5536 ("cpufreq: mediatek-hw: Fix double devm_remap in hotplug case").
> 
> Patch 1 releases the resources when the CPUFreq hardware fails to become
> enabled.
> 
> Following Zhongqiu's suggestion during review, patch 2 handles the
> additional failure path where mtk_cpu_create_freq_table() fails after
> the registers have been mapped and the memory region requested.
> Thanks to Zhongqiu for pointing out this omission and suggesting a
> separate fix.
> 
> Changes in v2:
> - Keep the original hardware enable failure fix unchanged as patch 1.
> - Add patch 2 to clean up on frequency table creation failure, using
>    the same Fixes tag.

Thanks for the update.

Side note on 1/2: if a domain's HW never comes up, subsequent CPUs of
that domain (and every CPU of it on later hotplug/resume) no longer
fail fast with -EBUSY at request_mem_region() in
mtk_cpu_resources_init(); each of them now waits for the full 300 ms
timeout. That said, HW failing to come up is already a broken platform
state, so the extra delay may not need special handling, unless
someone else sees a reason to. The code itself looks good to me.

For the series:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> 
> Haoxiang Li (2):
>    cpufreq: mediatek-hw: Release resources when hardware enable fails
>    cpufreq: mediatek-hw: Clean up on frequency table creation failure
> 
>   drivers/cpufreq/mediatek-cpufreq-hw.c | 31 ++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 13 deletions(-)
> 
> 
> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4


-- 
Thx and BRs,
Zhongqiu Han
