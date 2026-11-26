Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706382;
	b=ErKxB7QKiTuLoTApN6OasG30nPOESBwNkcjmZiOVZc0kdS24H66Zjy0hyEZiMSI2vV5+
	 MxuX8IQJLhNgqAWNfHnQoEfyMc66skP3j63/FCnepxnorm7IznS6gOwk54eg7w6ladx1S
	 QqtX2ghWwqpjGRQuTG87tCs4cXUsWTsDzOjFY6U8pHscVeXlPd/PXGiF55HnA1/6vH6Bs
	 czAw5eHR2bVAu3waqCg03H1QfnCbfao9+uA1xzznZpvhofMhUy4+g6vbq7MTGR8FBa+2m
	 lV0fRkZxxLIG/7QHmZ06vMB+TFZGgdLTtgGAxxDydzFgXyYND0qKyo6HEbaR49x14sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f6YLhLfLVjeLIqcNMr5RDQlxnH+G7D4G2SjsiKW56tI=;
	b=OqXRuF7HSEZoN+ayLyEO6+C4Rmrd9X2NWZukPU72gePEmKdrDlxyklqehP2sBp0NnlOW
	 xLpdmef5JvCWdi5kpx70vy9luPxKpvUQIhhFqw7yPERC/Dwmh7eGK9rSFxYfFFwVHsbri
	 hNxoEF6k5wINmMkCbwF+W+hAmF+wAj5GJtftuq0Hks+8NTZwNDqsYq8sIFG5HYRMnrz/k
	 WdxJY2tdwPgpJL14VVD7Fc1TOpMCFwzgzgTrTKq0Es/SLHtOjofpLmHe0hxq3R5nTkfgb
	 SF/9FW3nRpaR425FfSGFhgDg9mo9lM2jrlZ93DJI8U5AJE1oHG5i1FCuXyxHvzgWcqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BK4TgPyU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i+YjImph;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D55D606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D55D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BK4TgPyU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i+YjImph
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUv8T3563194
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6YLhLfLVjeLIqcNMr5RDQlxnH+G7D4G2SjsiKW56tI=; b=BK4TgPyUKEgrkGSe
	cjfO92XyyZP48aQlTte+MaGUesyNPhaEwk7ZaDx2KEGdneRTe6sRNpebid2qa1Yz
	r/Oj7Mwrz4785tUFwSSU4yZBcZschjTNrclCBP2GZPIfPJmGZtq28fJrZ+RXPQv4
	I3iWgdXczX1687eCMp+GI4Jo8lp3hDp6nkjRYzWGTP3PjuIrmQt9SxM9/15bmHwn
	qYbeK+di1cPMBeGBwKyn8wLnxgiJOl8DEVOca6AyC4pe4ug9fGZUfie5iR/iKT4f
	Infz5fM2rvWvehlykjyMXWszZkNNaLwTps58iH2GcS3j+Sa1rzFwgpLULkW8knCn
	Ms6EZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbpbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:19:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945e8a244bfso79663885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706380; x=1796311180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6YLhLfLVjeLIqcNMr5RDQlxnH+G7D4G2SjsiKW56tI=;
        b=i+YjImphDk4NMaM+ye5KYB8v/bkDJxEtxUcCTCjRfwgGkksM9iXgpJFUR5imk5Q/zY
         Dmb9KOXQXIiRghQOJkRgZGdCl40lHvJHGK1BVYjGp5MhzljvgXIXVCIsueV0wfjfROqE
         81+6UaUUbmJomvG4OHtOTvLTYqb8o1cKXtj6KBdESDG/QPyN7HlgdZ24vzO4RW4IJLqh
         S5DG7wFBn87r3/kpIToP8fWNo7X7LPD7OekSEFmtifQJl5Vcn7puJ0tBoDoLHOpUt6Sx
         0ky+elJFY2boyhaJWOyWVQdsGnqHP/+BNoAsZQAKRWULVLzSp2W3pEX8sL8NFEfSL14g
         n52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706380; x=1796311180;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6YLhLfLVjeLIqcNMr5RDQlxnH+G7D4G2SjsiKW56tI=;
        b=zeG9F/MgGdt4TAqoPj0SynC3qDxQdiday9XzVaMcmIE2uRec6SOS4xcT7j4BROC5GS
         65RAwyWJkeJ8XoBQtmEPFcsuOeihNE2fndIGVeO/ZNf25Lt0BAEQVNEKdg436vIuYeCq
         55MaLohwsx6TIDQw0L/BXjV19ZZEj9VyCZWQ2UXNNABeVUe9Y7Ce//+acIVlacD1Peji
         DfDPJCCRwfhXt0W24fYjEJexFDBXA3SsQe0PTOye/X/LDftRnzR6wRpDMUqOlkeRSAYc
         f0QNsrYwCRD5RPSx5g2L3FBEgHK3QdfZxkhwFDMFuMwmr1zwWcwL24PrSBy6vrMCgJ8T
         H+Tg==
