Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677381;
	b=T9T7Mvhl31jm3UQ4xyC3kqbcdOMgkTIc3Foo9+KbDzp5vDyDaiiAbv/0rg2AGDBsosTG
	 vm+8Wh9gfJqeCAugdyGhSY0QovIeU+p0rPk9CRiJG+gTykLKskTkTySEsg3jdNOg5Y9IH
	 CJyCJ5YzIi7MAoXfGWtWgTiiCTotMmsWc0BD7lcVJWwK6sGKL8zkIHDbEvWD4BArHehck
	 c1MvFmeyI8AQ0SeO4RnD+ekm6nmRqumUWA7ywVFQGj82R0x6N5DY1hTA3EylzeX1ZsKz/
	 aXH+MthBUgkw9+JDiuOMeR8Hqn6oeVRjo2p41SODHoPKMUdc15wfYp3pCn/y1E0fJTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677381;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=fQ9pC12UgeQHKo4v2+Isp6+X8dmisuGtcTzdtq5XM1w=;
	b=K9Z6w7V19tfg2ikhLS1Ojnb8l/XvCSCO70lqaMJOYhV9mUo8eVrmv0c994NphzDN5FnS
	 1B9FIOu6fsoL0OgMx9OJl0jFwI8qNhLZwhnjUqAQZOl+lfA1Z1ezJXNq8+652aDa333T4
	 Bsy13YTNjCVows19cNeOANuFEO2xKm9/F6JlucqJ02FI2eYd9YbcB1j0ziLUU0XyNkSYi
	 5gsLqmYstQMQXq86ZrcRK40gLTbvGjC3WOt19i3W27dhKKSfDLQvFzEkMhZz/g510tgE+
	 MCfPqbXReKjtFBLnsYoR2+5dQs4rZTrOQgovntqucX404u4912N9axAaSsRS6pYtxoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Li4i6wBE;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C780606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C780606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Li4i6wBE
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fQ9pC12UgeQHKo4v2+Isp6+X8dmisuGtcTzdtq5XM1w=;
	b=Li4i6wBET6MlGF7NQok3MceD0g0Osz25ZYuKOUjgYHLzLsW8jFkameq1ks9DZ0LaL4THMRIDP
	ozCtCGUiiFuG0FcfH9SMTbs2AXlhBOUNvpvWl8NFTjElEePpD85+HCMyjDOQr8MKJgVFkHeM/Pl
	6kbZr/N6s4b6jujuSQ7LL0k=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jZnrV0L7Kz1cyRy;
	Thu, 26 Nov 2026 15:15:38 +0800 (CST)
