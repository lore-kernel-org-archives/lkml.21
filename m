Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081734;
	b=2omgaj9HL765FghBYYUzzRMVkp65prN1aEibtclhxaUV3dci2C0d2K4Y8HCbmaHIeG4x
	 ofePkNXedmB99Tjim2sGRwfZaMxhZg/eInqhAnGQYkmVBGOukcSzCTcgV/6gYbSlE9kqt
	 cDgtSVrOw1ZkdKN7/SAVxVYIu97L8+3MOnh2ytR956s/GLTwLSH+YJIPJg6W+yaxQAykB
	 aOOc4dvgCn6QPkJ9xYQ0G2RDUBHJIWkOo+HnjYCs8506l5fHtnzN9ZQ+B4XLjPCqz6fZI
	 ZspmSNUUiYc2lMWQ7XCSRqe+R3JyAGXsZiwLdm3OH6zToOFqb7I2QkitHZ1gCUXUdQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081734;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lyfI9PrgTIYPzEbm8cZBR714R/hrvn27V4qZB1Otj84=;
	b=2g+rF51Tgj49XMZ2FjOvOCqIQZGnJb3nD3EIQvBcmiUTjva28wC4iOWS42Cm8UwMToFX
	 Q4YoTuXdBMjii3EYnF2EH87Bz4vlvL+/hwAuzBvdU+b2cgKagiwEEL0gvVW7dhDH5L11b
	 Pn6R9hWLETMdfhqygvH+jyJqYHe5EZsOWsBIBVwfvlvX1lWR37C4OC3TqEd9u3hKUCvIV
	 q8fdpkSg70GLWtMRRkfbcNbNlAOTQ6efFz7ayiAidcqBFdT+A9Uf5+U0uo2XDrS0+azM8
	 yo2pOk80FYEySPWymqbOeTM+Fop3sSwp0cJQk8QkGTx/28l4f4CJdL/AOdNCTyn6pKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ElQxz6jB;
	arc=none smtp.remote-ip=91.218.175.79
