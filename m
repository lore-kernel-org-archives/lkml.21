Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984905;
	b=yO1LtwJ1Y5Scf/I9sugh4nEgCuyi0fsiz74xCSpuMo7LlXOYBJH8HJVCrrKSdODzvcEK
	 XGw/LYrVCr0qF/GT3HGxKHSJFV1AOvsq0igRod+kyPaZO81kFQG7Ls3Oqw/zWu93x0oE0
	 YWpzAkWyyg6+HhJDu3i745kfIVSG8byufCBOXBq8YP8jZSoGaWDjXixpAirspDJt30LyF
	 3lNekzHCGfPUT/sUzeT+MtEMoKBvQfiHqaomsaJ7RHUzGL6x4JRn7Etp7h1cnfxflq5aJ
	 qrrIPrfyP9iryFKEc0ATsveOEvmU2fUkhKA964xwxrYahNHSQ2Sl8PdiiVljCiSZNoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xHO46V2+jhWyowoFT898RU1DleDEPsfgWYvhjeEUgxw=;
	b=TLYNybC2KlcN9ogIx0kAk84LgRYxIPRwUkVdheLjWaye2Q0/VnUQEb5VRse5VRNFdcMd
	 ot7VKM7uL1LdfZteVBVHWKccSYw4fhKiktstEKmIcQ1M5XRKMUWXqOMFjxTIPQPdfmwxX
	 pA55trTplIXO2JXjZFv4VCP25hrBoiPTEPSQP5Z/zIugEArG60RoDQ0djrKVJ8992GLa/
	 wqUKGQu9uu8liDUKpEDJmp24N+SkSmHA40eYN8d2FJYNHQYqaYXtFkMFv0MHniLXRXq/d
	 i9b8ZjekBrzcsYEbDaM64q1Y88zWb05u8Svcf+sOQJ1cKTluayzchC+fadIKNTdfl2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gdl0lK+0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwEAbva9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C0B606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C0B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gdl0lK+0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwEAbva9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvCq2453547
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xHO46V2+jhWyowoFT898RU1DleDEPsfgWYvhjeEUgxw=; b=gdl0lK+0OfTs+42S
	UvtSCwuKorlm3XTsB9rG+rN3qkThx14hornSh54QdUG5USLAWoxsN1K/OcczxAXf
	lrB5wfsW4MLi7ia7qAaioVSm7p0qDUqapPJ1Qks98pXRBouhkx52ANQiyxYHpNfl
	0X5kuWVXIDEhrPVWF14oY4/gzemqIx9KHDzY2hHayLgnqbAtUJ4kqI3hihF0YPl0
	ccx1IzKAO3pJPjmSCMqxeRbIukzCeaIloM8OqPj71BGWY1SMkhWTsEOXNOIvnUhv
	jvQJSyMp6QjvOoMv2Gdpj6L0v9qtq8JfpfYnZkRW9N8pFB8oZvRgzvIZkZnLvGO7
	5XAzVA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99nf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:55:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efe331887aso5181825ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794984903; x=1795589703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHO46V2+jhWyowoFT898RU1DleDEPsfgWYvhjeEUgxw=;
        b=iwEAbva9v26ntmEuN/RqNhSnSL8b8aLDN9wFRLnwqflnNeXAbGvV5pd1aFod4xD5DM
         Ffa2tu9yUspeBya96BnnxnkcXtV0lY8HmLWAuhjNeuhMlNz0Yc4iYjEjqNwTzqd5yxIm
         9tBauX+Rwo0XEAhHTFOPugYzdeYpzsSgkmatm9h0q8wjrwJbWKVu4ZjKo0ejwW2HO74a
         UqMnBpeVzxjl85fOnggT1XnIg9cIim0+QIGLz8gtxKGn8+S0y54z9xpSh62LBcFexld9
         7SnefNNZhuNqxNUaB39O2ggDCyNgc6MZKATB98zkhOX0Sfo6fyh1gTgIeyZfdPayL9Pd
         RGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984903; x=1795589703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHO46V2+jhWyowoFT898RU1DleDEPsfgWYvhjeEUgxw=;
        b=A/hAZKKj7YxnR8kPPPwPC0nX4H1RSkHBAkryQ+44mrHcBvpkbLo+bJm6D3yrgE9rQ/
         dDYXUE6YqykJZ+ciUAIW7iidEkY5awLLLi0vhmT4J+OadxEk3BGo1sd9ZlaUQ/ljswrY
         GkKzm9VmsDqJTjoLw7OjRRS8ZHb/IrD2pGRVx7oU9ltXoyqi+i9V1nWHY4C7IgApwQXt
         21vbiV11uyLYWOy0eAH7mfEF4JmaWfHz36a+FYnW4UvT/byo68svFnKNYBnXxUJCvoIV
         c1sJHVjGaIFK1xrCc5axmOSI6hQVAQo3c1G7jLzogQQE88RrNXxmUXCl+4np+9iVbJ1J
         f76Q==
X-Forwarded-Encrypted: i=1; AL+hErHRpXCyRabOkz/MdPeWxDLACgmXT5UBZDEyOa1Yki2Gq+ZbLuER0BpBfqhyAJghh0mTloQjKDmRQ4/L+oA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EkWW5nzaAPajB6OPMAJ9d9TYNbMg+iNiagBdWI1PbYE8CK7+P
	ZnIdL8TtJtNVed9eYDj2EBjbBGtnZEnUhUe63yUnQ63ZZ8UC2FUVLCvwxzwta/wB9Ja2Ga17tPJ
	g3YHozwDEuDwuQMnHWdqaWuO+YcT8J251renR7asLvcAj9QG8ZAjAh4aWWQJyOnnYqVw=
