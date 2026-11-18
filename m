Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028419;
	b=HslvF6p7WTw72+671UoBUtN0JE5XmCyWz8S5nGhdkwI7pyRwp2u4t7jrc6lB56kSRUip
	 BFtN6V1MXi4h8gFrgP7jVoF6fL1BcsX+K9zdx2lmILgYJWq65IgjDNVuPeRS7ErZWDd8s
	 oGlADGAdi2Re2nqevFdz4bXkwAH+NWiF3TTxZtlLWInIbPwVt2K4wOil4TZe07Myod9FN
	 1QPwSsKdNqRjWdjf6LaAejnZFHkJ3fqPHOQC1Lkm22O82gA2+hCIHfjW2DmUbnC/72ffW
	 dOosnwQ5DrC4YN9VszcoXgPt2U0gXv5K7HFolLecCeUlVfdNTdpz7lXEEJBK+nrmYog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Os+tb29jNMnP2oCpww6m9nFCa+COo9vLvWye7mQzAMM=;
	b=Y6QyEWTxE2aNvqyG7EKbrO4eG4nQ12WFoC0oNPV4eXl34BI798/FsYKAcQnRpd8Djqc2
	 eHm6RCHQjEqj2lO3O4Nqkc2xzTp9W5VPUIo10dVZsnUBN9COf02rFzrG9TPsDyZ3xha+i
	 tRyfI+kGADihfIO+BF4x12RRu64Raf4JkLs7coAJ1e7H6CXseMbq7hfKiN1vcMmRX8Lqh
	 WLcncJGIfnuQcV6c+D/Bq4Xv9CR5/pHY+W4R7amgEoi9ySdmCHvqHW+Urm+7H1EfK/WVp
	 asZPHsZozbb+QKfI1eGlZoVZFXKZ093gtqnnte48J+WFpM2d2nsblKJln4R36wonHSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oU4lsZmV;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC356606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC356606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oU4lsZmV
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so598718a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795028417; x=1795633217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Os+tb29jNMnP2oCpww6m9nFCa+COo9vLvWye7mQzAMM=;
        b=oU4lsZmV1PkgL9roaXPM478SlLBUgSwP48rs0SQBrBvN1LckftOztWeyKPg1IhPphV
         SZZNZlsHFwmkP5NEvknW72NWgumbp0yYjOiFvHUMW65EaARDkAZNMZZLQpavIjGtcs9X
         LWTo5bljzw7qGs0Oj+/P7M0QYpfl+NF5Sn/jd39QHp8DvPZntucdO9fk3ws72rDlziwS
         zksmItPHTsX+xPYxoeFSzKTXFaelck2itKi6RBGrerjXKFDnDq3hKruQxuaKwYvJOI46
         MdM1Ofceo0bOcDnc1w6thFb1Xb1DQvOkvAWfMBxBw8xJ+zgoeiHxrlt0pS+CVli3iB0n
         uNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028417; x=1795633217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Os+tb29jNMnP2oCpww6m9nFCa+COo9vLvWye7mQzAMM=;
        b=sEA6KkzA9L1T6N4u7RhFYPlxbPNIq3ICzLne2sWKicslpaPm5/T6Cwf/0zSA1c+53G
         3G4EoT+CLHSzSx5zs9VpCxWlUUSXnUjH7Ew6D3LAxtrMRBGrETTkNZ/s9VJ3FPlaQ8yh
         W2Z3X3lMGTYp65jBq2oolL3+lZmI89bL1ct9G8zzY9WxQjVkVMfgidwFhHHjTiPR3Fzj
         ZpNDt66bjGkQbGZ63il3U3P7grr927CnEdBrqfM8Fm/5d7bfCi0sPxszb1PmvFgZcDPt
         0wHCGjrZWe9tXS7HKKd4CHzbqHr2yoqhuc3HQ7OSXAu4IIOUqGF9d63DpNBzTJyK9VGy
         RhWA==
X-Forwarded-Encrypted: i=1; AL+hErHfJULGZ4GXgem5EPALMaI2KWlJmMGl5dfqSdmtLUUZxv+5bolGGLRTNrXACXZ3XXfk9+dInZrBVEKpGks=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rUbVlbbvKZonV7QRJ9PhSLqTq1v6VWfZb6Ctnu5JCiB+RQjuT
	FM9JTU0WcM8t2CcHlgC9m5ISwXovqUVkavDxsv9VTEYY/UN+iPb4CXve
