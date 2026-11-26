Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661365;
	b=KIE8wbzH0mvtWj6HIY2yn7hegH4lq8wtDMV4IOZAM0Y6dfbOgIMrSlemNo8+3fQQ2uOw
	 uuzlgcts9c4CQtj6Xw+o0pVTwuE1jCMfdqisn51nuKUvFInMLRAPIYu2DuO8s1t1ygn7x
	 BKXCRDcqA/gE853QmR0H9sx00UE+b/FWHCMaX4Jy5BQVTdggZl9mC/hRji7D9UXPpS5pe
	 EHjXJ4GExgPKkP1pgwY8s1NYGP7emeWBgpQ8ev4UFD3ukMdDDzWzwsvTUFSF72cTIsk7e
	 fybmpMfGgunHC9MTW8yKv1cyntrBvngo0xnviVAHtX17KVJFpMEeEtx9nrTFnSLn4BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661365;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z2+L0Cn4BUDftonsYzXF/roII5B4vo3NgJAjGwhVPco=;
	b=XPQU9HfdLMK0oKmovH1ZaW4lTL+2fxT2dHZI/yIO7q1dwih/0gQaFs1Ujb9nqU0+sK9D
	 IuJZIagQ64ERm8TdQxbFbBEKy5P8Y+tFYzgiKIbcKjrfASM8otSHpp+Ov2zWvhh61qmuz
	 qyKcQio78AV0WLMHnXVSio9S3uqziXS3ejhQd+6/RqMLf6tg9/1SnOpROIRY60suvTbsc
	 6pYKCjdxH1tWYxxxKgtlXVxRS4/4XCearlNphUPyx7bGYYMahwHtN0WcOjTCtLdhIz7uK
	 BaYLG6VzJNkI0oWwTIam6ZPTXR+dzLDLyvAi8ohOpLQryaSCMRNAOPjdRmck2iAMGRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=olTDCIQs;
	arc=none smtp.remote-ip=95.215.58.186
Received: from mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC28606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC28606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=olTDCIQs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PLZP3DsLWZfxMOMa8LdSOVDyaC5v65AEhU7+TVprqCY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795661362; v=1; x=1796266162;
 b=olTDCIQsG+QmlS22Q0eAezsmv7G4Lg00kz1OO3CibZIDNjvJV4b5EuEC+/pz8TEEvEM1F4ik
 jZTSuSv7JfFBVlSqu0yFdjxMkj32IFbJk7r8iC8+GY0CCuw/1Qpfg7VKnHoR49SQm6UlmAnB3Gz
 U6p9cudIEGbKJ4rXSN+BDA0E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 426d50183f31a7b2;
	Thu, 26 Nov 2026 02:49:22 +0000
X-Mizu-Trace-ID: 426d50183f31a7b2
X-Migadu-Flow: FLOW_OUT
Message-ID: <4d70562b-6604-456f-9175-5b6b17f46f26@linux.dev>
Date: Thu, 26 Nov 2026 10:49:13 +0800
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
Subject: Re: [PATCH 1/3] cgroup/cpuset: Skip the sched domain attribute
 allocation on v2
To: Chuyi Zhou <zhouchuyi@bytedance.com>, longman@redhat.com, tj@kernel.org,
 hannes@cmpxchg.org, mkoutny@suse.com
Cc: linux-kernel@vger.kernel.org
References: <cover.1795436486.git.zhouchuyi@bytedance.com>
 <b32bbb1feb9721cb58f756b43c7d53698b7fa03a.1795436486.git.zhouchuyi@bytedance.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <b32bbb1feb9721cb58f756b43c7d53698b7fa03a.1795436486.git.zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/23/2026 8:45 PM, Chuyi Zhou wrote:
> Cgroup v2 cpusets use the default scheduling domain attributes for every
> partition. The scheduler treats a NULL attribute pointer as the default
> both when matching existing domains and when building new ones.
> 
> generate_sched_domains() allocates an attribute array for v2 and fills
> each entry with SD_ATTR_INIT, even in the single-partition case.
> 
> Return NULL for the v2 attributes. For N > 0 partitions, this saves one
> memory allocation and N attribute initializations per rebuild.
> 
> Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
> ---
>   kernel/cgroup/cpuset.c | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index c7b3a734cda8..633fd05f513e 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -867,7 +867,6 @@ static int generate_sched_domains(cpumask_var_t **domains,
>   	struct cpuset **csa;	/* array of all cpuset ptrs */
>   	int i, j;		/* indices for partition finding loops */
>   	cpumask_var_t *doms;	/* resulting partition; i.e. sched domains */
> -	struct sched_domain_attr *dattr;  /* attributes for custom domains */
>   	int ndoms = 0;		/* number of sched domains in result */
>   	struct cgroup_subsys_state *pos_css;
>   
> @@ -875,7 +874,6 @@ static int generate_sched_domains(cpumask_var_t **domains,
>   		return cpuset1_generate_sched_domains(domains, attributes);
>   
>   	doms = NULL;
> -	dattr = NULL;
>   	csa = NULL;
>   
>   	/* Special case for the 99% of systems with one, full, sched domain */
> @@ -926,15 +924,8 @@ generate_doms:
>   		goto done;
>   
>   	/*
> -	 * The rest of the code, including the scheduler, can deal with
> -	 * dattr==NULL case. No need to abort if alloc fails.
> -	 */
> -	dattr = kmalloc_objs(struct sched_domain_attr, ndoms);
> -
> -	/*
> -	 * Cgroup v2 doesn't support domain attributes, just set all of them
> -	 * to SD_ATTR_INIT. Also non-isolating partition root CPUs are a
> -	 * subset of HK_TYPE_DOMAIN_BOOT housekeeping CPUs.
> +	 * Non-isolating child partition root CPUs are a subset of
> +	 * HK_TYPE_DOMAIN_BOOT housekeeping CPUs.
>   	 */
>   	for (i = 0; i < ndoms; i++) {
>   		/*
> @@ -946,8 +937,6 @@ generate_doms:
>   				    housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT));
>   		else
>   			cpumask_copy(doms[i], csa[i]->effective_cpus);
> -		if (dattr)
> -			dattr[i] = SD_ATTR_INIT;
>   	}
>   
>   done:
> @@ -960,8 +949,12 @@ done:
>   	if (doms == NULL)
>   		ndoms = 1;
>   
> +	/*
> +	 * Cgroup v2 uses the default domain attributes. The scheduler treats
> +	 * a NULL attribute array as SD_ATTR_INIT for every partition.
> +	 */
>   	*domains    = doms;
> -	*attributes = dattr;
> +	*attributes = NULL;
>   	return ndoms;
>   }
>   

LGTM.

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

