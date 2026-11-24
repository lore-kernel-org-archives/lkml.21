Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535323;
	b=WXQ6BxCVU9xA3h/vxRiAS+Nu8VGM08RcckeiSj/YYK18dvO7Xv5iL8yqnEWTpNgILZjx
	 kHaah+jU8t6071mQjkhWW6cOrtmBSXoXA7DiWq2ilYV0YtlkX+i/LcJseCYM0OUdt8qo8
	 eRwqBmB1XjNF9Ap90qCwnajHTYwArsRuy5hvBPI4/c8vrgOCgB90Wg6YJSgMtzDQoT+CF
	 gOnPxU8iDoUz66GmKX+lIsTebAKRdzaZnHsVYtCZ6lZqgeQl51eDWyGiV7hYmFCfKUc9g
	 zKm+Fe5iGzltpfMS7YmkwpMOL7kpWMOlRzdrGkUaIOJahOWt/uzqKgxBL5eZfIh/ywA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535323;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8PNwOatqkWi3DPeRMW9K9Ow73UFN06+ullfX1MwBzgM=;
	b=iome3BMKQYdtntUD5RBAHWuqo0MYOvsLYwkiHZxHExFjt37rKYOF2h26k5hRX/RVIogh
	 LGQY5G9rkeZqmCBH1YCWKzWvVDKYI+kZCPjuzYZ1eY8ViuhUK4GMgCCRieCffNsH0fJIe
	 jJI6vPq2DHkSCzS0VuY6d5V3i/JLl6H7jseBjo/iIHr1BJWjMtgL9/WjrALRTY+GI0loa
	 tXU6F5L07QHldp8CZjlDwIU5XJjk1xu8tKEWfNVOiL9yrrWB/x4gCgVhLIs62Iru+ukem
	 xUd1Tudh+3H2pJqOOX2mrVh1pLiNo+p1f1dFnFega7zAaRiDRfzA4l1UJjO4fFR5/Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VsZmc/xP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B2606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VsZmc/xP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3FB1F000CA;
	Tue, 24 Nov 2026 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795535323;
	bh=8PNwOatqkWi3DPeRMW9K9Ow73UFN06+ullfX1MwBzgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VsZmc/xPWo1bSNHT2LcbJkJ5aAZGo5Ex6MD6H/GmFufKL5/hFTFMTSWogzAlFSxaO
	 47Az5xBblVfrqyoIh1VpztG6IImhzve5VramGyXB0UaKyDKWaNMcDq9q/nYBr3Yy4+
	 sumWDRrl+hTXqT5gLqTTvgVxUVc8zn+V/YXda8G82gkbNMMR/+Jo1x7bGXv5pzV/Ju
	 sDBYG+9232JroSunsVFT6JLR11m6BK2Afz+vHmum49tYGznGjfbnOZsrdMRL+PpK8B
	 /zFkpCBcVrMjt6kCu+d8fuEsHL0hiQHmKZNDgFXoWaSz4KQyC5uyB+lt/t9w8AXv97
	 bs17euuowrjcg==
Date: Tue, 24 Nov 2026 17:48:37 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memfd_luo: don't use memfd_pin_folios()
Message-ID: <awWx1YnA0PcB2RaB@kernel.org>
References: <20261123130115.4021199-1-pratyush@kernel.org>
 <179546369651.425130.14155931836758567682.b4-review@b4>
 <2vxzo6bez3hs.fsf@kernel.org>
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
In-Reply-To: <2vxzo6bez3hs.fsf@kernel.org>