X-Gm-Gg: AYBFou0jOYkVxopqr1RcSnqk2IDTqAScu0e041xKHjy14YLpaZmD1soZKD7qF8URLew
	UJMduxHUf8PATTXgv5Hu2DL+tuB6NPXr3Fwq+Zj1LLtqYAu6Hl+mPuYwo0vDyfNWRw4luQLH95p
	tB2GaBR1THBUQROHi4Jx+B59pmvLSLiKd252eX+rfxfDH1cmeO5qkXt1rtjKuLsKPLXYUTMcpfb
	ZHpGozNDB+a9OjFKhPNHkc+lNYOjvbt/b30ijCqT82ocoUi7Dj+5EinJ6utQ282RAoGAjn6HsVc
	NUrrPltikAXsp8c284K6FHPJyxaPjnBFb0LQ7y8BKKyXojZQLyA/xfssCAymDYRQRgib435EO6r
	jeKhOy9VNN+CGArNUbeboXJC+tkj8hFHRmjEADci7SPWYPAvH/ZQGLdcqDN23M/rjj7iM5IKD5N
	gXUXsJE39IxLiK/rXjTsASbgs5NFIBHg/wBUAb7W4CYhDBB3gxeKY0u40wE6SDZRbqdx9sCyslD
	4c2kowUKqYXzExYz2e6atjIEwhvvUiR3hDlAPwq1JGXuTX/aEqe5c5RkmLd/a8pmsaa4+/+7Anm
	aMqSQtnxN58yizs=
X-Received: by 2002:a05:6402:4409:b0:6b8:8815:ffcc with SMTP id 4fb4d7f45d1cf-6b88816003amr2894326a12.18.1795028416871;
        Wed, 18 Nov 2026 11:00:16 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a1eb813sm1357442a12.26.2026.11.18.11.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:00:16 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 18 Nov 2026 20:00:13 +0100
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v5 01/11] mm/vmalloc: skip cond_resched() in the vmap
 unmap paths when atomic
Message-ID: <av31vR89G64KJHpj@milan>
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-2-hao.ge@linux.dev>
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
In-Reply-To: <20261116071325.263682-2-hao.ge@linux.dev>

