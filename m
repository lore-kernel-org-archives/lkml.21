Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097172;
	b=CAkcf+W8mucUwgsCYilElAcl+iqVkVEIi2sBl0VUnwc8vx8c1v1OebxtBxKgM6Ou1HG9
	 4UAktnABJBvc6VTglroEPp1VbyjTwM1EHzEH+Ef6bcCcZrpMWxQaX2MgfBA2A68EywXxy
	 NcbXPhStwYDU5FbhnSG0PlsW6UspA7kbSp85GMWwkS9Xgd8vsDYZeq77T1F8jXZbJ6UR/
	 k/XV2apYFnIDZdqPHHxf7wo4mxLfdQqeJpD0YxJpnZz25+I3j1sowfvktpE9ni9d6kH0r
	 K2pF/3BXrKFHpqPz7xPGNjaB2LyTMOvZoVClhs5wDKieZvte9Va//jcfcwiD2S2ZE4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097172;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UjCeHxZksMiuQk8qi3/5sRJwJN7rQU7or9TBiPA7fVg=;
	b=p93D+eQ7ZepqGMnb7ilzb5t71UVD7Yb0af6LwyqhfhupO28NnLeoSUuf3RWvA8Wz9tVx
	 vchbzEy3H3LuXtKQjwqLC3KKMeBErTOEJt0mT42YKqNHokGfaEO0G/LHZKFlHdzZsLC6q
	 rhNI9h8oFGisHMCvncenbguMcw+dYUH1qfZgq0MW0ixel9TiexO7TmH4sl2yc0SHK6Jcc
	 04pztm1WyfkwVP24PSY0WpC9nJHboZ0rEpt2TVisku66MM9zOC32QzJaAq6uqFXCG5zV6
	 0Hd2PF8xVxSzmDt+3MPsj9/OAc9NpDQV0N3j6e1XE4daJHojyvozpdsZPtze0/sGe8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I962Fy36;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402A5606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I962Fy36
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6611B1F000C4;
	Thu, 19 Nov 2026 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097171;
	bh=UjCeHxZksMiuQk8qi3/5sRJwJN7rQU7or9TBiPA7fVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I962Fy3629DgiSuo3zu7CICQuwivgtJs+aj4wSGBpeu6krM6gscogwdrDpAk8amkO
	 FXiKVdlaClj0oNGYJMpAfcBwol0KYMWPNk9hPBAyiY8ZHegngv+D8gn48FUbtD606O
	 Abk2xxKkgd5u3c7+MZfD4g79qgKGlqg/6tuF3ZRKAq7Yg0ehBZl6IDZoWpECGEsrnE
	 K8/uohreO1Qj2HRWo45FghMUcRa/2aJCGTzDtluksttAWxJjzc6tMb0ioW0Ahh8y9p
	 A0ODGBE8dtuHhS5igCemKtOu1v2DuhjsjTy+RXX44YRgr/oFrZ3IWgTd7sSlqjntyb
	 xN2RkrgwpnlbQ==
Date: Thu, 19 Nov 2026 15:06:06 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH v2] mm/memfd: drop redundant hugetlb allocation mask
 narrowing
Message-ID: <av8CTrxr_NdRgpKL@localhost.localdomain>
References: <20261119-for-memfd-v2-1-59f2d8c9752d@kylinos.cn>
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
In-Reply-To: <20261119-for-memfd-v2-1-59f2d8c9752d@kylinos.cn>

On Thu, Nov 19, 2026 at 05:49:45PM +0800, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> memfd_alloc_folio() derives its allocation mask from htlb_alloc_mask()
> and then clears __GFP_HIGHMEM and __GFP_MOVABLE. This mask handling was
> introduced by commit 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios()
> for pinning memfd folios"), when the fallback path in
> alloc_hugetlb_folio_nodemask() could still call
> alloc_migrate_hugetlb_folio() and reach the buddy allocator, so the mask
> decided the zone and migratetype of freshly allocated pages.
> 
> Since commit 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios
> resv_huge_pages leak"), this call site uses alloc_hugetlb_folio_reserve(),
> which only dequeues folios from the existing hugetlb pool and never falls
> back to the buddy allocator. The mask therefore no longer decides where
> any page comes from.
> 
> Long-term pinning safety no longer depends on the mask either:
> memfd_pin_folios() obtains its folios (dequeued from the pool, or freshly
> allocated) under memalloc_pin_save(), so PF_MEMALLOC_PIN makes
> dequeue_hugetlb_folio_node_exact() skip any folio that fails
> folio_is_longterm_pinnable(), and current_gfp_context() already clears
> __GFP_MOVABLE from any page allocator request made under PF_MEMALLOC_PIN.
> 
> Clearing __GFP_HIGHMEM was a lowmem constraint for these folios, which
> were meant to be accessed by a DMA driver. It is not required any more:
> the users of memfd_pin_folios() work on pages and scatterlists, which
> support highmem, as does the shmem path with its default
> GFP_HIGHUSER_MOVABLE mask.
> 
> Drop the narrowing, which has had no effect since 26a8ea80929c.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Acked-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs
