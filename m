Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750905;
	b=5D2AE31SvNIYOD55A7NL7YoZB3I+jASL1bCoecUDp6T2W01B9rq4bbwad4WLe9J5q4qH
	 JHezqWhmaX6vzD5izOC2O75kwy9M+FstGPHLXjpSveJmrhH75Pd81ssqGcHA2d6qjMJsn
	 mRXeCsrNlP0utP2e+yuen+IrGdvEMMSvvu2xEdNBi0SDybu6rlys1ptKzf6MuccHZvsMa
	 OmPYUDpBUu9yikNYfirLib0233fyGfm+jpBuWUU53HIjfZwUerxcL1hmg4/T+u9chZGU2
	 ZkUIsP11wfEJ2ZTGjTshnfIMAyCwPc3LnGHEjUdo0H4/LNKMRYllQVb62iIghUOmlVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j/B7u+aLU4cptfM/G8VwPhJ6v2wabYzrEeZVFO6+qug=;
	b=xAyyXzF+9C6GtRkNvKiIxoLit8gaL95sOEEE9mAmCE4VfVzRlFykFelVa4cRXBUi7VSx
	 EtJ+26tJUPl4jE5lJ6zshzUriy67s33etZP8Pziq/96B/8giTosIZKB+0UdRDCupmg8Bp
	 RIOENvcKkra+U25L5kVpL6F+fOc0fj8Xbg4a1OHOuwZwMAuCMfIKQ/qBNiYIHeply5QGl
	 e1cELIoIhQwXhbgk01FQe+us6L8ptyN6y2MN3TK60EO6r0ZfLz1srmRvzO78xRGz5rwJc
	 PMPVsIMeDAKNFoFhot1g/sdurJIFJ4uk6vp/comilJbM+QAAmWgnUkwuG5WDbGe5eHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cUi8MYUy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GEq7IxF/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9419F606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9419F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cUi8MYUy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GEq7IxF/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwmq0162587
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/B7u+aLU4cptfM/G8VwPhJ6v2wabYzrEeZVFO6+qug=; b=cUi8MYUyahB/zYqd
	N9dp/3YJmTKq3AKc8fxj/MkyYFRoAhM3d5utDPc+8w9Kg17q9a5yuH4bILXfzNbT
	SzhIHWQ5H8ArcycrViUQu6hqQs5igD0enxVKGmV5DpqtpuAeMEq1pIX+D9KswfeV
	vqoRopMjfCNBQHtrfi5T/r8pTPNUqGTjuWd8Xn4vkK424Ir6NlOr39XUAdVbTEdI
	fFC7I1QnshtpPoTeGiX+Rd7TbeQ65rQI+6XvoRxUAM4K7rTox8Ay9z4ZNwY31UBi
	W5ewkrAti91wI3yl91sN7+Yxh05thvo4xMDFYJWrPP3DKRv/IHCuet+SuxTDbm52
	hSXy1A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7gb9c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:41:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b539019e1aso168747a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795750902; x=1796355702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/B7u+aLU4cptfM/G8VwPhJ6v2wabYzrEeZVFO6+qug=;
        b=GEq7IxF/TKAa44CyOf0A8Sp1pvpQ//GiK+keelbZUZBv9kmH5hyzfw7oxA5Zsz33NT
         s/IQAiIIfiMDcc8vvJ1Mqj5+8CHf7aX+pD1qgwDbT54OD+U7tTMkWogtkW2mhm9d1BGU
         un8eg+ITKe3slgTs5gzNZ+clvbp2ZVKSIeKNue7vtE9AsB6CnkAsDK3gyCjSsBHIb0GZ
         Yj9W5kK4656yQZFPVQoSQ4X8SmJpvbSiKhnOTunx4OHY5hO4dqH79XkxcwmiA8XajgNi
         30wh/GduXmBjz2laCa33U8VAu1PTEno77Te3vdzUPnEWesHeIeP2lngA2kHf85ywHlho
         +N0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750902; x=1796355702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/B7u+aLU4cptfM/G8VwPhJ6v2wabYzrEeZVFO6+qug=;
        b=DcnC4taJjTbIZUts59hAf8v6Hcf4XQVNekwoNbsU2UI8Cf/jeR4VliZ0ipgbqAcn/r
         XQ7CVAsw11NruWmz6cGTVv9RsAia/GNjFMNW6TPg7zQjf6gOVEAU0FRSNUntBHGt7Jti
         CKrt+u2H0BmhesX2O4RNpipLBLjQma4z1QqmK5FlbYJ2EWtE5CKqa4YZQa/oRv03aTDC
         nEBQm5Pa7R5dp1ZbKs2H6SBEqV7VSdPtuR/bzccWZGbXCr+JQtIoHVFauJaydHGgNZFx
         8hrI5n6JqhxIxKTfSwoO8Ap8zJ274ydK9nH9XS0luq3jxSd59nO+eVnafD/j85abM2yI
         a9Xw==
