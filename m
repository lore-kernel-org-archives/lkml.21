Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795830393;
	b=TbVXTmCCjohhu8hbUSU3rKxYHQ3zb5L2hPuir5PJS3xwj0tlnMyBc5oGW5Zd3154Hf7s
	 86HIdEIl4TiufHBJPVNQxBDBxv9+5qcUGwfiK/15n+ZcZc1aKD0U8ulLUcHsHK0NPj2jX
	 JHl7Jl3dumIxBc9Tp12afZ4hT5i2qxMEmWgqfvCUop80lmdozKPbwVlbSzmPuoiZjXUQ6
	 7h5jlZtv1RZVtCuc7B3ddgaOVPsCXHhiMRCCKMmFOzrDJlLEAinjVGcVPvCoEi3hcg1vw
	 lvAqp2i1iBgmWYC1yMRMUaKYZUXOyiikt7ZGTLWcOn9RE11Tnk6njjqhcWq+QCmWslQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830393;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3FvS8FtGQ6aPw+HEAnB6v1qG/uMn95oCLDLXDWQpCpY=;
	b=eV6Cg+VZ8yiYA2dFYRPsDVYGtb2L/ADztd4vRCHPfpU+PQB6E/okAuoivpELMZpCzvxv
	 xAZV8zKsKrUZb2tiB+/3PY7Blw72EyZeR2n2h48iUizGOSqaw535d6puw+gxCOiO7XzBH
	 0eQi3Xzin+NvHIMimoxHL5mWeRdEEby2rXYyoP1Deym0/8ck5serVGcQU+PKYO0oufZvb
	 it6sYS3pBvfhwGZANZ+yVJq0qRNOwNO2JmL2zbNOT8vJfAHO9CpeLqoi0SmC0KW+xwLOk
	 fq11CZ0gPVaGKzhe4LYsC+v2FGwRVHNlriGjikzTch4v0C5qyDcl/rfHOboHz/HoN/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=waIn7u7l;
	arc=none smtp.remote-ip=91.218.175.213
