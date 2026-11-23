Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412927;
	b=Z0+9WOYaVLWqvVxJG/hejyaKylEOXwoZwoZ8p20En61K1XsisD+5hXZ8yF6acmHrtYYH
	 RIQi2S7hrZ7bJBlm3dm6JiPphLVgUQAgUcibN6eLp/yt7t8BB8hF7M4IBIp4nYIExip3M
	 DMcKQuL4zD0dvLJGW92Ele5FrCXdWQR+a99wDgKZ0vgX5wLNq9HoUhJxl4smXLcx74hJq
	 gbdREqwQT5lKoRpfTTTWfvvUAx92xZD6HnYG0cJpHnbncnofSHtsWklzx3fYSa9B567ip
	 K40sHz+9x78kLxYfuBzTMfbwDGBViWPaTY7M9hUza4t1WqN/VUNk2EgiN7fEnabpd/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=;
	b=sKZtTrH9MxYlb8SZlIki96Q9JM5ZMygdZsG0RvV21g8GRyLYC3hn5CpagxBD2067706j
	 kf9sOnlIFuJi5LWlHqror8Bj6Vwf01JR77+ypDP6XSrOXA1gk9mN/BXvi7I0f8Ft5Fc2K
	 5/6DSv3VkroEmwqQpjszb+A9uSRsGmrGNJajiJIyaBqaykotAOru0ZLbKLJDQQR8K3tFI
	 e7pkKmIS6TR1sbKylaX3QraR7H6PPiG+uAr835vXXyuYXXBIMgjndegGb24eBD6jsA1g7
	 liA4PmWl0Daonv+vaR9FEQJqYMkN6RDWo74zwTESBxMVRRNPJJw3e6FxWOZ53zLKeAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrouaAOQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8BaWBFQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C620F606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C620F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrouaAOQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8BaWBFQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51cUt2226183
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=; b=jrouaAOQBkpXIBv0
	p0KNvCgW1f7jEnIrr0Cy+Nnxx1dSw/Ay7K9cKDB6jBS47qatRVXeio/i+ZnrSdce
	gBvTeLdlV9/MQQCSmS7LdOrlE7vDZX4bFFRCfyDuM7ZqzSoSn71dQ0hXnVj0wk+1
	s+y7B8I9sJuwCvbI23laLvKIxRMGLO0iAMLdCB6h5N7c1eb/xD4m9VJLw3RxPJQA
	Qi+HvSIp6t2+9bx0FSBoeNzjEhhIGqydVasOOXI22En4OTjNS7QihXk88Sy84ZG8
	NXFa+AmgEzOrD50vCeO5kJlqHeOnun7pal3HL55qadLF2DfhM8mUHXNjdjAWD2ba
	loRXjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310fdmpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:48:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed05b3eaecso26250445ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795412925; x=1796017725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=;
        b=R8BaWBFQ3icyby0bVQZ+wDH4STMcAiTr9We+ZD4LfTFtdS7ujvgsJszYKbA3dzXP2O
         rgWxpmQopwjF6af5BilwlMT7gp79swnLPQ6PGEzMwjVdMfr8oLKwWNQKf3vt9nzYNCY3
         o2y9IUtxstsvK6Z8sT1zEcxifuBJuhRyj2Jz0GAFnri4v5q4jK8xKyHqmPQz0kLFS5dI
         t1c9qjZwDIz9B7sMuoz3Zcv8k+I/IuFK+WEFO1j9gqxflsL52uhry7CT1lx5QqFD70uS
         bs6MSSV/VP/io6w7y1izfPChjwjaElZxiP3UOzLw7cTLjMdiihwDIbjXvZxXl8h9mQvc
         lddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412925; x=1796017725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=;
        b=vRESo8nnl3i6LKJ9kr2pC9XibW0I8fJc/8541/aQ0XBj4thGtnAgawJD449sqcyTwJ
         Iw4pLhy0YlZbe9pjXhcegH/3ZtlN4Xjj9PkCgpNnWyAgF4trvp4KqDjJEdr80SsaWE4U
         O5FeTAh+sxnY8pSp2ktAqxi23ZhpudnocXDhue1jJm1X/a+uFoIinbDNKqhCDUxIPL/k
         9HjWmUmtVoPW4GRP4iOVwTmPC/SwKJMC+KM59ddsh2dHxoj9DJLg0eGp1lySvC8pQibV
         vlBNCLfwg6YPXzX9ulu/e/aemd4BdENu2Mrb7+UUb3w4jYXBaWOLL6gdqbE8CL7nndYt
         X8Tw==
