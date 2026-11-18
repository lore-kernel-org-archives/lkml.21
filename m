Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973655;
	b=t2Da/qls3Sx/kqdJ+yYTg3i8MgNt0H5/u4EnBYn1JpGiyLuSjIUcW0nuPKKNGtTY2znm
	 9Geb4e+X/H1BXuW23nS7Hnt8toKfP93nKB6kc51g46pu0AM1Qd+67EfeRnKTypBEybXiA
	 xa2pNShiTw4t/JHK6igSnOP4nKBr9utB4xw8+ok6rg5llTcKbPhWJ19ZFByvvr5VvS95k
	 0WfaojrdOqTh5SmT4kWNJSPWZStrbHyPB/EWA4z+xDSzlpjKeSU+EeLwXkWX/0ysrw3tR
	 zj8cQy2lLp09iF8+Kj0XUBEEUy+tJOa62ZQazNMKnO95LGeM4YOhCnxV/Bp1vQh2k4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=;
	b=Hw/QX+sVUQmBxPVNpUExD0FdxrR4OJvIAXLijilsji3HUuoOEKUWQolwKXBJkGsi6EoG
	 8VXbRL4+jwcc/aLaxlqgEOaE3xKsT4XjhRCSINMPVIl/GLDNq5D8m5vGSinjSq5wadObc
	 Cedfmq+tIjWeeOLXHSajjfleiMTfAO276hTU7PtDOhUoOa6r4RJyVR2pLvqXpHcx0aIpr
	 FutTVF6M7QnNfr+KvJrJc+NCS1ciLny8LUObtoEcaiXoPKRImf2KFLCezgAysoSE1cNbT
	 y1UYxl0gaIKUhdVh+qF9iSSmGSG+oJYSv7WjmBbsHPHEcml/17psUC/wQwU/rVT6W3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URdO5GDu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NuGOEOMn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04253606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04253606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URdO5GDu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NuGOEOMn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvDI4059972
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=; b=URdO5GDumrbt7yQi
	t45ph71r36BGnxp4xR6UAasTVy+UyOXBD2UD+McP94p1qiI2LXt7+njAIdrVvR/r
	DWGGlXx4eMfHepT/zs/FXi1HQ9y8m2DGmIBZnKQVdWesbwvKIybwUrfO5NeJ/w/J
	47RwzofSmx/Qz0cxhFOzP/2kIEviNsxu4C6x7CadeUanaQZzdKkK2Fl8n7OJl6aD
	T5sqkCYbC/QhnJBb3pHute4G8Yh7F2/Xr53abuIXLQetzpCyJZyLsQuur9AW/KN/
	qkGrzHqmPMwzQC3vA+KevsSWJGvE1DEplBiDf6nzziTswmeOaODFjJBppY0al+L7
	BXSiQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvch2tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:47:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso531926a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794973653; x=1795578453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=;
        b=NuGOEOMnTZcVlrXyoF2+B4DqmvSA+y3upE8mnAhcwNFO8pcrb+HfNj+yNJstPIU53Y
         UOoH11REDeIismjafSNl0JLM33SFhT/ixSZ0yN70XZdFXTKl5i7ixtBgGwz67iAQodsK
         FaNqGDgOaFRMZ0qKNOPybEGEcICSXlFa2dfPmeFHXC6/gaaGwTUsuhc7SOn0mhFVxowE
         SU8njdvNbBQxYW5xmYmAedKWZwACGzTI21QX49nHoZCDRrwQyR8LLq4wph6AdPG8osma
         NuH5qkkN7ikezFclLT3mPfLqx2CJx012CBLcSHnq2riiYUV0v+aQ6W2MSIFsi1SjYW5S
         wMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973653; x=1795578453;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYtjnP2yQm0onoxAY31O2Z/NVjo75NmF1Hpq5N3hnXw=;
        b=LfPeLmo5M7uw9AOGgEvNM7VLwg6lQ3OsOOT+f2YQSUVlRrfNavzQjGsCQ462rwIuZG
         lP7nzEkbIXgYzL6mklDFM317x6LMrUhJc9vQoVX/gzPJbOIwTeFYu8f89FqBJmYXrEHE
         XDeD3t8lElx5d2rK3YirxLxqOHXtdZSQtCGwzA7ktfddambBGdtRFcb4sJg8TxPvDM7+
         5ZOH7ORZ4s9A6YLkm+dz5qIcPYWkBWg+Tk1gxHWxvKj9E/OvRVI36QiIraB/8O1vFAHH
         LCtFtllV+FDem47ZYrH6Vsspss9sIshJ+rMx+XQuQeOxPUp0BqIDhESFRq96arwmBtKN
         arOg==
