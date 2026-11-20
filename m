Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143578;
	b=n8Ob1czW9VcOIPjwG9QvRy0Tw2Ewvj72GXdLxSAPtu9aYdMNbMeRlCbTiAZhtx4RXL6R
	 XqcMY7DbcQJ4bTefLO40h2uWckXVhEGuFEHV8jUgc6mGcUoFnDEQ1bMGOSgzSRWZskhxo
	 zPbHUv0evX1Rbei5w8T4ufN+WCFhXzxSt4sboKyCiiiqpQJSv3XLJA2029gkt9AFQSevI
	 LxI4lPStLNGI/39T3cny7t/20GHAnae2aB9/69nGFBmcz7n+HJuaWHNGeBIkjGfnWfNJq
	 6UIfTHSQLb21BUcz6IgtWSPoNgll3a9qQ8aCamj/RDlM+dWdW7K3xBSz9yXh0g82T4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143578;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Fvu+xmi6UAM2iEO+qK5+UmYLpk5vCo6FIx3dU82MR8E=;
	b=1MyodvA5ICU8uJi4hyGXCEauOWM2vcoep0hlQvQufYDqlkg1v/8CEo2UNXW1Zu1JhPA6
	 NWk2/l4ElUA6kuMbXkKGHP+YvUe1rFQ/GJ1JBsWonpbdy3L4/7TkXwecUvHm532YwXnOb
	 UjRYadP8oZyIhVV1DJLTfvOKT/BnX/O7CsfM+DD6HuumXbwsGpBX9qVX+HhW8bcZ4uy0r
	 YOoSN5A5eH8MygyTv3q68MCnEQ9wSw9cEmLYu+/lG4XY6/70/4Kpaj7MvZIyyLLg8P/1O
	 HuXMV3n64eqX0CNQ+DFY5LaaulxvkaNPXNoe5R50siAS++pnmf4hz8dMT+LGzEr0fsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oSSHBxkz;
	arc=none smtp.remote-ip=95.215.58.43
Received: from mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D65D606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D65D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oSSHBxkz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xf1Ty42kwvSN/jnqX8X1h+tJ+g/k4LBm2sjhuEXhJYk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795143575; v=1; x=1795748375;
 b=oSSHBxkzlInc8+y/vBw+9o6iJl/SFY/CXEaSardW5xhMTA3dOeG7HV0CUE7PMWjEeCtLASBx
 P4FLOxLvb/a/b/Yj5qIntLCfhSDmJ8TrQWn212Nmg7I2fiG0Mnsv4lRvPcXQKf0reosWEq7kCBP
 szI2/fHhE+RXhW2yqIZvsXVU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7819671ee5c7563b;
	Fri, 20 Nov 2026 02:59:34 +0000
X-Mizu-Trace-ID: 7819671ee5c7563b
X-Migadu-Flow: FLOW_OUT
Message-ID: <aa414751-9913-43ac-9782-aa9043b77517@linux.dev>
Date: Fri, 20 Nov 2026 10:59:26 +0800
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
Subject: Re: [PATCH v2] lib/test_hmm: fix alloc tag leak when splitting
 device-private folios
To: Nilay Vaish <nilayvaish@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Alistair Popple <apopple@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261119233119.1721789-1-nilayvaish@google.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20261119233119.1721789-1-nilayvaish@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/26 7:31 AM, Nilay Vaish wrote:
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
> 
> Fixes: 56ef39899643 ("mm/memremap: add driver callback support for folio splitting")
> Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
> Closes: https://lore.kernel.org/linux-mm/be9a8bae-9223-4966-bba9-2cbe39c8f4de@linux.dev/
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Link: https://lore.kernel.org/linux-mm/8ef6e92d-4cb3-444e-857e-fdbf88c035ea@kernel.org/
> Signed-off-by: Nilay Vaish <nilayvaish@google.com>

Tested-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks!
Zenghui