X-Gm-Gg: AZFdTZc5ibrHCFnOyduRh2A45B+8/VHzf/+sVhX0expFxNaQ/of/BbSAcw3xQU8fjuX
	BavTN1jT2VP40OWfP/JoLHYkdSFVteuE3p/FHxUk+yZZYj67YOayX9oFO2CijsJ3wUPOHw5HAr3
	b1GSDmWXEuYx/aAl0eXOtlarehbjfh4alIOeP4Rb4bVVFy7fZIhjKrma1z4umQyGphdCQQW/yXF
	oErHcexryRkGF8kvtHOVJernZJS1e4bquZQrPgPaUhJqH69RzenOcLJFealzLdniyZkt0bFxcOc
	9NK+sVLdRFduVDVPuIjsr+ZqG2LFeYjkY4cvQosGblJtOmpxQUglO/C0HPyOsjd7y5kwYB0WSmc
	2T1Iv9o6VgkgoNBVvLtAqJp+RpXcUalPSRAHp5hmKFSxTerP9r6BJeW8su2KUGZf8SSetNXtVsJ
	A2vVnDS7Wsh0lFPFjkJZnpNjjl+iLNa7vKqhdHnVtyVODB
X-Received: by 2002:a17:902:e84c:b0:2e5:4604:c375 with SMTP id d9443c01a7336-2eff75368e5mr17564635ad.48.1794984902981;
        Tue, 17 Nov 2026 22:55:02 -0800 (PST)
X-Received: by 2002:a17:902:e84c:b0:2e5:4604:c375 with SMTP id d9443c01a7336-2eff75368e5mr17564425ad.48.1794984902511;
        Tue, 17 Nov 2026 22:55:02 -0800 (PST)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6215032sm7998485ad.45.2026.11.17.22.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:55:02 -0800 (PST)
Message-ID: <3af8a03e-137a-456f-b1de-626405852482@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 14:54:58 +0800
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
Subject: Re: [PATCH] cpufreq: spear: Fix clock reference leak in
 spear_cpufreq_target()
To: Haoxiang Li <haoxiang_li2024@163.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, deepak.sikri@st.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261118053229.2066011-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261118053229.2066011-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfXwJ8Wdn0mfSAt
 ro0waJtoNnmqKTBSDRaS5Exxrxv57IiN/pDD9W3jDZhQUUowVSUxOs3TT0j2an1ul3Qw9e0daza
 6KQA5ZvH8Pm+rlZorVW92WvHYYb1e58=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd4bc7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=_cko6zJwpGfbbsqUD2wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX/VXR3YfCoPaR
 zKYWCTJM96QHTQ+kN4WlcHhfX+vWiwfEQD+DZ3Z/32fx85R+6qN8zgYOJFBkshKju88s0OMpeoX
 zSRnLYWv7ybdKqsg8Fw+Ya7XfRi44B7k+KBp3rj0EbNf54XEEskQHCLupQDvWecaLAe9d5oaLEz
 nMsDhm5Wsmxvgzy9/ExPmwA9JArKJfrKGHwRzx3fnmwN5FyQSlfsQ2JS4QVlT1X/oWqxsoBXId/
 ngaTXtcD4myHHgcygqY+jHJ9Y49KjGQXpvKEI7mMOuGfTr5wOIxD/fvhYgtONdGSoQhjUTRWB4a
 c7qX/71/3Ch+xIn4x1CdsmcQbJNfu4acMXwIkjhKTJq/f/31lMZpuQhz4ju27rj78EUyMKPhzPn
 BoCokD9K7jcdQ9J7kpwAQQCUqH3C+9thYA/evIVVKb7QdRsmPKcLMZjRNRXzZOgrT+wgOsWSD7e
 el84PmwihFA6um3saQQ==
X-Proofpoint-ORIG-GUID: ZK6WZHiGELy6refRi9-qMClLVMwBqKOn
X-Proofpoint-GUID: ZK6WZHiGELy6refRi9-qMClLVMwBqKOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

On 11/18/2026 1:32 PM, Haoxiang Li wrote:
> spear1340_cpu_get_possible_parent() acquires a clock reference with
> clk_get() for each frequency transition. However,spear_cpufreq_target()

Nit: missing space after the comma.

> never releases this reference, leaking a clock consumer object and its
> reference on both success and error paths. Add a common cleanup path to
> release the source clock reference.
> 
> Fixes: 420993221175 ("cpufreq: SPEAr: Add CPUFreq driver")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>


Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com> (with a nit
inline)

> ---
>   drivers/cpufreq/spear-cpufreq.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
> index ffe5eda82f0b..7f3fd6eca854 100644
> --- a/drivers/cpufreq/spear-cpufreq.c
> +++ b/drivers/cpufreq/spear-cpufreq.c
> @@ -136,7 +136,8 @@ static int spear_cpufreq_target(struct cpufreq_policy *policy,
>   	newfreq = clk_round_rate(srcclk, newfreq * mult);
>   	if (newfreq <= 0) {
>   		pr_err("clk_round_rate failed for cpu src clock\n");
> -		return newfreq;
> +		ret = newfreq;
> +		goto err_put;
>   	}
>   
>   	if (mult == 2)
> @@ -147,6 +148,9 @@ static int spear_cpufreq_target(struct cpufreq_policy *policy,
>   	if (ret)
>   		pr_err("CPU Freq: cpu clk_set_rate failed: %d\n", ret);
>   
> +err_put:

Nit: this label is also reached on the success path, so something like
"out_put_clk" would be a more accurate name than "err_put".

> +	if (mult == 2)
> +		clk_put(srcclk);
>   	return ret;
>   }
>   


-- 
Thx and BRs,
Zhongqiu Han