On Tue, Nov 24, 2026 at 02:51:59PM +0000, Pratyush Yadav wrote:
> On Mon, Nov 23 2026, Mike Rapoport wrote:
> 
> > Hi,
> >
> >> memfd_luo takes a snapshot of the folios in the file's mapping. To make
> >> sure the snapshot does not go out of sync, it pins the folios in the
> >> file via memfd_pin_folios(). The pinning also migrates the folios out of
> >> MIGRATE_MOVABLE to make sure doesn't land in KHO boot memory or in a CMA
> >> region.
> >> 
> >> memfd_pin_folios() does not lock the folios. So it can race with
> >> shmem_writeout(). A folio returned by memfd_pin_folios() might already
> >> be in swap cache. This happens to work but is fragile. memfd_luo looks
> >> at folio flags and index on a folio that isn't in the memfd's page
> >> cache.
> >> 
> >> In addition, memfd_pin_folios() needs the caller to allocate an array of
> >> folios. memfd_luo does not really need that since it will vmalloc
> >> folios_ser and store the information there anyway. The folios array is
> >> unnecessary overhead.
> >> 
> >> Finally, memfd_pin_folios() fills in holes in the memfd. This makes
> >> preserving sparse memfds very expensive in both compute and memory.
> >> While this patch doesn't yet stop filling in the holes, it sets up the
> >> infrastructure to make it simpler.
> >> 
> >> Fix all this by walking the page cache directly using shmem_get_folio()
> >> with SGP_CACHE. This returns a locked folio with an elevated refcount.
> >> memfd_luo holds that reference until the memfd is unpreserved. This
> >> blocks compaction, migration, etc.
> >> 
> >> There is still a need to migrate folios out of MIGRATE_MOVABLE page
> >> blocks. This is because those might be CMA or KHO scratch. memfd_luo
> >> will hold a longterm reference to the folios so it will block migration
> >> in that pageblock. Introduce memfd_luo_migrate_folio() to do this.
> [...]
> >> +/*
> >> + * Look up the folio at @index, allocating it if needed. Preservation holds a
> >> + * longterm reference on the folio, so folios that are not longterm pinnable are
> >> + * migrated out first, retrying a few times if someone else has them isolated.
> >> + *
> >> + * On success, returns 0 with *@foliop locked and holding a reference.
> >> + */
> >> +static int memfd_luo_get_folio(struct inode *inode, pgoff_t index,
> >> +			       struct folio **foliop)
> >> +{
> >> +	struct folio *folio;
> >> +	int err, retry;
> >> +
> >> +	for (retry = 0; retry < MEMFD_LUO_MIGRATE_RETRIES; retry++) {
> >> +		err = shmem_get_folio(inode, index, 0, &folio, SGP_CACHE);
> >> +		if (err)
> >> +			return err;
> >> +
> >> +		if (likely(folio_is_longterm_pinnable(folio))) {
> >> +			*foliop = folio;
> >> +			return 0;
> >> +		}
> >> +
> >> +		folio_unlock(folio);
> >> +		err = memfd_luo_migrate_folio(folio);
> >> +		/* Someone else might have it isolated, retry a bit. */
> >> +		if (err && err != -EBUSY)
> >> +			return err;
> >> +	}
> >> +
> >> +	return -EBUSY;
> >
> > In v2 we did another shmem_get_folio() after a successfull migration,
> > now even if the last iteration migrates successfully we still return
> > -EBUSY and don't update *foloip.
> 
> Argh, right... Good catch!
> 
> How about this:
> 
> 	for (retry = 0; ; retry++) {
> 		err = shmem_get_folio(inode, index, 0, &folio, SGP_CACHE);
> 		if (err)
> 			return err;
> 
> 		if (likely(folio_is_longterm_pinnable(folio))) {
> 			*foliop = folio;
> 			return 0;
> 		}
> 
> 		folio_unlock(folio);
> 		if (retry == MEMFD_LUO_MIGRATE_RETRIES) {
> 			folio_put(folio);
> 			return -EBUSY;
> 		}
> 
> 		err = memfd_luo_migrate_folio(folio);
> 		/* Someone else might have it isolated, retry a bit. */
> 		if (err && err != -EBUSY)
> 			return err;
> 	}
> 
> 	/* Should never get here. */
> 	return -EINVAL;
> 
> Or, I suppose I can go back to the original implementation.
> 
> What do you think?

v2 was better I think, but it still had that

		if (err == -EBUSY && ++busy_retries < MEMFD_LUO_MIGRATE_RETRIES)
			continue;
		if (err)
			return err;

which I don't really like.

I came up with a variant below that IMHO makes things more explicit:

static int memfd_luo_get_folio(struct inode *inode, pgoff_t index,
			       struct folio **foliop)
{
	int err, retries = 0;
	struct folio *folio;

	for (;;) {
		if (retries > MEMFD_LUO_MIGRATE_RETRIES)
			return -EBUSY;

		err = shmem_get_folio(inode, index, 0, &folio, SGP_CACHE);
		if (err)
			return err;

		if (likely(folio_is_longterm_pinnable(folio)))
			break;

		folio_unlock(folio);
		err = memfd_luo_migrate_folio(folio);
		if (err) {
			if (err != -EBUSY)
				return err;
			retries++;
		}
	}

	*foliop = folio;
	return 0;
}

It does an iteration more than v2 with the same MEMFD_LUO_MIGRATE_RETRIES,
but that's not really important.

Your call really, I can live with either of them.
 
> -- 
> Regards,
> Pratyush Yadav

-- 
Sincerely yours,
Mike.
