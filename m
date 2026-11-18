Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016822;
	b=D047q9mh+Ta1PocAUNYxnpkmM+duXAqtAQYNT2uQ8Rsb0jNjTHZRc/n+W4tYxaMjkDA1
	 eGLGCZ+yiQRGoz8Z7jeraKEFS/VfqPir2hcF5eALzDwKfwdDticl0ZvhPHrmYojSWpOB0
	 eK+j0jy0E70p6SMjKl+Vvwm1cs68xj05qH/Etnk4SGBX2QIrYaz8HD4Hteybtvc1yIuZz
	 fj7PR5j7NYGZXj6SQwusj6Ufj3iwL3Tc0t455Jm/x9eV0D0cLjT5bChSMSInn35tgnBdz
	 ct76U30rNsla6OX+5Lp/HEO+V4vF95mDIRp9/M5RFGrYYMzYrtKQLdupBBiJGAy27gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016822;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Qgt/D7EjetA1zXjZ4OojFsT9YpnJKXfxEGboHnE/gd8=;
	b=r+Fwj9/jikSsg8wxsOXA2iEBUqYqMYKlfFvFzQkJ1gJB71uXW8ebG+0A3L3ae+FjOLYU
	 suPvRem7OikY4JnwsG6epeLs9l8f5Kt6c4jeh1ht7MALBu47jwWY9fdmSNlBJRmJzddb4
	 Zn2ZAexLTTqBZP11ZXA+ebeQqMG//D42akthXxyRW9j8YnVNKE/YIosUBs9UShGTnWBSS
	 wAi1HEJ9ZMPQB1UEDFmCmypry0aTtB1AKo4s+7Lzom0xBSecuFNp77kVldUX3joJutTu0
	 tU+uRu2e9CSxn+T4frJhXSN3TrH8unraW9g3vYHGRvFADWQvE1R4IOhuTp6TNpezegQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="nYvU/FA4";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEFD606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACEFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nYvU/FA4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C28A4339;
	Wed, 18 Nov 2026 07:46:57 -0800 (PST)
Received: from [10.163.128.4] (unknown [10.163.128.4])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D6323F632;
	Wed, 18 Nov 2026 07:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795016820; bh=AkNRT3RQuliNSsz+dDJtjd/2TDwlCHcU7deLN3qC6XE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nYvU/FA4MPmlvSnqmXps2Wbn7Huogpk0j4p9MFldIIA3Fx7wOdgDmvmbh9V4mEPa0
	 rr5P4CpV/BmJDkS27UOK+Fx7XoY1cW67MzGMgmJ/oPBN/7Z3fFfDiaklOz0TF5I6uq
	 gPqSmkldPvLyByemva6p/vW/kGtcQrlqDWGShTHA=
Message-ID: <bf8692ab-f5b6-4ffe-b5ad-02ad59182cc0@arm.com>
Date: Wed, 18 Nov 2026 21:16:51 +0530
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
Subject: Re: [PATCH v2 2/3] mm/page_alloc: move the kswapd node skip check
 into a helper
To: Joshua Hahn <joshua.hahnjy@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
 <20261116232346.788145-3-joshua.hahnjy@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261116232346.788145-3-joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/11/26 4:53 am, Joshua Hahn wrote:
> get_page_from_freelist() checks many conditions for each zone, often
> with a big comment block explaining the conditions.
> 
> Move the kswapd check and its comment into should_skip_kswapd_zone() to
> make the zone iteration cleaner to read.
> 
> While moving this, also resolve a checkpatch warning which complains of
> a waitqueue_active() call with no corresponding comment explaining why
> the lockless use is OK in this case.
> 
> No functional change intended.
> 
> Reviewed-by: SJ Park <sj@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Tested-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---

Thanks looks better.

Reviewed-by: Dev Jain <dev.jain@arm.com>

But see below.


>  mm/page_alloc.c | 47 +++++++++++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 18 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 4d829e5eac49d..43929faffb989 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -3785,6 +3785,32 @@ static inline unsigned int alloc_flags_cma(gfp_t gfp_mask)
>  	return ALLOC_DEFAULT;
>  }
>  
> +/*
> + * If kswapd is already active on a node and the zone is below its kswapd
> + * watermark for this request, keep looking for other nodes that might be idle.
> + * This can happen if another process has NUMA bindings and is causing kswapd
> + * wakeups on only some nodes. Avoid accidental "node_reclaim_mode"-like
> + * behavior in this case.
> + */
> +static bool should_skip_kswapd_zone(struct zone *zone, unsigned int order,
> +				    const struct alloc_context *ac)

Make this inline? This is the very hot page allocator code that's why :)
I may be overthinking but in page_alloc.c I do see functions with similar
size being marked inline.



> +{
> +	unsigned long mark;
> +
> +	/*
> +	 * This means kswapd is asleep, so don't skip the zone. This is a
> +	 * lockless check, since a stale result only affects zone selection.
> +	 */
> +	if (waitqueue_active(&zone->zone_pgdat->kswapd_wait))
> +		return false;
> +
> +	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
> +		mark = promo_wmark_pages(zone);
> +	else
> +		mark = high_wmark_pages(zone);
> +	return !zone_watermark_fast(zone, order, mark, ac->highest_zoneidx, 0);
> +}
> +
>  /*
>   * get_page_from_freelist goes through the zonelist trying to allocate
>   * a page.
> @@ -3796,9 +3822,6 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>  	struct zoneref *z;
>  	struct zone *zone;
>  	struct pglist_data *last_pgdat = NULL;
> -	enum zone_watermarks kswapd_watermark =
> -		sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
> -		WMARK_PROMO : WMARK_HIGH;
>  	bool last_pgdat_dirty_ok = false;
>  	bool no_fallback;
>  	bool skip_kswapd_nodes = nr_online_nodes > 1;
> @@ -3865,22 +3888,10 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>  			}
>  		}
>  
> -		/*
> -		 * If kswapd is already active on a node and the zone is below
> -		 * its kswapd watermark for this request, keep looking for
> -		 * other nodes that might be idle. This can happen if another
> -		 * process has NUMA bindings and is causing kswapd wakeups on
> -		 * only some nodes. Avoid accidental "node_reclaim_mode"-like
> -		 * behavior in this case.
> -		 */
>  		if (skip_kswapd_nodes &&
> -		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
> -			mark = wmark_pages(zone, kswapd_watermark);
> -			if (!zone_watermark_fast(zone, order, mark,
> -					ac->highest_zoneidx, 0)) {
> -				skipped_kswapd_nodes = true;
> -				continue;
> -			}
> +		    should_skip_kswapd_zone(zone, order, ac)) {
> +			skipped_kswapd_nodes = true;
> +			continue;
>  		}
>  
>  		cond_accept_memory(zone, order, alloc_flags);