Received: from mta0.migadu.com (out-79.mta0.migadu.com [91.218.175.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B8B606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B8B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ElQxz6jB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9T83l59KhEFxR4AY2GM52FkL0TA2LE8VK3GZ8LaiKQw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795081730; v=1; x=1795686530;
 b=ElQxz6jBi2jgzAueX47C9jvg6hM1f2oo2HoRxb/dcbzOkLDQvIdiI86aAw1klr+T2k28r0FZ
 TqZDiAlo7182Tjeo4+p88zdBOM/299sR0VlFuXyetI5xZpRFbjkzKYci21UeJfLSckN5f/XVjlI
 +8ylcRKqpWsMIOEcCreP5DiI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 29611b66eda32918;
	Thu, 19 Nov 2026 09:48:50 +0000
X-Mizu-Trace-ID: 29611b66eda32918
X-Migadu-Flow: FLOW_OUT
Message-ID: <5238e574-ed22-4781-aac2-b91a6b2d911e@linux.dev>
Date: Thu, 19 Nov 2026 17:48:38 +0800
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
Subject: Re: [PATCH v9 07/16] mm/mglru: balance anon and file scan budget by
 refault rate
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: axelrasmussen@google.com, baolin.wang@linux.alibaba.com,
 baoquan.he@linux.dev, hannes@cmpxchg.org, hui.zhu@linux.dev,
 kasong@tencent.com, kunwu.chan@gmail.com, liam@infradead.org,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org,
 liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org,
 mhocko@suse.com, qi.zheng@linux.dev, rppt@kernel.org, ryncsn@gmail.com,
 shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com,
 weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com,
 zhuhui@kylinos.cn, sidchintamaneni@gmail.com
References: <20261114200803.23129-1-baohua@kernel.org>
 <20261114200803.23129-8-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-8-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Replace get_type_to_scan() and isolate_folios(), which selected one
> type per batch, with a proportional split of the scan budget between
> anon and file, and scan both types each round.
> 
> lru_gen_balance_scan() splits the total by
> 
>          anon : file = swappiness * r_file * w_anon :
>                        (MAX_SWAPPINESS - swappiness) * r_anon * w_file
> 
> where r_anon and r_file are the per-type refault rates scaled by
> 4096, clamped to [1, 4096]; a rate at the 4096 ceiling means the type
> refaults at least as often as it is evicted. The w factors bias the
> split toward the LRU sizes at mild swappiness and follow the IO cost
> ratio at the extremes. Both rate accumulators start at MIN_LRU_BATCH,
> so a type without eviction history reads as 100% until evictions
> accumulate, and the floor of 1 keeps a type that never refaults from
> zeroing out the other type's share. Swappiness 0 and
> SWAPPINESS_ANON_ONLY keep their single-type behavior; at swappiness ==
> MAX_SWAPPINESS the file factor is zero, so anon gets the whole budget,
> as in the classical LRU; swappiness 1 no longer forces file-only
> scanning as the old code did.
> 
> The proportional protection and priority reduction are applied to the
> total once, before the split, and each budget is capped at its type's
> evictable size. Regular reclaim derives the total from the evictable
> sizes, so the budgets sum to it. The proactive path re-splits the
> remaining target each round, so eviction keeps working while either
> type makes progress, until the target is met or no progress is
> possible. The debugfs scan_control gets .priority = DEF_PRIORITY so
> eviction starts from the oldest gen and reports the default priority
> in the tracepoints.
> 
> Note that we are already lenient with the debugfs proactive
> reclaim interface. We may reclaim one generation ahead even
> at `DEF_PRIORITY`, and with extreme swappiness values such
> as 1 and 200, we may not fall back to the other type.
> 
> To address these cases and preserve the behavior of the
> previous model before scan-budget-based reclaim, we would
> need to add another flag to `scan_control`. However, this
> may not be worthwhile for a debugfs interface that is likely
> to be rarely used, especially given that we already have
> memory-level and node-level proactive reclaim interfaces.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Co-developed-by: Gaofei Lyu <lyugaofei@xiaomi.com>
> Signed-off-by: Gaofei Lyu <lyugaofei@xiaomi.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>   mm/vmscan.c | 219 +++++++++++++++++++++++++++++++++-------------------
>   1 file changed, 138 insertions(+), 81 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index f7fbe91fedf3..18cf1c084e78 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4863,79 +4863,110 @@ static int get_tier_idx(struct lruvec *lruvec, int type)
>   	return tier - 1;
>   }
>   
> -static int get_type_to_scan(struct lruvec *lruvec, int swappiness)
> +/*
> + * Balance the anon vs file scan budget using MGLRU's per-type refault
> + * rates, where swappiness is the relative IO cost of anon vs file (see
> + * Documentation/admin-guide/sysctl/vm.rst).
> + *
> + * On entry, nr[] holds the evictable size of each type, on return it
> + * holds each type's scan budget, bounded by its evictable size.
> + *
> + * LRU lock not needed: a stale snapshot merely skews the split for one pass,
> + * and MGLRU aging averages the fault rate so we can simply read it, no need
> + * to do any extra work here. If reclaim is blocked by unfair type hotness or
> + * stall aging, the priority will raise and a raised priority drives the
> + * aging.
> + *
> + * Calculation is basically based on following formula with a LRU size bias:
> + *
> + * anon : file = swappiness * r_file * w_anon :
> + *               (MAX_SWAPPINESS - swappiness) * r_anon * w_file
> + *
> + * r_file / r_anon: refault rate for file / anon.
> + * w_file / w_anon: LRU size weight of file / anon.
> + *
> + * We don't calculate the scan cost. MGLRU uses lazy promotion, which will
> + * cancel the scan budget naturally.
> + */
> +static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness,
> +		unsigned long total_scan, unsigned long nr[])
>   {
> -	struct ctrl_pos sp, pv;
> +	struct lru_gen_folio *lrugen = &lruvec->lrugen;
> +	u64 refault_rate[ANON_AND_FILE], anon_factor, file_factor;
> +	u64 anon_scan, file_scan, total;
> +	u64 anon_weight, file_weight;
> +	int size_bias;
>   
> -	if (swappiness <= MIN_SWAPPINESS + 1)
> -		return LRU_GEN_FILE;
> +	total = nr[LRU_GEN_ANON] + nr[LRU_GEN_FILE];
> +	if (!total)
> +		return;
>   
> -	if (swappiness >= MAX_SWAPPINESS)
> -		return LRU_GEN_ANON;
> -	/*
> -	 * Compare the sum of all tiers of anon with that of file to determine
> -	 * which type to scan.
> -	 */
> -	read_ctrl_pos(lruvec, LRU_GEN_ANON, LRU_TIER_MIN, LRU_TIER_MAX,
> -		      swappiness, &sp);
> -	read_ctrl_pos(lruvec, LRU_GEN_FILE, LRU_TIER_MIN, LRU_TIER_MAX,
> -		      MAX_SWAPPINESS - swappiness, &pv);
> +	if (swappiness <= MIN_SWAPPINESS) {
> +		nr[LRU_GEN_ANON] = 0;
> +		nr[LRU_GEN_FILE] = min_t(u64, total_scan, nr[LRU_GEN_FILE]);
> +		return;
> +	}
>   
> -	return positive_ctrl_err(&sp, &pv);
> -}
> +	if (swappiness == SWAPPINESS_ANON_ONLY) {
> +		nr[LRU_GEN_FILE] = 0;
> +		nr[LRU_GEN_ANON] = min_t(u64, total_scan, nr[LRU_GEN_ANON]);
> +		return;
> +	}
>   
> -static inline bool is_single_type_reclaim(int swappiness)
> -{
> -	return swappiness == MIN_SWAPPINESS ||
> -	       swappiness == SWAPPINESS_ANON_ONLY;
> -}
> +	for (int type = LRU_GEN_ANON; type <= LRU_GEN_FILE; type++) {
> +		int hist = lru_hist_from_seq(READ_ONCE(lrugen->min_seq[type]));
> +		/* start at MIN_LRU_BATCH to smooth the rate on gen start */
> +		u64 refaulted = MIN_LRU_BATCH, evicted = MIN_LRU_BATCH;
>   
> -static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> -			  struct scan_control *sc, int swappiness,
> -			  struct list_head *list, int *isolated,
> -			  int *isolate_type, int *isolate_scanned)
> -{
> -	bool type_fallback_allowed = !is_single_type_reclaim(swappiness);
> -	int type = get_type_to_scan(lruvec, swappiness);
> -	int total_scanned = 0, scanned, tier;
> -	bool tried = false;
> +		for (int tier = 0; tier < MAX_NR_TIERS; tier++) {
> +			refaulted += READ_ONCE(lrugen->avg_refaulted[type][tier]);
> +			refaulted += atomic_long_read(&lrugen->refaulted[hist][type][tier]);
>   
> -retry:
> -	tier = get_tier_idx(lruvec, type);
> -	scanned = scan_folios(nr_to_scan, lruvec, sc,
> -			      type, tier, list, isolated);
> +			evicted += READ_ONCE(lrugen->avg_total[type][tier]);
> +			evicted += atomic_long_read(&lrugen->evicted[hist][type][tier]);
> +		}
>   
> -	total_scanned += scanned;
> -	if (*isolated) {
> -		*isolate_type = type;
> -		*isolate_scanned = scanned;
> -		return total_scanned;
> +		/*
> +		 * The rate scaled by 4096 to survive integer division, clamped
> +		 * to [1, 4096] (~0% - 100%), the floor of 1 keeps a type that
> +		 * never refaults from zeroing out the other type's share.
> +		 */
> +		refault_rate[type] = mul_u64_u64_div_u64(refaulted, 4096, evicted);
> +		refault_rate[type] = clamp_t(u64, refault_rate[type], 1, 4096);
>   	}
>   
>   	/*
> -	 * We are running out of the current reclaim type. Fall back to
> -	 * the other type if allowed.
> +	 * The more extreme the swappiness, the wider the IO cost gap between
> +	 * anon and file, so the split should follow the IO cost ratio rather
> +	 * than the sizes. With a mild swappiness, balance the scan by the
> +	 * actual LRU size more.
>   	 */
> -	if (!scanned && !tried && type_fallback_allowed) {
> -		type = !type;
> -		tried = true;
> -		type_fallback_allowed = false;
> -		goto retry;
> -	}

Hi Kairui, Barry,

A question about the size weight:

> +	size_bias = max(1, min(swappiness, MAX_SWAPPINESS - swappiness));
> +	anon_weight = nr[LRU_GEN_ANON] + nr[LRU_GEN_FILE] / size_bias;
> +	file_weight = nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
> +

In the classic LRU, get_scan_count() weights each type by its own size
only.

Here each weight also includes the other type's size / size_bias. So
around swappiness 100 the split follows the sizes like the classic LRU,
but near swappiness 1 or 199 the sizes cancel out and the split follows
swappiness only.

For example, anon 3G, file 100M, same refault rate, anon share of the
scan budget:

	  swappiness   classic   this patch
		 100         97%        96%
		  10         62%        28%
		   1         13%       0.5%

Having two behaviors in one formula is a bit confusing. What is the
reason for this blending, and is there data behind it? Would weighting
each type only by its own size, like get_scan_count(), work as well?

> +	anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
> +	file_factor = (u64)(MAX_SWAPPINESS - swappiness) * refault_rate[LRU_GEN_ANON] * file_weight;
> +
> +	/* Cross-multiply the ratio above. */
> +	anon_scan = mul_u64_u64_div_u64(total_scan, anon_factor, anon_factor + file_factor);
> +	file_scan = (u64)total_scan - anon_scan;
> +
>   	/*
> -	 * We scanned some folios but failed to isolate any due to promotions,
> -	 * protections, or races. Retry once to avoid a larger loop.
> +	 * Bound each type by its evictable size. Hand the exceeding part to
> +	 * the other type. Any excess left when total_scan exceeds both sizes
> +	 * is dropped, since it only stresses the scanner with no gain.
>   	 */
> -	if (scanned && !tried) {
> -		tried = true;
> -		goto retry;
> -	}
> -
> -	return total_scanned;
> +	if (anon_scan > nr[LRU_GEN_ANON])
> +		file_scan += anon_scan - nr[LRU_GEN_ANON];
> +	else if (file_scan > nr[LRU_GEN_FILE])
> +		anon_scan += file_scan - nr[LRU_GEN_FILE];
> +	nr[LRU_GEN_ANON] = min_t(u64, anon_scan, nr[LRU_GEN_ANON]);
> +	nr[LRU_GEN_FILE] = min_t(u64, file_scan, nr[LRU_GEN_FILE]);
>   }
>   
>   static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> -			struct scan_control *sc, int swappiness)
> +			struct scan_control *sc, int type, int swappiness)
>   {
>   	LIST_HEAD(list);
>   	LIST_HEAD(clean);
> @@ -4944,8 +4975,8 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   	enum node_stat_item item;
>   	struct reclaim_stat stat;
>   	struct lru_gen_mm_walk *walk;
> -	int scanned, reclaimed;
> -	int isolated = 0, nr_isolated = 0, type, type_scanned;
> +	int tier, scanned, reclaimed;
> +	int isolated = 0, nr_isolated = 0;
>   	unsigned long total_reclaimed = 0;
>   	bool skip_retry = false;
>   	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
> @@ -4956,8 +4987,9 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   	/* In case folio deletion left empty old gens, flush them */
>   	try_to_inc_min_seq(lruvec, swappiness);
>   
> -	scanned = isolate_folios(nr_to_scan, lruvec, sc, swappiness,
> -				 &list, &isolated, &type, &type_scanned);
> +	tier = get_tier_idx(lruvec, type);
> +	scanned = scan_folios(nr_to_scan, lruvec, sc,
> +			      type, tier, &list, &isolated);
>   	nr_isolated = isolated;
>   	if (nr_isolated)
>   		__mod_node_page_state(pgdat, NR_ISOLATED_ANON + type,
> @@ -4979,7 +5011,7 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   	if (isolated)
>   		handle_reclaim_writeback(isolated, pgdat, sc, &stat);
>   	trace_mm_vmscan_lru_shrink_inactive(pgdat->node_id,
> -			type_scanned, reclaimed, &stat, sc,
> +			scanned, reclaimed, &stat, sc,
>   			type ? LRU_INACTIVE_FILE : LRU_INACTIVE_ANON);
>   
>   	list_for_each_entry_safe_reverse(folio, next, &list, lru) {
> @@ -5056,18 +5088,18 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
>   	return evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS == max_seq;
>   }
>   
> -static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
> -			   struct mem_cgroup *memcg, int swappiness)
> +static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
> +		struct mem_cgroup *memcg, int swappiness,
> +		unsigned long nr_to_scan[])
>   {
> -	unsigned long nr_to_scan, evictable, sizes[ANON_AND_FILE];
> -
> -	lruvec_evictable_size(lruvec, swappiness, sizes);
> -	evictable = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
> +	unsigned long total;
>   
> -	nr_to_scan = apply_proportional_protection(memcg, sc, evictable);
> -	nr_to_scan >>= sc->priority;
> +	lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> +	total = nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE];
>   
> -	return nr_to_scan;
> +	total = apply_proportional_protection(memcg, sc, total);
> +	total >>= sc->priority;
> +	lru_gen_balance_scan(lruvec, swappiness, total, nr_to_scan);
>   }
>   
>   static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
> @@ -5100,6 +5132,30 @@ static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
>   	return true;
>   }
>   
> +static long evict_folio_lists(unsigned long nr_to_scan[], struct lruvec *lruvec,
> +			     struct scan_control *sc, int swappiness, unsigned long max_batch)
> +{
> +	int type;
> +	unsigned long batch, scanned, total_scanned = 0;
> +
> +	/*
> +	 * Scan both types with the given budgets; the caller checks if
> +	 * reclaim is satisfied after each pass.
> +	 */
> +	for (type = LRU_GEN_FILE; type >= LRU_GEN_ANON; type--) {
> +		if (!nr_to_scan[type])
> +			continue;
> +
> +		batch = min(nr_to_scan[type], max_batch);
> +		scanned = evict_folios(batch, lruvec, sc, type, swappiness);
> +
> +		nr_to_scan[type] -= min(nr_to_scan[type], scanned);
> +		total_scanned += scanned;
> +	}
> +
> +	return total_scanned;
> +}
> +
>   /*
>    * For future optimizations:
>    * 1. Defer try_to_inc_max_seq() to workqueues to reduce latency for memcg
> @@ -5107,8 +5163,8 @@ static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
>    */
>   static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>   {
> +	unsigned long nr[ANON_AND_FILE];
>   	bool need_rotate = false, should_age = false;
> -	long nr_batch, nr_to_scan;
>   	int swappiness = get_swappiness(lruvec, sc);
>   	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
>   
> @@ -5125,9 +5181,9 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>   			return false;
>   	}
>   
> -	nr_to_scan = get_nr_to_scan(lruvec, sc, memcg, swappiness);
> -	while (nr_to_scan > 0) {
> -		int delta;
> +	lru_gen_prepare_scan(lruvec, sc, memcg, swappiness, nr);
> +
> +	while (nr[LRU_GEN_ANON] > 0 || nr[LRU_GEN_FILE] > 0) {
>   		DEFINE_MAX_SEQ(lruvec);
>   
>   		if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg)) {
> @@ -5142,9 +5198,7 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>   			should_age = true;
>   		}
>   
> -		nr_batch = min(nr_to_scan, MIN_LRU_BATCH);
> -		delta = evict_folios(nr_batch, lruvec, sc, swappiness);
> -		if (!delta)
> +		if (!evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH))
>   			break;
>   
>   		if (should_abort_scan(lruvec, sc))
> @@ -5157,7 +5211,6 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>   		if (root_reclaim(sc) && should_age)
>   			break;
>   
> -		nr_to_scan -= delta;
>   		cond_resched();
>   	}
>   
> @@ -5769,8 +5822,8 @@ static int run_aging(struct lruvec *lruvec, unsigned long seq,
>   static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_control *sc,
>   			int swappiness, unsigned long nr_to_reclaim)
>   {
> -	int nr_batch;
>   	DEFINE_MAX_SEQ(lruvec);
> +	unsigned long nr_to_scan[ANON_AND_FILE];
>   
>   	if (seq + MIN_NR_GENS > max_seq)
>   		return -EINVAL;
> @@ -5786,8 +5839,11 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
>   		if (sc->nr_reclaimed >= nr_to_reclaim)
>   			return 0;
>   
> -		nr_batch = min(nr_to_reclaim - sc->nr_reclaimed, MAX_LRU_BATCH);
> -		if (!evict_folios(nr_batch, lruvec, sc, swappiness))
> +		lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> +		lru_gen_balance_scan(lruvec, swappiness,
> +				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
> +
> +		if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness, MAX_LRU_BATCH))
>   			return 0;
>   
>   		cond_resched();
> @@ -5850,6 +5906,7 @@ static ssize_t lru_gen_seq_write(struct file *file, const char __user *src,
>   		.may_writepage = true,
>   		.may_unmap = true,
>   		.may_swap = true,
> +		.priority = DEF_PRIORITY,
>   		.reclaim_idx = MAX_NR_ZONES - 1,
>   		.gfp_mask = GFP_KERNEL,
>   		.proactive = true,

-- 
Best regards
Ridong

