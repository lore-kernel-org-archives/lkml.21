Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762467;
	b=FKL0RwAq+SNMr4Dm/Q54oE+dYFK+bLwmo+V5z+Db5W267wxQx5HU9Ar7bxvGQLkGOr5w
	 DtIEk0yylA6YAbVGhqWsawjPsx23V9vk4qEAfIxq+6EucTOdL+5iagPqy/goLWh5zfgK0
	 mcLdvdBR79sxxxV7IfS6qS0lKnqPx1vTOKAZWc3DsxgzCnKMC2CHbsj7qg3l0iXPjMz0L
	 5LMpIsMJAQkE7k2SnhUDkBkJ+QYsA+6L+EyTUmM0ovMXkN5ImEbLor6sAQ+xe8CL1QYWO
	 2rG9mXXKjVuO1YDUHdtjP/oLi0mZOZZ/V+P9pqLVt/pInwu3OdrsIShCRXjhsCvy9Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dnmnoRyzKZOwMZxaxRnM14b51OftSDQjqFYoGX4djuA=;
	b=sEBv0KSqGtArPKNsd0U4BrOJKA5qXvQtdWRDGmP4oPNPzgekr9q2351LqLfexKKCxKnF
	 1BKi5fkkBY4hj60giCbw5d5iTccgVCBeO7mL32FCA9WZqr3ZcUduZEkJWFS4MFGMWBiRO
	 uNZif0avGRNMUT/zbXXE7ArGkJEqjuei0NfxDGqAScq2BPeXumIYXnP8/31VRHhiUVVAm
	 3l7bMYwspSkIqahINpKP/jaNrvNUXPDSq9Dubajfp9fUpgNShQCVOyQ77vPR6RTHWnrxa
	 XHY6YEXAZkqcJcGZVBg7hgXcyOnDAYCfvj0uHmUkXvP+TBKiugWHTlyftvaZTIFVUuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMpOnQ2N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LvTH9UO/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB58606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMpOnQ2N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LvTH9UO/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR55Ddu2830755
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnmnoRyzKZOwMZxaxRnM14b51OftSDQjqFYoGX4djuA=; b=cMpOnQ2NCix0fijU
	moZBclEH/rDZlcNfhs5Cfdo/7ec/i2cJxpp/R0URD5hbR6sse38s5nz4if3e6Nva
	AGiwsPYp5VCpqRuWyu+Af9w8dE1PWVjPOb6PckzgEkdj3USARRgcGocRWCH/iM0i
	PvebupRcbRJoy1kNFyawsv3/TchbWkGQUT+ve7SNWncc/U1jBlpW1wZW9HoITEAe
	AHssk5tNKZWiFCqWcH4ru0xznbwfKoyF7aL0AIUdYBACLHQ4TmrAEMqmayO1U2oD
	JanRttxdvQX88V7scii3e7ZZi9XMtQgj9Za7Qh4keYL2ypncVRFWHkfMMkNU6wQc
	jJbDJw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh8bbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:54:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f022026e60so83056305ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795762464; x=1796367264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnmnoRyzKZOwMZxaxRnM14b51OftSDQjqFYoGX4djuA=;
        b=LvTH9UO/+E7lPK1QHe8/P5QOHz5vst3N4XRqAufOYc77BgboffBW/DbgwbHVZgrDYZ
         IBXdUzJ0RjJGnlOx1Ifimp2dyU1rFM7Vi3kbykAIy0kswcQmiTgMxtDLj+165XQlYty8
         nDthw3mtz490WMLZWjvHx59/VolXqhaoXhiJXS/lvUOZj0HxddM/cmsr6ILX/OssjF+R
         4FhcK4KLQDcKbOjk0h7A3BkbkC5pOyRI7jP9TJlqRR9nJJtQ0OJHRQ5lmvR6qnWISisr
         hoKw1ChtB0NB3Ff3QcmdeBfxpshdC/vWYDYM3xgRvkkXiFs5igIsvbfwly8Yv8Vx+6jq
         rd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762464; x=1796367264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnmnoRyzKZOwMZxaxRnM14b51OftSDQjqFYoGX4djuA=;
        b=VGzG2+2TxIJ2ZLx9EiL20GT/0tgNxRm6YpOrTdtUcXVewebpAv3NWr7uLeGVQseVL7
         LMswY9bmUVH0dKtiMDy/ezmXO2mBQ4/vkM8HI2idg1KXDatng/3Sa1XPRpfws0HzVa7c
         40AT+watvx3c6Y16khglCuShs+Htmf045gIFI3FqrOXqpf8XR5PTuS0kc15D/NJ38by4
         YZunBBvQJnvIiPsN5/k+K7ahL+xS6I0FXqkT46Z2lfYG37yR1JCW+7SdUF9JbOnoIf9Q
         7aDuNzjtxyIff/9PDk8Wh3QsGSTptDtlSKh2DJkI9+JxvlbmnMF8+gwzWCqi4GZ+2iKA
         FCLA==
