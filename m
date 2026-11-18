Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989432;
	b=wVMtCOXU11xxlxbgyW2tXtluS10wIIJhDm3/Pwz/WTOwERjk0P+XB1MXdcbcHiQd8UoB
	 aPksneqS3b0CBbbL5K+b6BgEE5w77pnKX1+wCaRairP7z4mdZMvMC3hRc2ELlc7P7GG7K
	 EiOthk2+5tWA3zjIIXQegNRK+ndg2E3heqryuoXrFYsiWy13t6AIwaJsfa4+sSQC6IdJM
	 V4TUB40dc7OEkIY2wzan6FCHXv7L6pLGgMFTX8QEBSdmN/ZTB3js8LJvVCPHJrqqwlP95
	 o/B9ES7b6iQhMiOIGF0ant+y6tdqxvnFJKzm4CfR2zJAuhonCNowx7w8v8tP3lLHEww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989432;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hj2AtJ5fdbFUi8EuCznDfKlHT8DybaNFg1VurQsunj0=;
	b=EUIXJ5zbcjXQx0Plcq0KbhoxM8ZrBL887uQ4E27OEZ+GxpghunOO0srum39jY13BGbcL
	 JrECiMF6eQxCaGE5CbqPUMXBzA8hScyQUZikBRAJig6SBjSFaJYYQq/hzIn6bqiIFNWua
	 shrnEwd5Mptf6+PwvYp4MsXBNjxa2QqAdu4NqMb5spHQa/5olLxPCYLAt8LTQoCtjUEAl
	 9DM5Lo/gmOvIqufufTd5R9pTod2phKpwa1MEuW4IhMZXe3bprRM17xsRuEDjtUkIWmGJ5
	 L/UZdowDCiHjrJWyciuuTPtvenHBjypA/8Vl7rQy5pA2XOlfgrXvrZMygHHb1nvOukA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q4fUY0+g;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF57606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF57606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q4fUY0+g
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4C791596;
	Wed, 18 Nov 2026 00:10:26 -0800 (PST)
Received: from [10.163.128.4] (unknown [10.163.128.4])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B10C3F882;
	Wed, 18 Nov 2026 00:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794989429; bh=0H51ijbzjs6BiH+IRFtsYcS5mGGhZK4y1Kx0/tr2CTk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q4fUY0+gWsCb9QiVpjNWATFAKLE6lh/hQh84bHsTCsALikTwDBGlwktRcFOn5qP8d
	 6ZhyC/tO9w9jYhfsy76lfpgoaiomucKgKTuNNqYvkMovfmw/4tWOT748Lle1pSdDS0
	 GzZcwrr9RtkPTQMuyvfABvyavwPc6jAnC8Gk5qqo=
Message-ID: <a066d403-1608-4c0b-b06b-0b786e71b12d@arm.com>
Date: Wed, 18 Nov 2026 13:40:17 +0530
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
Subject: Re: [PATCH v3 2/3] mm: page_alloc: make the high-order watermark
 check honour ALLOC_NOFRAGMENT
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>, Harry Yoo <harry@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261116125103.2894162-1-kas@kernel.org>
 <20261116125103.2894162-3-kas@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261116125103.2894162-3-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/11/26 6:21 pm, Kiryl Shutsemau (Meta) wrote:
> With defrag_mode, every slowpath allocation carries ALLOC_NOFRAGMENT.  A
> request below pageblock_order may take a page of its own migratetype or
> claim a whole free block, but not steal from another migratetype's block.
> For a high-order request, the watermark check still accepts a free page
> of any migratetype.
> 
> Under memory pressure, movable allocations take free movable pages as
> soon as reclaim frees them.  Free space in unmovable and reclaimable
> pageblocks is off-limits to them under ALLOC_NOFRAGMENT, and builds up.
> The free pages of order 4 and up end up mostly in those pageblocks.
> 
> A 64K mTHP fault cannot take them, but direct compaction's up-front check
> counts them and returns COMPACT_SUCCESS without compacting anything.  The
> allocation then fails.  Because compaction "succeeded", it is never
> deferred, and every fault stalls in it again before falling back to small
> pages.
> 
> Dev Jain's benchmark faults 64K mTHPs under swap pressure, in a 7G VM
> with only the 64K size enabled.  With defrag_mode, those faults stall in
> compaction 18 times as often and get about a third of the folios
> (medians of 15 runs):
> 
>                               defrag_mode=0  defrag_mode=1  defrag_mode=1
>                                                             + this patch
>     compact_stall                      1690          30669          2607
>     compact_fail                        621          30531           906
>     64K faults allocated              20750           7391         11538
>     64K faults falling back to 4K       725          13832          9945
> 
> Make __zone_watermark_ok_mt() skip other migratetypes' free lists below
> pageblock_order for an ALLOC_NOFRAGMENT request.  Give
> __compact_finished() the same rule for its fallback test, so that
> compaction, once it runs, stops on a page the request can take.
> 
> zone_watermark_fast() calls __zone_watermark_ok_mt() too.  With
> defrag_mode, an allocation now wakes kswapd and starts reclaim or
> compaction as soon as the free lists hold nothing it can take.  For the
> orders the per-cpu lists serve, that is earlier than before: the check
> does not count their pages, so the allocation no longer uses up the local
> list first.  A request that may not wake kswapd or reclaim, such as an
> mTHP fault with THP defrag=never, falls back to a smaller folio instead.
> 
> Fixes: e3aa7df331bc ("mm: page_alloc: defrag_mode")
> Reported-by: Dev Jain <dev.jain@arm.com>
> Closes: https://lore.kernel.org/all/4aa14b41-9b89-494c-8825-55fffd5a541c@arm.com/
> Tested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

