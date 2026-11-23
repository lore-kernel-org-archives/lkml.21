Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427305;
	b=l5H1bKl9+BVjfB0IMHevNqlPImSI1M0fc6RNpFCz557oXFxfT2OJsLpYJs1Rmz8oirko
	 jidPMQ4QZa6bpC+J7I8FCNjzCOBMHtdM0ItNkaqxikzJnB2MzUehs85BUnkfWpuAf7EUZ
	 YbduBcOobqeMdruNuw+Ei5N9zfLPI8x55sHdYWpM2O13wDtIJeQAFttZw4G58ZFx4Czyz
	 8tT/lCDyeRms5AIhwgfNc7TfptO9vW6wNwd+CvjH5lsE43AGaPsb6fnL4gd1ANhfWv00h
	 5FCEYmICI8ajTS7H9Ulst8s2g2IIJ8yG4GuulQbndqi65iQ737wD1aarUcgqqnmO00A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427305;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=URTfUaPeSMI7/6g/61TQR3koz+6aMmSPM7AhHlRCW5g=;
	b=w8OPNhLpLh52/XE3v2TKu7QpHyHmN86dAxxvuacDqMmH+gNqTOuF6HPt307NxYGUNlgD
	 1XlEPGavN7jpFqnM41JVty08Yt5D2EK2ohERQgtmvjglbYHIDHd8CdnT970tJyjKzxy18
	 vp7JbB4FFSZda8Cr81MUVLitQbG8cmOvxRodaL1TZqtr3BwXQ/hig1QtIEiU4fl2VxuY/
	 wJ4j2LkCJ1BLGKldNvONwFoIYTxGw351+RKR7v+cLV4A/OUMCLw4o6o+sRvm54fywqltv
	 o9jHbKtP/HXpsZwExHgFpsG16NSXRqDTdBYDi1NUlwBzxCc/3Kg5gEoj47iTP2P7zJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SJARYwkS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD07606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SJARYwkS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6F21F000CF;
	Mon, 23 Nov 2026 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427304;
	bh=URTfUaPeSMI7/6g/61TQR3koz+6aMmSPM7AhHlRCW5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SJARYwkS2s9WDNrDVuFk9dgMuTihNj5LRNQkTS//+fFO44VrPreRQbv8NLIbpJa9W
	 CJpx0hy/hWMLKrlpdgX5+8yaaLTTJzQxSpxBMqmNfnhQ/3iN6PqpezIzG7fuPc4xMo
	 iqqcPOZ455AUUW+NBdrhTQwgQ3PZNWvd5NZm9i0AXRbPFKv7MDkjRk5Xuvias5BekY
	 lpHuhHswe0gL78PADqaUfR6A56l6VSqgOyJ8XXhfhz6TNSgDxXQPoRtWTru0qo0vxP
	 XMvlfVCvEwdLfZT96/r0Qh/FB7qE9BV2yYTcS2MTNaixYOQzxgNSF8M4KJEogLZfvx
	 FH9S7hvppblgA==
Message-ID: <fe70d569-cba3-4a9d-af7f-3931c191b8db@kernel.org>
Date: Mon, 23 Nov 2026 10:48:17 +0100
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
Subject: Re: [PATCH v3 0/3] mm: make watermark checks honour ALLOC_NOFRAGMENT
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Harry Yoo <harry@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Dev Jain <dev.jain@arm.com>,
 Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261116125103.2894162-1-kas@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261116125103.2894162-1-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 13:50, Kiryl Shutsemau (Meta) wrote:
> With defrag_mode, 64K mTHP faults under memory pressure stall in
> compaction 18 times as often as without it, and get about a third of the
> folios.  Dev Jain reported it [1].
> 
> The high-order watermark check counts free pages of every migratetype.
> With defrag_mode, every slowpath allocation is ALLOC_NOFRAGMENT, and a
> request below pageblock_order cannot take free pages from another
> migratetype's pageblock.  Under pressure, that is where the large free
> pages end up.  Two callers act on the wrong answer:
> 
>   - direct compaction's up-front check returns COMPACT_SUCCESS without
>     compacting, so compaction is never deferred;
>   - direct reclaim for a costly order stops early, having freed little.
> 
> Patches 1-2 give the check the request's migratetype and make it skip
> the free lists the request cannot take.  Patch 3 tells direct reclaim
> that the allocation is ALLOC_NOFRAGMENT.
> 
> Dev's benchmark in a 7G VM with only 64K mTHP enabled, medians of 15
> runs:
> 
>                               defrag_mode=0  defrag_mode=1  defrag_mode=1
>                                                             + series
>     compact_stall                      1690          30669          7366
>     64K faults allocated              20750           7391         20129
>     64K faults falling back to 4K       725          13832          1339
> 
> defrag_mode=1 still compacts more than defrag_mode=0.  That is by design,
> as it keeps 64K faults out of unmovable and reclaimable pageblocks [2].
> With the series, defrag_mode=0 is unchanged at 20698 64K faults
> allocated.
> 
> Based on page_alloc/for-7.5/misc.  Two trivial conflicts with other trees:
> 
>   - v7.4-rc2 changed the trace_reclaim_retry_zone() call next to patch
>     2's change in should_reclaim_retry();

