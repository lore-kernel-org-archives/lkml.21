Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106881;
	b=TDQJSgvfU5/0b82yvHHFmIycLZ+27Xoih/E7dm4TjhPe0DAd2Ks3c5o2W0PBGu+pD7Il
	 NWCoh+N87u0TJ1WjAFhHgZBtTLEe8sCvBOhxzM47b4ngA6kosjkalR7tqU9KYFSaaqq5Z
	 e85WmR3GXPzlt4EbhybGWpV1ES2ImpO5ZWMwdnX9ofhWxoInjqOPW/SEebwHuKilGXF+J
	 ppS3i2hBHIcuqc7MhO0dHzgnqdNbyWSCOC+xobxhNRPsK2cstppuZq0cv4LkoPr5OoOgn
	 lqr8HRTpQnP5SbM4HpKpr5nZsr9b/LsA34hpquFJnjCI0qBjkUYfpmgeqS/nCeGSz0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106881;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZEcHC6MMC7MCebnxoFXV3ICRjGzCONOlrR9aOhluDQY=;
	b=MPeBTCoOszkQ2G/1AP7BdDlIGssc/KG3yPBTGEVOz9zSOsL8uLtDArowjICFNVIBJskl
	 uMpvdQsc+wzaQpFMZ6tpCh/mqi48PZQK9IGXM9VFmLPWFhfIHf/c0HBdRRO9NkLpQ534d
	 eODHgQB+SfS/jRz/oQ1UgSUtr9yvecdyXnQyhBCurFtp9McvwwBqEK7HNtpf7ZmIaHDDy
	 IyOkeIRzg65q8l6Se3sjdnYvOxRSP4FOvNSSOBc/m+tDOlxX1JcHAc60PMzCl2oDfskzE
	 dXC8dduV9M1s/F1khWmCzWlzLI9O1RG6U/JmCTrjowr4ArfdsnQ2aGAcQvDDUmuzZcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jp4+SqDL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91076606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jp4+SqDL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3FE1F000C4;
	Thu, 19 Nov 2026 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106881;
	bh=ZEcHC6MMC7MCebnxoFXV3ICRjGzCONOlrR9aOhluDQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Jp4+SqDL56/zI9zTKkHLhNWhuHMCLWwNwPy6errsexfCx8j1+4Ey4o/67c2t7cLdm
	 Yi/6pJ8+59d9mEwu/n1L4TUUnbmHNzeN+3occHw3/hqJmqb2vI2EkdOpfob/hIKEsE
	 bF7VlkuKKUi9jWY40TgoAZv8rO395PH1/F4+hTanzMWXrnpSR9DOfrVMueRoza6CBK
	 Ewlnv+kQ7IfiFOdmowArQwusZFJvfw/2L9EA6YYOJNH5hdsqtwfoW71nJgmq53LOpe
	 kCh0KU4nBqjVfNrFzoC7FJEPdW0y7Tta/PWqeamQNdcHowLKhUxuxoKzk+iVSQP1pk
	 PcaHFm7O27CSg==
Message-ID: <c1225518-70b9-445e-9b6a-7f0e80cbc62d@kernel.org>
Date: Thu, 19 Nov 2026 17:47:56 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/memfd: drop redundant hugetlb allocation mask
 narrowing
To: Hongfu Li <hongfu.li@linux.dev>, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
References: <20261119-for-memfd-v2-1-59f2d8c9752d@kylinos.cn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261119-for-memfd-v2-1-59f2d8c9752d@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 10:49, Hongfu Li wrote:
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
> ---

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
