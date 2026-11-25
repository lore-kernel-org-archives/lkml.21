Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572834;
	b=ElRj0Q9dAaJX1/Dp8R7ANASe/QX/YRADpOZKmWxF2l4gv/x6HM+CkNmBs/lx6I7orQEp
	 Q5nLp6CzV/Eg0QX0U5Lojchfl1LmZN+1UG7dinEi7KR8hTLdCrg19BLTbDfRBAj7PJcxz
	 o7egBV+x+ujMBfbXOZ1od7cIZ0GiuqV1N4Q5B+uHrQVWQL5r32ycGOPviPjBMXt8ro9J+
	 ojtoWfkmFR0kAjR2/DEKfYXQbUi9VwOtn4RcnQpX0giupqw4bJZ3qVZamhjIhFqIr6v4h
	 SiFvokVhZTnTvHSgoDAAhzWbo2oJZv4YCRZOSCtnp53PNknG6F/6tR5VP4oJ9rl8ljQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572834;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mR75b2s1mWNZlecKjEzTGrzm1QNi2Di7hyQA/N1UDPw=;
	b=edOlMw3UKtTitgSGBOiyb6uypa8u/WR4Bb6jl6+bCBBl27GrKzQICiE9xAgO8VkOv0mR
	 /fvIrjs4I2idd29sugvtjsmrr8TOOFHovOwZ9Dd57OB+i9wNmll6PbRyD4JezjSWmhTzT
	 3dmbfVXVRd76ffWV6hXvP//l8cIvMiH8GHeDlIyRLxWB6hJtm1M8mm8njv5hJAwGf61ss
	 2wfCH/MXHuXlgRGSkpKBioHs5hi1a+8M3Q8z31gQddr/icWRcYfA+Ox77CoGo8XlrTS+V
	 H/GOm7k5nfOtM7Nbr9jNWwhR0kdAN/2KokGCgJ+0Ky9gKTXwLcCBhnc2LZ3pMbHEiwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TKIcPLRi;
	arc=none smtp.remote-ip=91.218.175.126
