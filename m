Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704475;
	b=AskqIKcy6jikTb9+TkA0LKR1qVCW8brfCNWGOfE24kDEeseIraRVjA40KOe0R4jmFFu7
	 oG+BEQfkPozb2mIN7F7puHKo4jinyITGuBSj/dqq4ejHkN6S+FeuHYZIDBt5jYRp/NOb4
	 9zoTKFgMzncI/UBsfbv20bfqqzUH4P/fAnzTCwdlshTY9aXo0fl5fnaz6IgGn7Jr+jZLj
	 h1rBi49JewgsWBTb4/s/nGC8fCQRubx+SQ5KAeFvIeRoxSNxAgVnMycM2fvHuSp5Bv+QX
	 CCeEzMa81P/eIYkHvd0KoGQlDtVsLx0u0T0oEhQ+7lMDk61D14PtGMhWcoKcOnyrOwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704475;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=;
	b=bb89HWQllkPwDJzJfSc+/EP7z5BtVv9lmBFKjIoqEQhqsPnUCArQlBbBuh6PKf7vE2s0
	 19WBqPFLIv57PCxzSPpaMhTNvgppx8D7vuSmJ4xScgJbziizywWd6shnUZ4bMUp3HVkMv
	 lE77iDcQM+O5l2XTn05WDt0XBVpKqTQ8/xQ8OBwzPt7HYHT1m0JRH6vJzzOfsUZS5hmsD
	 cerefS7+0CxfwFB4Du/3rpkrgvufxGSNKsj41vfgR3tByipcMbww9MftleYsSuw4TOk0W
	 HMZNgzTXcGcbUFki0kg2HJlI7rtieM7pNxfWvKu+ZBn6NmFMd7LpDlqC6al9hd2QL4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fel4mEEB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f+tGsvsU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95187606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95187606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fel4mEEB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f+tGsvsU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV35w1882553
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=; b=fel4mEEBzuPxWI/Q
	FGaSuwN1amKxr7mb6Uqomci/2589jz2JZTO9djkwS0SgTG0ZifkeXngRrAEPBRP5
	g7V1MDzMFfBsa9rNfDx/RS+VEZoTNhEpO16hkCqRcFVLXQ7m7Jy3YwT9HPRqWjZu
	7rNrKoGnG62YilLD5dsv04FxAUlDjlgbBQvGhJbTx8ReqIxHqf18GLTkCv2wuk52
	TEkrwaOAMEnwBv39Jn759OLHCpqTmDeaN+gIRYxcZXucprGeiQE4sEPleTFJzkx3
	MVn3DsuZfD+A+90gmjYtNf+oaHrXON6vrcr6Wy8SjuifYsDbBRtH5FqcFTmegNhT
	tUTQOA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y3gea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:47:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso320435e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704472; x=1796309272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=;
        b=f+tGsvsUrrrqGMJf6NdrLJjK6GvQNnh2hUoi/AIzlpk1JkMJvOYPvRaq5wCcjQp5nq
         eq5JEhzrb/OHqzHcBHuOZn3QHWdmS/4+P3YSltL9AxiuTMMvVAse5avVLkWcRwpo8FcL
         ikr2CeKmsqJdxlHTyr9thpHCPrUimxSFCOmHkdxvNGD4acfaqrdrEZKEQlEr3U2kaNjt
         BJm0fPXHR4UYi0OiRDcNmAl1OPxHNP+llnka8IiFd1ieCsSTKAtzYc2SDMlVT99lE/XI
         AWv/+/pn0rFWhP3UaXTqYcrscXjxcwfR4wSX5JlOjs1nZ6e/qP+e8+O/WBeA5yY7EaH6
         rNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704472; x=1796309272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=;
        b=z0CTLz3EI38MSYhpOCxdqyJl0BCrZpSAhgg4vmZTDpjIndlaRSbQFTjjtcW8s/N7dh
         4F0CSCiNIiav86vT0cs7CN4srFVqC6rKXDK/WRDbtNl9ZzYX/IFPRRvsxkCUHW/i4Tm5
         ZKnrdspJRSgrxZPZztVsvCHWGxtExpTaDBXo5JmtUPSUzZyGWdMabdQv+vQzAhTryatw
         daVjnwRkTNI4/L2Di4Z5cABFVHXGLidvvqKRnIWwW/qyZvNle/nrtNL3ow0Z0x7/fV2N
         DBFnYho6kn+WVqK0FXRVnN5ybLs7hlXBK3pAJKuq+Uq2zr+kE3ez6rV35Ss5W22xTXPK
         7tSA==
