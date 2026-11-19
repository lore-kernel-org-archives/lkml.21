Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096609;
	b=RSKaSAGIW9nIR5fWiGABRs272REzSWdeWsWbbOLF9mpHdgaSUgWQfmWp0mNhRuXX792g
	 wuP1K+5qJh9gQWTGlwmfSXYhZ6ZBMyq7srfbjNA5uMBPHdbJD5LrDYwzI1OsSNIfwG8Cv
	 X6K9jKGod7SQFAwXt7R5y8hyl7AExLKKMRu107Iidcnqcj/vYUDU9pqycOK4x8sNceH7v
	 BrbEmKFCbFGyq1mCpHWq8SDB5ccRd4Ag8oGlWRrYUIn9xZyytGXCe3kn0P9slKIYQOpSE
	 0x9BCWzx7Qybb3v5AHmwJpLk/K4dfNFHtJhSnqxj5cLYm5wH7AjMqmMv8KOT6fYQ0oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096609;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qIx6Bux1pGDApEL1rLj1d3nFZ3JSNemgDEDuwGhJ5EE=;
	b=yC7hNRtoxIOPRlvGLl7pIm0O5Fy/iavDGibJk/mTeO0xgKpkyTWkMBTXrsZ4wayne7el
	 LEmSdAYroHCZGhWKclQbTo4VWmY0Db+NmbN/gmWrh5Mn13Anmd4JnOkj/IB2lh6rPw3kl
	 YxarKO8RUkEM1R4fr+CKm5p7HzdyooblJomXBYWdHr1Bu5M9obJiuRaybHtWLmlZuwB3e
	 WTiWRySHmvBUGeouke7xx12lP+lHtN+NRFKlCarpKSbhb1RCIoSV2WxXdQbqd+WgaN+02
	 MDaO4fUaKORfggCKinPHvKRZ/vXJXUt3WO/CYoaGbQD2YqPqI7aaoorjNdSWZ7E43kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AX6N7NUK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2498A606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AX6N7NUK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895931F000C4;
	Thu, 19 Nov 2026 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096609;
	bh=qIx6Bux1pGDApEL1rLj1d3nFZ3JSNemgDEDuwGhJ5EE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AX6N7NUKv9mp9gn/kzY4kW5RrUPF3SGn22v25jisQSCjWcWuPJlf2UIgxrTPgJrjw
	 jk3pE00l2yTz0rptfaTyhdgb0u3Qh1tUpO0Ek1x/nZfEikEPoHVoE/XAmwneC0tq3d
	 UdafLEl3OFft6hrgq5E3rA5WFjycxMy2bi2mendulJ+X8xyJkWoQHFmOk9znESazxU
	 ce5YuJQoIV7sGcuDwBEWKznEAWMfDKC5Jad//dK6Hg8dJ1sHVWDbm/2xXORSWyFR2Z
	 qh2BdQ1nJojbo/tN6VMNx+Js/s7+x99Otf9buy76+dZyy3fISX7tujJ/6GXSNY8UIx
	 TIZVAYjgdLx2w==
Date: Thu, 19 Nov 2026 13:56:42 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>, "Liam R. Howlett" <liam@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 2/3] mm/memory: remove the mkwrite argument from
 __vm_insert_mixed()
Message-ID: <av7_y5u1E1hps9q9@gremlin>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
 <20261002160535.661399-3-ekffu200098@gmail.com>
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
In-Reply-To: <20261002160535.661399-3-ekffu200098@gmail.com>

