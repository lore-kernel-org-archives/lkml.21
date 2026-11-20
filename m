Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188904;
	b=WyBeqvH/sdqXnIFm8Ise8+zUoT4eu+wFXNQ+VToSC0BpDicbQmDpzfGT5z7J2tteYJcX
	 7nYRxIBVWN/mvm4PsWgUeRPKpgfOfWcMSvb/dwGTZQzjLYlmP91ExC1m0/kMg50OBvaKS
	 QNOd2qULeq+U7IYeVtBhrah+zRjjslWelEHT7S2GaVUUGbqruld++IzwmjUbAkuKZrZL5
	 cW2SSu9uY90HnK/IrTbJ/zrSCQJXQykM/GPZ/qwRsyYyWlnYiKdjrYQpK5EpjlPgSgHSv
	 Lq0g/upbHavUO+A/a+8eKoJ0786MPD/So/64qwtqeFymxpygNMsakT+h9ssezKWKS8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188904;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JSOR2zLnD451En4fHV4lWcfu2c4ywdgSX1FC2ITuFNY=;
	b=Tcw4y5K2Yghz8eNQee5ukfPlzWFvLGw6FvmUIQrwZkYsHT7dUkOcc5KSPQ/OOrfXV/3O
	 c/wjvxB6nQu2qy2c7PvVsqooBjxBBn8Jg1ySVT5y72mAifyrFPKYNlsQ0ZfL/fYzsFM1+
	 mss6tF9O+xqJS1zRtMS8maQjXqEf78rR0FD46kQ08gYGt97cDeYE0d2/aBg+2nFuWfn2R
	 uM2UDoZFmlHl60i7nl2A2h01mucvbm+XTBROWxn00kPSy74OdbYkEQfsCFN/b/Prg4q7E
	 +HK3AoKTT3y8UwUXazSmf7nWgUBBWEhGFQaOykuljw+fX6h3E4uQ6fzUUXtMQ6w5OMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LSgGPf0o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4A1606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LSgGPf0o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D0C1F000D1;
	Fri, 20 Nov 2026 15:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188903;
	bh=JSOR2zLnD451En4fHV4lWcfu2c4ywdgSX1FC2ITuFNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LSgGPf0oTWQ3yv9VLQ7g2jN3JT+q2sdZtsvBnJLmRxUh241Xp9mrIjyvuzOMaZdDD
	 OM+PWA6RoqjwUMtwqGcXnh8Hf9rVmwx3dxJlV8k3aTLAFc0cNDj/lBXBYAhF8NQd/g
	 dvOP7DcyoMKoCwYN5JoLPR2OD5POi7eCEVtH38ypYNpxFgo4zt57yZ54P5Ig8H+fu+
	 RAw7hL9YjZM3rKgJSLX4GokUtphYJG8AocHGVRd/S9Fc+6P/7424YuaExsXQpJ2N7S
	 IZ8ZWKRCiLP8XgDzw6hrJruNlM6UW6RSzjkNjlDqCp+FwNrl8W8MZmM3MMtodwO0UK
	 FPXuLeYSwZv7g==
Date: Fri, 20 Nov 2026 15:34:58 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: david@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com
Subject: Re: [PATCH 1/3] mm: factor out common softleaf offset PTE batch
 scanning
Message-ID: <awBnU0jVXCS2hj1S@gremlin>
References: <20261120032949.2036731-1-chenwandun1@gmail.com>
 <20261120032949.2036731-2-chenwandun1@gmail.com>
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
In-Reply-To: <20261120032949.2036731-2-chenwandun1@gmail.com>

On Fri, Nov 20, 2026 at 11:29:47AM +0800, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
>
> Extract the consecutive-offset scan from swap_pte_batch() into
> __softleaf_pte_batch() to prepare for migration PTE batching in a
> subsequent patch.
>
> No functional change.
>
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> ---
>  mm/internal.h | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 3a1643afedc0..9f78c12882cb 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -512,29 +512,26 @@ static inline pte_t pte_next_swp_offset(pte_t pte)
>  }
>
>  /**
> - * swap_pte_batch - detect a PTE batch for a set of contiguous swap entries
> + * __softleaf_pte_batch - detect a PTE batch for contiguous softleaf entries
>   * @start_ptep: Page table pointer for the first entry.
>   * @max_nr: The maximum number of table entries to consider.
>   * @pte: Page table entry for the first entry.
>   *
> - * Detect a batch of contiguous swap entries: consecutive (non-present) PTEs
> - * containing swap entries all with consecutive offsets and targeting the same
> - * swap type, all with matching swp pte bits.
> + * Detect a batch of contiguous swap or migration entries: consecutive

You mean softleaf entries?

> + * (non-present) PTEs with consecutive offsets/PFNs and the same entry type,
> + * all with matching swp pte bits.

Maybe 'softleaf bits'? Ah I wish I finished the softleaf conversion properly :P

>   *
>   * max_nr must be at least one and must be limited by the caller so scanning
>   * cannot exceed a single page table.
>   *
>   * Return: the number of table entries in the batch.
>   */
> -static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
> +static inline int __softleaf_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>  {
>  	pte_t expected_pte = pte_next_swp_offset(pte);
>  	const pte_t *end_ptep = start_ptep + max_nr;
>  	pte_t *ptep = start_ptep + 1;
>
> -	VM_WARN_ON(max_nr < 1);
> -	VM_WARN_ON(!softleaf_is_swap(softleaf_from_pte(pte)));
> -
>  	while (ptep < end_ptep) {
>  		pte = ptep_get(ptep);
>
> @@ -546,6 +543,15 @@ static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>
>  	return ptep - start_ptep;
>  }
> +
> +static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
> +{
> +	VM_WARN_ON(max_nr < 1);

I wonder if max_nr should be nr. Or is it a maximum range to examine I guess?

> +	VM_WARN_ON(!softleaf_is_swap(softleaf_from_pte(pte)));

Since you're getting a softleaf_t here...

> +
> +	return __softleaf_pte_batch(start_ptep, max_nr, pte);

...Does the batching need the full PTE or can you just pass the entry?

> +}
> +
>  #endif /* CONFIG_MMU */
>
>  void __acct_reclaim_writeback(pg_data_t *pgdat, struct folio *folio,
> --
> 2.43.0
>

--
Cheers, Lorenzo