X-Forwarded-Encrypted: i=1; AL+hErH9yRwCa+cmoW6iJHPhjmqYqdCe9z3B6synAMUkj2wIUvAg63uiliK2OfGFtpJIOulrdsFNzSumY66+eWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SAdLXVGuRirYlNJiKSCc9UyIgEKtq56avrVaiWJWHLPI7X334
	KgwUIwzuz/fmOJUZn8yiifz3HADqCjEnOOQr47QBZyRe+6BsTB6S0aUsMhXWEuojoKUbgQvzh1F
	q9Yk0H+406dXzLB2QaJ7zSS/oYt8lHi0XywHa8RcgmxJ0QBigWE2Jf9CNs963Lj9rUf4=
X-Gm-Gg: AZFdTZdAmpEKt3Jn7RdCXInmMYEI+QObrqIuKagH3AVBw4Liz1P4N71fgqUOR2J5sP5
	NJzvi3uH8AF+v0nmtujzqFtNtFPQwXQclTJsq4Bbqca6kpFfwB8B/LwYSacykJ3uV5ozYC5iqz8
	ZudRaicrZSLjOG91y/Yn8uhWdxz7/Vn36YNG4uSFoHkMS/Tj+3CF6z3/77F3VannTeJcX6KQ3Hv
	KXsL3iVXZA8SwAM7Eg6tJqJ73ep4W8gJ8LMJGSQT/ukeB5/194KE5WkWBoGvZRAa6WHXEP0HcWv
	L+ldst2NcbZnfFce9r+/oudcyZETAeAuRtew/hWKAwAAiQLDBsqFm/07Dbr75Z0izXNqLkiQq41
	Z235wC2Oz7+uTpL+Y4wfstfcLoTE/SooCD64raDDFIxcAKy2S5s4IwcTeYVpqsNvhQmLCjRJfHy
	YZHudpuu3FdS7KS2/ZTplAa/dIqY6waLxmWdzAlwJcOXfR
X-Received: by 2002:a17:90b:1d03:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b41c8ff729mr22806057a91.14.1795750902005;
        Thu, 26 Nov 2026 19:41:42 -0800 (PST)
X-Received: by 2002:a17:90b:1d03:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b41c8ff729mr22806040a91.14.1795750901537;
        Thu, 26 Nov 2026 19:41:41 -0800 (PST)
Received: from [10.133.33.190] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm36441127a91.6.2026.11.26.19.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 19:41:41 -0800 (PST)
Message-ID: <234fef36-b7af-43e6-8b72-e58d924c528a@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:41:36 +0800
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
Subject: Re: [RFC PATCH v2] cpufreq: Keep global boost enabled after partial
 enable
To: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>, rafael@kernel.org,
        viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        christian.loehle@arm.com, ananthu.cv@oss.qualcomm.com,
        pierre.gondois@arm.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261126110903.3747240-1-jiangtianfeng@linux.alibaba.com>
 <20261127014937.413500-1-jiangtianfeng@linux.alibaba.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261127014937.413500-1-jiangtianfeng@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eLaBaCWRfj5qcWxJjIDOIYevXTzKtgXv