On Sat, Oct 03, 2026 at 01:05:33AM +0900, Sang-Heon Jeon wrote:
> __vm_insert_mixed() is only called from vmf_insert_mixed() with
> mkwrite == false, so mkwrite is also always false in vm_mixed_ok()
> and insert_pfn().
>
> So remove the argument and the unreachable code in insert_pfn().
>
> No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Very nice, thanks!

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/memory.c | 57 +++++++++++++++++------------------------------------
>  1 file changed, 18 insertions(+), 39 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 4b2e4be28031..6c1d38eba7b2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2453,7 +2453,14 @@ static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
>  		if (!mkwrite)
>  			return -EBUSY;
>
> -		/* see insert_pfn(). */
> +		/*
> +		 * For read faults on private mappings the PFN passed in may
> +		 * not match the PFN we have mapped if the mapped PFN is a
> +		 * writeable COW page.  In the mkwrite case we are creating a
> +		 * writable PTE for a shared mapping and we expect the PFNs to
> +		 * match. If they don't match, we are likely racing with block
> +		 * allocation and mapping invalidation.
> +		 */
>  		if (pte_pfn(pteval) != page_to_pfn(page)) {
>  			WARN_ON_ONCE(!is_zero_pfn(pte_pfn(pteval)));
>  			return -EFAULT;
> @@ -2858,7 +2865,7 @@ int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
>  EXPORT_SYMBOL(vm_map_pages_zero);
>
>  static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
> -			unsigned long pfn, pgprot_t prot, bool mkwrite)
> +			unsigned long pfn, pgprot_t prot)
>  {
>  	struct mm_struct *mm = vma->vm_mm;
>  	pte_t *pte, entry;
> @@ -2868,38 +2875,12 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>  	if (!pte)
>  		return VM_FAULT_OOM;
>  	entry = ptep_get(pte);
> -	if (!pte_none(entry)) {
> -		if (mkwrite) {
> -			/*
> -			 * For read faults on private mappings the PFN passed
> -			 * in may not match the PFN we have mapped if the
> -			 * mapped PFN is a writeable COW page.  In the mkwrite
> -			 * case we are creating a writable PTE for a shared
> -			 * mapping and we expect the PFNs to match. If they
> -			 * don't match, we are likely racing with block
> -			 * allocation and mapping invalidation so just skip the
> -			 * update.
> -			 */
> -			if (pte_pfn(entry) != pfn) {
> -				WARN_ON_ONCE(!is_zero_pfn(pte_pfn(entry)));
> -				goto out_unlock;
> -			}
> -			entry = pte_mkyoung(entry);
> -			entry = maybe_mkwrite(pte_mkdirty(entry), vma);
> -			if (ptep_set_access_flags(vma, addr, pte, entry, 1))
> -				update_mmu_cache(vma, addr, pte);
> -		}
> +	if (!pte_none(entry))
>  		goto out_unlock;
> -	}
>
>  	/* Ok, finally just insert the thing.. */
>  	entry = pte_mkspecial(pfn_pte(pfn, prot));
>
> -	if (mkwrite) {
> -		entry = pte_mkyoung(entry);
> -		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
> -	}
> -
>  	set_pte_at(mm, addr, pte, entry);
>  	update_mmu_cache(vma, addr, pte); /* XXX: why not for insert_page? */
>
> @@ -2967,7 +2948,7 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
>
>  	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
>
> -	return insert_pfn(vma, addr, pfn, pgprot, false);
> +	return insert_pfn(vma, addr, pfn, pgprot);
>  }
>  EXPORT_SYMBOL(vmf_insert_pfn_prot);
>
> @@ -2998,11 +2979,9 @@ vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>  }
>  EXPORT_SYMBOL(vmf_insert_pfn);
>
> -static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn,
> -			bool mkwrite)
> +static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn)
>  {
> -	if (unlikely(is_zero_pfn(pfn)) &&
> -	    (mkwrite || !vm_mixed_zeropage_allowed(vma)))
> +	if (unlikely(is_zero_pfn(pfn)) && !vm_mixed_zeropage_allowed(vma))
>  		return false;
>  	/* these checks mirror the abort conditions in vm_normal_page */
>  	if (vma->vm_flags & VM_MIXEDMAP)
> @@ -3013,12 +2992,12 @@ static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn,
>  }
>
>  static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
> -		unsigned long addr, unsigned long pfn, bool mkwrite)
> +		unsigned long addr, unsigned long pfn)
>  {
>  	pgprot_t pgprot = vma->vm_page_prot;
>  	int err;
>
> -	if (!vm_mixed_ok(vma, pfn, mkwrite))
> +	if (!vm_mixed_ok(vma, pfn))
>  		return VM_FAULT_SIGBUS;
>
>  	if (addr < vma->vm_start || addr >= vma->vm_end)
> @@ -3045,9 +3024,9 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
>  		 * result in pfn_t_has_page() == false.
>  		 */
>  		page = pfn_to_page(pfn);
> -		err = insert_page(vma, addr, page, pgprot, mkwrite);
> +		err = insert_page(vma, addr, page, pgprot, false);
>  	} else {
> -		return insert_pfn(vma, addr, pfn, pgprot, mkwrite);
> +		return insert_pfn(vma, addr, pfn, pgprot);
>  	}
>
>  	if (err == -ENOMEM)
> @@ -3086,7 +3065,7 @@ EXPORT_SYMBOL_GPL(vmf_insert_page_mkwrite);
>  vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
>  		unsigned long pfn)
>  {
> -	return __vm_insert_mixed(vma, addr, pfn, false);
> +	return __vm_insert_mixed(vma, addr, pfn);
>  }
>  EXPORT_SYMBOL(vmf_insert_mixed);
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
