Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085642;
	b=sz9/jLz/AyjlrarWwW73fNfPl0EybotaahdBdiogbTsMhL9EZsI3piFHIb3mnX9fb0r4
	 zLuBxb5yFtFa77ZwOQDbiziAfpOajDG1TIkxsXoJN0figVQ6Av1ZDbLtnx+Ab92sReYv1
	 kDeqLlZ+oNtq8o/SBYmjTOdRcKk/XzVOrdA+mgD9qCWSFg0kuOsafRZ7srxFG9WC5Rpue
	 RvouKGptjvEI8rJ3vBqD9R1phqU+nMg8Qg7iqsWi0t7Df6ZyFTSBjI2s76UTGqljZi7xN
	 UuWfbF3VQ7IxI1V1FjwUm61vRSPC3O6oAoAKCiIyfsktC1zUVhvgqnXCexBtM6Uu+WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085642;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=o4DSb8O5B5HDKJHtAiV5LnHaoIIXUo9MJFuaEaQpxIc=;
	b=hmiA859W6N89du7eRlrO0FtcK8CWA5X4v/1PwSOuvtfsWqv9VBOwlSX4+goiCv6kEdO5
	 PJ+9cIlPLxPXo2bQ5/mAndj3aq3hIVTdZoe30Td0nKbb5hi/2n67iYuEJCbM2xDSsTdrY
	 dRDG0OT4O/cZF9Ce8CGJwCqkZ2N0BFlg4vvIlo1BRtiofvtfh5rwiULRJneNYNVqEMoDc
	 NnbwOv9zHAVew6PhEd32s3eF0GsZQkTJ6FNH4HeaBqFhisxF295JUrKZgX/XqGPgmfVZy
	 X0Zde4wZu3XJT8yGMFRuuWGQAUJDdc5IO/fxIokA26F8NztpHwJm3pKDugdnU0gFWeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qhmodlXT;
	arc=none smtp.remote-ip=95.215.58.63
Received: from mta1.migadu.com (out-63.mta1.migadu.com [95.215.58.63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF84606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF84606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qhmodlXT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=L7sCtNoyyz4AOhvKZSKvMdeJDCNqtf9hXe6yH6IKk3Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795085639; v=1; x=1795690439;
 b=qhmodlXTLA68QiicrIY73RmGX7Hm2VKU/66uCQJ3OAtlgcJwMd/2a7uirAJ0Q7YTIARMiNnC
 zMmfIvpIOdtHG/pGBQVNP1JnnvSbBiSiNzQhrw7eiU5rvy6cmT1MuFBD5D4M23z9EZbAndfuhXU
 y/4i6nX7uI0+5QrBPY2D9jqs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c67fc910d9f71c9e;
	Thu, 19 Nov 2026 10:53:58 +0000
X-Mizu-Trace-ID: c67fc910d9f71c9e
X-Migadu-Flow: FLOW_OUT
Message-ID: <ee77a886-44b8-44b9-b21e-2c03729e9566@linux.dev>
Date: Thu, 19 Nov 2026 18:53:44 +0800
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
Subject: Re: [PATCH] lib/test_hmm: fix alloc tag leak when splitting
 device-private folios
To: Nilay Vaish <nilayvaish@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Alistair Popple <apopple@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261118230044.683221-1-nilayvaish@google.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20261118230044.683221-1-nilayvaish@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 7:00 AM, Nilay Vaish wrote:
> For device-private memory, test_hmm backs each fake device folio with
> real system RAM of the same order, allocated with folio_alloc() in
> dmirror_devmem_alloc_page().
> 
> When the core MM splits a large device-private folio, the driver's
> ->folio_split() callback, dmirror_devmem_folio_split(), has to split
> the backing memory as well. It does that by hand: clear_compound_head()
> on the tail pages, folio_reset_order() on the head page, and
> folio_set_count() on each of them. dmirror_devmem_free() then frees
> every backing page as an order-0 page.
> 
> This open-coded split does not split the allocator's metadata. The
> allocation tag and the page_owner record still describe one high-order
> allocation, and PG_head stays set on the head page. When the pages are
> freed one by one, the tag is debited for only one page when the head is
> freed, and the tail pages carry no tag at all. With
> CONFIG_MEM_ALLOC_PROFILING, running the HMM selftests and unloading the
> module reports the leak:
> 
>   lib/test_hmm.c:808 module test_hmm func:dmirror_devmem_alloc_page has 16744448 allocated at module unload
> 
> and with CONFIG_MEM_ALLOC_PROFILING_DEBUG freeing a tail page triggers:
> 
>   alloc_tag was not set
>   WARNING: ./include/linux/alloc_tag.h:164 at ___free_pages+0x2a0/0x2d0
> 
> The backing memory is a private buffer of the test driver and nothing
> requires it to be a folio. Allocate it with alloc_pages() instead and
> split it right away with split_page(), which splits the allocation tag,
> page_owner and memcg state and is already exported to modules. It is
> still allocated as one high-order block rather than as individual
> order-0 pages because the driver finds the backing page of the Nth page
> of a device folio by offsetting from the first backing page, so the
> backing pages have to be physically contiguous. Every backing page is
> then an independent order-0 page for its whole lifetime, so
> dmirror_devmem_folio_split() only has to point the new device folio at
> its backing page, and dmirror_devmem_free() frees the backing pages one
> at a time.
> 
> As the backing pages no longer form a folio, take the order from the
> device folio rather than from the backing page, and index and copy the
> backing pages individually instead of using folio_page() and
> folio_copy().
> 
> With this patch the device-private HMM selftests pass and the module
> unloads without the messages above.

I did a quick test and confirmed that the original splat has
disappeared :-)

Thanks,
Zenghui
