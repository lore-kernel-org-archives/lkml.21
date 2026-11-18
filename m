Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974143;
	b=a/6xRyaLG39SbBgBQcItWJ8snRDVKvakp5ifUhxMWIMm398UyY4Wwh9dHm9IaN4iGGYx
	 e3zZFDbns1A7hxc19oCxO6WE19VDrgnUwJj6SCouLyawUjoBgZL7f0/Ju0L3RThSpTGhW
	 PhnNb+IiS5ZvUnR7Y/GjehXW6DySEZFKo/9yeLMf3uqJp8bHFzA/5fN+dP4kRCEU8Djxi
	 2MbB+GpkDW91QEgvxIR6h+Iw53WQcp4aDuT3c/h86jRDUd3hrtlawV5nnKZ03kOl+NoIJ
	 KA9Ukxs3Qvd79hx4FzYukNpGbE8dhZXAByYSuslbdNLGWGVt5PIOdIb6LgP4ABzq25Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=;
	b=PjwYafwJm64hreIukMEA0XP1f4zJy8LqD5MsdHdSfKhFZTEiMMZjvJW2v3oThuwCxnAh
	 HvrOsUmnoKuKK5D7EOwNhykt+RZJMiY9v/cBFApBCkBbueNYdUwNZQ3hRX55/pbXxeHzT
	 6p1nGu0N7v0qNSd1m3SmQmRQHpdlcF8h+m56fuv3I8xY+vM+Yu5X0gSfJCgstOuiGY8Qm
	 aAfHAScqPpD58xWfEjrxUERoBT8CT3Ztl+BvJuWU1UZwAMIR2nlDUyhHpeyETYObTg8q2
	 ATQ1aVlBLRoK/jtjCcjEGRT+tmOcob5/dQaE358UURjI2eCSl3JJChWjMPbb4ygeRqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mW2vvBmq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNucIe0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E1606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mW2vvBmq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNucIe0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmMu3371246
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=; b=mW2vvBmqHXZC7iwZ
	fezB4fqyW34Rb4e9IE9D5A9AraL3KfwTeC8T9IwN96u/QDDVP7O9y3QCYVPengej
	0W22Sk6b5JsbeeN/Jd+zE4VPYPpaP33H90fl4xXhwpEhWX18GXjI1RUmDl/rclLI
	K5t1eoPlJ6LIbbugOw6SbRiW/EngOrI4XBLQjbJyuJZsOs1YmMWWY3f5cJmjlPqc
	DB6vHoNI9ATbd7aKZJxkxto+4iHl9Mg6tVNbHgX+JTixGOF43k6ArOZWc0xJYbiX
	4KmWVB0ryp0w87w+nqS2b2WK6tqtdVRwPac4APgZIYd1zk8ykk4rnUWSUDanYH2t
	PBL6xQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8s2df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:55:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b930598cf0so694958b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794974141; x=1795578941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=;
        b=jDNucIe0Udqg1nARcSW2RLa+XuYo8RPY8jjXFiwryZgpV/O7RETf7nZBQamL1b+rR+
         Oz+jCbms4BBSwkXUfUdI3m2OPNf6v9F1B9o5qBmM3+Y5ZEEpIJxfBL2V86XEQ2AO7tks
         I3G5Ju2u+p8Zcp0KvfMt1/ZVXyObuc8ensJzCghTvfnU7ZbO+Of+X7p+H7X6xY5k81b4
         wQ+mDS2pFDgRIEGK5het4rP03FQJLlZu7OeSIZnjGxQRl+zNJQkh645azaaYx9NDp/f7
         tSUlTgXUvFE4q4EAxaW706Xos72wEpJfUVJd5C8HefQS9jNb1a0PpuXbyFOTNAAGoNm1
         35bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974141; x=1795578941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siGlkVwFK+kAlmr7HRrTxVX0dPih8LkYmQDCGq/74C0=;
        b=njxm/zpK3wF1ehzI5ZbcAQCiL50hCrDdsb/UI3nEzVWOcPF9Hkg5w6q3MlAesnHQV5
         JH5F1OOvT/rgHlq+Wpwkkue6sxmuEy36veXtB15FVVgjsVOYq1hkwYIHiBp9JZNYykaY
         qrAT6HAmAMemLTOhMgbshp8Npm2CF1IkS00QPtpyI1uThRCAYCSzMTsQT3yVVpe/kp9A
         J/5MuWU3Cthxs09d4moG7Gf2/aaTdP9B/2Nva1pAAmRSdeqC1uOLcdcbhHsyVVjWpjOT
         4CQgm1PUnaF52VSqXVj0bgO/OeM/Sz1QJK+W9oaC+ME+9vurbrZRg07wz7nYROwP7UAL
         dDIQ==
X-Forwarded-Encrypted: i=1; AL+hErH4YuhuAOLpDZbSKCZ12ZQQeRae7xFsVEe7wmT24II2mrMBBdbUTBlt6FTNDiSA6wp7ME9l1G72KOOWOTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yc/CNF9ZLa8gsOQJynAbWV4f8hRF/ntwQC6rgNQlBcGgdkR1t
	RAgewfI39AQet3avm4JtcASBKsnew3RKnT+K8FYtm9JfH18tIrQEGMQokur4QkL1stYjfIUWkgD
	p6dwsMdEk0Cy+pwlxtGJk2oaLB0En2HbWZ3KMWDszbORSUZ9QwNvl1WkWaSfp+wdwfZ8=
