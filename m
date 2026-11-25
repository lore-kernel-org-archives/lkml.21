Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607273;
	b=DPxBEJ6kVqGwLDUnR3ZYP6aHlffI/rtgTN6EMeHDg0qHMkTAPMwqyn4KP8uUHxMYUJTl
	 EdFkwJg7hliu1bNXkVTU5IXZChLpJUhHXT1gaKo9/cN9KxpOxasapWEb2oQNouKV6gbf+
	 1UWrb+B/IdP810C0bJ7m301GCNkEz8U2xbNNDtYVUHD70cCK9s45Y9n6VUWYsHRZPkX8I
	 PYzeUctUxYTMqwVS/tzoYE9fhw7dmFVN+L4IMePFWEBvBTdI8ozV6BjS3vKeaAxpCZfkp
	 qVy1Vj1nhuCfjOemntHz5tHRqRzWrGmfert8qxDDxsfMHlz+LvW6pXVy0sWbmNRSmXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607273;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Uftm8l0P1lvzgPJDRipge4Ec3j5A5wJyMrLil3kjAnw=;
	b=B2VWjLDGtb3Z83/hWu9qzozAl91xyH/i9XNL+INQHbBayGME0ABZ2iqgqhNXYZywYqZz
	 f3W1WySCbl59tFytrM7LLJNj/rm6hxZBz1e5tZNmp00ukjNeBTw/BMXwRS+lfDJ4hp5+k
	 0PphDmmDkhaDx2sDNMkW/c92JwQDQkK55cYZ2KtLHARaT7naQZugoNXpBQAMaLKGwA62S
	 6hkTR78Mw5kWMY1R1kNa90spXvuFw0Ylr9k3RXfIB24HFgHUQaLBdJ4rvsJ1CjJePrmOt
	 lnIWZ43L2v4kmMpMJUg2ASm6uPVLAYAKvxbrFAWqjOvFmKWX4RBiN3uFNrPuHCLq50w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="P+C1/iYf";
	arc=none smtp.remote-ip=91.218.175.218
