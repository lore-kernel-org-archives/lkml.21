Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597609;
	b=FgaBgW5CB36a/E42bvQz1iZzusRSVpwWiFTdCL3At1/9FRK2t3/pFO8kGQ7edUnWJxEI
	 0y1Xuxvo7mUL9eg1aPFv8aRFwwWf5TVM3CsgHS9drUSc0VLiE1RC9NrJbKyetJu1BgGpq
	 cMGicOV8fUyMfcyRd7dl8x/0IncgaOIAOLmaN8jSZXbuSyUKHDEEJGWKFemJogp3Q3OuC
	 J12td4NJf8mxAqgMFTWSeA6M0ZbwGZpJxOWmOHAyulh50ngm9lbcUBEXJIT3l6dn19k6M
	 Ip1l40c/T/GjIsAXb+d+oqMgnzm6qmO4YPxYdV06rOhZDvGoouspD3VELiH+pcXW0Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eNChMfmi5DInFMx/izI876SpdAyPSwuqxL6T2yjWjFU=;
	b=mMhaXW7BPn+nAYr3UkKwlAb5vFLZu4HkwXHBXsVmo/BW/sDYcGYt6xEX6/tEM4CMXNJT
	 SXDDZB+8dkBEURiZ5nMyNYoHrPt2xS6zUsud3FweMFkfn/Rsp8pm34/1jstb/udSjLhOh
	 E9UCUaNI9BbqZEhXnmPmPOEfhvGbXeGycg94i5MQB3M6qWpq3LRpDCGYxlgPLR7YQgnAB
	 aUDnOlMbU3DiAVUVWyADANX4DqtviL1EEEGZFn5WpcC9dec81tuPI1/yTCC9cZat7KF+1
	 4xjAX9y8gkRhGVV8gSjWc4WjQp/Fv300WW4m8RE//OoGernQHlibXTW/w3Zem6vXxsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bA1mqBw5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9gL284Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C30606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C30606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bA1mqBw5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9gL284Q
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68XY8299998
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eNChMfmi5DInFMx/izI876SpdAyPSwuqxL6T2yjWjFU=; b=bA1mqBw5lUnG6vcd
	9K1yC8/glLrZGM8XOpAUuivrZyGRIfp+WD3undW+UP+VEUiaH/zShXTlupgnBWQp
	PSpANanOhTsQJ8IgxFviQXTLO7DxCOyHW6Fg9LR5XbinZSUrIoNQLsrQKt72yc6j
	O9KB7TBAPXhNX+SlBIiZMEmnrispHc1S1OCsyui21IfLQ91XXw970clFs2fTwiar
	T+iQcfy98sZ1L0cIz+L8JGWXMv13Iqr/Sq8rYqoPN4B2V/R0zxru8kNaqkc2MLxy
	U1uLtb3Q5pwnHYEHAuMjEjO0/SbPU1r5pKi1oN2ovulPP55YNCDxUe5CiG+Y0yGZ
	HEz0Eg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rstb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:06:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533962f6bc9so11759951cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597608; x=1796202408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNChMfmi5DInFMx/izI876SpdAyPSwuqxL6T2yjWjFU=;
        b=L9gL284QSDfokq3jJyla+Ng1+2kGgg6yh+zE4A1tptvJadfyjIpFqXAFaxfEtv2m9t
         8NqG3faIQk8KkwbcPxS2lWYvjhN0uHzzD/u/9UVJ8PBkVRzwjmo07MEKbsKx45/E9v6o
         HevDnY5jS7gHFq/lMR8xeinWJER+WQRGt7BTkIpwtzzMBiPWjIHNmvsWzcc/D5Y12GJX
         /RNquN8jTUcPRQLEAE0F5vy4BMouv8ETEJ9Ro4ZVLsL54SSRhxxGmMEaByU/Zr+jqYgG
         n09uiNnJzciFLWuke81p6Cl4zrvoIMjKiiizAw1n3Nb13RE8ygB+eIg1//b+ByK+MSh6
         qraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597608; x=1796202408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNChMfmi5DInFMx/izI876SpdAyPSwuqxL6T2yjWjFU=;
        b=KV/bnweZtb+7vJV1Lb2a4YEJvKcMcbuSD0weDiJgByyRM55ZUcoMKyH3vwqoBJTJAO
         U/pGzPIXd307OO71RR7orVyWliAlaf6AosGrw2qN6GxGLN7FjqEaLagNFfvdL7kDRy4x
         XDpmtTPTi0pYw7BxYul2vcz94m0cTOMYiXXQLb6Rv5X/gBuOXFnh9qFNEyLhb0y6ffEw
         fjYs1IGDFj4m136ZP3Y/w29YvL2ro4i5i/shDF2zz9rQBqsjJL6Qpri9WHRozenreUl7
         cTV0bsr/kYyiaqhPFSU7bbCFwZaoEAaBCVGJyP3ljgYqGZre4yD8uqNHMe5Q0el50J24
         khXA==
