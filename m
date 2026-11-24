Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543296;
	b=XiXehxe5Nx7xzxOdAsfo1gQZBZp78ywNYZGdQErTMTbhKqwPL6yTL/hdvimuWdx/UKF+
	 132KYf27ibrWHBN+qP6MajEWsrIwXcttaq+OAdnZH39D3HBbBjqWd55nw53gynw9tjdXO
	 q8+2n/Jndj+plYSekud2D5oGGmi3rBa7Rggyby5BNgSZsdbT6TH7NvQ7IVRHgrZXwKALB
	 0F+fgtlV++XnT4JjLgurYvrIRjlpSBQEfyNHwNwld51KYzgoTnUz6yOR/3mXHbggZoHdr
	 7QXOZcHKAWcvYTkOeVNE1xypdLWjrVFME5+te+ONJiBPpkppUI6a0Uj6iibsHs4Q4Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543296;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kHUlsupwDOpkHbLX8S2w072pY8Rr3ikdGTNicvjXqnc=;
	b=su7D2BOdT+6AoN7sf/HRx1u/7iTZx1pRq38ZO4sbIKlz404aGRVpDq/Mi9+79tYsl6qn
	 u8X98ploeeAiUzG7UDzsEjOXLMPDvzP1Oc/gZZ07dieMLU10gwULRNfl+EYWkfS3ImqGh
	 6lhKqVCPAC/HGWrsJTxp5EVN7ilG1Fm3NTp0WVjUqS3+sj9xbj7rlmgaycRCVtjqPeYsA
	 7oiJ7T0FE3wfjdqHuVEQNY8zNPe513wg/BsMn5FpzsX6AVi8OUFY6aRUZgRmiUSflquVS
	 Tzhhu3B9tSOmWwG8Y2oGxdJk56RzRUNzeuLeKMb1+N8XN2rl5lQDmZJYdCW+mQ46JPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOCxnsb8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8101C606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOCxnsb8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF151F000D0;
	Tue, 24 Nov 2026 18:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543296;
	bh=kHUlsupwDOpkHbLX8S2w072pY8Rr3ikdGTNicvjXqnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aOCxnsb8KPo+uJrOTN2VG0/4LzIxOzbWkwFqqZPQqsYidT1LLQds618V5lhevH4cZ
	 ej1MUDUfWcJgncApHe/rrdwWbCxUG8cV5c6de3Q4njvOYqmVc01Uv/Y++uX6vESr2m
	 45lz90ReFnUu+mllQHU/ZP/mRkUaa9hXavmj0vO2IXP3+q1U/c1I27mqUXCb3ZJ/4P
	 vP4hw80hjwtC/HjjhEv5DXnz/NJN5w8MMALFsjvA68MUA+ciDfSjXrbDDhFLqZ7wtu
	 iq+89nJGM972PYb5N8h9knZmqK9DAfA0Zj9W07jBwwW1p57V47z4WmVx0uNShB2Dzs
	 +NX9oH8Lpn0+g==
Date: Tue, 24 Nov 2026 20:01:30 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memfd_luo: don't use memfd_pin_folios()
Message-ID: <awXQ-sYNkY-TALqE@kernel.org>
References: <20261123130115.4021199-1-pratyush@kernel.org>
 <179546369651.425130.14155931836758567682.b4-review@b4>
 <2vxzo6bez3hs.fsf@kernel.org>
 <awWx1YnA0PcB2RaB@kernel.org>
 <2vxztsl6xj59.fsf@kernel.org>
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
In-Reply-To: <2vxztsl6xj59.fsf@kernel.org>

On Tue, Nov 24, 2026 at 04:56:50PM +0000, Pratyush Yadav wrote:
> On Tue, Nov 24 2026, Mike Rapoport wrote:
> 
> > On Tue, Nov 24, 2026 at 02:51:59PM +0000, Pratyush Yadav wrote:
> >> On Mon, Nov 23 2026, Mike Rapoport wrote:
> [...]
> > v2 was better I think, but it still had that
> >
> > 		if (err == -EBUSY && ++busy_retries < MEMFD_LUO_MIGRATE_RETRIES)
> > 			continue;
> > 		if (err)
> > 			return err;
> >
> > which I don't really like.
> >
> > I came up with a variant below that IMHO makes things more explicit:
> >
> > static int memfd_luo_get_folio(struct inode *inode, pgoff_t index,
> > 			       struct folio **foliop)
> > {
> > 	int err, retries = 0;
> > 	struct folio *folio;
> >
> > 	for (;;) {
> > 		if (retries > MEMFD_LUO_MIGRATE_RETRIES)
> > 			return -EBUSY;
> >
> > 		err = shmem_get_folio(inode, index, 0, &folio, SGP_CACHE);
> > 		if (err)
> > 			return err;
> >
> > 		if (likely(folio_is_longterm_pinnable(folio)))
> > 			break;
> >
> > 		folio_unlock(folio);
> > 		err = memfd_luo_migrate_folio(folio);
> > 		if (err) {
> > 			if (err != -EBUSY)
> > 				return err;
> > 			retries++;
> > 		}
> > 	}
> 
> This has a super theoretical corner case where the migration can
> succeed, then the folio can migrate back to CMA by the time we do
> shmem_get_folio(). So we can loop infinitely.

Oops :)
 
> I think the if (retries > MEMFD_LUO_MIGRATE_RETRIES) should be after the
> folio_is_longterm_pinnable() check and retries should increment after

Maybe after folio_unlock() then?

> every migration, not only failed ones.
> 
> Apart from that, your variant looks nicer.
> 
> Does that sound good?
> 
> >
> > 	*foliop = folio;
> > 	return 0;
> > }
> >
> > It does an iteration more than v2 with the same MEMFD_LUO_MIGRATE_RETRIES,
> > but that's not really important.
> >
> > Your call really, I can live with either of them.
> 
> -- 
> Regards,
> Pratyush Yadav

-- 
Sincerely yours,
Mike.
