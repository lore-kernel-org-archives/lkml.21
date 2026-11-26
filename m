Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705794;
	b=CjOAyUKNjHX8ejU/wlMd+ZW2orznXini9VNQaat/Kxu9AYP20fMYcYei2ElkO3DI0rtK
	 JJbh8lIBcwqFe9EDejVdtKvcupc/kFxeKe7VgwknBa1V8AmN5hivpT143I/uA94tAG3Fb
	 NE463ChYoHZfGAY6Z2whnW74tqBkLG+TWCTbkYH2CiHmu2A2dfD6xHDVvcPcjVEnx8P18
	 O10hIZw+xU9oLfatw4a6LV0gy/S5yRcZnwBEqcHhrLLL1L5E3pKXoCMSPQh+czEmpBw/J
	 O+SsFcjOJtfCfvb7V4hbfJer99UoLzgitYUikn1F6pCjLGTe3bgimhrBW5vLtfGIq5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EYRNIXN9GIDPEJwoIApz90EAE3rM4QaSJO+X59CuZJk=;
	b=Q0hHvo932FU73QoWMfimb2bIkhADv3YJo2MVpoDOlNoRUVgOfpE//9851C4EdGQZoTot
	 CL0t44WQZsoWaF1Tmlqrj0AwjwFrIqebrMF3nXO5wx52wqUDm1CYjUTe4vdMEl9EHzt/1
	 uSvUCbPMiGZtAxT8fMWC8JJtfIlFyb5DRl1jYAn7qqt8ps96Zs967WSIEE+N8X6MS3Y8U
	 5hJ4rBkTh3J6sqAJ7RdQrGM3r0rZbz7j4dBK6e0hfbCwKFktv1xRjb62c6lA22+1KsqM+
	 wKXnQT6LjUBLpCYVgQbmua2kFNUlrgmCvtiomngnZqX8MhpunkX5kIQfrw4xomG2kgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5+0mxal;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T0m6DfYT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42A1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D42A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5+0mxal;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T0m6DfYT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUv1m3563182
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EYRNIXN9GIDPEJwoIApz90EAE3rM4QaSJO+X59CuZJk=; b=M5+0mxalerfQAfG/
	VBtQQD2bhDLEqFEBr5v0KYDMrm8TEtiotjQMl9sJgPgU3GuTpivuTCRCEjCQoUS5
	3fVbygbhIYTlnVfzy3lx1Tcqte1yli1cW/I9U0oPv3jg4JK1g6Roe66obavTQS4k
	Pj3XnVmmRTQIw6S+PQpepTIf6LcbWBrr0jmoiWWWB4LTVu8+Gl1c22lwnMIKBjRH
	cAGd/k04gjbAf0BxdfPZa24KoCaP56Ve4kcA0bH+9R1YHlBDyQW0G2w6xGOoS8lY
	67phASZqXf3AAwYisT9Bz70aogbW/cGWRv8TDHiLKNRNlMCu/0Hytk/Z/kZTpAg+
	qeuE7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbncd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:09:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0651873abso51426935ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795705792; x=1796310592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYRNIXN9GIDPEJwoIApz90EAE3rM4QaSJO+X59CuZJk=;
        b=T0m6DfYTf+ay0kESLPqGP/mOTGZRL6yO7dQm0aZA8wkcxEuFsMjmQfh+Jvjen4K6Ao
         Ln7j6aDoapO88cIfPTNzWdSxyN6qiMfjQ3ckTdTmb1gLspR9IndqF0Md2EqAetOPG9w9
         rQVqxpFPfxRBT73qyfpCB+YvPgSrFkXMT9Zm9lKE9OoIqi0NJd+UOoPwq7C7aIJAeSIN
         uNUM9z5St4ePA0iKPMEjb3SLK17Uc1ep02UVIVsAIBEHJhUjtsTJfRYlq1msqZl7SzBL
         o7ZqjfC26PX+HNc8N9ZvlPW3CYUsqRqnlY3n4UUHoQNT4uK9dYULSh/N0f7NU+/RK6sR
         DDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705792; x=1796310592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYRNIXN9GIDPEJwoIApz90EAE3rM4QaSJO+X59CuZJk=;
        b=lR/CF8P0b9yITxwuNMtz5WkkXJ5R4q01O3piay9CjXE0x2nM86Xbuw/a4eR3IkGBLY
         Hi2WihWqKP4Kp+wD2pw1UoSNhptYpg7PDk3pj0Esn+yX6msaZ0h8ooTDtsdCy9TJgAQY
         RvbQyM+i3nzJfdsJJH4NwaBbcY05vSTAnYIRyHHjS6fGNqwaAC7TyfzyE1tF/+AmCFTR
         /FeFVgL0dUV/sd9ljsQsobhHyAJuXoRYBtOzXsTFErh68cFJGEizVglVkeODxTpyxr1e
         ON9AInKx+6t1Vi+bauP0tUCk/KAVejUlrAPoXDFpqgjJv842TXrwfWeJuvKMGBzR4sjt
         MdhA==
