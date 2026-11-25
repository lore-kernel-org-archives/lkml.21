Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611592;
	b=jtHuziIByeQO3JU6eg55ml4JEb/gmBZ5zL9Y0Zul9riTRuc1PIdNmVCFi4j3FmHRAHmN
	 36J3KcuEPTogO098kOn1NxTiOHqu8wxdngvP0i2skRxt1u354QRL69+D6PhdrwVyUVrRZ
	 KHoV2EoVI6So/R56kqKN+9I3osDIv8gf5qioat2vOnIY1e2DkLetP42Vsr04JiqBB7naS
	 rimjNr4ZRO2H1u8dwIhE3Po4ld7Ashzrt34RxI86aKZUewdBamnV1VWg7/MxUFE3PLPVU
	 Ym7M/dVhYNjoLqemLcEx3wH4U3lpcaAClTHNzo0pPRmav7uemGBXzdmTUV9V45G+PBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611592;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=c+Mpazxl4ZEIYEZU/rJ/n2zn5OgZbseL/gkYDzd+dwc=;
	b=XhakHj1RgB47IYlzTCftk6gLf7rhStUYtuCAQlZO7xqZ8pRjlhKS+NuVAirAWSXTfaeS
	 ADoDJfQ2js7Pyo3TlF9K2/vBniIbqmFyziU5fsQ5q8/7fKRLiBoYofuZGvck1KMXx/msd
	 +cv+8ZbX57beKaR/kQ3xLh+hYiw6sbA9vN8jUpe8bPKSqU09SRx1b2/aNv9lkyEzlyMLN
	 +1O//f17/QeghRb4b+uKt0JuPunvuO2B+czBxpmY5Vvacx+BYHXN4LuO+CnFF6gzigumy
	 mMraFRAguzgNcG9enSpjB5VbPS3ceU6Y7BTlWJGIKQo1uEmz0+KOGh67kVIfMLs2ykw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WlLAo1lN;
	arc=none smtp.remote-ip=91.218.175.181
Received: from mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B3F606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50B3F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WlLAo1lN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zvbWqo5iHc5+akdiEM8RCy5BVcALG0xIAZNTE1kuK1g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795611589; v=1; x=1796216389;
 b=WlLAo1lNv8iH8o8n7VKHCUvl64e1kpI2IsRlzaCwY6+dbLfZfSDMqqydjcG/Q86vXMhwJxKD
 3sv55vXnXLodBR2IYxDuicHdb53cJLoVW8mPo0Y6vSi2wkUJqS5CHPrasjLHwthS8z+A4UBJ8BS
 lZl0z11fI4v/9d5VuYCe1wlk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 89e5829b4aa7431a;
	Wed, 25 Nov 2026 12:59:49 +0000
X-Mizu-Trace-ID: 89e5829b4aa7431a
X-Migadu-Flow: FLOW_OUT
Message-ID: <0b27c4ca-4c5d-4693-9153-51ab365e06b0@linux.dev>
Date: Wed, 25 Nov 2026 20:59:34 +0800
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
Subject: Re: [PATCH v9 12/16] mm/mglru: Restrict eviction accounting to
 eligible zones
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
 <20261114200803.23129-13-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-13-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> For both lruvec_evictable_size() and lru_gen_imbalanced(),