Received: from whupemk100004.china.huawei.com (unknown [7.152.185.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BBBDD4057C;
	Thu, 26 Nov 2026 15:16:02 +0800 (CST)
Received: from [10.173.98.163] (10.173.98.163) by
 whupemk100004.china.huawei.com (7.152.185.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 15:15:59 +0800
Subject: Re: [PATCH v7 2/3] mm/page_alloc: only free healthy pages in
 high-order folio
To: Jiaqi Yan <jiaqiyan@google.com>
CC: <osalvador@kernel.org>, <ljs@kernel.org>, <ziy@nvidia.com>,
	<harry.yoo@oracle.com>, <willy@infradead.org>, <osalvador@suse.de>,
	<jackmanb@google.com>, <hannes@cmpxchg.org>, <nao.horiguchi@gmail.com>,
	<david@kernel.org>, <william.roche@oracle.com>, <tony.luck@intel.com>,
	<wangkefeng.wang@huawei.com>, <jane.chu@oracle.com>,
	<akpm@linux-foundation.org>, <muchun.song@linux.dev>, <liam@infradead.org>,
	<rientjes@google.com>, <duenwen@google.com>, <jthoughton@google.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <shuah@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>, <boudewijn@delta-utec.com>, Vlastimil Babka
	<vbabka@kernel.org>
References: <20261110053331.2708996-1-jiaqiyan@google.com>
 <20261110053331.2708996-3-jiaqiyan@google.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <ac843d8d-4415-85f3-6832-e3faf5cfd04f@huawei.com>
Date: Thu, 26 Nov 2026 15:15:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261110053331.2708996-3-jiaqiyan@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemk100004.china.huawei.com (7.152.185.74)

On 2026/11/10 13:33, Jiaqi Yan wrote:
> At the end of dissolve_free_hugetlb_folio(), a free HugeTLB folio
> becomes non-HugeTLB, and it is released to buddy allocator as a
> high-order folio, e.g. a folio that contains 262144 pages if the
> folio was a 1G HugeTLB hugepage.
> 
> This is problematic if the HugeTLB hugepage contained HWPoison
> subpages. In that case, since buddy allocator does not check
> HWPoison for non-zero-order folio, the raw HWPoison page can be
> given out with its buddy page and be re-used by either kernel or
> userspace.
> 
> Memory failure recovery (MFR) in kernel does attempt to take raw
> HWPoison page off buddy allocator after
> dissolve_free_hugetlb_folio(). However, there is always a time
> window between dissolve_free_hugetlb_folio() frees a HWPoison
> high-order folio to buddy allocator and MFR takes HWPoison raw page
> off buddy allocator. Worse, a free HWPoison HugeTLB folio can also
> be dissolved outside of MFR, e.g. when shrinking the HugeTLB pool,
> and then nobody takes its HWPoison pages off buddy allocator.
> 
> Another similar situation is when a transparent huge page (THP)
> runs into memory failure but splitting failed. Such THP will
> eventually be released to buddy allocator when owning userspace
> processes are gone, but with certain subpages having HWPoison.
> 
> One obvious way to avoid these problems is to always check
> PageHWPoison() when allocating pages, which check_new_pages() only
> does if page sanity checks are enabled. However, it is against the
> past efforts to reduce sanity check overhead [1,2,3].
> 
> Instead, keep HWPoison pages out of buddy allocator when freeing a
> high-order folio. __free_pages_prepare() already walks through all
> tail pages of a high-order folio to check and clear their flags, so
> counting PageHWPoison() pages in that loop is cheap, as pointed out
> by David Hildenbrand [4]. Unlike PG_has_hwpoisoned, which is only
> maintained for THP, this catches HWPoison pages in any high-order
> folio, including dissolved HugeTLB folios.
> 
> If any HWPoison page is found, then after all checks and
> preparations in __free_pages_prepare() succeed, take a shortcut to
> the newly introduced free_has_hwpoisoned(), which only frees the
> healthy pages and excludes the HWPoison ones. __free_pages_prepare()
> then returns false so that its callers don't free the folio again.
> 
> free_has_hwpoisoned() iterates through the pages of the folio to
> identify contiguous ranges of healthy pages. It uses
> free_prepared_contig_range() to decompose each healthy range into
> the largest possible chunks of different orders, which are then
> freed via __free_frozen_pages(). Knowing the number of HWPoison
> pages from __free_pages_prepare(), it stops scanning once all of
> them are found, and frees the remaining pages without scanning them.
> 
> Sanitizing pages at free time (e.g. page poisoning and init_on_free)
> may write to page contents, which must be avoided for HWPoison
> pages. So factor it out of __free_pages_prepare() into
> free_pages_sanitize(), and skip it for a folio that has HWPoison
> pages. Instead, free_has_hwpoisoned() passes the new FPI_SANITIZE
> flag to free_prepared_contig_range(), which then sanitizes each
> healthy chunk right before freeing it.
> 
> Each excluded HWPoison page is treated like a page that
> memory_failure() takes off buddy allocator: it is marked
> PageHWPoisonTakenOff and holds a refcount of 1. Its alloc tag
> reference is also cleared, as is done for an order-0 HWPoison page
> in __free_pages_prepare(). This allows unpoison_memory() to put it
> back to buddy allocator via put_page_back_buddy() instead of leaking
> it.
> 
> As a result, memory_failure() no longer needs to take HWPoison pages
> off buddy allocator after dissolving a HugeTLB folio. For a free
> HugeTLB folio, or an anonymous one that becomes free after being
> unmapped, try_memory_failure_hugetlb() and me_huge_page() call
> __page_handle_poison(), which disables pcplists, dissolves the folio
> and then calls take_page_off_buddy(). Since the raw HWPoison page
> never reaches buddy allocator now, take_page_off_buddy() would fail,
> and memory_failure() would report MF_FAILED.
> 
> So add __hugepage_handle_poison() for these two callers. It dissolves
> the folio and then checks whether the raw HWPoison page has been
> isolated, i.e. is HWPoisonTakenOff. It doesn't test any HugeTLB
> flags, because the folio may have already been freed, e.g. by
> folio_put() in me_huge_page() if it was a surplus folio, or by a
> concurrent dissolve. If the folio's raw_hwp_list is unreliable,
> __update_and_free_hugetlb_folio() leaks the folio and the raw
> HWPoison page is not isolated, so memory_failure() still reports
> MF_FAILED. As free_has_hwpoisoned() already holds a refcount on
> each isolated page, the callers no longer page_ref_inc() it. Soft
> offline keeps using __page_handle_poison(), because it marks a page
> HWPoison only after taking it off buddy allocator.
> 
> free_has_hwpoisoned() has linear time complexity wrt the number of
> pages in the folio; the worst case is when the last page of the
> folio is HWPoison. While the power-of-two decomposition keeps the
> number of calls to buddy allocator small, the linear scan of pages
> to identify PageHWPoison() defines the overall time complexity. For
> a 1G hugepage having 8 HWPoison pages and if the last page is HWPoison,
> free_has_hwpoisoned() takes in worst case 15x the time free_one_page()
> takes for a healthy 1G hugepage, measured on a system having 56 Intel
> Skylake physical cores. The cost is nontrivial but far from triggering
> soft lockup, and fair for handling exceptional hardware memory errors.
> 
> This commit message text was reworded with an AI assistant, then
> reviewed and edited by me. The code changes are my own, but they
> are reviewed by the AI assistant.
> 
> [1] https://lore.kernel.org/linux-mm/1460711275-1130-15-git-send-email-mgorman@techsingularity.net
> [2] https://lore.kernel.org/linux-mm/1460711275-1130-16-git-send-email-mgorman@techsingularity.net
> [3] https://lore.kernel.org/all/20230216095131.17336-1-vbabka@suse.cz
> [4] https://lore.kernel.org/linux-mm/8e48c288-2183-4d58-b69d-5f78344b5da5@kernel.org
> 
> Assisted-by: Antigravity:claude-opus-5-5
> Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>

Thanks for update. Some questions below.

> ---
>  mm/internal.h       |   3 +
>  mm/memory-failure.c |  52 +++++++++-----
>  mm/page_alloc.c     | 170 +++++++++++++++++++++++++++++++++++++-------
>  3 files changed, 183 insertions(+), 42 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 9b8864a8540a..3ccbf7e4439a 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1195,6 +1195,9 @@ static inline int unmap_poisoned_folio(struct folio *folio, unsigned long pfn, b
>  {
>  	return -EBUSY;
>  }
> +
> +static inline void SetPageHWPoisonTakenOff(struct page *page)
> +{
> +}
>  #endif
>  
>  extern unsigned long  __must_check vm_mmap_pgoff(struct file *, unsigned long,
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index b215312f261b..b456e0996ecd 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -214,7 +214,40 @@ static struct rb_root_cached pfn_space_itree = RB_ROOT_CACHED;
>  
>  static DEFINE_MUTEX(pfn_space_lock);
>  
> +static inline bool PageHWPoisonTakenOff(struct page *page)
> +{
> +	return PageHWPoison(page) && page_private(page) == MAGIC_HWPOISON;
> +}
> +
> +/*
> + * Only for a HugeTLB page being handled by memory_failure().
> + * Unlike soft_offline_page(), no HWPoison subpage makes it into
> + * buddy allocator when the folio is freed, so take_page_off_buddy()
> + * is unnecessary.
> + *
> + * Return values:
> + *   1:   the folio is dissolved and the page is isolated with
> + *        HWPoisonTakenOff and refcount=1. Caller must not take
> + *        another refcount.
> + *   0:   the folio is dissolved but the page is not isolated,
> + *        e.g. the folio's raw_hwp_list is unreliable.

If folio's raw_hwp_list is unreliable, I think it cannot be dissolved. So
above comment confused me.

> + *   < 0: failed to dissolve folio.
> + */
> +static int __hugepage_handle_poison(struct page *page)

...

> +/*
> + * Returns
> + * - true: checks and preparations all good, caller can proceed freeing.
> + * - false: do not proceed freeing for one of the following reasons:
> + *   1. Some check failed so it is not safe to proceed freeing.
> + *   2. A compound page has some HWPoison pages. The healthy pages
> + *      are already safely freed, and the HWPoison ones isolated.
> + */
>  static __always_inline bool __free_pages_prepare(struct page *page,
>  		unsigned int order, fpi_t fpi_flags)
>  {
>  	int bad = 0;
> -	bool skip_kasan_poison = should_skip_kasan_poison(page);
> -	bool init = want_init_on_free();
>  	bool compound = PageCompound(page);
>  	struct folio *folio = page_folio(page);
> +	unsigned int num_hwpoisoned = 0;
>  
>  	if (fpi_flags & FPI_PREPARED)
>  		return true;
> @@ -1376,6 +1437,7 @@ static __always_inline bool __free_pages_prepare(struct page *page,
>  			folio->_nr_pages = 0;
>  #endif
>  		}
> +		num_hwpoisoned += PageHWPoison(page);
>  		for (i = 1; i < (1 << order); i++) {
>  			struct page *tail_page = page + i;
>  
> @@ -1394,6 +1456,7 @@ static __always_inline bool __free_pages_prepare(struct page *page,
>  				}
>  			}
>  			tail_page->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
> +			num_hwpoisoned += PageHWPoison(tail_page);
>  		}
>  	}
>  	if (folio_test_anon(folio)) {
> @@ -1425,34 +1488,20 @@ static __always_inline bool __free_pages_prepare(struct page *page,
>  					   PAGE_SIZE << order);
>  	}
>  
> -	kernel_poison_pages(page, 1 << order);
> -
>  	/*
> -	 * As memory initialization might be integrated into KASAN,
> -	 * KASAN poisoning and memory initialization code must be
> -	 * kept together to avoid discrepancies in behavior.
> +	 * After breaking down compound page and dealing with page metadata
> +	 * (e.g. page owner and page alloc tags), take a shortcut if this
> +	 * was a compound page containing certain HWPoison subpages.
>  	 *
> -	 * With hardware tag-based KASAN, memory tags must be set before the
> -	 * page becomes unavailable via debug_pagealloc or arch_free_page.
> +	 * Pass FPI_SANITIZE to only free_pages_sanitize() healthy pages.
>  	 */
> -	if (!skip_kasan_poison) {
> -		kasan_poison_pages(page, order, init);
> -
> -		/* Memory is already initialized if KASAN did it internally. */
> -		if (kasan_has_integrated_init())
> -			init = false;
> +	if (unlikely(num_hwpoisoned)) {
> +		free_has_hwpoisoned(page, order, num_hwpoisoned,
> +				    fpi_flags | FPI_SANITIZE);
> +		return false;

There is free_page_is_bad check above this:
	if (is_check_pages_enabled()) {
		if (free_page_is_bad(page))
			bad++;
		if (bad)
			return false;
	}

It can return early if bad is true. In this case, free_has_hwpoisoned cannot handle
the hwpoisoned subpages. Is this expected behavior?

>  	}
> -	if (init)
> -		clear_highpages_kasan_tagged(page, 1 << order);
> -
> -	/*
> -	 * arch_free_page() can make the page's contents inaccessible.  s390
> -	 * does this.  So nothing which can access the page's contents should
> -	 * happen after this.
> -	 */
> -	arch_free_page(page, order);
>  
> -	debug_pagealloc_unmap_pages(page, 1 << order);
> +	free_pages_sanitize(page, order);
>  
>  	return true;
>  }
> @@ -7059,7 +7108,14 @@ static void free_prepared_contig_range(struct page *page,
>  		/*
>  		 * Free the chunk as a single block. Our caller has already
>  		 * called free_pages_prepare() for each order-0 page.
> +		 *
> +		 * If the original compound page has HWPoison page,
> +		 * free_pages_prepare() has to skip sanitize at that time,
> +		 * but now it is good time to do that.
>  		 */
> +		if (fpi_flags & FPI_SANITIZE)
> +			free_pages_sanitize(page, order);
> +
>  		__free_frozen_pages(page, order, fpi_flags | FPI_PREPARED);
>  
>  		pfn += 1UL << order;
> @@ -7141,6 +7197,69 @@ void __free_contig_range(unsigned long pfn, unsigned long nr_pages)
>  	__free_contig_range_common(pfn, nr_pages, /* is_frozen= */ false);
>  }
>  
> +/*
> + * Given some contiguous pages that have num_hwpoisoned HWPoison page(s),
> + * free only the healthy ones.
> + *
> + * Used at the end of __free_pages_prepare(). Even if having HWPoison pages,
> + * breaking down compound page and clearing metadata (e.g. page owner, alloc
> + * tag) can be done together during __free_pages_prepare(), which simplifies
> + * the splitting here: unlike __split_unmapped_folio(), there is no need to
> + * turn split pages into a compound page or to carry metadata.
> + *
> + * It scans every raw page of the compound page and causes nontrivial overhead.
> + * So only use this when the compound page contains HWPoison page(s).
> + *
> + * This implementation needs rework in memdesc world.
> + */
> +static void free_has_hwpoisoned(struct page *page, unsigned int order,
> +				unsigned int num_hwpoisoned,
> +				fpi_t fpi_flags)

There are codes for order = 0 in __free_pages_prepare:

	if (unlikely(PageHWPoison(page)) && !order) {
		/* Do not let hwpoison pages hit pcplists/buddy */
		reset_page_owner(page, order);
		page_table_check_free(page, order);
		pgalloc_tag_sub(page, 1 << order);

		/*
		 * The page is isolated and accounted for.
		 * Mark the codetag as empty to avoid accounting error
		 * when the page is freed by unpoison_memory().
		 */
		clear_page_tag_ref(page);
		return false;
	}

Can free_has_hwpoisoned also handle order=0 pages? This way, the hwpoison-related handling code
can be centralized here.

> +{
> +	unsigned long curr = page_to_pfn(page);
> +	unsigned long end_pfn = curr + (1UL << order);
> +	unsigned long next;
> +	struct page *hwpoisoned;
> +
> +	while (curr < end_pfn) {
> +		if (!num_hwpoisoned) {
> +			/* No more HWPoison page in [curr, end_pfn) */
> +			free_prepared_contig_range(pfn_to_page(curr),
> +						   end_pfn - curr, fpi_flags);
> +			break;
> +		}
> +
> +		next = curr;
> +		while (next < end_pfn && !PageHWPoison(pfn_to_page(next)))
> +			++next;
> +
> +		if (next != end_pfn) {

We reach here with num_hwpoisoned != 0. So next can not be equal to end_pfn?

> +			hwpoisoned = pfn_to_page(next);
> +			/*
> +			 * Avoid accounting error when the page is freed
> +			 * by unpoison_memory().
> +			 */
> +			clear_page_tag_ref(hwpoisoned);
> +			/*
> +			 * unpoison_memory() will put_page_back_buddy()
> +			 * for HWPoisonTakenOff pages. Increment refcount
> +			 * to avoid VM_BUG() from put_page_testzero().
> +			 */
> +			page_ref_inc(hwpoisoned);
> +			SetPageHWPoisonTakenOff(hwpoisoned);
> +			--num_hwpoisoned;
> +		}
> +
> +		free_prepared_contig_range(pfn_to_page(curr), next - curr,
> +					   fpi_flags);
> +
> +		if (next == end_pfn)

Ditto.

Thanks.
.
