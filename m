Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095274;
	b=RmUFHPZ3oSVhFZbkbWmuJWEB04II5x6sD/h1YjKHpu+l5Qqj71fpk3/UIHxP8JWDYx62
	 +/nRCbZfOlFOAKIlfEVVnPIl1Drkc+NL9DjQ0b4D1Cg5MNpFRDupF0RG4eeI0MRIvJXQ7
	 3f1bxC88+oQbi1ng1yv2nOGWQvyEX1kXLkk9X3E3XWvrYVSILsN7D9wmPIIjoVPnwev8v
	 mBum/dbCaECOLNEBLjzpOa1hyinR8jsIpZv4Mk5ZvUANe1hbrZGsUahzgNuNajXBrPDw3
	 k3P474utSwRSjtz4CPDXprhRiN1X01GYxEn3moCVVhYJaH+bO8zaoK68ndsJ2vHivTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095274;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=Kbe/Wkq4rYrYN6MBYuFpuRQJ/7anrRHrUP2tno+KG7w=;
	b=Yl3FpDoxGrOlY8i1IQeDeGXePhyJ2I+EMr9C+Paa+cjthqp+yHrXfiHkDHVuP03YJ0nv
	 BGJRJZ4eNAtNjqggcj7gUGGgl/iP6SM3kdnQva5LlWJyT40HZq69M0/z7iTDb4SEowt0G
	 JWlG9rrJQRLk87da5Lo/Jd2T+KELaVGc0S1hGP409LK4CiRtLPMcIN4CPnlQmSBX9A0E3
	 e3sndIfuzLH+Onhelp+BPumDXnBAfXQdsJPqDsnQvYWuPdorEtr7TqH6dgfW02AmqzskG
	 /VXhBnIVcYQMzBRdmMNOaZMZbWNj7MpAHD3mIJp8OgewzqtfxBYdHmKWjKmrELmAe9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OtI71pgS;
	arc=none smtp.remote-ip=91.218.175.37
Received: from mta0.migadu.com (out-37.mta0.migadu.com [91.218.175.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BF1606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1BF1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OtI71pgS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7aMmjfpfnJwpxpDpoLMqNeUVHrm4vinac7NGKcQYtyE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795095271; v=1; x=1795700071;
 b=OtI71pgSWNdYojCDMvf8TQCNArpg2mZCM9lgVO4JXCyzSwK/za+CPUthcjpH67yg1KlKvx+w
 C5djU9lXJs5Ksn8sVuRHpRcelESf6ngzOmAs/7LYCcQZ37dI8/uFIIaCQrnPkUkTIfgpojp9RgY
 L7uWkiFLUxKCcAFGgu968nF4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id fb9fb7e65a471db4;
	Thu, 19 Nov 2026 13:34:31 +0000
X-Mizu-Trace-ID: fb9fb7e65a471db4
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2] mm/memfd: drop redundant hugetlb allocation mask
 narrowing
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261119-for-memfd-v2-1-59f2d8c9752d@kylinos.cn>
Date: Thu, 19 Nov 2026 21:34:11 +0800
Cc: Hugh Dickins <hughd@google.com>,
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
Content-Transfer-Encoding: 7bit
Message-Id: <E8842E0E-E559-421C-BFC8-1B91BD416EBD@linux.dev>
References: <20261119-for-memfd-v2-1-59f2d8c9752d@kylinos.cn>
To: Hongfu Li <hongfu.li@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 19, 2026, at 17:49, Hongfu Li <hongfu.li@linux.dev> wrote:
> 
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

Acked-by: Muchun Song (ByteDance) <muchun.song@linux.dev>