Received: from mta0.migadu.com (out-213.mta0.migadu.com [91.218.175.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A9606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D06A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=waIn7u7l
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UoaWF2UOgdIt1xm3obgw+ytYgy/p7Hbugvx0fIXYnzQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795830389; v=1; x=1796435189;
 b=waIn7u7l+6+/Im2MolrMT1bjG7ljXIOBQ/JMlyofBE1tf4Q+Rp8CU+XP8tk2OVs3/M9+rxEU
 HUmvTj7dphw7ltLPaET9wg6HWisHDAcOkCEdP/hjAzFElz9Pn3C0LetDF2TffdJRHaW7MCXaa3Z
 qKgrAIK0A53gzdvgqNGT1fcw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 650c92153ae3d674;
	Sat, 28 Nov 2026 01:46:29 +0000
X-Mizu-Trace-ID: 650c92153ae3d674
X-Migadu-Flow: FLOW_OUT
Message-ID: <628e83e6-fc30-4c02-a067-ee6ad9b74666@linux.dev>
Date: Sat, 28 Nov 2026 09:46:26 +0800
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
Subject: Re: [PATCH 2/3] cgroup/cpuset: Check v2 partition overlap in a single
 pass
To: Chuyi Zhou <zhouchuyi@bytedance.com>, longman@redhat.com, tj@kernel.org,
 hannes@cmpxchg.org, mkoutny@suse.com
Cc: linux-kernel@vger.kernel.org
References: <cover.1795436486.git.zhouchuyi@bytedance.com>
 <95bc3ba0a481b2ef09ce8e3258c78b58b6a42a02.1795436486.git.zhouchuyi@bytedance.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <95bc3ba0a481b2ef09ce8e3258c78b58b6a42a02.1795436486.git.zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/23/2026 8:45 PM, Chuyi Zhou wrote:
> generate_sched_domains() checks that the effective CPU masks of cgroup
> v2 root partitions with load balancing enabled are disjoint. It compares
> every pair of nonempty masks and warns on overlap. For P masks, this
> takes P * (P - 1) / 2 intersection tests.
> 
> Copy the first mask into a scratch mask. Check each remaining mask for
> overlap with the scratch mask before adding its CPUs. This takes one
> intersection test and one union per remaining partition.
> 
> Reuse the scratch mask allocated at boot for task attachment. Both
> users hold cpuset_mutex and overwrite the mask before reading it, so
> the check needs no additional allocation.
> 
> On a dual-socket Xeon Platinum 8582C with 240 online CPUs, changing a
> child partition's cpuset.cpus triggered a domain rebuild. The table
> shows median time in generate_sched_domains() in microseconds. The
> partition count includes the top partition.
> 
>      Partitions      Before         After
>               2       0.524         0.520
>               8       0.775         0.657
>              32       3.734         1.222
>              64      11.875         1.797
>             128      42.936         3.138
>             192      93.781         4.700
>             238     142.305         5.424
> 
> Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>

The numbers look nice. I'm not sure how often this is a bottleneck in
practice, but it's a simple change and a clear win, so I'm all for it.

> ---
>   kernel/cgroup/cpuset-internal.h |  1 -
>   kernel/cgroup/cpuset.c          | 41 +++++++++++++++++----------------
>   2 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset-internal.h b/kernel/cgroup/cpuset-internal.h
> index 1ba94ffaff9d..42abe241a251 100644
> --- a/kernel/cgroup/cpuset-internal.h
> +++ b/kernel/cgroup/cpuset-internal.h
> @@ -257,7 +257,6 @@ static inline int is_spread_slab(const struct cpuset *cs)
>   }
>   
>   /*
> - * Helper routine for generate_sched_domains().
>    * Do cpusets a, b have overlapping effective cpus_allowed masks?
>    */

cpuset1_generate_sched_domains() still uses it, so maybe say that
instead of dropping the line.

With this change, cpusets_overlap() is only used by
cpuset1_generate_sched_domains(), and the rest of cpuset-v1.c already
calls cpumask_intersects() directly. Maybe just open-code it there and
remove the helper from cpuset-internal.h, either in this patch or as a
separate cleanup.

>   static inline int cpusets_overlap(struct cpuset *a, struct cpuset *b)
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 633fd05f513e..2e09abb9e864 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -119,6 +119,12 @@ static const char * const perr_strings[] = {
>   static DEFINE_MUTEX(cpuset_top_mutex);
>   static DEFINE_MUTEX(cpuset_mutex);
>   
> +/*
> + * Scratch mask for task attachment and sched domain generation. Each user
> + * must initialize the mask and hold cpuset_mutex for its entire use.
> + */
> +static cpumask_var_t cpuset_scratch_mask;
> +
>   /*
>    * File level internal variables below follow one of the following exclusion
>    * rules.
> @@ -865,10 +871,10 @@ static int generate_sched_domains(cpumask_var_t **domains,
>   {
>   	struct cpuset *cp;	/* top-down scan of cpusets */
>   	struct cpuset **csa;	/* array of all cpuset ptrs */
> -	int i, j;		/* indices for partition finding loops */
>   	cpumask_var_t *doms;	/* resulting partition; i.e. sched domains */
>   	int ndoms = 0;		/* number of sched domains in result */
>   	struct cgroup_subsys_state *pos_css;
> +	int i;
>   
>   	if (!cpuset_v2())
>   		return cpuset1_generate_sched_domains(domains, attributes);
> @@ -907,14 +913,16 @@ static int generate_sched_domains(cpumask_var_t **domains,
>   	}
>   	rcu_read_unlock();
>   
> -	for (i = 0; i < ndoms; i++) {
> -		for (j = i + 1; j < ndoms; j++) {
> -			if (cpusets_overlap(csa[i], csa[j]))
> -				/*
> -				 * Cgroup v2 shouldn't pass down overlapping
> -				 * partition root cpusets.
> -				 */
> -				WARN_ON_ONCE(1);
> +	/* Each CPU can belong to only one load-balancing partition. */
> +	if (ndoms > 1) {
> +		struct cpumask *seen = cpuset_scratch_mask;
> +
> +		cpumask_copy(seen, csa[0]->effective_cpus);
> +		for (i = 1; i < ndoms; i++) {
> +			const struct cpumask *cpus = csa[i]->effective_cpus;
> +
> +			WARN_ON_ONCE(cpumask_intersects(seen, cpus));
> +			cpumask_or(seen, seen, cpus);
>   		}
>   	}
>   

A pair of masks overlaps iff some mask intersects the union of the
ones before it, so this is equivalent, and there was only one
WARN_ON_ONCE() before as well. Sharing the scratch mask with
cpuset_attach_task() is fine: both run under cpuset_mutex, overwrite
the mask before reading it, and don't nest.


> @@ -3307,13 +3315,6 @@ static void cpuset_cancel_attach(struct cgroup_taskset *tset)
>   	mutex_unlock(&cpuset_mutex);
>   }
>   
> -/*
> - * Protected by cpuset_mutex. cpus_attach is used only by cpuset_attach_task()
> - * but we can't allocate it dynamically there.  Define it global and
> - * allocate from cpuset_init().
> - */
> -static cpumask_var_t cpus_attach;
> -
>   static void cpuset_attach_task(struct cpuset *cs, struct task_struct *task)
>   {
>   	struct mm_struct *mm;
> @@ -3321,15 +3322,15 @@ static void cpuset_attach_task(struct cpuset *cs, struct task_struct *task)
>   	lockdep_assert_cpuset_lock_held();
>   
>   	if (cs != &top_cpuset)
> -		guarantee_active_cpus(task, cpus_attach);
> +		guarantee_active_cpus(task, cpuset_scratch_mask);
>   	else
> -		cpumask_andnot(cpus_attach, task_cpu_possible_mask(task),
> +		cpumask_andnot(cpuset_scratch_mask, task_cpu_possible_mask(task),
>   			       subpartitions_cpus);
>   	/*
>   	 * can_attach beforehand should guarantee that this doesn't
>   	 * fail.  TODO: have a better way to handle failure here
>   	 */
> -	WARN_ON_ONCE(set_cpus_allowed_ptr(task, cpus_attach));
> +	WARN_ON_ONCE(set_cpus_allowed_ptr(task, cpuset_scratch_mask));
>   
>   	if (cpuset_v2() && !attach_ctx.mems_updated)
>   		return;
> @@ -3915,7 +3916,7 @@ int __init cpuset_init(void)
>   
>   	cpuset1_init(&top_cpuset);
>   
> -	BUG_ON(!alloc_cpumask_var(&cpus_attach, GFP_KERNEL));
> +	BUG_ON(!alloc_cpumask_var(&cpuset_scratch_mask, GFP_KERNEL));
>   
>   	if (housekeeping_enabled(HK_TYPE_DOMAIN_BOOT))
>   		cpumask_andnot(isolated_cpus, cpu_possible_mask,

Overall, it looks good to me.

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