X-Gm-Message-State: APuU4Z8YSBGfIfN2UOTIW3iKfMQOxHHS2OfwSykAKDSwgWRTILD1njvz
	TBkpZMKTaxHLzsb+IDvEx5GsI2TI2cvrZHIo3aebyKCLd3WVDnXkygg1BWTXnGlfrlQMDpaCDWI
	4EaQtd+H1G6aOUB2rif2Coy9i057f95AW6Vru62UJE+kF0717kZl3A20QSKvEMxYwahk=
X-Gm-Gg: AZFdTZcgcPjKN+IZMuxDB/HUtIfiTBYhrOjJyQZzbmNYx6wjyyLavei33lERXglB9We
	mstUOvo5bWek06Q4ZxPcG8Ma4Hz5mrg8tf1MXrqaCLqg77ERZrA7lgnRbOaKA5RCdm+Z6xF9zT0
	n0QtOh2P4t+MXOSjo39Tqb88bT6FMwX4ioo27jWM3OL0TWgyTU0CM+QPxVAikXmjz/vkwrQ1nuG
	TG5Nj1Ofr9xdtQZ+Yw/TXLZwEl3GVKgfAd46f/6g7inhmL9MniZWqC81vEoyQknFfsOxAYcrt2i
	2qpKCXRnDFldM+z0nHmaLFEMQZNFEklyP1zxwcRd1j3KL+7IzPQNTwzNiogazok1lf/zTle/qzK
	2RQdkrsGS7UGVgY5tD1Szu1LfkY09kAYbAlWE2G4HVGxmYy4VBN31oJUuCC2ScZDJR/OOCB5Nod
	32HmdFtY1LaeHfDCUhA8FaMXxhShTYatg63KxTKzi9dWzt
X-Received: by 2002:a17:902:f551:b0:2f0:2ba0:3b9a with SMTP id d9443c01a7336-2f03f1bfc54mr100526455ad.38.1795412925267;
        Sun, 22 Nov 2026 21:48:45 -0800 (PST)
X-Received: by 2002:a17:902:f551:b0:2f0:2ba0:3b9a with SMTP id d9443c01a7336-2f03f1bfc54mr100526295ad.38.1795412924773;
        Sun, 22 Nov 2026 21:48:44 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1207f1sm46143615ad.64.2026.11.22.21.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:48:44 -0800 (PST)
Message-ID: <bee69c86-2433-46bf-b842-0277b8f2b76e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:48:40 +0800
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
Subject: Re: [PATCH v3 3/3] cpufreq: s5pv210: Fix resource leaks on probe
 error paths
To: shyckless@gmail.com, viresh.kumar@linaro.org, krzk@kernel.org,
        peter.griffin@linaro.org, rafael@kernel.org
