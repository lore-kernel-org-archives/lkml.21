Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417219;
	b=pB+Nk39ASvMXeQuLXSbeCjKtM5d3gOvnTcF8XA5tT8qfAWLh3GszFXRMFDApZVUncIzF
	 Cb03eI8WMOpcm/jAQAhXei3hu6zgsaUDCyQXAYdjjzok1sVya19rl4Nu3IY1sXXtf27eC
	 UQ9w2N9V+PpdwROi/TzFQH4BCkUHI3A8zhsQkxpd8sS+Pl+FaLmnvf3yt4Jrmgygqhadf
	 E+ueYrElNBvLsnSmj4JHMA44ulOukJUt1B+EP+pC9l9Xe/OWYr+QlyhL20PWC0fyqLhO7
	 5LMQjHG5E/HkLpkhEU1UDuAei8S3pc8ngszyXDQaYnH42xW0YT7QTxlEY8R7K2TcJFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417219;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wz61PR6m+Hv4KIDjJgpzt68ZFn1R+shrC/4PW4HJ6X8=;
	b=mDiWwFprF5bLQ8vuNC2wkc/sMKVmW2nI1hR7bR8ynk+De50g1WbPMuYB0pKcPms2QDJX
	 7RqXyXjQcrYWb5UfHhDs6pdF+JQGPIsrKtbEgLOWkZlIN52Xza4BaeLxLabBk+NBWHqEo
	 G7xlt/KWZip21fEwz7NM/xNzSLYU3ssZW53dF32IUvXFzUadt7wo//F8uKHX6sg1cELt5
	 qIcB9RHj/5GOtOCdutmnFZK9mKSwuy81wzStDgk3rv3zXwZxmsUHVOlPntNSUvcYcx3lm
	 j8+mq7cDF75QR+53uhV4QUlOW0nu1dknR4jupRLFqa+6oSSQhOvQBD6G9ntnkiU6nBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LFO5kG6Y;
	arc=none smtp.remote-ip=95.215.58.122
Received: from mta1.migadu.com (out-122.mta1.migadu.com [95.215.58.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54204606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54204606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LFO5kG6Y
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y6IFXvtm+aIMH3lUM18yqu4CvE/ZO2f55GMqbnpqCPA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795417215; v=1; x=1796022015;
 b=LFO5kG6YIw05GsVw8di3zyy/dHt3+da6fDxo6VYUV2g3lNk9Y3crl4iFetc0riIlFd+Cjkyw
 4Lx2EBBqCCYLAfy2tL84QauWVI11AOAdVxeCnZE57Qlybmv2sfzljdWAqWCeb3V08klUk+AM07l
 M4/4WTlLtMW7qkIupbEVPHCE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f0ff690aa2f0d91c;
	Mon, 23 Nov 2026 07:00:13 +0000
X-Mizu-Trace-ID: f0ff690aa2f0d91c
X-Migadu-Flow: FLOW_OUT
Message-ID: <a3add5b9-a69e-4e06-b91c-c23db9b6e1ca@linux.dev>
Date: Mon, 23 Nov 2026 15:00:04 +0800
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
Subject: Re: [PATCH v3 02/11] mm/mm_init: factor out common struct page
 initialization
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, Li Zhe <lizhe.67@bytedance.com>,
 Andrew Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 James Houghton <jthoughton@google.com>, Lance Yang <lance.yang@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-3-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261120100856.16929-3-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 6:08 PM, Muchun Song wrote:
> Several struct page fields have the same initial values for every page in
> a zone. __init_single_page() initializes this state as part of its
> per-page setup, while the shared vmemmap tail path open-codes only a
> subset.
> 
> Factor the PFN-independent state into memmap_init_page() and use it for
> both regular and shared tail struct pages. Keep section-, PFN- and
> instance-specific initialization in __init_single_page().
> 
> This also initializes the last cpupid and KASAN tag for shared tail
> struct pages consistently with regular struct pages. Since
> memmap_init_page() marks ZONE_DEVICE pages reserved, remove the redundant
> update from the memory hotplug path.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v3:
> - Rename memmap_init_page_common() to memmap_init_page() (suggested by
>    Mike Rapoport)
> - Remove redundant ZONE_DEVICE reserved-page initialization (suggested by
>    Mike Rapoport)
> 
> v2:
> - Remove __meminit from memmap_init_page_common() so HVO shared tail
>    pages can call it after init text is freed (reported by Sashiko).
> ---
>   include/linux/mm.h  |  8 --------
>   mm/mm_init.c        | 37 +++++++++++++++++++++----------------
>   mm/mm_init.h        |  1 +
>   mm/sparse-vmemmap.c |  7 +------
>   4 files changed, 23 insertions(+), 30 deletions(-)

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

One nit below.

> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 8883b780b76d..d8bafcd92791 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3096,14 +3096,6 @@ static inline void set_page_node(struct page *page, unsigned long node)
>   	page->flags.f |= (node & NODES_MASK) << NODES_PGSHIFT;
>   }
>   
> -static inline void set_page_links(struct page *page, enum zone_type zone,
> -	unsigned long node, unsigned long pfn)
> -{
> -	set_page_zone(page, zone);
> -	set_page_node(page, node);
> -	set_page_section_from_pfn(page, pfn);
> -}
> -
>   /**
>    * folio_nr_pages - The number of pages in the folio.
>    * @folio: The folio.
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 0129152b74d8..08d6e47bde22 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -602,15 +602,27 @@ static inline void vmemmap_optimization_verify_zone(struct page *page)
>   			page_zone_id(page));
>   }
>   
> -void __meminit __init_single_page(struct page *page, unsigned long pfn,
> -				unsigned long zone, int nid)
> +/* Initialize PFN-independent fields common to pages in the same zone. */
> +void memmap_init_page(struct page *page, enum zone_type zone, int nid)
>   {
>   	mm_zero_struct_page(page);
> -	set_page_links(page, zone, nid, pfn);
> -	init_page_count(page);
> -	atomic_set(&page->_mapcount, -1);
> +	set_page_zone(page, zone);
> +	set_page_node(page, nid);
>   	page_cpupid_reset_last(page);
>   	page_kasan_tag_reset(page);
> +	atomic_set(&page->_mapcount, -1);
> +#ifdef CONFIG_ZONE_DEVICE
> +	if (zone == ZONE_DEVICE)
> +		__SetPageReserved(page);
> +#endif
> +}
> +
> +void __meminit __init_single_page(struct page *page, unsigned long pfn,
> +		unsigned long zone, int nid)

                 ^ enum zone_type zone?


Thanks,
Qi