X-Proofpoint-GUID: eLaBaCWRfj5qcWxJjIDOIYevXTzKtgXv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxNCBTYWx0ZWRfX3KUm8Dqntn8T
 ldsGvSh/viYr2iG7OG1ZsQICj8FMp4sSNzZ0muFmrdbqN7hg28q7sPlIHtl4mJ5JdnFwGYatdgp
 03Y53nUL8fwQ55M+PCLfBvZg53g1PikaquUWFdmHX8c7VvKsc5eyE8YkNfV6n7EwpK3Q+a0iCUw
 JdvPF04fOg68OerwgKemlxevw6GmNsyMDa2RluKokj0d/qiXPF4f5+XKsv+Leb+7dX1d4f9Pt9N
 0bpR/SpIMnqL9oUD2pmD2opB1gEnVR7BufM3ynPMvv8hhiPB7YhzeXr/cAvt/Tf+yHjOx3Zs91R
 RTEkESNjfLKyyA5aL2GOqHHLoIAfurDeSI2q8kTF9TFbm3T+ud+pv8rv96Xj5EiVGHG2SqWuuW6
 cgCRB421uLRKObaJfIPIM4RYkMFMCKjv9G/YbUb5QJTSjIQyTfwYHa6hulZ05g44iO1b1888h9m
 dnr/vm5IcnsPOW8/63w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxNCBTYWx0ZWRfXz0O0NZ66npVN
 oTjMY/tnp0FAdJg0N1h7vBV3HZdIKpr4f5l4X2EdEFvg+QO3gU+VJpivrpy2C2Lcx4kVZLfr2WW
 WRB68j8/eZltxkHWRGrfnAzVeqPk+QU=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b08fbf7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=SRrdq9N9AAAA:8 a=dELt5KNJBVKGH5iyx0EA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270014

On 11/27/2026 9:49 AM, Jiangtian Feng wrote:
> When global boost is enabled from the disabled state, a failure after
> one or more policies have been updated successfully currently restores
> the global flag to 0 without rolling back those policies. This leaves
> them locally enabled, with their boost-related driver/QoS updates
> retained, while the global flag rejects per-policy sysfs writes.
> 
> Keep the global flag enabled if at least one policy_set_boost() call
> succeeded, while preserving the existing error return path. Global
> boost = 1 grants permission to boost; it does not require every policy
> to have boost enabled. The mixed per-policy state is therefore valid
> and individual policies remain accessible through per-policy sysfs.
> 
> Retain global-state restoration for enable failures without a
> successful policy update, same-state resynchronization failures, and
> disable failures. Do not roll back earlier policy updates.

The "same-state resynchronization failures" part of the changelog is
left over from v1. With v2's condition, if global boost is already 1,
writing 1 again fails, and some policy was boosted before the failure,
the restore is skipped. This is harmless because the restore would write
1 anyway, but the changelog no longer matches the code. Please update
that sentence along with the comment.

> 
> Qoder, an AI coding assistant, helped analyze the issue, develop the fix
> and state matrix, and draft this description.
> 
> Fixes: 218a06a79d9a ("cpufreq: Support per-policy performance boost")
> Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
> ---

When posting a new version of a patch, such as this v2, please
describe what changed since the previous version below the "---"
line, with a link to the previous posting. See
Documentation/process/submitting-patches.rst for details.

Please also reply to the review comments on the previous version
before posting a new one, so reviewers know whether each comment was
accepted, and if not, why.

>   drivers/cpufreq/cpufreq.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 4332cb114070..707de10ad36b 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -2887,6 +2887,7 @@ static int cpufreq_boost_trigger_state(int state)
>   	struct cpufreq_policy *policy;
>   	unsigned long flags;
>   	bool boost_enabled;
> +	bool policy_success = false;
>   	int ret = -EOPNOTSUPP;
>   
>   	guard(mutex)(&cpufreq_boost_mutex);
> @@ -2911,6 +2912,8 @@ static int cpufreq_boost_trigger_state(int state)
>   		ret = policy_set_boost(policy, state);
>   		if (unlikely(ret))
>   			break;
> +
> +		policy_success = true;
>   	}
>   
>   	cpus_read_unlock();
> @@ -2918,9 +2921,12 @@ static int cpufreq_boost_trigger_state(int state)
>   	if (likely(!ret))
>   		return 0;
>   
> -	write_lock_irqsave(&cpufreq_driver_lock, flags);
> -	cpufreq_driver->boost_enabled = boost_enabled;
> -	write_unlock_irqrestore(&cpufreq_driver_lock, flags);
> +	/* Keep partial enable usable and repairable through local sysfs. */


This comment is left over from v1's goto branch. In v2 it sits above
the restore path but only describes the skipped case, so please reword
it to say when the previous state is restored and why a partial enable
keeps global boost set.

> +	if (!state || !policy_success) {
> +		write_lock_irqsave(&cpufreq_driver_lock, flags);
> +		cpufreq_driver->boost_enabled = boost_enabled;
> +		write_unlock_irqrestore(&cpufreq_driver_lock, flags);
> +	}
>   
>   	pr_err("%s: Cannot %s BOOST\n",
>   	       __func__, str_enable_disable(state));


-- 
Thx and BRs,
Zhongqiu Han
