Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188166;
	b=pXHs3bbRRJ4Rb22N91zQDHxwiPYqONpdCJovPdDxNct0P0WHb3bvpnLXirkzWeAcGNug
	 6+X4eQ9hs/7frXGi+nf6ZVQ2mmyQTSUt4cxGH2Gl36zzpMCncofatTYOtp96qysTkz4RG
	 LlAY1a+3MAc281Oisk6d2CFTw+5d1bKgT1EE6F/Ot9GraNLrbzJagPZDzY/HuYZNPm4NP
	 lHTlb91qLKRN3I2Tav2yYNgXPAvDI7N6C9kqmbZdZk0TwNA9bW9RT1aARhsuPIdSf0muT
	 fPj40OF3oMWRDLyi7Me6e79sRBPS+qeIeLL6yd5nWeS9mBx0actWKoiKbaiIzTFmkwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188166;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QqS+qF73GHZJLanntYt4ZL3GQPK5ntqIkF074E0sSaY=;
	b=Yq62vBkkbUkGCDrGiCMwpD/fEpVB+iaRSW04PSi9CVNFYXpF3iWxj+4D1gJTlfSF38Ec
	 pTrmH0lAl+l9X4X46TJ9AWTVcLSQKI214ijwKDDevX/4VhTuFIqXROoTVRDxEQ6e23JET
	 gaOOaoaWfmFtsbbxK99b9/5vpmd5+nI18AKHmfq9YnGpqEIExNeCG1ceLyuqkmisYnskA
	 Xr8hXXFQIxdkIg5lreMuV4TTRQpBdI1JlMdtWO2eaSNbDegOAQd91svZM+A/sRuAz2+7G
	 bN+UxqybYIiGhBm/FnB2uSiiTYw6ju1YO8xIoU/KlctXpMO6BSSVvJpL1NBZJdHhJWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQnJPqvn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FC8606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQnJPqvn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E821F000C0;
	Fri, 20 Nov 2026 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188165;
	bh=QqS+qF73GHZJLanntYt4ZL3GQPK5ntqIkF074E0sSaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hQnJPqvnbFD2+tssbhPSfU9zKKdvccfJjl3gMjqqY8y9TylHWQvBmcTr97isBZWkN
	 o94x1OUsgPKGsC9gQ0xjyhnl+Z4p7/D6bXqeatVMD2y0bF1ONXdsIh7/ATaboGlHeO
	 b9B91VqeHFICoNB/4bkABWQROT+KQVz+b3elB8+0NYEPB4uTFeD7rjIMxDzd6LvmDa
	 nXB5ma87Z7/e0g3b8+/PI/g7g0MMgukv+Z5LJXtRD/MCV+cV9IA4RnLv7h01QbMBDf
	 Yt9poiMxcXAJhDTswDdg+GmSnhXJ0WeKpMeng1lgq7OldvEHE+VuGR2wgcMe9hbwcI
	 UuVz1P3QLNujw==
Date: Fri, 20 Nov 2026 15:22:40 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: david@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com
Subject: Re: [PATCH 2/3] mm/migrate: batch PTE restoration in
 remove_migration_pte()
Message-ID: <awBjoC-YFf6KPYT1@gremlin>
References: <20261120032949.2036731-1-chenwandun1@gmail.com>
 <20261120032949.2036731-3-chenwandun1@gmail.com>
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
In-Reply-To: <20261120032949.2036731-3-chenwandun1@gmail.com>

