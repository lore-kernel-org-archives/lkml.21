Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795056012;
	b=QQb/tqGiG13Fs6aHpbZDptU13LigAm5ws9wVegJ4uPQ1tDCuQopeZN1G8JRaBnHVXlPI
	 7BjIu3dYtbTbvk1gH1pIfUKsvixYffz0QTcDXMcStCu/r0caInzS3MkEpBo1c3tf5H8li
	 tAME4SmcfZd4hU3o825FvLjDQo9NGBoht3jC17gdSYMrJ7xURG5sO6/8g3VnaSmcEdssK
	 dnlDs4Q8FxvoXTCsMmNV3c6DENfpcU+5BUqhPZR/1t3M9U3Zyv5FDMb3YYf7MJC+9zuJZ
	 Da1J/WpRzG4nNF1hPsS0uhBktTYiTpsR/x9QKdyAcAcSacXaS2Tj9HJloPKXxUBXQzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795056012;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4eldt1poESacQhlEKIXWEYqmbMHzZtx9KsZXa9CMQjc=;
	b=AYdv4hHYUVWi8p3A4t+UZ7WnUxGroB+A6uPig5FxQPRUblPjYJGNl8vqFz6D0eRT7QJH
	 ygXkJfEah45NcMncBPnQVt2w/VJR1EgkTURU0mEsxBK7OitUIZ8o0HSXruBrJQePg7zuu
	 U4NNA9+O+6Nd45+Vw0J0n1dpRak4mNopkr6kYemBWj4x4960p+aKatMrMglkYB5+/O/em
	 zuI7+E06YUM3p8f5ebITSZE0JWPlKT/rs701tZGuxdgTjXvkpac999KIZJFdT7I6sCpBI
	 49WKuM0RgVY2+FUq82wITP2fkK9y9541e1xie0B/KEd1LfxsYPP1S5XBllmWgGe5ysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XBBWtXQO;
	arc=none smtp.remote-ip=95.215.58.130
Received: from mta1.migadu.com (out-130.mta1.migadu.com [95.215.58.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370F4606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 370F4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XBBWtXQO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9pcJmRRsUuG+cdTHwFCyDqrJPxLVIT1eO5dRnb4HvdE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795056008; v=1; x=1795660808;
 b=XBBWtXQOQuSLuvwMtqVfj/iMVIf4tc9Tmd1Nrp9xy2tm31viK7vYLgo61MM1cszxcb1Xabmz
 v+7pNENlDdtYE5Ff5VSE1648FefXrY8sXzFXML+A65gh/dHfhW9PdGHS/BbBn7KjDFyNOfY/HKO
 u5MzYs64xnbYxy3a4XrFNiyU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f7668d8552ff7426;
	Thu, 19 Nov 2026 02:40:07 +0000
X-Mizu-Trace-ID: f7668d8552ff7426
X-Migadu-Flow: FLOW_OUT
Message-ID: <85341270-6c22-4a93-bd07-26ee58b88929@linux.dev>
Date: Thu, 19 Nov 2026 10:39:54 +0800
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
Cc: hongfu.li@linux.dev, Hugh Dickins <hughd@google.com>,
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH 1/2] mm/memfd: drop redundant hugetlb allocation mask
 narrowing
To: Muchun Song <muchun.song@linux.dev>
References: <20261117-for-memfd-v1-0-fa68f433171e@kylinos.cn>
 <20261117-for-memfd-v1-1-fa68f433171e@kylinos.cn>
 <87A66860-C0E1-42CF-AFF7-671D19B82E16@linux.dev>
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <87A66860-C0E1-42CF-AFF7-671D19B82E16@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 11/18/26 19:47, Muchun Song 写道:
>
>> On Nov 17, 2026, at 18:53, Hongfu Li <hongfu.li@linux.dev> wrote:
>>
>> From: Hongfu Li <lihongfu@kylinos.cn>
>>
>> memfd_alloc_folio() derives its allocation mask from htlb_alloc_mask()
>> and then clears __GFP_HIGHMEM and __GFP_MOVABLE. This mask handling was
>> introduced by commit 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios()
>> for pinning memfd folios"), when the fallback path in
>> alloc_hugetlb_folio_nodemask() could still call
>> alloc_migrate_hugetlb_folio() and reach the buddy allocator, so the mask
>> decided the zone and migratetype of freshly allocated pages.
>>
>> Since commit 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios
>> resv_huge_pages leak"), this call site uses alloc_hugetlb_folio_reserve(),
>> which only dequeues folios from the existing hugetlb pool and never falls
>> back to the buddy allocator. The mask therefore no longer decides where
>> any page comes from.
>>
>> Long-term pinning safety no longer depends on the mask either:
>> memfd_pin_folios() obtains its folios (dequeued from the pool, or freshly
>> allocated) under memalloc_pin_save(), so PF_MEMALLOC_PIN makes
>> dequeue_hugetlb_folio_node_exact() skip any folio that fails
>> folio_is_longterm_pinnable(), and current_gfp_context() already clears
>> __GFP_MOVABLE from any page allocator request made under PF_MEMALLOC_PIN.
>>
>> Drop the narrowing, which has had no effect since 26a8ea80929c.
>>
>> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
>> ---
>> mm/memfd.c | 1 -
>> 1 file changed, 1 deletion(-)
>>
>> diff --git a/mm/memfd.c b/mm/memfd.c
>> index 0e3ff3eebfa8..8905e3e9efc8 100644
>> --- a/mm/memfd.c
>> +++ b/mm/memfd.c
>> @@ -85,7 +85,6 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
>> 	u32 hash;
>>
>> 	gfp_mask = htlb_alloc_mask(h);
>> -	gfp_mask &= ~(__GFP_HIGHMEM | __GFP_MOVABLE);
> You didn't mention why __GFP_HIGHMEM can be removed safely. I have to
> investigate the reason myself.
>
> During review, __GFP_HIGHMEM was cleared because "these pages might need
> to be accessible by some DMA driver, so you have HIGHMEM constraints.",
> refer to https://lore.kernel.org/all/ZmvNLSUgUgFETR0M@localhost.localdomain/
>
> I think that restriction is unnecessary now: DMA and existing memfd_pin_folios()
> users operate on pages or scatterlists and support highmem, while the
> shmem path already permits highmem folios. The hugetlb path therefore
> does not need a separate lowmem constraint.

Hi Muchun,

Thanks a lot for the review, and for tracking down the __GFP_HIGHMEM
history yourself; the explanation is very clear and much appreciated.

I was not fully sure about that part, which is why the commit message did
not describe it much. I'll add the following to the commit message in v2:

Clearing __GFP_HIGHMEM was a lowmem constraint for these folios, which
were meant to be accessed by a DMA driver. It is not required any more:
the users of memfd_pin_folios() work on pages and scatterlists, which
support highmem, as does the shmem path with its default
GFP_HIGHUSER_MOVABLE mask.

> Because you have removed the constrains, why you didn't remove the comment
> along the way?
>
> 	/*
> 	 * The folio would most likely be accessed by a DMA driver,
> 	 * therefore, we have zone memory constraints where we can
> 	 * alloc from. Also, the folio will be pinned for an indefinite
> 	 * amount of time, so it is not expected to be migrated away.
> 	 */

You are right, that comment describes the zone constraints that patch 1
removes, so it is stale once the constraints are gone. I removed it in
patch 2, together with the mask computation. Will do that in v2: move the
removal into patch 1 and drop patch 2.

>> 	idx >>= huge_page_order(h);
>>
>> /*
>>
>> -- 
>> 2.54.0
>>
-- 
Best regards,
Hongfu

