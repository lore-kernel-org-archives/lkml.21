Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088502;
	b=YcOw/pUA+qVFUxjRUlUf9+xzOtgJobqDVFPres0s4FN8plbkvcLHazq3hR444za+n32N
	 aQFMaLgqDnr+8RlwjrvOgurao+h3nPVqGVmIQUjtcOM8W7JEbthrMZBX+o5u1LzR4Uyae
	 rd/UwtRaJ+hoqlIutjAlUiUcRh/YTK0hDMmJ5hS9y1fTPf6hahJLFYRSf/41/8s8UjLwh
	 9iP4q7rNN7d1rFbXRCSiVQyJ44ReHdUFKDGWI88L0f+wttB2w57Jgw5v23Vtlhc8vmHau
	 FWjlJKeYSUJsvp41Tha1W3Qn1kzPcypoWLOd0fb3eX+lwxnZIi/6Wwtq39qK4tq8C/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088502;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VCII3XX/ebKpfvWD6KeCp48twovV+5/57+Y9fRp2vzk=;
	b=z/KV1snIPpa1q3FvO8CgThFBnBp5/ufnrjAtSZmbP5h//n9EAeJcCtsEP7SfS1y9u6CY
	 Z0PVLOglMxLmP8woetDEk/k1yEKaW5drrs6gfVyRfmdILK0jwPxfmVjiw+qDwI+s2jfCg
	 Oq57yxEw5/9fHCaVJUQ+m3NhyAZH608TSF+/82b/z1nlnCgNWJiaxMxLe8BFF6sbFfHVK
	 YkAKmhAX4k7crXuQ5KYZf1N2S1YXUI4U2B6Qjkd5FsdGcce+3jl5CJ3QMrp7QGOIfIklL
	 5MiRSkvLChvJDjO3/jSr0NP6ocx/8RuIvpKBRJ/KwvA8csdqIwSyFvAdONcbSYq5UcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMzUx5FJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQao0rhy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC46606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BC46606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMzUx5FJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQao0rhy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuJHD3475530
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VCII3XX/ebKpfvWD6KeCp48twovV+5/57+Y9fRp2vzk=; b=EMzUx5FJsZPwXonV
	qMvhlpaPfvRT2YQbRmsY/ZrX/OZnOAKLCxdwu+9eTRFgbtaMb5Ny+XuvsmaXrC3/
	i2zK0VZisTWo492QWv39hKnIsY1IFwXhZT/NdfmMeZMpX9/g3wJVOfKFOXojv+2E
	2k0Htmzi8l6toB0fgSbLP4LKHuKlxVYULIa28Un9yE1DcEHz2RH2VeWXIk0Aptkk
	vnOOhxFAOsdA7LrFY1A4dLlm6oykJayRyOudgONhaHc9r2TwjuE3mMDrOznrECHD
	oyDZ/LCZOdh7graKgFZAdHQNwif0SV411nELOOm05+zdb/SZ8kwk4afwOrkDLtgn
	nY1OZw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymgc70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:41:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so18926005ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088500; x=1795693300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCII3XX/ebKpfvWD6KeCp48twovV+5/57+Y9fRp2vzk=;
        b=IQao0rhy7TsQVGfFQahNkFb7lXuGyUaKMaUivVbZkLt6+LIr9bPLlCfGUoOUfHklBs
         pf+ibBqzjJFU06mmRumoMHJc7cXGTXqZCoEuwnofxE+MX2UoxfBSJmpoH1tP1NKwdE9C
         z8m0mkUuwQyx1ePunP2npvYhGbTm0v6sbKSGmTMMR86PjlC4arO9fZ/rtEmzOOne8aWS
         ITvAx6AD5POoXKgK4WOLdTXG5KraVfzDgNRq7AsH+HJB7OWHwZdBALH5D7vPAKNq2nnp
         2XuYkBzUHFsyyYCphz2vVvpzImvLcfG/5y+J2YErt7m26He/1zp17DHLQOI4daqa/xgH
         AWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088500; x=1795693300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VCII3XX/ebKpfvWD6KeCp48twovV+5/57+Y9fRp2vzk=;
        b=YH1YTWq2qtfqiPdBEM7LOriMcZUYclmtNGRNPYSnL7S/Nc5T6A7oXZjcshNGKWnlhu
         pBGWE8nc3dqJ4H2E+gaQdhLmWWvTcBLVXTqZzMMdWrmgaS/N/EWPoOh7ji4JNqO1P4MX
         f0V+ipnPN+gpPd9im6I7q7pQVk4jBqMjXB43+VPUWDlfEKBZs9+ovcrtv5MRH2ALFhqQ
         cLIQ7UUb61awsRw6602QzRGXvP36Joqvz3mK3nbKlw8M3oT8+kRxde7MJHwYYe+uAU0C
         rEMdd9hETEPWKommS5cCqaDA7+OadCF3qU9OQX0XPcMmL39Lix+WzS8thmP09Bzl67ic
         nzGQ==