On Fri, Nov 20, 2026 at 11:29:48AM +0800, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
>
> remove_migration_pte() restores PTE-mapped large folios one PTE at a
> time, constructing each new PTE and updating the folio references and
> rmap separately.
>
> Add migration_pte_batch() to find adjacent migration entries with
> consecutive PFNs and matching type and flags.
>
> When a batch covers the whole folio, the rmap helpers already call
> mlock_vma_folio(). Skip the explicit call to avoid double mlock
> accounting.
>
> Device-private PTEs encode PFNs as swap offsets. set_ptes() does not
> handle this encoding when constructing subsequent PTEs, such as on
> arm64 with a 16KB page granule, leaving device-private destinations
> unbatched. The next patch enables batching for these entries by
> advancing their softleaf offsets.
>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Link: https://lore.kernel.org/lkml/5f9c449e-43b3-4732-9c14-8199418cace0@kernel.org/
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> ---
>  mm/internal.h |  6 ++++++
>  mm/migrate.c  | 35 +++++++++++++++++++++++++++++------
>  2 files changed, 35 insertions(+), 6 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 9f78c12882cb..e6ecf307d532 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -552,6 +552,12 @@ static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>  	return __softleaf_pte_batch(start_ptep, max_nr, pte);
>  }
>
> +static inline int migration_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
> +{
> +	VM_WARN_ON(!softleaf_is_migration(softleaf_from_pte(pte)));
> +
> +	return __softleaf_pte_batch(start_ptep, max_nr, pte);
> +}
>  #endif /* CONFIG_MMU */
>
>  void __acct_reclaim_writeback(pg_data_t *pgdat, struct folio *folio,
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 3c39d309e6bd..e000ef77ea87 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -358,6 +358,7 @@ static bool remove_migration_pte(struct folio *folio,
>  	while (page_vma_mapped_walk(&pvmw)) {
>  		rmap_t rmap_flags = RMAP_NONE;
>  		unsigned long idx = 0;
> +		int nr = 1;
>  		softleaf_t entry;
>  		struct page *new;
>  		pte_t old_pte;
> @@ -441,17 +442,34 @@ static bool remove_migration_pte(struct folio *folio,
>  		} else
>  #endif
>  		{
> +			if (folio_test_large(rmap_walk_arg->folio) &&
> +			    !is_device_private_page(new)) {
> +				unsigned long end_addr = pmd_addr_end(pvmw.address, vma->vm_end);
> +				unsigned long max_nr = (end_addr - pvmw.address) >> PAGE_SHIFT;

const please

> +
> +				max_nr = min_t(unsigned long, max_nr,
> +					       PTRS_PER_PTE - pte_index(pvmw.address));
> +
> +				max_nr = min_t(unsigned long, max_nr,
> +					       folio_nr_pages(rmap_walk_arg->folio) - idx);
> +
> +				nr = migration_pte_batch(pvmw.pte, max_nr, old_pte);
> +			}
> +			if (nr > 1)
> +				folio_ref_add(folio, nr - 1);
> +

Please let's not insert a bunch more open-coded bits in an already way-too-big
function :)

If you need to add functionality to a function like this, please take the time
to pay down technical debt and refactor it first.

>  			if (folio_test_anon(folio))
> -				folio_add_anon_rmap_pte(folio, new, vma,
> -							pvmw.address, rmap_flags);
> +				folio_add_anon_rmap_ptes(folio, new, nr, vma,
> +							 pvmw.address, rmap_flags);
>  			else
> -				folio_add_file_rmap_pte(folio, new, vma);
> -			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
> +				folio_add_file_rmap_ptes(folio, new, nr, vma);
> +			set_ptes(vma->vm_mm, pvmw.address, pvmw.pte, pte, nr);
>
> -			ptes++;
> +			ptes += nr;
>  		}
>  		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
>  			if (folio_test_large(folio) &&
> +			    nr < folio_nr_pages(folio) &&
>  			    ptes == folio_nr_pages(folio) &&
>  			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
>  				mlock_vma_folio(folio, vma);
> @@ -462,7 +480,12 @@ static bool remove_migration_pte(struct folio *folio,
>  					   compound_order(new));
>
>  		/* No need to invalidate - it was non-present before */
> -		update_mmu_cache(vma, pvmw.address, pvmw.pte);
> +		update_mmu_cache_range(NULL, vma, pvmw.address, pvmw.pte, nr);
> +
> +		if (nr == folio_nr_pages(folio)) {
> +			page_vma_mapped_walk_done(&pvmw);
> +			break;
> +		}
>  	}
>
>  	return true;
> --
> 2.43.0
>

--
Cheers, Lorenzo