X-Forwarded-Encrypted: i=1; AL+hErGox5ATgk0cRvWU0gTKx6nZjHX0CupcQ98IqKlQ8bsy3OCN2R+Atokr+szEQR0fll2OEfbAe06slaW5dTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z99djfJh+WjA+nWj7sA0u5u8ZIlfiaKhsTe1pn35rnbgooMHnoo
	ADW/8ZhsoLZXxUsq/iQAVLp0YAP7o6Z5//fiQB84kmtxSwqgf70TNvxzRiOmn+9bVTL6bWFCyKt
	pCk5NOwoIevjbA9fYfriy8yGYh25B+3bvIsg7VpKZF0b8STpeqkaK6VLRXM5Xmt1KFjY=
X-Gm-Gg: AZFdTZdXX97krCAmkTLSxdYFoET4OmanW3lS/fKOeHy3jtX7pBzyayVDq8E+2+a8fh/
	UZ4Jra6Jcuotn5cSqeXsH8zjENtcDFovO0dwU7Z2br8Qhueo24Q/+1sC+2I58roflhMR6u1ZIUm
	sEYDW1OCYMnyETsp7/LhhGzPEZqsXofPb4D9LcBloYBcDhxRO4FJl/XxtT225ffdQn+04pR5GSJ
	4002T6QLpuUL1wEX2SbFPNvAFIowjPX/X7ejpF1ss5+bKtzZqQUgHpAseXuKxXIVVAtxWp8/HVA
	ggJJAvsgQc/DVxEwflTnQRkz92h2V4EPGYhbEMR87Qa3JvLiOE69LbzS4OX1KVOVccEa5DZFDgC
	zSV89LPfJY2tjOvKoQEs1Wci6j/t/iEPQy0o0GCHIk7O4Z3UXyNlfX9HhZcHBAJzGpd6/EYHjrU
	QjUOE3Tx9YC33d7fr1Fv0C1RfJKBR31hYcN98CE3CP5A14
X-Received: by 2002:a17:903:1a68:b0:2ef:db5d:59a6 with SMTP id d9443c01a7336-2f03f1ba4aamr180531015ad.23.1795762464182;
        Thu, 26 Nov 2026 22:54:24 -0800 (PST)
X-Received: by 2002:a17:903:1a68:b0:2ef:db5d:59a6 with SMTP id d9443c01a7336-2f03f1ba4aamr180530775ad.23.1795762463611;
        Thu, 26 Nov 2026 22:54:23 -0800 (PST)
Received: from [10.133.33.190] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm113631965ad.71.2026.11.26.22.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 22:54:23 -0800 (PST)
Message-ID: <bf120bab-75dd-4660-88ad-c00dfec38c92@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:54:18 +0800
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
Subject: Re: [RFC PATCH v3] cpufreq: Keep global boost enabled after partial
 enable