Received: from mta0.migadu.com (out-126.mta0.migadu.com [91.218.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB81B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB81B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TKIcPLRi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/wCihSMxaGc1SlzGU4LTrs2HdI1tRtEU07xbfbw90YY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795572831; v=1; x=1796177631;
 b=TKIcPLRiQdBI9FOqQuNoL62zEIKv2eSYJB9lJzAomqVZWkeQcJJj+51U7ZfxlxK8/+Mo/Lox
 T42BrOC8MwsE4CzTw0AMVd2TokR+3uxTve4ftGrV4dlcO2jWgKAO3SNtfg7hFr7i5803ww12k/d
 C9LHUAMz2KRxAIp9ZMkC2Pqw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 59fdfd6286176d23;
	Wed, 25 Nov 2026 02:13:51 +0000
X-Mizu-Trace-ID: 59fdfd6286176d23
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: nico.pache@linux.dev
Cc: aarcange@redhat.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	byungchul@sk.com,
	chengming.zhou@linux.dev,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	kas@kernel.org,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	matthew.brost@intel.com,
	ryan.roberts@arm.com,
	usama.arif@linux.dev,
	usamaarif642@gmail.com,
	xu.xin@linux.dev,
	ying.huang@linux.alibaba.com,
	yuzhao@google.com,
	ziy@nvidia.com
Subject: Re: [PATCH v3] mm/ksm: prevent zero-page remapping during ksmd-triggered THP splits
Date: Wed, 25 Nov 2026 10:13:30 +0800
Message-Id: <20261125021330.54446-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122-b4-ksm_fixv2-v3-1-f78ea7779746@linux.dev>
References: <20261122-b4-ksm_fixv2-v3-1-f78ea7779746@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Since commit b1f202060afe ("mm: remap unused subpages to shared zeropage
> when splitting isolated thp"), splitting an anonymous THP remaps all
> zero-filled subpages to the shared zeropage via TTU_USE_SHARED_ZEROPAGE.
> This flag is set unconditionally for every anonymous folio split,
> including splits triggered by KSM.
> 
> When KSM is enabled with THP=always, this causes two regressions:
> 
> 1. use_zero_pages=1: KSM calls try_to_merge_one_page() which triggers
>    split_huge_page(). The split remaps all 512 zero-filled subpages to
>    the shared zeropage at once, freeing the entire 2MB THP when KSM only
>    intended to process a single 4KB page. This bypasses KSM's
>    pages_to_scan rate limiting, causing ~1GB to be freed almost
>    instantly.
> 
> 2. use_zero_pages=0: The same split side-effect occurs through the
>    stable/unstable tree merge paths. Each pages_to_scan iteration
>    triggers an expensive split_huge_page() that silently frees 2MB,
>    while the scanner wastes cycles on tree searches for zero-filled
>    pages that were already freed as a side-effect.
> 
> Introduce current_is_ksmd(), to check if the current task is the KSM
> thread. Use it in try_to_map_unused_to_zeropage() to skip zero-page
> remapping when the split is triggered by ksmd. Allow remapping during
> reclaim running in ksmd's context.
> 
> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> ---
> This patch fixes a bug in KSM where the pages_to_scan limit is
> bypassed and the policy (use_zero_pages) is ignored.
> 
> Commit b1f202060afe ("mm: remap unused subpages to shared zeropage when
> splitting isolated thp") added zero-page remapping when an anonymous
> folio is split, including splits triggered by KSM.
> 
> Skip zero-page remapping when ksmd triggers the split, while allowing
> remapping during reclaim running in ksmd's context.
> 
> Changes in v3:
> - Drop the patch gating zero-page remapping on shrink_underused.
> - Allow zero-page remapping during reclaim running in ksmd's context
> - Add a comment explaining the ksmd check (David Hildenbrand).
> 
> V2: https://lore.kernel.org/all/20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev
> V1: https://lore.kernel.org/all/20260609114619.144416-1-npache@redhat.com/
> RFC: https://lore.kernel.org/all/20260508170509.640851-1-npache@redhat.com/
> ---
>  include/linux/ksm.h | 6 ++++++
>  mm/ksm.c            | 5 +++++
>  mm/migrate.c        | 8 ++++++++
>  3 files changed, 19 insertions(+)

LGTM, so

Acked-by: Xu Xin (vivo) <xu.xin@linux.dev>

> 
> diff --git a/include/linux/ksm.h b/include/linux/ksm.h
> index a0d358a1feb6..23c8e9f60118 100644
> --- a/include/linux/ksm.h
> +++ b/include/linux/ksm.h
> @@ -17,6 +17,7 @@
>  #ifdef CONFIG_KSM
>  int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
>  		unsigned long end, int advice, vm_flags_t *vm_flags);
> +bool current_is_ksmd(void);
>  vma_flags_t ksm_vma_flags(struct mm_struct *mm, const struct file *file,
>  			  vma_flags_t vma_flags);
>  int ksm_enable_merge_any(struct mm_struct *mm);
> @@ -144,6 +145,11 @@ static inline int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
>  	return 0;
>  }
>  
> +static inline bool current_is_ksmd(void)
> +{
> +	return false;
> +}
> +
>  static inline struct folio *ksm_might_need_to_copy(struct folio *folio,
>  		struct page *page, struct vm_area_struct *vma, unsigned long addr)
>  {
> diff --git a/mm/ksm.c b/mm/ksm.c
> index d24b129932bf..60656b05419a 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -2873,6 +2873,11 @@ static int ksm_scan_thread(void *nothing)
>  	return 0;
>  }
>  
> +bool current_is_ksmd(void)
> +{
> +	return kthread_func(current) == ksm_scan_thread;
> +}
> +
>  static bool __ksm_should_add_vma(const struct file *file, vma_flags_t vma_flags)
>  {
>  	if (vma_flags_test(&vma_flags, VMA_MERGEABLE_BIT))
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 65869b8acec5..b0949f43ed5c 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -305,6 +305,14 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
>  	if (PageCompound(page) || PageHWPoison(page))
>  		return false;
>  
> +	/*
> +	 * When a split is triggered by KSM, let KSM take care of scanning for
> +	 * and deduplicating the shared zeropage. Reclaim in the ksmd context
> +	 * should still be able to reclaim zero-filled pages.
> +	 */
> +	if (current_is_ksmd() && !current->reclaim_state)
> +		return false;
> +