X-Forwarded-Encrypted: i=1; AL+hErHaEVEV3Eq4uBvDe7V4fkebRqtOQzjs2lZdzZE7hmRVp8W60NLo33QVPrl7DLT2nKWM/6fSLeIcXiScWhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9trsjbGNxCQiBdywafWW2QyYAXCqMk0yZ4Ct7s9KsedU1BZGT6
	CG3vOEF06S8Zxjjj7pm3HX2Kc9DRiAXH0jT43dYA/qVCJlLv/bWUGAURsWSPv4kuAx1h59K6C/w
	0ajVQtHUrlpnEjLXZ+aB3yLgdnXoB5JzwJKLIpAK55WoD7uctaJjO4O6SjKl0xHXIYO4=
X-Gm-Gg: AZFdTZdFbx0Pl8evjg8QGh5tppZv0fOyhvkJLJbwprZKvB86S0cF+GMC6duyHUF9QTs
	0DNfdhBPdiXPnXWl9hwyEmRpnGQzucIMIOBVtpMxyHAr+gb7WuprTKWLbTfIBVhU6UscJO9FWFF
	LvhEeOQvIWip2CmzBr/dFLcDq3I1gZbBY5vlQDcNy0Bt72b21nMM/ipx2Bharoly/mSbQW/q5t1
	TDD4akFsYOC4en/rvnb+acqBBur0U9Mlun2hlRd5KdyepYcBfFhKQr4HCWZa/sKfuOMg7qroAy0
	kGxzLHmCXqAdJZfGgaKRKzNBjeMowbMBGN/UxahZHyBddfOuJVH6hy0b8jznyVhMAStZT4Dp+WP
	w8R61HKCzmi9xTO5pquEtpbWabwj/BjvZLg8NVAnbMIpefQPBdddgJkQ+7Fjl0GM90I6g2gQWJY
	rRdOi+N8/v7akbdDIKMnWgrvwISCgWlHP5m3EuCDBd3vs=
X-Received: by 2002:a17:90b:2684:b0:3b3:b71e:b2ef with SMTP id 98e67ed59e1d1-3b3d07c83f9mr1488940a91.50.1794973652618;
        Tue, 17 Nov 2026 19:47:32 -0800 (PST)
X-Received: by 2002:a17:90b:2684:b0:3b3:b71e:b2ef with SMTP id 98e67ed59e1d1-3b3d07c83f9mr1488907a91.50.1794973652066;
        Tue, 17 Nov 2026 19:47:32 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm2003736a91.6.2026.11.17.19.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:47:31 -0800 (PST)
Message-ID: <6452ab41-2d7c-4995-9f6f-1e8207767cdb@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:47:27 +0800
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
Subject: Re: [PATCH v2 8/9] cpufreq: tegra194: Add support for Tegra264
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261117154954.625126-1-sumitg@nvidia.com>
 <20261117154954.625126-9-sumitg@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261117154954.625126-9-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd1fd5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Ikd4Dj_1AAAA:8 a=jyGxVx0bnOFcdHMOUhQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Acvcjg_fhB53eA5ebUmv2MQVAAiZ4JDx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNCBTYWx0ZWRfX2sxKhmg3HXxk
 waplEcLTNxO+Dl9mkoGyeBobRZ1uqVoxajY7WOzQKkq9vSdVamtaydJiRNeo5Fu7oc3wV9vfA06
 NCxjJO/FrTbpJflFa/W74GAAzaBA5X0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNCBTYWx0ZWRfX6lPo8vhbnz7Z
 kEIkHwBa5DIpwKU228d7ayzNYe7rvP9WDn69ryGUKhUT0Q682+nj9z6cOHYBqne6lZ4KVcAeemO
 nLrCZxpCrdJv/CrFUWDTe6CXmw4eY7hd7EF8+ckOuBl/C1S0oKa7bwuvMeo6OacS51+6iXUMSSC
 Fny12O6+5O61w0+lOxTmKAy4GTAVmOtbfJpKvn9Hi0Xl0eU02TYeidE+S/2Nv82aknbrArGXZJ9
 rA3BKtDuQAEnW7Tw1KUBJFeP+PmcSbXCNPW+To9e7Di3OPNWZ80Jvz/y25cAR/qFrRdIbtTv6/f
 oJJ/9b4/GLoWr3dE9LvUI6QRaGmhW5y5uQyQWyusQP3QpLOpXnkK5CC/q0E0Fr/W+ooyzSGkCtM
 hL9rkXvzJtUyk+XcZr5tDzEd8I8dllNdyyK6OcpRRdvDlJKnqjMDx44Ftmq3OUO0IAAbnfN/b4L
 3Q/o+ar9h7aRQktZhmQ==
X-Proofpoint-ORIG-GUID: Acvcjg_fhB53eA5ebUmv2MQVAAiZ4JDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180014

On 11/17/2026 11:49 PM, Sumit Gupta wrote:
> Add cpufreq support for Tegra264. It requests and reads the CPU
> frequency differently from earlier SoCs.
> 
> To request a frequency, the driver writes NDIV to a core_freq_req
> register in the CCPLEX register space. Two clusters share a clock and
> its register, so they always run at the same frequency. The driver
> exposes each pair as one performance domain and one cpufreq policy.
> Each CPU's "performance-domains" property gives the domain index, which
> selects the register. If the CCPLEX node declares
> "#performance-domain-cells", probe fails if any CPU lacks the property.
> 
> To read the frequency, the driver samples the per-CPU 64-bit AMU
> counters through system registers. The AMU constant counter is the
> reference. It ticks at the system counter rate, so the driver takes the
> reference rate from CNTFRQ instead of the fixed 408 MHz clock. Probe
> fails if CONFIG_ARM64_AMU_EXTN is disabled or a CPU lacks AMU.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>   drivers/cpufreq/Kconfig.arm        |   4 +-
>   drivers/cpufreq/tegra194-cpufreq.c | 161 ++++++++++++++++++++++++++++-
>   2 files changed, 158 insertions(+), 7 deletions(-)
> +}
> +
> +/*
> + * The AMU counters are per-CPU system registers, so this must run on the CPU
> + * it samples. tegra194_calculate_speed() queues it there with queue_work_on().
> + */
> +static void tegra264_sample_counters(struct tegra194_cpufreq_data *data,
> +				     struct tegra_cpu_ctr *c)
> +{
> +	c->coreclk_cnt = read_sysreg_s(SYS_AMEVCNTR0_CORE_EL0);
> +	c->refclk_cnt = read_sysreg_s(SYS_AMEVCNTR0_CONST_EL0);


The core cycle counter and the constant counter are read separately
here, with interrupts enabled. An interrupt, or a preemption after it,
between the two reads skews the pair, and the resulting error in the
computed frequency becomes more significant as the gap increases. How
about reading both with local_irq_save(), like arm64 does in
amu_read_core_const_ctrs()?





-- 
Thx and BRs,
Zhongqiu Han
