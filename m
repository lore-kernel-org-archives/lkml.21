Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531923;
	b=UOpVNU3sdyg2R3f3CotgDwZkrxsvjIW8D2KZa/Jah+yuQdg+0VBZrfriwCzMP/H6OqdI
	 OCMM85ClJ+v/Tkz9TJAgWrjwEQ6MM/Cg+sSuEWy55J+VlCAlQLqzvUkX79Q0VTocN7Qvp
	 zJd1WoWB9UL/Mr7J2HDd27BRAYT07MnSm6tpuoX5zHB0nTgikljtLjM2cUZ0X/RUg8Bmx
	 ftRcAmpJCi/W31rI7rNi32aGyxGqOffnkzChiAbyUlo7BSzKiLtgNeXOQtxHK19Vlt8Z6
	 gGtFL8mCV/sSve4Dzk5VYY/nh72S6KvsajcC3LkNCwhZ3fi3huM9VI7VMLlDpDmEe/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531923;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=sGxFJ44ZaFH6exgExrPW7alOn2CzE3QHdnDsrhGvuiE=;
	b=nmBuQJBxWVhmK7ZCKK/fho4DLYHshXGDip6q6HBnEwsc7NH/JrQkihkKQaceydLGqRk7
	 AE1NRVsBXeDqOzZrM9uzxHrziXenKSevPOTc36QdhZ44CT7wGV1CS1WdTCSpwPZJCnyuB
	 WVA+7JnYnlQdSt9onSKPi66OQojJbZcUCWJ3qEqJdmxYH9R+1uvUXLxkHwNxStXsbBOrM
	 CUNHDAA5Qy9/4qtN0v30wGuOT1MwbmUcbwaSPdB6iiluEs47BYqFy0lIFQkNRvds2e950
	 5lGQtie13zZl/4Edb21FnBwHnqVyPWY5sKNKDMB30+MNSWr9D12TNRA+8zHxiOErrRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=na0frTEz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B11606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=na0frTEz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B5C1F000C0;
	Tue, 24 Nov 2026 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795531922;
	bh=sGxFJ44ZaFH6exgExrPW7alOn2CzE3QHdnDsrhGvuiE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=na0frTEzq9oKVPXfW+kl4B1FODPtbmqrLck8Vo7YJ/oC2SJimgVtMXglMH+JdV9r/
	 pBLHbXBmSElloNw9eX8snVCPxyXx89B6QzGt9bmHrxRPmnaQXMIMZmvTDtrg2I2N4F
	 fhTbXwZAZCFV8viHRtmgSrLQvOoDeu4DPUXmxULuDRPUwrZwhsBOqGJV392KQzXca2
	 ubYvG4QOApNz6aT4NTZu3ya2kvgyKO/ujqalAbVCbnfdov2ifiifRqInbAj1xyNxHi
	 T7Y+jg8IOBWP1ScMn1aweg5JruCIcz6fnNObLCmvHHw02M25m23Oil2yIoLw2meIqA
	 /atC3UmE0On0w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Andrew Morton <akpm@linux-foundation.org>,
  kexec@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memfd_luo: don't use memfd_pin_folios()
In-Reply-To: <179546369651.425130.14155931836758567682.b4-review@b4> (Mike
	Rapoport's message of "Mon, 23 Nov 2026 21:54:56 +0200")
References: <20261123130115.4021199-1-pratyush@kernel.org>
	<179546369651.425130.14155931836758567682.b4-review@b4>
Date: Tue, 24 Nov 2026 14:51:59 +0000
Message-ID: <2vxzo6bez3hs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 23 2026, Mike Rapoport wrote:

> Hi,
>
>> memfd_luo takes a snapshot of the folios in the file's mapping. To make
>> sure the snapshot does not go out of sync, it pins the folios in the
>> file via memfd_pin_folios(). The pinning also migrates the folios out of
>> MIGRATE_MOVABLE to make sure doesn't land in KHO boot memory or in a CMA
>> region.
>> 
>> memfd_pin_folios() does not lock the folios. So it can race with
>> shmem_writeout(). A folio returned by memfd_pin_folios() might already
>> be in swap cache. This happens to work but is fragile. memfd_luo looks
>> at folio flags and index on a folio that isn't in the memfd's page
>> cache.
>> 
>> In addition, memfd_pin_folios() needs the caller to allocate an array of
>> folios. memfd_luo does not really need that since it will vmalloc
>> folios_ser and store the information there anyway. The folios array is
>> unnecessary overhead.
>> 
>> Finally, memfd_pin_folios() fills in holes in the memfd. This makes
>> preserving sparse memfds very expensive in both compute and memory.
>> While this patch doesn't yet stop filling in the holes, it sets up the
>> infrastructure to make it simpler.
>> 
>> Fix all this by walking the page cache directly using shmem_get_folio()
>> with SGP_CACHE. This returns a locked folio with an elevated refcount.
>> memfd_luo holds that reference until the memfd is unpreserved. This
>> blocks compaction, migration, etc.
>> 
>> There is still a need to migrate folios out of MIGRATE_MOVABLE page
>> blocks. This is because those might be CMA or KHO scratch. memfd_luo
>> will hold a longterm reference to the folios so it will block migration
>> in that pageblock. Introduce memfd_luo_migrate_folio() to do this.
[...]
>> +/*
>> + * Look up the folio at @index, allocating it if needed. Preservation holds a
>> + * longterm reference on the folio, so folios that are not longterm pinnable are
>> + * migrated out first, retrying a few times if someone else has them isolated.
>> + *
>> + * On success, returns 0 with *@foliop locked and holding a reference.
>> + */
>> +static int memfd_luo_get_folio(struct inode *inode, pgoff_t index,
>> +			       struct folio **foliop)
>> +{
>> +	struct folio *folio;
>> +	int err, retry;
>> +
>> +	for (retry = 0; retry < MEMFD_LUO_MIGRATE_RETRIES; retry++) {
>> +		err = shmem_get_folio(inode, index, 0, &folio, SGP_CACHE);
>> +		if (err)
>> +			return err;
>> +
>> +		if (likely(folio_is_longterm_pinnable(folio))) {
>> +			*foliop = folio;
>> +			return 0;
>> +		}
>> +
>> +		folio_unlock(folio);
>> +		err = memfd_luo_migrate_folio(folio);
>> +		/* Someone else might have it isolated, retry a bit. */
>> +		if (err && err != -EBUSY)
>> +			return err;
>> +	}
>> +
>> +	return -EBUSY;
>
> In v2 we did another shmem_get_folio() after a successfull migration,
> now even if the last iteration migrates successfully we still return
> -EBUSY and don't update *foloip.

Argh, right... Good catch!

How about this:

	for (retry = 0; ; retry++) {
		err = shmem_get_folio(inode, index, 0, &folio, SGP_CACHE);
		if (err)
			return err;

		if (likely(folio_is_longterm_pinnable(folio))) {
			*foliop = folio;
			return 0;
		}

		folio_unlock(folio);
		if (retry == MEMFD_LUO_MIGRATE_RETRIES) {
			folio_put(folio);
			return -EBUSY;
		}

		err = memfd_luo_migrate_folio(folio);
		/* Someone else might have it isolated, retry a bit. */
		if (err && err != -EBUSY)
			return err;
	}

	/* Should never get here. */
	return -EINVAL;

Or, I suppose I can go back to the original implementation.

What do you think?

-- 
Regards,
Pratyush Yadav