X-Gm-Message-State: APuU4Z9eGhnCFypla9tHux7rHJGRTuALgkdmjH3AqFWJxV0WsuDYgMaC
	SO2ozOte7T4yvSnQBh9s5PjzNfEF47YqRoU74ogRlBhESj0JrSZIiyf6r1H7AgxkhQdPrWM6I9E
	ld5LoAviTvJXGqoAeMGIbXBYTdK+jOfamX3apbDpZiP1LEw2tAF2MNpAbM/YPtJuVZQE=
X-Gm-Gg: AZFdTZchF0eNbBt41UTENtrPWrUjfjDmZKwcXKFFcHGieAqdF6zfs/Kzj0h5yY2rNdX
	pLBUTpF7fx4GZZjOtXLIvxOEnzFxvGZJI8aWuFm2VSkzIlAzG735Z3KuQ9w+ZI6fBeesxs/041N
	63WIhEdjnih3gpK7ema1+howJBWH9BoqfOvrh5sUnHOXrkn3UEyHrJ0IjwbUjsac3C3QK+7Blt2
	6c1aMh5ejfi9bAamkWHG5A8Rpi2sr3WeiW1ZyNL+iqZoDl1+j0XRtP6LtuD5tLnANg9zT24WeVY
	I40xuxgYIzaKeQOSNt5TuTwiwuz3E7eZ6Fbhyk+NNEXcLYuORW7orQbwlY2D4018GvL1nrhzdWn
	KFSMiBUjTWcoIBXclxHeemSfZGXSyKIRDQXXyubk+B8a4ekk37WG/7BuzEIjxuAyiyhkH4uQ=
X-Received: by 2002:a05:622b:113:20b0:54b:18a5:ce08 with SMTP id d75a77b69052e-55d76740b26mr301585851cf.0.1795597607716;
        Wed, 25 Nov 2026 01:06:47 -0800 (PST)
X-Received: by 2002:a05:622b:113:20b0:54b:18a5:ce08 with SMTP id d75a77b69052e-55d76740b26mr301585671cf.0.1795597607313;
        Wed, 25 Nov 2026 01:06:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm620055766b.2.2026.11.25.01.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:06:46 -0800 (PST)
Message-ID: <8649f0ba-a333-4ece-9851-bf58cf20036f@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:06:43 +0100
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
Subject: Re: [PATCH] arm64: defconfig: Enable FUSB15201 Type-C controller
 driver
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        brgl@kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261125090017.26981-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125090017.26981-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX5iSfddvlY9VF
 /6h+3B0K4wtCBbtZJwPcTMSWJX3SMJAOWnSZVgTahoBVbrFUIbRs78PhiVSisr0ZuG2j708/rHQ
 edTup4L4nAiYyXgp0ItkaDwyfeCKhDYsbQ1hWErkGz+CF45cnUk3IwIWNjutU7tecdwWE5TQCcX
 6JMilnnm3m9dloHbVJpX0rug40yx7W6nrM/BLwk5wYga4JDPthFWqGzP0XsT1A7rTMP0FV57ZFN
 EXnw1JlYEKzmqibkhkvKs1lWSbP3FwILSyf878snA1lZ8TcU1iojCSpbIoH4gWu8Grb3GkWUZXa
 +xywbeuTEk/GD6k6u3nbYvieeyqDGPsgrMqNXZJuWISqXqX13Xmmm0WafQxHNMQ2iVU11GZyaB7
 1rP4E5Yw1KgWLt3EG7/8yLv8TDQlWR0vb8SXIt23XGn5xSwTrr9abdc/1tHctucgsRNIP4XReEQ
 StCheotzXjEI7r83g8Q==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06a528 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9fKiYXDB1noZe8vDgssA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: IGmCOl6zHieQHTyVnPZ2SZ8n-jw-2f3M
X-Proofpoint-ORIG-GUID: IGmCOl6zHieQHTyVnPZ2SZ8n-jw-2f3M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX1MfkR+1OlRmM
 URs67ZRqAXgMuTOX5JJuvuhbQZRAdvzDLNUydKnEWMCzEDFIr4COyW3HxB2XY75XObLyzsGVljS
 rXg7u0ZMO68E1vyxeon/j27iYj64NFE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On 11/25/26 10:00 AM, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Enable Onsemi FUSB15201 Type-C controller driver which is needed by
> the Qualcomm Nord Ride SX and RRD reference design boards for USB to
> work.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