X-Forwarded-Encrypted: i=1; AL+hErFkkxKqw6xtCPmq+3XplRs2LyuF9lRvKNwOeIWugK5hKa2BS1DsiLz3IQdC5Mmli85XQ53ODXNmmqSAsec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pvgLUL4pTCsRRsOeArNiC3Fxshurw+IHYxY9mTqawpLMuO34I
	Zw20zh28qNVYHcY6glGjS+dvFhH2KUNBJLzMAcJtj2gsyoEd2XVzGi/5s8ltGpo67mgtdTlTLiJ
	vZMyKlJ3xRH3xAvO7KhM0Mnblo/pHv7fa5jzSanHmsYgslYm0t0z0YJGoqVbYplR8Deg=
X-Gm-Gg: AZFdTZfgtJGm9WVhyAhnaKNLdJscKOToOFij7kuqoUJ1TGHr9y+nk6MDKYwVmdHjYTw
	Gf9ZxJdBJOvVvMvWFeva516l6AEKNVjChMh60meyg5NJs75DzFxDHoH1rh0VgJjFIdFExFbcDD0
	vEfKH0k7Ta5RGkvyMs/+wePeM9Xyz/s0TSwJNT2P2YE8gfRswtHuBcBb+6VcFC0DkFe2KT7x/AQ
	deCbDvenYiD0ze7dmGfLxxHDTrKUXgGoKyjZdv9qANzfMALVwGuEU7TAydZ9k0hCqEB9yUr71w+
	lug2ZzVHJQBvpvofRoVw5eYxCcstSbWxszfS7xgnQTWQw+17lniYxWbs3mGSbWcKH4kxaiC/EsL
	j/ytD+boyrmu0jXz2+6xn75QmCHoxBLbPQ5rbOJr46BgcegC1tI50hZZ7RcX6tuqIHQeSUowKFu
	rFaHy2MpmV9UGZMRvYa3aNNWM8RUPH1CiL7wLhwHQxESBS
X-Received: by 2002:a17:902:ced2:b0:2e8:c3e1:e1e with SMTP id d9443c01a7336-2f03f246d49mr194662325ad.52.1795705792163;
        Thu, 26 Nov 2026 07:09:52 -0800 (PST)
X-Received: by 2002:a17:902:ced2:b0:2e8:c3e1:e1e with SMTP id d9443c01a7336-2f03f246d49mr194661885ad.52.1795705791591;
        Thu, 26 Nov 2026 07:09:51 -0800 (PST)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm104949635ad.7.2026.11.26.07.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:09:51 -0800 (PST)
Message-ID: <2dcff329-4a81-42b3-b8e6-67ffc8c73f9e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:09:42 +0800
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
Subject: Re: [RFC PATCH] cpufreq: Keep global boost enabled after partial
 enable
