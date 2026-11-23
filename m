Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434836;
	b=bjWhAYKhJrpPjsMComH0CJq2dpRMmK+e7oTohlkABQV1PCZ4r+wkaFILqbT92RpsycMG
	 A4m6HLHAolZ/UaElL/+xmxsrawbdfOq2pp6wtqeik0p+1vNg54DXj2Vh07jAUpALv/RJf
	 cFeWnbDBvSbC/mYM06L6+zofhtLihHYh9K5CcZ12dgKAijYliqERAdMK/g61o/Fao7Bl5
	 EANMSNTePBobg/Qbix7zDv1LPJLCFLwmlTeztF+eFp41Lg+fMAWHy22B00T6vHJOuhfa5
	 Ztk9H8bfFT7KgkiMIqMYDbti0UHfjH2S7qKDZ8tkeNkTxWP032wSSgQ0LweJu+uwojQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434836;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rtnqsqXHQKuDC8iW2zmEn4j43knd0EsHyQCpFt+z1m4=;
	b=L1KbiwegfMIFTHwjia0ZJXjshjDEUKBE2jqK9M2xx2pnb9mhe4uiiDTEGjPdh4wFAdmL
	 d25LxinTTMJ6BVgjhD75BAka5u5K+F4wJBsPSyAg6OBeouRbXXryFFh72GYWkdbyxMmr7
	 8OA6AfN0PqUyP8jYTypiGB765xOJO+k7S2LvkCmZNuLxPXXOr+ULV6gWBOryPxbxNy17r
	 0914a5evac+se8m44LtQ10+q0BngfNSrA3i5SfCQXtdz8quMSBhsPWRvziNim+slZn8ur
	 6ctI7FpvMJaNY+96BzN6OVh+4Zp1M44ju8l8GBI8kRciq+zLyGcWdiX2d8xj/X7yDYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIM0+eRo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D693D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIM0+eRo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3C51F000C6;
	Mon, 23 Nov 2026 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795434836;
	bh=rtnqsqXHQKuDC8iW2zmEn4j43knd0EsHyQCpFt+z1m4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JIM0+eRoUDbIDakme8gpu8Dw9+Hw3XPCKCjTUoxiyGyWw4qFYt4lIvhSMKOihxx25
	 U58hML0Fp6d/RR6M9hj4GjDKY2SRaynGZMNJS21V8u9QMhkaS9jKRQ1HqstRF4xNI0
	 K8KaoEWXnH7BKtAcR+hUJ1xyGXFjUwltsRAj7Jx7aACtCnMo9TXzI0FZypxc29tofv
	 r6IjYcYVjPLTQbvgdPXIIcJIvElblOueuZsrsyzehwoEhJyCmqnbwIIiMDti5JFVBm
	 4zAXUpGx5KQwRjK02CGfjHL1ISOb8RExx95fCZZQXfNYsUIoUAmaICpNTouWn317Zu
	 6PKo7++42ebOA==
Date: Mon, 23 Nov 2026 11:53:50 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/rmap: flush the TLB once per mapping in
 page_vma_mkclean_one()
Message-ID: <awQo2tg9rzMJYCQe@gremlin>
References: <20261123-feat-mm-mkclean-batch-flush-v1-1-7e998ad13251@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-feat-mm-mkclean-batch-flush-v1-1-7e998ad13251@linux.dev>

On Mon, Nov 23, 2026 at 05:41:38AM -0500, Qiliang Yuan wrote:
> Writeback calls folio_mkclean() on every folio it writes, which
> write-protects and cleans each PTE that maps the folio, so that the
> next store through the mapping faults and redirties it.
>
> page_vma_mkclean_one() does this with ptep_clear_flush(), one TLB flush
> per PTE. A large folio mapped by PTEs thus costs as many flushes as it
> has pages, each an IPI to the other CPUs the mm runs on. Writing an
> 8 GiB file through a shared mapping on xfs flushes the TLB 2,097,152
> times for 65,575 folios, and the writer spends about half of its time
> in the IPIs and flushes.
>
> Write-protect and clean the PTEs with ptep_modify_prot_start() and
> ptep_modify_prot_commit(), as change_protection() does, and flush the
> range they cover once after the walk. The flush still happens before
> folio_mkclean() returns: stores through a stale TLB entry complete
> before writeback reads the folio, and later stores fault.
>
> Writing an 8 GiB checkpoint to brd through a shared mapping, one file
> per writer, then msync(), median of 6 runs:
>
>   fs     writers   before (s)   after (s)   change
>   xfs          1         5.57        2.98     -46%
>   xfs          8         5.37        2.10     -61%
>   ext4         1         7.88        3.90     -50%
>   ext4         8         5.10        2.02     -60%
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

You are flooding the kernel with patches, 6 series across 4
subsystems over 19 hrs:

https://lore.kernel.org/all/?q=f%3Aqiliang.yuan%40linux.dev

Please don't do that :)

Given the volume both recently and in the past I assume you are using an LLM to
do this, so could you confirm your understanding of the problem (as well as
those of patches sent to other subsystems) and what real-world task you were
doing to identify this issue?

See https://docs.kernel.org/process/generated-content.html especially the
paragraphs at the end.

In general a core team member tends to take over stuff like this.

> ---
>  mm/rmap.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 65646ed6fc453..4c3d9cb47e550 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1127,6 +1127,7 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
>  	struct vm_area_struct *vma = pvmw->vma;
>  	struct mmu_notifier_range range;
>  	unsigned long address = pvmw->address;
> +	unsigned long flush_start = ULONG_MAX, flush_end = 0;
>
>  	/*
>  	 * We have to assume the worse case ie pmd for invalidation. Note that
> @@ -1156,10 +1157,11 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
>  				continue;
>
>  			flush_cache_page(vma, address, pte_pfn(entry));
> -			entry = ptep_clear_flush(vma, address, pte);
> -			entry = pte_wrprotect(entry);
> -			entry = pte_mkclean(entry);
> -			set_pte_at(vma->vm_mm, address, pte, entry);
> +			entry = ptep_modify_prot_start(vma, address, pte);
> +			ptep_modify_prot_commit(vma, address, pte, entry,
> +						pte_mkclean(pte_wrprotect(entry)));
> +			flush_start = min(flush_start, address);
> +			flush_end = max(flush_end, address + PAGE_SIZE);
>  			ret = 1;
>  		} else {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> @@ -1193,6 +1195,12 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
>  			cleaned++;
>  	}
>
> +	/*
> +	 * Flush the write-protected PTEs once rather than one by one, before
> +	 * the caller writes the folio back, as change_protection() does.
> +	 */
> +	if (flush_end)
> +		flush_tlb_range(vma, flush_start, flush_end);
>  	mmu_notifier_invalidate_range_end(&range);
>
>  	return cleaned;
>
> ---
> base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
> change-id: 20261123-feat-mm-mkclean-batch-flush-686d20219b52
>
> Best regards,
> --
> Qiliang Yuan <qiliang.yuan@linux.dev>
>

--
Cheers, Lorenzo