X-Forwarded-Encrypted: i=1; AL+hErHHKrOCmTRD1bmAK8AWGLVxwq5LnYBM3KrJaRRb3vnUFIovxpBbOVXuy/2bPeIYHbq4BnVqeOSBwN4H0/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qwTaPlP0hAuQlmNdzUdBQ62+p+7+QxqlFqxG4HJ8xW+h/FvAe
	XzvApKBLMHUJWXBelf0kt4UmyH96pAzFgYpq5hYgwupSIb9uJVJ/SFIcjmzw5FQDyz5laT73fA/
	mQn6w0NwXsjesPDRp7ZmHaaq4WtbQvDaz48hUtlRABaTd/lUSL8buLt+3d95hQFWpTK0=
X-Gm-Gg: AZFdTZcHEOCdAJ57qXc5XHrUybQK/FHuAhw8CJ0GOjLc8GhLRxCgyWwoFwdH1g9GQjI
	wLalpok3bJsyTxiU5kuxeR9VW0d8wOIOmGqmrAZ973Gs7DVGvE2AvUz+9noquOyqKZQ4NyO3pA8
	RhNy6mNfNsej/CacQ8LFbV2H2YxWjqd9rCl9045OiDop81wMbnVuwP2BZuFTztnpcchAW1YNu0A
	+eqkHsA0Z5gxX2tNij05fetThXkAouaxCM8J6r47WhAXnYLszc0gOXeSMD5/XLqQNCcJhqnHTq8
	uvwOQuz2OVjqw7boNR1RcEF9nbRaEB9NPjMSqJ72pduEkhcuntsknKB7cQ0Gbu8kv0yaB46GWLS
	FnUC6iwejX1jdUbcGKdRC8wf2gMIFEzdCP8ovZCGJ4PKZ7bAfMPaQBJz1zl0ZKCEJhKTzGMs=
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr3538275085a.1.1795706380402;
        Thu, 26 Nov 2026 07:19:40 -0800 (PST)
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr3538269785a.1.1795706379937;
        Thu, 26 Nov 2026 07:19:39 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm9867226a12.31.2026.11.26.07.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:19:38 -0800 (PST)
Message-ID: <c351c004-50a7-407c-acde-0ca1a615efa2@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:19:35 +0100
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
Subject: Re: [PATCH 3/3] drm/msm/a3xx: update the CP_ME_INIT data to msm-3.10
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
 <20261111-a3xx-fix-me-v1-3-d81f50f1ba1e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-a3xx-fix-me-v1-3-d81f50f1ba1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b084e0d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LkFtg0SWbGx8eehL8ZQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: capuvGBu-IQGCw15Djs_YTrPmE5sNXIw
X-Proofpoint-ORIG-GUID: capuvGBu-IQGCw15Djs_YTrPmE5sNXIw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfX/Op0RN5lSoOz
 opxXSb7Fl7qq8rp2fpWsOoSJj3XzHj8gMfOQ/OusS8lc7jYU9/xnQJK1vzV7CtJwIW3DhPZvN0d
 ClVG3CIrPPZWqFG3OsgXsrmZTcERSTIzE8ugQocd2Gp5T52EIBdzfkm9Kab7Oj61N3NIvlI2u7d
 3z9zGz2V3EwzSicQysCifUZjLCfirYxdxKUlNMsOemaK7sqhTeDjwumLkZyfqackdXwMMslZAWv
 hLQhNoHSaz0QLNS6H7Rn0MB77dseT3Dtj4umk3s0epqpeMYhpnErukaalaZ0sCjVBBgXrzO30ce
 4f/mbnd/hH2LS4JSWvNOSWn9Gh527h9zt1oMbHrtEpxQeslGyCOHAq4sgS9jjAUMO3QwSw8YTVm
 XSFIl/S3WzlFyIahtwSVMM+m3wO62kH6659liZj/pfN+Y+YuzAQNkjUsuPYc7i+oY+WNHASsle7
 XfR5+7Js06Up+X9CCow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfX1z6Ll57ZrfEF
 x1rykeMayAvyUt9Cckxe0dxkNk2+WQs1S42QEsXayMLpgUwKZWBfaBz9yW3/l3PNAUGM5kno/yj
 m/2+xbYidzFCRRMJqd5fivlmsjVEoKg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260059

On 11/11/26 2:05 PM, Dmitry Baryshkov wrote:
> Update the CP_ME_INIT payload to the values used by the msm-3.10 kgsl
> driver.
> 
> Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