Received: from mta0.migadu.com (out-218.mta0.migadu.com [91.218.175.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F8E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F8E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P+C1/iYf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KTH0YYon1dsjvvAs8tsQMpP7zzlJkAMRifqXz3mgGhY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795607270; v=1; x=1796212070;
 b=P+C1/iYfnEosQOpYi9uKy9YgO9VRcaQqk9Wv1TZpnJf/ttAtZ4XhRtQ7ZzqFU1VQ2oeNcZLH
 ks5VF2S6k4b8Qi7iudZ/mSwo2RTH+fiiYE+0Mv5S4Bn7KpK3Q74kNtR9tdQs/GMMyFigb60GOtN
 nWCM4UmbXUuw97w1Lh3O3JIQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fee1e389369225e6;
	Wed, 25 Nov 2026 11:47:50 +0000
X-Mizu-Trace-ID: fee1e389369225e6
X-Migadu-Flow: FLOW_OUT
Message-ID: <e2595c80-c223-472a-a756-d352161a3330@linux.dev>
Date: Wed, 25 Nov 2026 19:47:35 +0800
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
Subject: Re: [PATCH v9 09/16] mm/mglru: Avoid placing rejected folios below
 populated gen
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
 <20261114200803.23129-10-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-10-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> We used to scan only the oldest generation in scan_folios(). In
> evict_folios(), we checked whether
> lru_gen_folio_seq(lruvec, folio, false) == min_seq[type]. If so, the
> folio was marked active and moved to younger generations.
> 
> This was itself buggy, as folios in generation min_seq[type] - 1

Should this be min_seq[type] + 1?

> would not be marked active by folio_set_active(), potentially causing
> a cold/hot inversion.
> 
> Besides this issue, the old approach also differs from the current
> behavior, where we can scan fewer than two generations.
> Now that we can scan younger generations, including the youngest
> generation, this no longer prevents rejected folios from being placed
> in a generation below or at the populated generation. Such rejected
> folios would then be scanned again and again, resulting in extremely
> low `pg_steal/pg_scan` ratios. For example:
>    pgsteal_file: 2312605
>    pgscan_file:  36465693
>    reclamation efficiency: 6.34%
> 
> We pass `scanned_seq` to `move_folios_to_lru()` and make sure we either
> promote the folio or place it in the youngest generation when the
> populated generation is already the youngest one.
> Also, folio_set_active() is no longer needed.
> 
> With this change, the results become:
>    pgsteal_file: 2683815
>    pgscan_file:  4224244
>    reclamation efficiency: 63.53%
> 
> The sys time for building the kernel also decreased from 4m30.532s to
> 3m50.188s while swappiness==1.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---
>   include/linux/mm_inline.h | 22 +++++++++++++++++++++-
>   mm/vmscan.c               | 24 ++++++++++++------------
>   2 files changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index ab69b9930893..f6f4bc9a704f 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -332,7 +332,8 @@ static inline unsigned long lru_gen_folio_seq(const struct lruvec *lruvec,
>   	return max(READ_ONCE(lrugen->max_seq) - gen + 1, READ_ONCE(lrugen->min_seq[type]));
>   }
>   
> -static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
> +static inline bool __lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio,
> +		unsigned long scanned_seq, bool reclaiming)
>   {
>   	unsigned long seq;
>   	unsigned long flags;
> @@ -347,6 +348,8 @@ static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio,
>   		return false;
>   
>   	seq = lru_gen_folio_seq(lruvec, folio, reclaiming);
> +	if (scanned_seq != -1UL)
> +		seq = max(seq, min(scanned_seq + 1, lrugen->max_seq));
>   	gen = lru_gen_from_seq(seq);
>   	flags = (gen + 1UL) << LRU_GEN_PGOFF;
>   	/* see the comment on MIN_NR_GENS about PG_active */
> @@ -362,6 +365,17 @@ static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio,
>   	return true;
>   }
>   
> +static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
> +{
> +	return __lru_gen_add_folio(lruvec, folio, -1UL, reclaiming);
> +}
> +
> +static inline bool lru_gen_add_rejected_folio(struct lruvec *lruvec, struct folio *folio,
> +		unsigned long scanned_seq)
> +{
> +	return __lru_gen_add_folio(lruvec, folio, scanned_seq, false);
> +}
> +
>   static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
>   {
>   	unsigned long flags;
> @@ -420,6 +434,12 @@ static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio,
>   	return false;
>   }
>   
> +static inline bool lru_gen_add_rejected_folio(struct lruvec *lruvec, struct folio *folio,
> +		unsigned long scanned_seq)
> +{
> +	return false;
> +}
> +
>   static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
>   {
>   	return false;
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index b538abf02578..0fef966b0a14 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -1865,7 +1865,8 @@ static bool too_many_isolated(struct pglist_data *pgdat, int file,
>    *
>    * Note: The caller must not hold any lruvec lock.
>    */
> -static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
> +static unsigned int move_folios_to_lru(struct list_head *list, unsigned long seq,
> +		bool do_rotate)
>   {
>   	int nr_pages, nr_moved = 0;
>   	struct lruvec *lruvec = NULL;
> @@ -1922,7 +1923,7 @@ static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
>   		    !folio_test_referenced(folio) &&
>   		    folio_ref_count(folio) == folio_expected_ref_count(folio))
>   			lruvec_add_folio_tail(lruvec, folio);
> -		else
> +		else if (seq == -1UL || !lru_gen_add_rejected_folio(lruvec, folio, seq))
>   			lruvec_add_folio(lruvec, folio);
>   
>   		nr_pages = folio_nr_pages(folio);
> @@ -2041,7 +2042,7 @@ static unsigned long shrink_inactive_list(unsigned long nr_to_scan,
>   	nr_reclaimed = shrink_folio_list(&folio_list, pgdat, sc, &stat, false,
>   					 lruvec_memcg(lruvec));
>   
> -	move_folios_to_lru(&folio_list, true);
> +	move_folios_to_lru(&folio_list, -1UL, true);
>   
>   	mod_lruvec_state(lruvec, PGDEMOTE_KSWAPD + reclaimer_offset(sc),
>   					stat.nr_demoted);
> @@ -2152,8 +2153,8 @@ static void shrink_active_list(unsigned long nr_to_scan,
>   	/*
>   	 * Move folios back to the lru list.
>   	 */
> -	nr_activate = move_folios_to_lru(&l_active, false);
> -	nr_deactivate = move_folios_to_lru(&l_inactive, false);
> +	nr_activate = move_folios_to_lru(&l_active, -1UL, false);
> +	nr_deactivate = move_folios_to_lru(&l_inactive, -1UL, false);
>   
>   	count_vm_events(PGDEACTIVATE, nr_deactivate);
>   	count_memcg_events(lruvec_memcg(lruvec), PGDEACTIVATE, nr_deactivate);
> @@ -4753,7 +4754,8 @@ static bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct sca
>   
>   static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   		       struct scan_control *sc, int type, int tier,
> -		       struct list_head *list, int *isolatedp)
> +		       struct list_head *list, int *isolatedp,
> +		       unsigned long *scanned_seq)
>   {
>   	enum node_stat_item item;
>   	int zone_idx;
> @@ -4784,6 +4786,7 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   		seq = lrugen->max_seq;
>   
>   	seq = lruvec_populated_min_seq(lruvec, type, sc->reclaim_idx + 1, seq);
> +	*scanned_seq = seq;
>   	gen = lru_gen_from_seq(seq);
>   	max_gen = lru_gen_from_seq(max_seq);
>   
> @@ -4980,6 +4983,7 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   	int tier, scanned, reclaimed;
>   	int isolated = 0, nr_isolated = 0;
>   	unsigned long total_reclaimed = 0;
> +	unsigned long scanned_seq;
>   	bool skip_retry = false;
>   	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
>   	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
> @@ -4991,7 +4995,7 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   
>   	tier = get_tier_idx(lruvec, type);
>   	scanned = scan_folios(nr_to_scan, lruvec, sc,
> -			      type, tier, &list, &isolated);
> +			      type, tier, &list, &isolated, &scanned_seq);
>   	nr_isolated = isolated;
>   	if (nr_isolated)
>   		__mod_node_page_state(pgdat, NR_ISOLATED_ANON + type,
> @@ -5017,8 +5021,6 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   			type ? LRU_INACTIVE_FILE : LRU_INACTIVE_ANON);
>   
>   	list_for_each_entry_safe_reverse(folio, next, &list, lru) {
> -		DEFINE_MIN_SEQ(lruvec);
> -
>   		/* move_folios_to_lru() culls unevictable folios via folio_putback_lru() */
>   		if (!folio_evictable(folio))
>   			continue;
> @@ -5037,11 +5039,9 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   		 * so this effectively promotes them by at least one generation.
>   		 */
>   		folio_set_lru_refs(folio, 0);
> -		if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
> -			folio_set_active(folio);
>   	}
>   
> -	move_folios_to_lru(&list, false);
> +	move_folios_to_lru(&list, scanned_seq, false);
>   
>   	walk = current->reclaim_state->mm_walk;
>   	if (walk && walk->batched) {

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

