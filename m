Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463702;
	b=ylc6pRpjfmyojy0A7IoLNNXoqzsB2lp4XRZhFYxlW/2y6FzF63UG2VLS4vaKaVk5yP0x
	 vGMyOeJ5K99Y1jvq+ymRvuPhMJeJPEJn9KuEobsZYPm0PaAFXQcMdktfW4Nh1cdoAcafx
	 LqzmJ1V2OQayt8LiweI2QvmKZzt1JrowSBr6+tPGaVB6UCucd18tFtwE7I+HEO6RVIV49
	 kPtNuTWQAUbJalPV1yymDlrEU68ppFYwMW/rkgEgZ5Q89xF4335YGt0du0NVCX7pcrAKP
	 dkvZ7NhR52GDij8eWcEC2gpZN0Auzma0RCXBRI0uGvM8YtTE+YO+wMQ1967bG2rXD3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463702;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=b5xkBqtOz/cxSYio3ZQFvWPZV907+8EypMB85HFz3iM=;
	b=mDo8LNOzlIq/G9i9K9aY516/QMKxrZgGCyBG256Ct1YsW8sLM152BCHc9zVfUyQFdm8/
	 IBvshUcIzqyyumZY/HEFQNl2+fRjJqf1QSqh0be9t0WiyBUm9keFhEsNaxlV3CZr120f9
	 tQekeSePRef58H1tWKTL1HsNZas8ZO4j7kvu1O8AO2gBOTKeXjmRKbUzhpW0cPjObxaAp
	 ezbCJK/7mal6mGAJOGMA3lkexEJaLoY2nz15Z7DrB7qKNst24NqTOjLGybsUadgg5tbTm
	 VMitwljU5jxZcmCSvkkl6n7dcHIi+hfjA+Y2qbJQk90OB4T7YcdY+gefrRxVB/IFtZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fme3Kdwb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0896D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fme3Kdwb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9681F000CF;
	Mon, 23 Nov 2026 19:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795463701;
	bh=b5xkBqtOz/cxSYio3ZQFvWPZV907+8EypMB85HFz3iM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Fme3Kdwb7X9HKaSgS+tsMCzmvD6INAAinoHdB/9i0GwoDs+wAXAYOx4tdn8N9UumG
	 UbDEJGtnucVzivH4BB9Cf2sRXCnDcsIeEMSFiDWXqkv2Z9hu+mbZevKMOp8KC9k1fd
	 5p69kp3Xb9NzBE2f5lEI+OQn8Grh1ysEMoG9GljgeTUzKZkwoOOPTfrYCxrtwjsxHU
	 6f4IO7jhFHat9GvLp4EDpEp6ENj1GEN7bwctGQA4ZLrdfCD0eetKk7kCT4BEP4mpm3
	 FLCYSyf6wQMq6IgiAGTwkOUzXvDnHcAwkz5lZQzsn8N6hP92ldF/tXT7bgjOQ1chNj
	 TSIWaVj+tsQqg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] mm/memfd_luo: don't use memfd_pin_folios()
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
In-Reply-To: <20261123130115.4021199-1-pratyush@kernel.org>
References: <20261123130115.4021199-1-pratyush@kernel.org>
Date: Mon, 23 Nov 2026 21:54:56 +0200
Message-Id: <179546369651.425130.14155931836758567682.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi,