X-Forwarded-Encrypted: i=1; AL+hErG/ybjCL0g3B6MSkaTIwXEZxqrukANihlrt/i4b4ArMqAjOK2azej5pFNQ9Ze515FPU/q5mnUHN1XKdtdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZNb3kTDihHu2UtyB83xJJlDDICAKxIMyU2KP9LGIEFSWnneiT
	xX7wB0TnU4E8QghG4KKNl7nlKut1mQ3YJxc9B3ZrvphcfoDoV5k/rFhnApoTKGUPwW+oMRypPbt
	BA7oBeCl/o+GyeaprkCeRLzatwmFwCN5Q9RiZV7H8QcwsujmzuiM0rG77XSgWt4o50qA=
X-Gm-Gg: AZFdTZf7ZdszjJuEF2SfMzNpmxg58CcVd0G1nt1+pz7+3dS5+vp8iVI+MdpTxdWORJ6
	OefidxUZOucyIQVvTRtqMTLinrDjs0PpJprCXmCYSQXKBFrH0/USqVZpOUREo/igG5GOgSq2eB5
	SdyzrvlrZDIHJ7KTT2rxv5bSJGb36xp1iQp1yAxadlNR0t51sShoPURVe91pMccl6IDN4fqP+yv
	JADqcOHOp4qTp3Bsnieevj2jBZCB2iYCBKK4FFzndEmVW0Ay5U8w1zMiYi9zPAmPJpSWUFyXN8z
	/ur47Hx8Tsv///0jZupK5Xeh6PT7jH0O1J2LllPiAkt0iB0K/KPNUJ2lxI9CVBE/rcNlaJF5Z3p
	lyuaMZIgrRTiuo5S9lC71/GH1xxAO144B6BIvpXRfyL6u9/E4hRubgaeKOdXAJT8b+upbaxo=
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13495164e0c.0.1795704471679;
        Thu, 26 Nov 2026 06:47:51 -0800 (PST)
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13495130e0c.0.1795704471268;
        Thu, 26 Nov 2026 06:47:51 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm8301224a12.37.2026.11.26.06.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:47:50 -0800 (PST)
Message-ID: <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:47:47 +0100
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
Subject: Re: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX2EPEOR31j/no
 RI+OlQ/3dL39Mgh04Mbp0kfLsIVM2G/TIJ8upq6z45bjdt80C1u42uBEKrk28ryd5Rcd7r1uJaF
 MfPmauvEmtub73n11aE/OKoY0dqII9POrNVopZdXXg6GUiRSrIsQIeHhPBcKeJm/k1igYAmbYcx
 3BBoBcRJy6ANEQXotcttMQ1/l6sQCOHGTYthmmK0b9sP87L39WrZ6Ff7YVXL1+WtCz1KFHHmR3p
 OLuWvh/ao2CpL+Pi1C+kHZQRfaIrrl4IZ5PnsQS2RrDyvOVeTWNhpTtpGpfLI1/kTCxkNlNzEpM
 0ZaFeEI5MNYFJKGve3oW82uhry6kTIT/A272e96apXbMBSBDn4UzyGTA+EB7qn6pe2xuCYgKnZB
 Q64M0C1stG84RgNAPNuVuvrNmis4kjs/P2yGvdCn9mZpcTSQvrt7MquQash4QsNw4xQ5QKWRwek
 Q5hhD2C+llaB9MvGpRA==
X-Proofpoint-GUID: eoLFaDipqd4kZoq1NRTmSsq3ySCqim0x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX1b9DGN6EylO3
 YejNaWodZTxtRDyL6szJATfdVaqwBQMzlWWRnJQD20rbzCGzgZWZCqOQKjwO/1dnu925gPFl5jz
 BRr8LrtQ2Je7jnXPrnGFyucxl+oenkU=
X-Proofpoint-ORIG-GUID: eoLFaDipqd4kZoq1NRTmSsq3ySCqim0x
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b084699 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GS9hGxBgXBVpQNT4ZgUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260057

On 11/18/26 12:00 AM, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
> the A7xx Gen3 family. It is derived from A750 and shares the same
> IP-level configuration: protected registers, pwrup/IFPC register lists,
> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
> record size. The differences visible to the KMD are the chip id
> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
> firmware.

[...]

> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>  		return;
>  
> +	if (adreno_is_a753(adreno_gpu))
> +		state = false;

Is that intended?

Konrad
