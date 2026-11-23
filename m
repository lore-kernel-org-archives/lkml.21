Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451642;
	b=d7HWNpffyblk18WfT5P3NpW0c1erMKxJxU0NWIsaInTkQd3Eiiv/98lvU8hAyeJsTi4V
	 1wZhVExfnRFhA5beJK965waPSRAtyN57TQAgxPx/fzwOqrQRlWm+p152BNqNELm1Lnjxj
	 W8t1Jz3A8DT+rGp9e/wbOo4t4WlyAojKc6/MlodiRIoKnGbPSxhikOLeU0TqJFgKzxbVz
	 eGD+7jG20M/ZxlWNEYmIzmp/3um9+OFjLobmXqXmdKuaxtmQJj7goxNdojKeMeqcmFqyl
	 zQ5FZ1unBO/49eUiW0TiwwdB7a3jOEpgVUOjGcxTMFMGdL6CDzXqdd4FANNBGIYeBUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451642;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XcUIc/Z2IDBd5zkYKP4F1aNbn+BFCP/Skc2wY3aN9mA=;
	b=j1cj3f+Kvulqy6290i6Y3bEzIk9dUomSSN6SZbW+veskYMhw5WqcLq9tcY+UQQQyxlrP
	 WQpZ7LkUWLv+JnmWrZNLRLAs+TkcBQ1zvxObF1MeblIhBBKDNar6S2pnwyf5vBS7TyNPj
	 eL3F3M9PCMo/J1bSu3Gxk0ANMBeQFQt+UB+0ImR85sqwRYI7y8PopM3GfPsB2Z+qoqbW3
	 BO/MGvuBxv4Id7IEsV0/x8BMZdyRabxS79DlKtUyTpOMrm373zKAuVRL0jIBkKWHfkCdw
	 URYBC5I1YKyDV31/B4evQVlZL2ht5VuC9B0VurwC+ZZcXLtsAt98Z8Ds5jsHKZbX6cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z9jcdZOG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A6E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z9jcdZOG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA571F000D2;
	Mon, 23 Nov 2026 16:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795451641;
	bh=XcUIc/Z2IDBd5zkYKP4F1aNbn+BFCP/Skc2wY3aN9mA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Z9jcdZOG0X8oS8S0q2V8LXzfYrqMDbKLNthqaEGxvKHxIrfzxpGvTBNeQEQwCIzMs
	 /FQmmKmv4se+QU3ueoSiOfyhjHxy0MMoxKHnkb9k43NlDzhuf5DPX8ZmjHUOWf26X0
	 4CiKU3rWbh0cnbnDJ7qCVKiRvIKfzjiZIZQEgNZsaTsR9kRzjLlr8x2WtPOGkXfDTz
	 3snWz4a1JN86WzuaVTadKwBSaQTT/T1hSuU1Us0bLRRzhPIIgxJNuEt4fjVQ2REUo+
	 /qG+mQjt4snrBOofs92ogQzCJto95dW7IGIDIuBJNlA9r7nqgGNedlm77e5AlRaQPB
	 IoSqNQa4REaxg==
Message-ID: <27c7a176-cd38-4e2c-b2e6-ad63b79ffc07@kernel.org>
Date: Mon, 23 Nov 2026 17:33:51 +0100
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
Subject: Re: [PATCH v3] mm/ksm: prevent zero-page remapping during
 ksmd-triggered THP splits
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>,
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
References: <20261122-b4-ksm_fixv2-v3-1-f78ea7779746@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261122-b4-ksm_fixv2-v3-1-f78ea7779746@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/22/26 23:20, Nico Pache (Red Hat) wrote:
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

[...]


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

I do wonder if we wan to make this an inline function to not require a function
call just to check this.

Thoughts?

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

Probably helpful to throw in an unlikely() and to to reverse the checks
(checking the latter is cheaper than the former).

In general LGTM.

-- 
Cheers,

David