X-Gm-Gg: AYBFou3wLh9iXqO8orEQ5ZzZVGfzrEd5aNnkd3LAktZfZSA1UJ//pAYbuyKGcQketnb
	tXV/WlHuYvjASziQkFLLjjAovGbm5kyusA+FToUNCN4vg6dHBryXn4XHI/NqWjV/Bjq56qZSRil
	mdPwcac088s9VH2SBU6HED1bS5JLpaXvevMxm76WbZpR6go0ciB5zc+kyNclkDedE7YOk+tcfzb
	C0sS95M6WhRJGCY9SEPksTF/UpzOt7YPOFNTYxy6w6hBb+z1F2YZkFbfRbrwg6/YW8GDWmbpZAj
	ySaqT+i1HNzJI6AffqytsTS2alwyjth2TDmsIPDSFuhFpoCgobeQAOihxkDDToEA29FGjD9B9Ae
	uumCpzOTY6LfcYa+lzGFaPvbGsUwXaZVznMYx1rErYicJIO6KUqA6Ad3pc8IUWeG5hfM3wzBOw7
	wWEhBSD4Lzl4wdwZuuFH7IGqM/KSy1ZYyTivJfUPNKDEQ=
X-Received: by 2002:a05:6a00:418d:b0:892:e080:4edb with SMTP id d2e1a72fcca58-8c5d55957d2mr1107236b3a.60.1794974141354;
        Tue, 17 Nov 2026 19:55:41 -0800 (PST)
X-Received: by 2002:a05:6a00:418d:b0:892:e080:4edb with SMTP id d2e1a72fcca58-8c5d55957d2mr1107218b3a.60.1794974140866;
        Tue, 17 Nov 2026 19:55:40 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99fe0sm421351b3a.7.2026.11.17.19.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:55:40 -0800 (PST)
Message-ID: <77166c44-71fa-4e28-9399-3f7c4b8b999b@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:55:36 +0800
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
Subject: Re: [PATCH v2 0/9] cpufreq: tegra194: add Tegra264 support
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261117154954.625126-1-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261117154954.625126-1-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd21be cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bIqCZTYioKoOuvliMVYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: oAHoNbnKgVLfhFhs35eT_mmlc8EAHhjz
X-Proofpoint-ORIG-GUID: oAHoNbnKgVLfhFhs35eT_mmlc8EAHhjz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNSBTYWx0ZWRfX/rX0eArgnSib
 j8pHk8dHE8xLp3j1rWceoRHctE2P82hr7/rw49ofTiOn6hmiv16KS8o8l6CYnz0hg8SAgTKoA6K
 Ago4wZ2gSHXeadvqx1B7KayBxhMO61QzbJhCDUlF/DVlbHVUhEyNoINSPNL00fKrJVzLl/ZIuZo
 o0YlgUd756BcqLIfK5e7AHPSZDvwCqlKsApYtkeUEqwkX2FFDaztlp+y0Tq4DHY4FZYn6SfltJ0
 +SSQdY0QfXMs8pB2jwWFwFKoDvCc+8bpd80UhWGcqVEGd9lcNW/4kPQbtzwXSE85hw3zfkidGtF
 qXXbg5eZ9U+0dx3IcYzJyPglYNB0SDRQljwTeLY1ZOA7yjtVU3MkDLjEGT0AsdEuakHnwxKAcjV
 0orxRjb9rz8wqpfKVM+PKVNzR2F2RT9/yovWvHb59tHrW6Pchdkl2s33lBSzFxyZDKsmeFPEdON
 40TRNzk2QX9egGEeWQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNSBTYWx0ZWRfXwNnT/Y3xnqQS
 iLn7/pq4FC4k3HiGm1HkPuKn/JtOTivhkqnB4NeV0lG0TUBF7Puu7BnfHLMRbyrmuyGIDnWB728
 OjhKvKMZK/CNf2UCzwEKVclv9kT0d7E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180015

On 11/17/2026 11:49 PM, Sumit Gupta wrote:
> This series adds cpufreq support for Tegra264, which joins the SoCs
> already supported by the tegra194-cpufreq driver.
> 
> Tegra264 keeps the existing model, where BPMP provides the NDIV limits.
> The driver derives the current frequency from the core clock and
> reference counters.
> 
> The main differences are:
>   - Frequency read: through system registers, as on Tegra194, but from
>     the 64-bit architected AMU counters. The reference counter ticks at
>     the system counter rate (CNTFRQ).


Hi Sumit,

Thanks for the update. All my v1 comments are addressed.

For patches 1-7 and 9:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

I left one comment on patch 8: the two AMU counters (core and constant)
are read separately in a kworker with interrupts enabled, so an
interrupt or preemption between the reads can skew the computed
frequency. Please have a look.


-- 
Thx and BRs,
Zhongqiu Han