> memfd_luo takes a snapshot of the folios in the file's mapping. To make
> sure the snapshot does not go out of sync, it pins the folios in the
> file via memfd_pin_folios(). The pinning also migrates the folios out of
> MIGRATE_MOVABLE to make sure doesn't land in KHO boot memory or in a CMA
> region.
> 
> memfd_pin_folios() does not lock the folios. So it can race with
> shmem_writeout(). A folio returned by memfd_pin_folios() might already
> be in swap cache. This happens to work but is fragile. memfd_luo looks
> at folio flags and index on a folio that isn't in the memfd's page
> cache.
> 
> In addition, memfd_pin_folios() needs the caller to allocate an array of
> folios. memfd_luo does not really need that since it will vmalloc
> folios_ser and store the information there anyway. The folios array is
> unnecessary overhead.
> 
> Finally, memfd_pin_folios() fills in holes in the memfd. This makes
> preserving sparse memfds very expensive in both compute and memory.
> While this patch doesn't yet stop filling in the holes, it sets up the
> infrastructure to make it simpler.
> 
> Fix all this by walking the page cache directly using shmem_get_folio()
> with SGP_CACHE. This returns a locked folio with an elevated refcount.
> memfd_luo holds that reference until the memfd is unpreserved. This
> blocks compaction, migration, etc.
> 
> There is still a need to migrate folios out of MIGRATE_MOVABLE page
> blocks. This is because those might be CMA or KHO scratch. memfd_luo
> will hold a longterm reference to the folios so it will block migration
> in that pageblock. Introduce memfd_luo_migrate_folio() to do this.
> 
> Also factor out folio unpreservation logic into memfd_luo_put_folios()
> and use it from memfd_luo_unpreserve_folios() and from error paths in
> memfd_luo_preserve_folios().
> 
> Since shmem_get_folio() always returns uptodate folios, drop the folio
> zeroing logic.
> 
> This change also improves preservation performance, shown in the table
> below.
> 
> |------------------+----------+------------+-------|
> | memfd            | baseline | this patch | delta |
> |------------------+----------+------------+-------|
> | 4K pages, 32 GiB | 748 ms   | 600 ms     |  -20% |
> | THP, 4 GiB       | 0.59 ms  | 0.59 ms    |    0% |
> | THP, 16 GiB      | 2.99 ms  | 2.61 ms    |  -13% |
> | THP, 32 GiB      | 4.83 ms  | 5.21 ms    |   +8% |
> | sparse, 32 GiB   | 8695 ms  | 7269 ms    |  -16% |
> |------------------+----------+------------+-------|
> 
> Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> ---
> The diff is unfortunately hard to read. It would be easier to review the
> patch by applying it and looking at the final code.
> 
> This patch is picked from a separate series I sent [0]. It is more or
> less an independent change. It fixed a race for that series so I added
> it there, but since that series might take longer to go through, I think
> it is useful to take this patch separately.
> 
> [0] https://lore.kernel.org/all/20261027173031.763213-2-pratyush@kernel.org/
> 
> Changes since v2:
> 
> - Reword the comments on memfd_luo_migrate_folio(), memfd_luo_get_folio()
>   and the allocation comment in memfd_luo_preserve_folios() so they no
>   longer say folios are "held until the next kernel". Instead, say that
>   preservation holds a longterm reference on them.
> - Use a bounded for loop in memfd_luo_get_folio() instead of an open
>   ended one with a separate busy retry counter.
> - Collect tags.
> 
> Changes since v1:
> 
> - Add memfd_luo_get_folio() which combines shmem_get_folio() and the
>   migration logic.
> - Collect tags.
> - Rebase to v7.4-rc1.
> 
> ---
>  mm/memfd_luo.c | 306 ++++++++++++++++++++++++++++++-------------------
>  1 file changed, 190 insertions(+), 116 deletions(-)
>
> diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
> index 6b68220275ebe..c963bc3522e61 100644
> --- a/mm/memfd_luo.c
> +++ b/mm/memfd_luo.c
> @@ -77,26 +77,161 @@
>  #include <linux/kexec_handover.h>
>  #include <linux/kho/abi/memfd.h>
>  #include <linux/liveupdate.h>
> +#include <linux/migrate.h>
> +#include <linux/sched/mm.h>
> +#include <linux/sched/signal.h>
>  #include <linux/shmem_fs.h>
> +#include <linux/swap.h>
>  #include <linux/vmalloc.h>
>  #include <linux/memfd.h>
>  #include <uapi/linux/memfd.h>
>  
>  #include "internal.h"
>  
> +static void memfd_luo_put_folios(const struct memfd_luo_folio_ser *folios_ser,
> +				 u64 nr_folios)
> +{
> +	u64 i;
> +
> +	for (i = 0; i < nr_folios; i++) {
> +		const struct memfd_luo_folio_ser *pfolio = &folios_ser[i];
> +		struct folio *folio;
> +
> +		if (!pfolio->pfn)
> +			continue;
> +
> +		folio = pfn_folio(pfolio->pfn);
> +
> +		kho_unpreserve_folio(folio);
> +		folio_put(folio);
> +	}
> +}
> +
> +/* How many times to try migrating a folio that is not longterm pinnable. */
> +#define MEMFD_LUO_MIGRATE_RETRIES	3
> +
> +/*
> + * Preservation holds a longterm reference on the folio. This would block
> + * migration in ZONE_MOVABLE or CMA. Move it out.
> + *
> + * Must be called with folio unlocked. Drops the reference to folio. The caller
> + * must look it up again.
> + *
> + * Returns 0 on success, -EBUSY if the folio could not be isolated (e.g.
> + * because someone else has it isolated right now), or -ENOMEM if migration
> + * failed.
> + */
> +static int memfd_luo_migrate_folio(struct folio *folio)
> +{
> +	struct migration_target_control mtc = {
> +		.nid = NUMA_NO_NODE,
> +		/* Not movable, so the target is neither in ZONE_MOVABLE nor CMA. */
> +		.gfp_mask = GFP_USER | __GFP_NOWARN,
> +		.reason = MR_LONGTERM_PIN,
> +	};
> +	LIST_HEAD(source);
> +	bool isolated;
> +
> +	/* Flush per-CPU LRU batches holding the folio so isolation works. */
> +	lru_cache_drain_for_folio(folio, 1, NULL);
> +	isolated = isolate_folio_to_list(folio, &source);
> +	/* Isolation holds its own reference. */
> +	folio_put(folio);
> +	if (!isolated)
> +		return -EBUSY;
> +
> +	if (migrate_pages(&source, alloc_migration_target, NULL,
> +			  (unsigned long)&mtc, MIGRATE_SYNC, MR_LONGTERM_PIN,
> +			  NULL)) {
> +		putback_movable_pages(&source);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Look up the folio at @index, allocating it if needed. Preservation holds a
> + * longterm reference on the folio, so folios that are not longterm pinnable are
> + * migrated out first, retrying a few times if someone else has them isolated.
> + *
> + * On success, returns 0 with *@foliop locked and holding a reference.
> + */
> +static int memfd_luo_get_folio(struct inode *inode, pgoff_t index,
> +			       struct folio **foliop)
> +{
> +	struct folio *folio;
> +	int err, retry;
> +
> +	for (retry = 0; retry < MEMFD_LUO_MIGRATE_RETRIES; retry++) {
> +		err = shmem_get_folio(inode, index, 0, &folio, SGP_CACHE);
> +		if (err)
> +			return err;
> +
> +		if (likely(folio_is_longterm_pinnable(folio))) {
> +			*foliop = folio;
> +			return 0;
> +		}
> +
> +		folio_unlock(folio);
> +		err = memfd_luo_migrate_folio(folio);
> +		/* Someone else might have it isolated, retry a bit. */
> +		if (err && err != -EBUSY)
> +			return err;
> +	}
> +
> +	return -EBUSY;

In v2 we did another shmem_get_folio() after a successfull migration,
now even if the last iteration migrates successfully we still return
-EBUSY and don't update *foloip.

-- 
Sincerely yours,
Mike.