Cc: linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261123-cpufreq-leaks-v3-0-1f1e3f4f5a7b@gmail.com>
 <20261123-cpufreq-leaks-v3-3-1f1e3f4f5a7b@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261123-cpufreq-leaks-v3-3-1f1e3f4f5a7b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfX7p9/AFUA3FE7
 tXEWYRIMyrGng5xn6rGOoy4ZOwAS2OFseL8/HhADRs80DSCTcOCDMm5JvePxXF4QojZRSovuTuh
 iVOxAinzJeU72cxed0ohfjG+dKQ/avIUZAx/2wWEjJOMwITMKovVr5fKdFwxVKQ2hbDIOuY1K7A
 aBKbWMuZSugo+JUxId2RhtETroUISS9YFc/ZIUq/BsrcU6xlaXHQprYp36TmA1vybUauosCFIy2
 Qsb28ELviRKnh5ZV5KMMs3l+OoYmd/0K29gdPItZoe7xag3ld6of4invcL4iRP4dtiYeyj5F8oC
 KxlwcyO4dnXXANmJR19hQkKJiW3HF8EPt7s7BIYAAbYtNNDGb5XccjcISi5pmu/XMSbi/vFBmmJ
 qZWAn/ke/zxeav2evGuElcMqamgdmCms4wUltTbIYNGUupbRriR72p9jJLczPHod5uJlIAk1Svx
 ChoNUQsxnTC4eGCO5jw==
X-Proofpoint-ORIG-GUID: ao5aHnomO1CeQtV8Odql9zP7Umm4Scx0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfX5JoqAoEVYmFv
 afm9z/qokduqYWUDAu4kU2UGWh1ryhzlkDfSSQ6hn+ZmwcRi0hOPY9uYQF0gxCvB18VN+/QUcBa
 8xl17Rs7/0B7CvjNzpQmegKV8VF9RDk=
X-Proofpoint-GUID: ao5aHnomO1CeQtV8Odql9zP7Umm4Scx0
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b03d3bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=M1YlFrUzwzMSSZYL3_kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230022

On 11/23/2026 1:40 PM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> s5pv210_cpufreq_probe() returns the result of cpufreq_register_driver()
> directly:
> 
> 	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
> 
> 	return cpufreq_register_driver(&s5pv210_driver);
> 
> If the registration fails, for example because s5pv210_cpu_init()
> fails, the resources taken by the probe itself are leaked: the two
> regulators and the clock and DMC register mappings. The reboot notifier
> also stays registered. (s5pv210_cpu_init() releases its own clocks on
> its error paths, and the cpufreq core tears down its own state.)
> 
> Also, when a DMC node has a bad alias, the code jumps to err_clk_base
> and skips unmapping DMC registers that were already mapped for an
> earlier node.
> 
> Unregister the reboot notifier and go through the existing unwind code
> when cpufreq_register_driver() fails, and jump to err_dmc on the alias
> error. The err_clk_base label has no users after this, so drop it.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: e8b4c1986efb ("[CPUFREQ] S5PV210: Add arm/int voltage control support")
> Fixes: fe7f1bcbff91 ("[CPUFREQ] S5PV210: Add reboot notifier to prevent system hang")
> Fixes: 6d4ed0f46af6 ("cpufreq: s5pv210: Make the driver multiplatform aware")
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   drivers/cpufreq/s5pv210-cpufreq.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index e64e84e1ee79..29b1c5d71a8b 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -634,7 +634,7 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
>   			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
>   			result = id;
> -			goto err_clk_base;
> +			goto err_dmc;
>   		}
>   
>   		dmc_base[id] = of_iomap(dmc, 0);
> @@ -655,7 +655,14 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   
>   	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
>   
> -	return cpufreq_register_driver(&s5pv210_driver);
> +	result = cpufreq_register_driver(&s5pv210_driver);
> +	if (result)
> +		goto err_reboot_notifier;
> +
> +	return 0;
> +
> +err_reboot_notifier:
> +	unregister_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
>   
>   err_dmc:
>   	for (id = 0; id < ARRAY_SIZE(dmc_base); ++id)
> @@ -664,7 +671,6 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   			dmc_base[id] = NULL;
>   		}
>   
> -err_clk_base:
>   	iounmap(clk_base);
>   
>   err_clock:
> 


-- 
Thx and BRs,
Zhongqiu Han