To: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>, rafael@kernel.org,
        viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        christian.loehle@arm.com, ananthu.cv@oss.qualcomm.com,
        pierre.gondois@arm.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261127014937.413500-1-jiangtianfeng@linux.alibaba.com>
 <20261127060407.732709-1-jiangtianfeng@linux.alibaba.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261127060407.732709-1-jiangtianfeng@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNyBTYWx0ZWRfXxTcO6rN4BGOE
 6KQi0N37ulmcJ0nDqV8BzH66UwSU6Ptpz0KW81jP44f/aEFaGpftFxsyqP6YXvLn3P0m/rEOkHg
 sLhAFBVjAY3Gku+Git9cXBeWdLrMGHP89wpOjcil8x0zyUJusqabHZ/ktaKTuQNafNen4WoSFzc
 DJRmgwVePENaQPqOdUZSZsngAan8zaqB+zFB/u1fyHmQKdD57Jw03/stAa1lRdtUD1/MhUhpHrh
 SRtYkJ5hlwK/Oja/ZKYsdkQIFfD9bxnz46lgf+wKZls+9hYKkX0Qqr9gpMCcCIWCv68nBOWt1Ia
 F1KCmY3wNXz1KyioQtfVuxaOSUX5PaONGhh296GGVMZZI2WGMNAbHpVsizU+2DsQI4N7N/BwLjA
 72Qd1KJ+5wOgkq82fiqv/G3y0LbewF+iiLO+SzFKGgAMCqYD8+a2yyn88FuJOsjdUuycFlafb7d
 6DIpDSNV0QjnHWXSr2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNyBTYWx0ZWRfX3Ua0y47g081r
 MqYnx4W9jXD8+iEmEZdfTD3Jg/e1BRri6lBmkHSPDVu+XxnOoG62reWmIfnl9/5QcTtyeZ/86Jw
 IlfYqpszZtBMaaV9Qg2rkC0eOA3WXMc=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b092921 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=6ASfClxjO_RaZqgU2kgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: i__tnCbG4mYqJU7V5lENgsOVwJfgA8T7
X-Proofpoint-ORIG-GUID: i__tnCbG4mYqJU7V5lENgsOVwJfgA8T7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270027

On 11/27/2026 2:03 PM, Jiangtian Feng wrote:
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
> Restore the previous global state on disable and when no policy was
> enabled successfully. After a partial enable, keep global boost enabled
> so users can repair individual policies through sysfs. Do not roll back
> earlier policy updates.
> 
> Qoder, an AI coding assistant, helped analyze the issue, develop the fix
> and state matrix, and draft this description.
> 
> Fixes: 218a06a79d9a ("cpufreq: Support per-policy performance boost")
> Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>

One thing to note is that a failed 0->1 write may now read back as 1,
though the resulting state itself is valid since 218a06a79d9a.

Looks good to me:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
> This RFC discusses the user-visible partial-success semantics: a failed
> write of 1 can leave the global flag readable as 1 when at least one
> policy was enabled successfully.
> 
> Changes in v3:
> - Correct the changelog and comment to describe restoration on disable
>    or when no policy was enabled successfully, and local repair after a
>    partial enable.
> - No code-logic change from v2.
> - Link: https://lore.kernel.org/linux-pm/20261127014937.413500-1-jiangtianfeng@linux.alibaba.com/
> 
> Changes in v2:
> - Remove goto/out_err from the function using cleanup guards.
> - Simplify the restoration condition to !state || !policy_success.
> - Link: https://lore.kernel.org/linux-pm/20261126110903.3747240-1-jiangtianfeng@linux.alibaba.com/
> 
> No normal in-tree trigger for the partial-enable sequence has been
> identified. Same-state global writes already provide a resynchronization
> mechanism. The same-state disable/resync failure noted by Zhongqiu is
> left for separate discussion instead of expanding this patch.
> 
> This AI-assisted draft requires human review and DCO sign-off before
> submission.

Please drop notes like this from future postings.

> 
> Validation:
> - mainline ARM64 defconfig build of the complete Image
> - checkpatch.pl
> - eight-case old-global/request/success state matrix
> - independent static control-flow and locking review
> 
> NOT_RUN:
> - runtime fault injection or reproduction with multiple policies
> - global/local concurrency, hotplug, lockdep or KCSAN testing
> - CPPC, SW frequency-table, ACPI or AMD hardware frequency/QoS testing
> 
>   drivers/cpufreq/cpufreq.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 4332cb114070..57f1874e087a 100644
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
> +	/* On failure, restore old state unless partial enable needs local repair. */
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