zone_watermark_ok_mt is a bad name, I am having a hard time figuring out when
to call zone_watermark_ok and when to call zone_watermark_ok_mt. Let us look at
what zone_watermark_ok answers currently, according to the comment above it:

a) "Return true if free base pages are above 'mark'."
b) "For high-order checks it will return true if the order-0 watermark is reached
    and there is at least one free page of a suitable size".

So there are two uses: whether we have enough free pages, then, whether
we have enough free pages *and* we can also allocate.

So let us do something like: we have zone_watermark_ok_for_alloc. It will call
zone_watermark_ok, which will only handle the watermark computation (so this is a
refactor for the code ending at if (!order) line in current zone_watermark_ok).
Then it will also scan the freelists for the correct order, correct migratetype etc.

Then at the callsite we clearly know whether we are just looking for enough free memory,
or whether we are looking for an allocation too.


>  mm/compaction.c |  5 +++++
>  mm/page_alloc.c | 21 ++++++++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 6c553d0e90f8..7312f7515c53 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -2365,6 +2365,11 @@ static enum compact_result __compact_finished(struct compact_control *cc)
>  			!free_area_empty(area, MIGRATE_CMA))
>  			return COMPACT_SUCCESS;
>  #endif
> +		/* An ALLOC_NOFRAGMENT request may only claim a whole block */
> +		if ((cc->alloc_flags & ALLOC_NOFRAGMENT) &&
> +		    order < pageblock_order)
> +			continue;
> +
>  		/*
>  		 * Job done if allocation would steal freepages from
>  		 * other migratetype buddy lists.
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 0ebfbbb5d7c5..6e75c03b303b 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -3587,6 +3587,11 @@ static inline long __zone_watermark_unusable_free(struct zone *z,
>   * will return true of the order-0 watermark is reached and there is at least
>   * one free page of a suitable size. Checking now avoids taking the zone lock
>   * to check in the allocation paths if no pages are free.
> + *
> + * Under ALLOC_NOFRAGMENT, a request below pageblock_order can take another
> + * migratetype's page only by claiming the whole block, so only free pages of
> + * @migratetype count below pageblock_order.  Without ALLOC_NOFRAGMENT,
> + * @migratetype is not used.
>   */
>  bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
>  			    unsigned long mark, int highest_zoneidx,
> @@ -3649,6 +3654,9 @@ bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
>  			continue;
>  
>  		for (mt = 0; mt < MIGRATE_PCPTYPES; mt++) {
> +			if ((alloc_flags & ALLOC_NOFRAGMENT) &&
> +			    mt != migratetype && o < pageblock_order)
> +				continue;
>  			if (!free_area_empty(area, mt))
>  				return true;
>  		}
> @@ -3677,8 +3685,12 @@ bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
>  			 int highest_zoneidx, unsigned int alloc_flags,
>  			 long free_pages)
>  {
> +	/* Serving an ALLOC_NOFRAGMENT request needs __zone_watermark_ok_mt() */
> +	VM_WARN_ON_ONCE(order && order < pageblock_order &&
> +			(alloc_flags & ALLOC_NOFRAGMENT));
>  	return __zone_watermark_ok_mt(z, order, mark, highest_zoneidx,
> -				      alloc_flags, free_pages, MIGRATE_MOVABLE);
> +				      alloc_flags & ~ALLOC_NOFRAGMENT,
> +				      free_pages, MIGRATE_MOVABLE);
>  }
>  
>  bool zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
> @@ -4693,10 +4705,13 @@ should_reclaim_retry(gfp_t gfp_mask, unsigned order,
>  
>  		/*
>  		 * Would the allocation succeed if we reclaimed all
> -		 * reclaimable pages?
> +		 * reclaimable pages?  Count free pages of all migratetypes.
> +		 * Compaction can then free a whole pageblock for the
> +		 * allocation to claim.
>  		 */
>  		wmark = __zone_watermark_ok(zone, order, min_wmark,
> -				ac->highest_zoneidx, alloc_flags, available);
> +				ac->highest_zoneidx,
> +				alloc_flags & ~ALLOC_NOFRAGMENT, available);
>  		trace_reclaim_retry_zone(z, order, reclaimable,
>  				available, min_wmark, *no_progress_loops, wmark);
>  		if (wmark) {