On Mon, Nov 16, 2026 at 03:13:15PM +0800, Hao Ge wrote:
> The vmap failure paths can be reached with GFP_ATOMIC or GFP_NOWAIT
> since commit b186a94227b7 ("kmsan: remove hard-coded GFP_KERNEL
> flags") and commit 8da89ba18ed4 ("mm/vmalloc: handle non-blocking
> GFP in __vmalloc_area_node()"), so an undo of a partially installed
> mapping may have to run in atomic context, where the cond_resched()
> in vunmap_pmd_range() cannot schedule.
> 
> Give __vunmap_range_noflush() and kmsan_vunmap_range_noflush() a
> can_resched argument and skip the cond_resched() when it is false.
> The existing callers are on sleepable paths and pass true, so nothing
> changes for them.
> 
> Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_pages_range_noflush()")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-178439@kernel.org/
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  include/linux/kmsan.h |  8 ++++++--
>  mm/kmsan/hooks.c      | 14 +++++++++-----
>  mm/vmalloc.c          | 24 ++++++++++++++----------
>  mm/vmalloc.h          |  3 ++-
>  4 files changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/include/linux/kmsan.h b/include/linux/kmsan.h
> index 7da9fd506b39..0016c032d1e7 100644
> --- a/include/linux/kmsan.h
> +++ b/include/linux/kmsan.h
> @@ -150,11 +150,14 @@ int __must_check kmsan_vmap_pages_range_noflush(unsigned long start,
>   * kmsan_vunmap_kernel_range_noflush() - Notify KMSAN about a vunmap.
>   * @start: start of vunmapped range.
>   * @end:   end of vunmapped range.
> + * @can_resched: whether the unmap walk may call cond_resched(); pass
> + * false from atomic context.
>   *
>   * KMSAN unmaps the contiguous metadata ranges created by
>   * kmsan_map_kernel_range_noflush().
>   */
> -void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end);
> +void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end,
> +				bool can_resched);
>  
>  /**
>   * kmsan_ioremap_page_range() - Notify KMSAN about a ioremap_page_range() call.
> @@ -355,7 +358,8 @@ static inline int __must_check kmsan_vmap_pages_range_noflush(
>  }
>  
>  static inline void kmsan_vunmap_range_noflush(unsigned long start,
> -					      unsigned long end)
> +					      unsigned long end,
> +					      bool can_resched)
>  {
>  }
>  
> diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
> index a706666db097..69008b085658 100644
> --- a/mm/kmsan/hooks.c
> +++ b/mm/kmsan/hooks.c
> @@ -136,10 +136,13 @@ static unsigned long vmalloc_origin(unsigned long addr)
>  						 KMSAN_META_ORIGIN);
>  }
>  
> -void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
> +void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end,
> +				bool can_resched)
>  {
> -	__vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end));
> -	__vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end));
> +	__vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end),
> +			       can_resched);
> +	__vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end),
> +			       can_resched);
>  	flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
>  	flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
>  }
> @@ -168,8 +171,9 @@ static void kmsan_iounmap_pages(unsigned long start, unsigned long end)
>  		if (origin)
>  			__free_pages(origin, KMSAN_IOREMAP_META_ORDER);
>  	}
> -	__vunmap_range_noflush(shadow_start, shadow_end);
> -	__vunmap_range_noflush(origin_start, origin_end);
> +	/* ioremap metadata mappings are always GFP_KERNEL, so resched is safe. */
> +	__vunmap_range_noflush(shadow_start, shadow_end, true);
> +	__vunmap_range_noflush(origin_start, origin_end, true);
>  	flush_tlb_kernel_range(shadow_start, shadow_end);
>  	flush_tlb_kernel_range(origin_start, origin_end);
>  }
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index ccaf158c5b7f..3c0d9e69b886 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -429,7 +429,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  }
>  
>  static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
> -			     pgtbl_mod_mask *mask)
> +			     pgtbl_mod_mask *mask, bool can_resched)
>  {
>  	pmd_t *pmd;
>  	unsigned long next;
> @@ -451,12 +451,14 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  			continue;
>  		vunmap_pte_range(pmd, addr, next, mask);
>  
> -		cond_resched();
> +		/* The undo path may run in atomic context. */
> +		if (can_resched)
> +			cond_resched();
>  	} while (pmd++, addr = next, addr != end);
>  }
>  
>  static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
> -			     pgtbl_mod_mask *mask)
> +			     pgtbl_mod_mask *mask, bool can_resched)
>  {
>  	pud_t *pud;
>  	unsigned long next;
> @@ -476,12 +478,12 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>  		}
>  		if (pud_none_or_clear_bad(pud))
>  			continue;
> -		vunmap_pmd_range(pud, addr, next, mask);
> +		vunmap_pmd_range(pud, addr, next, mask, can_resched);
>  	} while (pud++, addr = next, addr != end);
>  }
>  
>  static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
> -			     pgtbl_mod_mask *mask)
> +			     pgtbl_mod_mask *mask, bool can_resched)
>  {
>  	p4d_t *p4d;
>  	unsigned long next;
> @@ -496,7 +498,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
>  
>  		if (p4d_none_or_clear_bad(p4d))
>  			continue;
> -		vunmap_pud_range(p4d, addr, next, mask);
> +		vunmap_pud_range(p4d, addr, next, mask, can_resched);
>  	} while (p4d++, addr = next, addr != end);
>  }
>  
> @@ -512,7 +514,8 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
>   *
>   * This is an internal function only. Do not use outside mm/.
>   */
> -void __vunmap_range_noflush(unsigned long start, unsigned long end)
> +void __vunmap_range_noflush(unsigned long start, unsigned long end,
> +			    bool can_resched)
>  {
>  	unsigned long next;
>  	pgd_t *pgd;
> @@ -527,7 +530,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
>  			mask |= PGTBL_PGD_MODIFIED;
>  		if (pgd_none_or_clear_bad(pgd))
>  			continue;
> -		vunmap_p4d_range(pgd, addr, next, &mask);
> +		vunmap_p4d_range(pgd, addr, next, &mask, can_resched);
>  	} while (pgd++, addr = next, addr != end);
>  
>  	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> @@ -536,8 +539,9 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
>  
>  void vunmap_range_noflush(unsigned long start, unsigned long end)
>  {
> -	kmsan_vunmap_range_noflush(start, end);
> -	__vunmap_range_noflush(start, end);
> +	/* The unmap paths are sleepable, keep the resched point. */
> +	kmsan_vunmap_range_noflush(start, end, true);
> +	__vunmap_range_noflush(start, end, true);
>  }
>  
>  /**
> diff --git a/mm/vmalloc.h b/mm/vmalloc.h
> index d8372a4f65c4..4ec114a75f04 100644
> --- a/mm/vmalloc.h
> +++ b/mm/vmalloc.h
> @@ -44,6 +44,7 @@ int __must_check __vmap_pages_range_noflush(unsigned long addr,
>  
>  void vunmap_range_noflush(unsigned long start, unsigned long end);
>  
> -void __vunmap_range_noflush(unsigned long start, unsigned long end);
> +void __vunmap_range_noflush(unsigned long start, unsigned long end,
> +			    bool can_resched);
>  
>  #endif /* __MM_VMALLOC_H */
> -- 
> 2.25.1
> 
This looks good to me. I am not sure if passing gfp_mask is better
here since it is only for checking if-allow-blocking.

--
Uladzislau Rezki