X-Forwarded-Encrypted: i=1; AL+hErFoSNYrmtWAVYb6KEL5rQyPbU15uB7Lw/K41nRA0P7qM61Af5o249ginr+IZKBDUrjFDMByzmMfKcfK1BY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YDmNJeOMqadMMzhGQCF/+E2++iP5ij8YfFLvp6l1Y9heV3hE5
	zQDEP2R9IFbg//tHfsZP7eP1tg8t7PGx+hQnQ3XBuFhy6Cpu9Orooid1pBCEaT3e4UopvP89MWU
	eEOiLMD0JEJrQ/J/hQ6ZalLTv3fRBjB5UQAAIiDpDhtao6FdMVZ27FT7Ny1SkIfNGv2w=
X-Gm-Gg: AZFdTZds7FIbegqnn4FT2L4KDiW2jG8vZzPLsF8m28cvU1Zomi4dHs/3ZL+7V41oNuJ
	tkAaFy5ZR53cOHP+tjmJ3pIexWuKJvJwDgQ26knBs3cBdl+aJ/Jt+MwNL/WtUbH5PWodO6rnsAt
	NVMtllzzOIIaNq/LU56HJeeDrXZEI4oOZtZoIb5LI5o9s35zI/ryTUiQXV19BpAoBLIwBZ8cgfh
	lnqcVp40qZWLITakEGcZ1QyHOUq9R63TRU39VyFyx5CVoLbRC7VUbHyl3rWYn/Yb1gMO5pSyZrn
	zwXtqFo/iEGDGSY1a7Bia+TL5OCfUro/nNepuCBIL95Rc9ar1uZP9ras9ESjYuSWf6xBV3RSD5I
	r/jgWVbBvJ1fYllbGN7nMeV0CdsTAD/JwU60fMh+/ZfE+C3lrm36IlDwlVFXlhxavba6wviitLY
	Mx6ya4z5GtPgYyUjqc8zaeLQIqv47Aaut92cVIQOH61A==
X-Received: by 2002:a17:903:2b06:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2eff753ce5cmr53624355ad.50.1795088499953;
        Thu, 19 Nov 2026 03:41:39 -0800 (PST)
X-Received: by 2002:a17:903:2b06:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2eff753ce5cmr53624135ad.50.1795088499431;
        Thu, 19 Nov 2026 03:41:39 -0800 (PST)
Received: from [10.133.33.68] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f021fdf305sm11054485ad.5.2026.11.19.03.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 03:41:39 -0800 (PST)
Message-ID: <2698e091-17e9-4a1d-acf1-19981ee604da@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 19:41:34 +0800
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
Subject: Re: [PATCH v3 0/9] cpufreq: tegra194: add Tegra264 support
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261119111217.902071-1-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261119111217.902071-1-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX0H1tRyhzIu/f
 rVk8X1bObxfcMA7hUs2HD5fNV/6zAvwwnYTR5Fbp0tKFPdCuoYuEA2wJgVlK2UZ5tkuJ6UpM2Si
 xX1RXAy57YHNx1jn0eawWrqbLEMiAFY=