I created a topic branch page_alloc/for-7.5/defrag_mode based on v7.4-rc4
and fixed that up while applying this series there.

>   - mm-new moved struct scan_control to mm/vmscan.h, where patch 3's
>     new field goes.

David will hopefully resolve this in mm-next. IMHO (we're in the learning
phase of this) it's a simple case that can be dealt with without moving
stuff between trees or creating shared stable branches etc.

Thanks,
Vlastimil

> 
> v3:
>  - Patch 1: declare the watermark functions in mm/page_alloc.h; rewrite
>    the comment above __zone_watermark_ok() and the changelog
>    (Vlastimil, Harry)
>  - Patch 2: plainer comments in should_reclaim_retry() and
>    __compact_finished()
>  - Patch 3: pass alloc_flags to try_to_free_pages() (Vlastimil)
>  - Rebased onto page_alloc/for-7.5/misc
> 
> v2:
>  - Patch 2 changelog: describe what the fast path change does to pages
>    on the per-cpu lists (Andrew); drop the should_reclaim_retry()
>    paragraph
>  - Patch 3 changelog: say that the benchmark baseline already has the
>    high-order check honouring ALLOC_NOFRAGMENT (Andrew)
>  - Rebased onto v7.4-rc1
> 
> v2: https://lore.kernel.org/all/20261102093939.3340540-1-kas@kernel.org/
> v1: https://lore.kernel.org/all/20261028132638.2560361-1-kirill@shutemov.name/
> 
> [1] https://lore.kernel.org/all/4aa14b41-9b89-494c-8825-55fffd5a541c@arm.com/
> [2] https://lore.kernel.org/all/auCDnqJc7fsBpUW2@thinkstation/
> 
> Kiryl Shutsemau (Meta) (3):
>   mm: page_alloc: add a watermark check that knows the migratetype
>   mm: page_alloc: make the high-order watermark check honour
>     ALLOC_NOFRAGMENT
>   mm: vmscan: tell direct reclaim the allocation is ALLOC_NOFRAGMENT
> 
>  include/linux/mmzone.h |  3 --
>  mm/compaction.c        | 16 +++++++----
>  mm/internal.h          |  3 +-
>  mm/page_alloc.c        | 62 ++++++++++++++++++++++++++++++++----------
>  mm/page_alloc.h        |  8 ++++++
>  mm/vmscan.c            | 24 ++++++++++++----
>  6 files changed, 88 insertions(+), 28 deletions(-)
> 
> Range-diff against v2:
> 1:  ed3ef9f9fd13 ! 1:  e3c2bded052a mm: page_alloc: add a watermark check that knows the migratetype
>     @@ Metadata
>       ## Commit message ##
>          mm: page_alloc: add a watermark check that knows the migratetype
>      
>     -    The high-order check in __zone_watermark_ok() accepts a free page of any
>     -    migratetype.  Under ALLOC_NOFRAGMENT, a request below pageblock_order can
>     -    only take a page of its own migratetype or claim a whole free block, so
>     -    the check can pass when the allocation cannot succeed.
>     +    For a high-order request, __zone_watermark_ok() accepts a free page of
>     +    any migratetype.  An ALLOC_NOFRAGMENT request below pageblock_order can
>     +    take a page of its own migratetype or claim a whole free pageblock, but
>     +    not steal from another migratetype's pageblock.  So the check can pass
>     +    for an allocation that is going to fail.
>      
>     -    Telling those apart needs the request's migratetype, but not every check
>     -    wants them told apart.  A check whether an allocation can be served now
>     -    has to count only the pages it can take.
>     +    To tell these apart, the check needs the migratetype of the request.
>     +    Add __zone_watermark_ok_mt(), which takes it, and use it where the
>     +    caller asks whether this allocation can succeed:
>      
>     -    A check whether there is enough free memory counts every migratetype:
>     -    kswapd and kcompactd balancing a zone, order-0 thresholds, the
>     -    slowpath's forecast whether reclaim and compaction can still make
>     -    progress.  Reclaim and compaction work across migratetypes to free whole
>     -    pageblocks.
>     +      - zone_watermark_fast();
>     +      - the recheck after node reclaim in get_page_from_freelist();
>     +      - compaction_suit_allocation_order().
>      
>     -    Move the body of __zone_watermark_ok() into __zone_watermark_ok_mt(),
>     -    which takes the migratetype as well, and make __zone_watermark_ok() a
>     -    wrapper around it for the second kind of check.  These use the new
>     -    function:
>     +    Other callers keep __zone_watermark_ok(), which counts every
>     +    migratetype.  kswapd and kcompactd balance the zone as a whole.
>     +    should_reclaim_retry() asks whether the allocation could succeed if all
>     +    reclaimable pages were freed, and compaction can then free a whole
>     +    pageblock for it to claim.
>      
>     -      - the allocator fast path, zone_watermark_fast();
>     -      - its recheck after node reclaim in get_page_from_freelist();
>     -      - compaction's up-front check, compaction_suit_allocation_order().
>     +    kcompactd passes MIGRATE_MOVABLE to compaction_suit_allocation_order().
>     +    It never sets ALLOC_NOFRAGMENT, so the value is not used.
>      
>     -    Declare both in mm/internal.h: nothing outside mm uses them.
>     +    Nothing outside mm/ uses __zone_watermark_ok().  Move its declaration
>     +    to mm/page_alloc.h, next to the new one.
>      
>     -    Nothing reads the migratetype yet: no functional change.
>     +    Nothing reads the migratetype yet, so there is no functional change.
>     +    Preparation for making the high-order check honour ALLOC_NOFRAGMENT.
>      
>     +    Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
>          Tested-by: Dev Jain <dev.jain@arm.com>
>          Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>      
>     @@ mm/compaction.c: static void kcompactd_do_work(pg_data_t *pgdat)
>       			continue;
>       
>      
>     - ## mm/internal.h ##
>     -@@ mm/internal.h: extern int min_free_kbytes;
>     - extern int defrag_mode;
>     - 
>     - void setup_per_zone_wmarks(void);
>     -+bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
>     -+			 int highest_zoneidx, unsigned int alloc_flags,
>     -+			 long free_pages);
>     -+bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
>     -+			    unsigned long mark, int highest_zoneidx,
>     -+			    unsigned int alloc_flags, long free_pages,
>     -+			    int migratetype);
>     - void calculate_min_free_kbytes(void);
>     - int __meminit init_per_zone_wmark_min(void);
>     - 
>     -
>       ## mm/page_alloc.c ##
>      @@ mm/page_alloc.c: static inline long __zone_watermark_unusable_free(struct zone *z,
>        * one free page of a suitable size. Checking now avoids taking the zone lock
>     @@ mm/page_alloc.c: bool __zone_watermark_ok(struct zone *z, unsigned int order, un
>       }
>       
>      +/*
>     -+ * For checks that are not about serving one allocation now: kswapd and
>     -+ * kcompactd balancing a zone, order-0 thresholds, forecasts whether
>     -+ * reclaim and compaction can still make progress.  They count free pages
>     -+ * of every migratetype: reclaim and compaction work across migratetypes
>     -+ * to free whole pageblocks.
>     ++ * Return true if free base pages in the zone are above 'mark' regardless
>     ++ * of migratetype. Use it to check whether the zone as a whole has enough
>     ++ * free memory. Use __zone_watermark_ok_mt() instead to check whether a
>     ++ * particular allocation can be served.
>      + */
>      +bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
>      +			 int highest_zoneidx, unsigned int alloc_flags,
>     @@ mm/page_alloc.c: get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int
>       				continue;
>       		}
>       
>     +
>     + ## mm/page_alloc.h ##
>     +@@ mm/page_alloc.h: extern bool free_pages_prepare(struct page *page, unsigned int order);
>     + 
>     + extern int user_min_free_kbytes;
>     + 
>     ++bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
>     ++			 int highest_zoneidx, unsigned int alloc_flags,
>     ++			 long free_pages);
>     ++bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
>     ++			    unsigned long mark, int highest_zoneidx,
>     ++			    unsigned int alloc_flags, long free_pages,
>     ++			    int migratetype);
>     ++
>     + struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order, int nid,
>     + 		nodemask_t *nodemask, unsigned int alloc_flags);
>     + #define __alloc_frozen_pages(...) \
> 2:  3347b0a24b0e ! 2:  c991756a139a mm: page_alloc: make the high-order watermark check honour ALLOC_NOFRAGMENT
>     @@ Commit message
>          With defrag_mode, every slowpath allocation carries ALLOC_NOFRAGMENT.  A
>          request below pageblock_order may take a page of its own migratetype or
>          claim a whole free block, but not steal from another migratetype's block.
>     -    The high-order part of the watermark check still accepts a free page of
>     -    any migratetype.
>     +    For a high-order request, the watermark check still accepts a free page
>     +    of any migratetype.
>      
>          Under memory pressure, movable allocations take free movable pages as
>          soon as reclaim frees them.  Free space in unmovable and reclaimable
>     @@ mm/compaction.c: static enum compact_result __compact_finished(struct compact_co
>       			!free_area_empty(area, MIGRATE_CMA))
>       			return COMPACT_SUCCESS;
>       #endif
>     -+		/* Under ALLOC_NOFRAGMENT it may only claim a whole block */
>     ++		/* An ALLOC_NOFRAGMENT request may only claim a whole block */
>      +		if ((cc->alloc_flags & ALLOC_NOFRAGMENT) &&
>      +		    order < pageblock_order)
>      +			continue;
>     @@ mm/page_alloc.c: should_reclaim_retry(gfp_t gfp_mask, unsigned order,
>       		/*
>       		 * Would the allocation succeed if we reclaimed all
>      -		 * reclaimable pages?
>     -+		 * reclaimable pages?  Count free pages of every migratetype:
>     -+		 * reclaim and compaction work across migratetypes to free a
>     -+		 * whole pageblock, which the allocation can then claim.
>     ++		 * reclaimable pages?  Count free pages of all migratetypes.
>     ++		 * Compaction can then free a whole pageblock for the
>     ++		 * allocation to claim.
>       		 */
>       		wmark = __zone_watermark_ok(zone, order, min_wmark,
>      -				ac->highest_zoneidx, alloc_flags, available);
> 3:  0ecbcc5f5fb0 ! 3:  fd8bb9835186 mm: vmscan: tell direct reclaim the allocation is ALLOC_NOFRAGMENT
>     @@ Commit message
>              64K faults allocated              20750          11538         19759
>              64K faults falling back to 4K       725           9945          1664
>      
>     -    Pass ALLOC_NOFRAGMENT from the allocation down to try_to_free_pages().
>     -    Both checks then ask __zone_watermark_ok_mt() for a free page the
>     -    allocation can take, and an order-4 direct reclaim frees 40 pages on
>     -    average.
>     +    Pass the allocation's alloc_flags down to try_to_free_pages(), and
>     +    record ALLOC_NOFRAGMENT in scan_control.  Both checks then ask
>     +    __zone_watermark_ok_mt() for a free page the allocation can take, and an
>     +    order-4 direct reclaim frees 40 pages on average.
>      
>          Fixes: e3aa7df331bc ("mm: page_alloc: defrag_mode")
>          Reported-by: Dev Jain <dev.jain@arm.com>
>     @@ mm/internal.h: void folio_mark_lazyfree(struct folio *folio);
>       unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
>      -				gfp_t gfp_mask, const nodemask_t *mask);
>      +				gfp_t gfp_mask, const nodemask_t *mask,
>     -+				bool nofragment);
>     ++				unsigned int alloc_flags);
>       unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
>       			      int zone_idx);
>       
>     @@ mm/page_alloc.c: __perform_reclaim(gfp_t gfp_mask, unsigned int order,
>       
>       	progress = try_to_free_pages(ac->zonelist, order, gfp_mask,
>      -								ac->nodemask);
>     -+				     ac->nodemask,
>     -+				     alloc_flags & ALLOC_NOFRAGMENT);
>     ++				     ac->nodemask, alloc_flags);
>       
>       	memalloc_noreclaim_restore(noreclaim_flag);
>       	fs_reclaim_release(gfp_mask);
>     @@ mm/vmscan.c: struct scan_control {
>       	/* One of the zones is ready for compaction */
>       	unsigned int compaction_ready:1;
>       
>     -+	/* The allocation cannot fall back to other migratetypes' blocks */
>     ++	/* The allocation may not steal from other migratetypes' blocks */
>      +	unsigned int nofragment:1;
>      +
>       	/* There is easily reclaimable cold cache in the current node */
>     @@ mm/vmscan.c: static bool throttle_direct_reclaim(gfp_t gfp_mask, struct zonelist
>       unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
>      -				gfp_t gfp_mask, const nodemask_t *nodemask)
>      +				gfp_t gfp_mask, const nodemask_t *nodemask,
>     -+				bool nofragment)
>     ++				unsigned int alloc_flags)
>       {
>       	unsigned long nr_reclaimed;
>       	struct scan_control sc = {
>     @@ mm/vmscan.c: unsigned long try_to_free_pages(struct zonelist *zonelist, int orde
>       		.may_writepage = 1,
>       		.may_unmap = 1,
>       		.may_swap = 1,
>     -+		.nofragment = nofragment,
>     ++		.nofragment = !!(alloc_flags & ALLOC_NOFRAGMENT),
>       	};
>       
>       	/*
> 
> base-commit: 3a99594e62fce8c646e8aac01d38af16d6833a40