> only count eligible zones up to sc->reclaim_idx. This avoids
> overestimating the number of pages available for scanning and
> allows aging to proceed more promptly when eligible zones
> contain few folios.
> 
> lru_gen_age_node() uses lruvec_is_reclaimable() to determine
> whether any memcg has generations old enough to reclaim under
> min_ttl. If none are reclaimable, it may trigger OOM. However,
> lruvec_is_reclaimable() also uses lruvec_is_sizable() to
> estimate the LRU size.
> 
> Previously, lruvec_is_sizable() counted folios across all zones.
> With accounting now restricted to zones up to sc->reclaim_idx,
> the estimated size may be significantly smaller, potentially
> leading to premature OOM.
> 
> To avoid this and simplify the implementation, allow
> lru_gen_age_node() to count folios from all zones.
> 
> Note that min_ttl currently has several issues and does not
> work as expected.
> 
> First, reclaim does not enforce min_ttl on a per-memcg basis,
> so folios from memcgs whose generations are all younger than
> min_ttl can still be reclaimed.
> 
> Second, the LRU size check is coupled with the min_ttl check,
> which can lead to premature OOM. For example, consider a system
> with 100 memcgs, each containing fewer than 16 MB of evictable
> folios. At priority 12, shifting each memcg's LRU size by
> sc->priority can yield zero, causing all memcgs to be considered
> unreclaimable even if their generations are older than min_ttl.
> 
> These issues should be addressed in a separate patch series
> rather than as part of this eviction accounting change.
> 
> Co-developed-by: Bo Zhang <zhangbo56@xiaomi.com>
> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>   mm/trace_vmscan.h |  4 ++--
>   mm/vmscan.c       | 27 +++++++++++++++------------
>   mm/vmscan.h       |  7 ++++---
>   3 files changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/trace_vmscan.h b/mm/trace_vmscan.h
> index 565c56428364..9dafdb5bd3ce 100644
> --- a/mm/trace_vmscan.h
> +++ b/mm/trace_vmscan.h
> @@ -488,9 +488,9 @@ TRACE_EVENT(mm_mglru_aging,
>   			unsigned long seq = max_seq - MAX_NR_GENS + 1 + i;
>   
>   			__entry->nr_anon[i] =
> -				lruvec_gen_size(lrugen, LRU_GEN_ANON, seq);
> +				lruvec_gen_size(lrugen, LRU_GEN_ANON, seq, MAX_NR_ZONES);
>   			__entry->nr_file[i] =
> -				lruvec_gen_size(lrugen, LRU_GEN_FILE, seq);
> +				lruvec_gen_size(lrugen, LRU_GEN_FILE, seq, MAX_NR_ZONES);
>   		}
>   		__entry->nid = lruvec_pgdat(lruvec)->node_id;
>   		__entry->priority = sc->priority;
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 6d942f192e63..c9e22a5cbb51 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4207,8 +4207,9 @@ static void set_initial_priority(struct pglist_data *pgdat, struct scan_control
>   	sc->priority = clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
>   }
>   
> -static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
> -				  unsigned long nr[])
> +static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc,
> +				  int swappiness, unsigned long nr[],
> +				  int max_zone)
>   {
>   	int type;
>   	unsigned long seq;
> @@ -4221,16 +4222,17 @@ static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
>   
>   	for_each_evictable_type(type, swappiness) {
>   		for (seq = min_seq[type]; seq <= max_seq; seq++)
> -			nr[type] += lruvec_gen_size(lrugen, type, seq);
> +			nr[type] += lruvec_gen_size(lrugen, type, seq, max_zone);
>   	}
>   }
>   
> -static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
> +static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc,
> +		int max_zone)
>   {
>   	unsigned long total, sizes[ANON_AND_FILE];
>   	int swappiness = get_swappiness(lruvec, sc);
>   
> -	lruvec_evictable_size(lruvec, swappiness, sizes);
> +	lruvec_evictable_size(lruvec, sc, swappiness, sizes, max_zone);
>   	total = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
>   
>   	/* whether the size is big enough to be helpful */
> @@ -4249,7 +4251,8 @@ static bool lruvec_is_reclaimable(struct lruvec *lruvec, struct scan_control *sc
>   	if (mem_cgroup_below_min(NULL, memcg))
>   		return false;
>   
> -	if (!lruvec_is_sizable(lruvec, sc))
> +	/* counting all zones to avoid premature OOM */
> +	if (!lruvec_is_sizable(lruvec, sc, MAX_NR_ZONES))
>   		return false;
>   
>   	gen = lru_gen_from_seq(evictable_min_seq(min_seq, swappiness));
> @@ -5099,9 +5102,9 @@ static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
>   	for_each_evictable_type(type, swappiness) {
>   		unsigned long seq;
>   
> -		youngest[type] = lruvec_gen_size(lrugen, type, max_seq);
> +		youngest[type] = lruvec_gen_size(lrugen, type, max_seq, sc->reclaim_idx + 1);
>   		for (seq = min_seq[type]; seq < max_seq; seq++)
> -			old[type] += lruvec_gen_size(lrugen, type, seq);
> +			old[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
>   	}
>   
>   	/* the vast majority of pages sit in the youngest gen */
> @@ -5136,7 +5139,7 @@ static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
>   {
>   	unsigned long total;
>   
> -	lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> +	lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan, sc->reclaim_idx + 1);
>   	total = nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE];
>   
>   	total = apply_proportional_protection(memcg, sc, total);
> @@ -5323,7 +5326,7 @@ static int shrink_one(struct lruvec *lruvec, struct scan_control *sc)
>   	if (need_rotate)
>   		return MEMCG_LRU_YOUNG;
>   
> -	if (lruvec_is_sizable(lruvec, sc))
> +	if (lruvec_is_sizable(lruvec, sc, sc->reclaim_idx + 1))
>   		return 0;
>   
>   	/* one retry if too small */
> @@ -5853,7 +5856,7 @@ static int lru_gen_seq_show(struct seq_file *m, void *v)
>   			char mark = full && seq < min_seq[type] ? 'x' : ' ';
>   
>   			seq_printf(m, " %10lu%c",
> -				   lruvec_gen_size(lrugen, type, seq), mark);
> +				   lruvec_gen_size(lrugen, type, seq, MAX_NR_ZONES), mark);
>   		}
>   
>   		seq_putc(m, '\n');
> @@ -5906,7 +5909,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
>   		if (sc->nr_reclaimed >= nr_to_reclaim)
>   			return 0;
>   
> -		lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> +		lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan, sc->reclaim_idx + 1);
>   		lru_gen_balance_scan(lruvec, swappiness,
>   				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
>   
> diff --git a/mm/vmscan.h b/mm/vmscan.h
> index c6b583fc7493..c2cea36289f3 100644
> --- a/mm/vmscan.h
> +++ b/mm/vmscan.h
> @@ -117,14 +117,15 @@ struct scan_control {
>   };
>   
>   #ifdef CONFIG_LRU_GEN
> -/* The number of pages of @type in the generation @seq, summed over all zones */
> +/* Number of pages of @type in generation @seq below @max_zone */
>   static inline unsigned long lruvec_gen_size(struct lru_gen_folio *lrugen,
> -					    int type, unsigned long seq)
> +					    int type, unsigned long seq,
> +					    int max_zone)
>   {
>   	int gen = lru_gen_from_seq(seq);
>   	unsigned long size = 0;
>   
> -	for (int zone = 0; zone < MAX_NR_ZONES; zone++)
> +	for (int zone = 0; zone < max_zone; zone++)
>   		size += max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
>   
>   	return size;

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

