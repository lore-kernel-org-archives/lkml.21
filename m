Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017442;
	b=HEDS2xhhd/fpCmjDStuF57j5prHQy34pT5kipWytOqOkd84lvP0+iCPkpiW669ut7MV6
	 x97xYFIeX28WPCpkfhJRkAba+RYoc9ciEJFBF2bUcc0SllwVb9eqNQZBtmCI3x7z94wZi
	 tEmwQ95GlYhk4yn94Ov5XLqjjTVKLtDDnpzT7JQmJM+O0e0LwWJZhlppE10pWETiralXw
	 mYVPuoI/L3VoYUeY9UzUYtbZdRKIjrS+7jwI9iC+m4ERliqSJKG50KQBkpf9aF89laUNg
	 Q/mkSx6pXC/9bwEIzWbBFxTBqonZn1VxnrW6G9J6ckECNZhrXzmKqplCWjWGhScbA5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017442;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zKXyYdXEIrl9wXJLW3IWBVcu7N8UHhxwJAb10Vz4gsY=;
	b=KcOE6iFyvw8VrNQWgydJ/rPHNPRk+8hn3SpeYj3BDVv2eD6EaBRMwN9jC6S3Tj25FVwK
	 esXNqp/C2soKTt8Yz5/ufGvCuWOf5Uw3iny/rWsYnqzpI4VWV3M/34P0P5A2/GmhcYOua
	 30XhwCdcLUtYj8Wcmk+ojcvMhvb/EeZqY6LJY6tNytOcNTQ2cOceiWpNvK/z551jhS4I+
	 TweFHi37vbuDj8dNi1vQeOwBvIIGebLuHRGy7q8Ln/TjTp97nxojCFyKRlouPIMIwLsbx
	 1saj9gVsKZXgyWaA63EY122II8N1ostZYyDgujsHQsJ/ljBMBMMBMqhf4EiC65olpqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g0n52dAO;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC86606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AC86606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g0n52dAO
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65C04339;
	Wed, 18 Nov 2026 07:57:18 -0800 (PST)
Received: from [10.163.128.4] (unknown [10.163.128.4])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1441A3F632;
	Wed, 18 Nov 2026 07:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795017441; bh=27Z82//x5IJjvNfiCnD9RSWBkqpaK0b4bZQs4O+BDd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g0n52dAOWxfruPOCCgDFQmbzbJt2Bd2gTv/xYYpqWJrDb4cuetsMwmMxqrU8qdlEb
	 fbqUFicH5cFJ1FZPYXVeih+/HLpcOCU7nsIvFKioK0PI5EOc3lpofyCL3XmJ9gvJnl
	 5vL7RLFACVpZi5yfZWGs4Po9RLcq4SXq4kf7Fqtc=
Message-ID: <9e327000-afea-4f6c-8121-913301803233@arm.com>
Date: Wed, 18 Nov 2026 21:27:12 +0530
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
Subject: Re: [PATCH v2 3/3] mm/vmscan: consolidate promo vs. high watermark
 checks
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
 <20261116232346.788145-4-joshua.hahnjy@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261116232346.788145-4-joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/11/26 4:53 am, Joshua Hahn wrote:
> There are three sites which all check the watermark that kswapd reclaims
> zones up to, which is the promo watermark when NUMA balancing memory
> tiering is enabled, and the high watermark otherwise.
> 
> Consolidate the pattern into a helper function. While at it, remove the
> include for <linux/sched/sysctl.h> in mm/page_alloc.c now that the
> dependency on sysctl_numa_balancing_mode has been abstracted into
> vmscan code.
> 
> No functional changes intended.
> 
> Reviewed-by: SJ Park <sj@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Tested-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  mm/internal.h   |  1 +
>  mm/page_alloc.c |  6 +-----
>  mm/vmscan.c     | 22 +++++++++++++---------
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 566cbd2dce485..8beb5b263ca1f 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -68,6 +68,7 @@ unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
>  				gfp_t gfp_mask, const nodemask_t *mask);
>  unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
>  			      int zone_idx);
> +unsigned long kswapd_wmark_pages(const struct zone *zone);
>  
>  #define MEMCG_RECLAIM_MAY_SWAP (1 << 1)
>  #define MEMCG_RECLAIM_PROACTIVE (1 << 2)
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 43929faffb989..d7320566a9509 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -45,7 +45,6 @@
>  #include <linux/mmu_notifier.h>
>  #include <linux/migrate.h>
>  #include <linux/sched/mm.h>
> -#include <linux/sched/sysctl.h>
>  #include <linux/page_owner.h>
>  #include <linux/page_table_check.h>
>  #include <linux/memcontrol.h>
> @@ -3804,10 +3803,7 @@ static bool should_skip_kswapd_zone(struct zone *zone, unsigned int order,
>  	if (waitqueue_active(&zone->zone_pgdat->kswapd_wait))
>  		return false;
>  
> -	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
> -		mark = promo_wmark_pages(zone);
> -	else
> -		mark = high_wmark_pages(zone);
> +	mark = kswapd_wmark_pages(zone);
>  	return !zone_watermark_fast(zone, order, mark, ac->highest_zoneidx, 0);
>  }
>  
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 9959ca158ce83..9af50783fc824 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -478,6 +478,17 @@ unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru, int zone
>  	return size;
>  }
>  
> +/*
> + * The watermark kswapd reclaims zones up to. With NUMA balancing memory
> + * tiering, kswapd keeps room above the high watermark for promotions.
> + */
> +unsigned long kswapd_wmark_pages(const struct zone *zone)
> +{
> +	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
> +		return promo_wmark_pages(zone);
> +	return high_wmark_pages(zone);
> +}
> +
>  static unsigned long drop_slab_node(int nid)
>  {
>  	unsigned long freed = 0;
> @@ -5212,7 +5223,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
>  static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
>  {
>  	int i;
> -	enum zone_watermarks mark;
>  
>  	if (unlikely(sc->proactive && signal_pending(current)))
>  		return true;
> @@ -5224,12 +5234,9 @@ static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
>  	if (!current_is_kswapd() || sc->order)
>  		return false;
>  
> -	mark = sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
> -	       WMARK_PROMO : WMARK_HIGH;
> -
>  	for (i = 0; i <= sc->reclaim_idx; i++) {
>  		struct zone *zone = lruvec_pgdat(lruvec)->node_zones + i;
> -		unsigned long size = wmark_pages(zone, mark) + MIN_LRU_BATCH;
> +		unsigned long size = kswapd_wmark_pages(zone) + MIN_LRU_BATCH;
>  
>  		if (managed_zone(zone) && !zone_watermark_ok(zone, 0, size, sc->reclaim_idx, 0))
>  			return false;
> @@ -7131,10 +7138,7 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
>  		enum zone_stat_item item;
>  		unsigned long free_pages;
>  
> -		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
> -			mark = promo_wmark_pages(zone);
> -		else
> -			mark = high_wmark_pages(zone);
> +		mark = kswapd_wmark_pages(zone);
>  
>  		/*
>  		 * In defrag_mode, watermarks must be met in whole