To: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Loehle <christian.loehle@arm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Pierre Gondois <pierre.gondois@arm.com>,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261126110903.3747240-1-jiangtianfeng@linux.alibaba.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261126110903.3747240-1-jiangtianfeng@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b084bc0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SRrdq9N9AAAA:8 a=yvlZ-AJO8mc1iqAQddwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 6yhJWPtyXmiddbM8Iz5XoVkol0fl9hf2
X-Proofpoint-ORIG-GUID: 6yhJWPtyXmiddbM8Iz5XoVkol0fl9hf2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfX5Nv2dZsmEUWX
 aQszDgxW0axKgMTFLMbaMDbUTKcoz4YYYFdT+s4RqIcdlaYU14DCm/iki/vLPdDrIKpDtBkhgyZ
 niKCLqG/ZmYLJCe9IHWmjCQH/TneYPvPBXmUNAobXW3aFwnBxsD3AXixLIL7SGnhpDrwMhVB9Us
 m0ceTI6+4HJtB05xfxw2iJHTPyAeDDyn0Su+Re8z2OxlTAXt6X5rH+t8NwPKq/kf9uHNkbc7fHU
 BVJ0vyK+wAmxgFZSIauYozGVdXBayPZ9m/M5l+lPesSx8KmyHsrB2d6mA6nQ8onXukdxd0I9b38
 RhiaV14nJaTwR7ndT0kVn/MfK1HU3kuogr+86VQzwxvDDwpFhxsl3HP12uqD6DTZK3+qUzrgQB8
 5B2r/lQ8IaKUeV80mXtixRUHGvrGSKmINYigzbwhspIydRtOf0vNwUx/mWDpPLPOW6n9TCTMvux
 PhZl2dYhVovVlcLqIuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfX/3kBumbRD6O4
 seBuOxKStVlQ3INLGqz5KSewF8tJMfd7CV4a3tZ3nRt5SM2wbSS367zQIcORDfzdDzBCvB0kJhu
 sjUZlgFZ1ce/zt9MP6/i9Viz4K6Useo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260059

On 11/26/2026 7:08 PM, Jiangtian Feng wrote:
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

Yeah, it is a real issue, global boost "only means a permission to use
the frequency boost mechanism" (cpufreq.rst), and "per-policy boost can
then be enabled or disabled individually" while "disabling global boost
makes the per-policy boost interface illegal" (commit 218a06a79d9a).

> and individual policies remain accessible through per-policy sysfs.
> 
> Retain global-state restoration for enable failures without a
> successful policy update, same-state resynchronization failures, and
> disable failures. Do not roll back earlier policy updates.
> 
> Qoder, an AI coding assistant, helped analyze the issue, develop the fix
> and state matrix, and draft this description.
> 
> Fixes: 218a06a79d9a ("cpufreq: Support per-policy performance boost")
> Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
> ---
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
>   drivers/cpufreq/cpufreq.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 4332cb114070..f23b64c2e620 100644
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
> @@ -2918,10 +2921,15 @@ static int cpufreq_boost_trigger_state(int state)
>   	if (likely(!ret))
>   		return 0;
>   
> +	/* Keep partial enable usable and repairable through local sysfs. */
> +	if (state && !boost_enabled && policy_success)
> +		goto out_err;

This function uses guard(), and cleanup.h says "usage of "goto" and
cleanup helpers is never mixed in the same function".

Besides, the !boost_enabled check is redundant, right? so maybe:

       if (!state || !policy_success) {
               write_lock_irqsave(&cpufreq_driver_lock, flags);
               cpufreq_driver->boost_enabled = boost_enabled;
               write_unlock_irqrestore(&cpufreq_driver_lock, flags);
       }


> +
>   	write_lock_irqsave(&cpufreq_driver_lock, flags);
>   	cpufreq_driver->boost_enabled = boost_enabled;
>   	write_unlock_irqrestore(&cpufreq_driver_lock, flags);
>   
> +out_err:
>   	pr_err("%s: Cannot %s BOOST\n",
>   	       __func__, str_enable_disable(state));
>   

Separately, the disable side can end up in a similar state: if global
boost is already 0 and a resync write of 0 fails on some policy, that
policy stays boosted under global boost = 0.  That's outside the scope
of this patch, though.


-- 
Thx and BRs,
Zhongqiu Han