X-Proofpoint-GUID: TCQ36nn3Jj5lFpKTz1_-GavdjH732m1p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX1MdUVdZZhBAf
 MdcnDtm8FP5BUDall6/pMkCRUsNdmLrhTnGnRiDQHnjd7ZSPRQr7wqRts4XTv3DkzAbpjxyGmsc
 EX6rC6LGQBzRdFEZVXbfXzI9da9X6vBiFNofmVTPpxcrwbNw/KVWNqByr3pAMuxTyeDDhzfPzn1
 shVm0+nA+X5q2UX8J1HYCyUNgvTLP3hoQOqCRLj8slHdmHJhdCmE9ceBuLd0TAMDsspIUf0J1lu
 dyd1+7uOVgeCOWjBOvXPeqacozSs0RDOTGNc9ZsWDuSej1M53uO1LE648h4HUSETQi1gypKQ7oX
 3RXLuhCbLiY9lIKuWyA8S22wQGYJvx+76zd5Zps6Ev1x6IchHobi3KjQH6cTfejWpUjXzu8SqFk
 9uIFz0OpmP9HLl3F2u8h4bISvwbFf/ezEw/N+SJHw64NRvyqR1YDJZ8C7UdL7gzMQstzEKHhIBi
 PcdGqs8qZhCsfuAA2vA==
X-Proofpoint-ORIG-GUID: TCQ36nn3Jj5lFpKTz1_-GavdjH732m1p
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6afee074 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=I7BNmAFbTgjmseqQuzQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

On 11/19/2026 7:12 PM, Sumit Gupta wrote:
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
> 
>   - Frequency request: through MMIO, as on Tegra234. The driver writes
>     NDIV to a core_freq_req register in the CCPLEX register space. Each
>     register controls a clock shared by two single-CPU clusters, so both
>     CPUs form one cpufreq policy.
> 
> The patches fall into four groups:
>   - Fix (patch 1): read each CPU's MPIDR from a CPU hotplug callback
>     instead of at probe. A CPU that is offline at probe then also gets
>     valid cluster and core IDs.
> 
>   - Preparation (patches 2 to 5): cleanups, mostly of the counter code,
>     to make room for a 64-bit counter and for an MMIO mapping without
>     ACTMON counters.
> 
>   - Improvement (patches 6 and 7): group CPUs by the generic
>     "performance-domains" property, which cluster-based grouping cannot
>     express on Tegra264. Device trees without it keep the existing
>     grouping.
> 
>   - Tegra264 support (patches 8 and 9): the driver support, followed by
>     the device tree changes it relies on.
> 
> v2[2] -> v3:
>   - Patch 8: read the AMU counters with interrupts disabled (Zhongqiu).
>   - Add Reviewed-by from Zhongqiu to patches 1-7 and 9.

For patch 8/9:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> 
> v1[1] -> v2:
>   - Patch 1: drop the cpu argument of get_cpu_cluster_id() (Zhongqiu).
>              Check for a bad MPIDR in tegra194_get_speed() (Sashiko).
>   - Patch 7: check the BPMP table in tegra194_get_speed() (Sashiko).
>   - Patch 8: fail probe if AMU is not available (Zhongqiu).
> 
> Sumit Gupta (9):
>    cpufreq: tegra194: move MPIDR read to CPU hotplug callback
>    cpufreq: tegra194: remove duplicate counter sampling loops
>    cpufreq: tegra194: add tegra_counter_delta helper
>    cpufreq: tegra194: add per-SoC counter mask
>    cpufreq: tegra194: split MMIO mapping from ACTMON offset
>    dt-bindings: arm: nvidia: Document the Tegra264 CCPLEX cluster
>    cpufreq: tegra194: derive frequency domain from device tree
>    cpufreq: tegra194: Add support for Tegra264
>    arm64: tegra: Add CCPLEX cluster node for Tegra264
> 
>   .../tegra/nvidia,tegra-ccplex-cluster.yaml    |  27 +-
>   arch/arm64/boot/dts/nvidia/tegra264.dtsi      |  21 +
>   drivers/cpufreq/Kconfig.arm                   |   4 +-
>   drivers/cpufreq/tegra194-cpufreq.c            | 456 +++++++++++++-----
>   4 files changed, 387 insertions(+), 121 deletions(-)
> 
> [1] v1: https://lore.kernel.org/lkml/20261104181521.3003578-1-sumitg@nvidia.com/
> [2] v2: https://lore.kernel.org/lkml/20261117154954.625126-1-sumitg@nvidia.com/
> 
> base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6


-- 
Thx and BRs,
Zhongqiu Han
