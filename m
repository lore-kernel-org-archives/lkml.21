Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415975;
	b=y9v/0nrSZ/WrhnTR9eabneKgTP+VJR5PZUQwiahGRGXNS3lkxHFy0BtMgBFAnpQdrjiz
	 R8VqPthu9scicj+JB999Zz+/hdkc+0+BJe/kZkPIv1fFICqXrdho46qge90Yv3kWDvHwT
	 LxQHEI+vZLXWpFb7uUPldJcW9YKjMoLJc87vvaKhSqc0x5N6oYxSX2PhIcaT8JYxdP8AU
	 oLWaNqFXC5VbzWZVVRTRELx72QoaTW/05+FV7Ywe4ckCgbiBqpy2KFs52jeZheze264T4
	 em007u170aQMfPt66h3zt7Eri8klW5gp/jE3lsBKVi7ZVLvKZnHi3YIz/TCR7JS1zGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415975;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1S+FjIq6iQ59JuCSrkDkJDXNBT3bARoAzrzzdcKK3hc=;
	b=c/juWEjLSKRai69U/L9t+wbgCxyOv3WrpFYc8zyuQRhBKDfspwyBxA8AziUABDELIxpq
	 5mndA7UVS8uNPhrOaevjpWAntPPnSuYxvQ0Pqmb10Vdrl07nong7K3o1HLWmuIGsdnXUj
	 XGSv2WfZU1kS73hDTAV2epajjk0TmEkUphkM9z5npm1AetsQGmGxc+YruyAcMDcO4L1vx
	 v4AKfzZQ97ZUW5h1WflELHnzndZwugVfAFdIqX+pKRZcyGd0UwOz2nOSea7PJFifp14Xg
	 7iRfeNr3U+H2qU/cn9wGFzaxCjMbGwVMeVrJsfTYUFhJThDbg/3fOaFzuRpVwSSCyNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gpuPjbek;
	arc=none smtp.remote-ip=91.218.175.74
Received: from mta0.migadu.com (out-74.mta0.migadu.com [91.218.175.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2138B606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2138B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gpuPjbek
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EGI+hFYSI6qeyRcfjHp8n/r3RKOt4t3CJPzrN5D49Oc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795415973; v=1; x=1796020773;
 b=gpuPjbek126+k4ikzIEVnpzVvCcwh8lf7SHiElMR/xFmDyWR+AmS2CpWX++AkiwuZSCIHli+
 b7uYGDaqJNKoophIy6kfGgY4yH7CruzYv2JLoOb4Jxn83J6wInJAOBosabRtD4fMhPB9kRTAvuj
 JoxmP4rb5FpRe47vFhXHog3k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ebc62440839800c0;
	Mon, 23 Nov 2026 06:39:33 +0000
X-Mizu-Trace-ID: ebc62440839800c0
X-Migadu-Flow: FLOW_OUT
Message-ID: <240018e0-02c1-401a-a979-3f867526191d@linux.dev>
Date: Mon, 23 Nov 2026 14:39:22 +0800
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
Subject: Re: [PATCH v3 01/11] mm/mm_init: verify zones for
 template-initialized pages
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
 <20261120100856.16929-2-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261120100856.16929-2-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Muchun,

On 11/20/26 6:08 PM, Muchun Song wrote:
> Template-based ZONE_DEVICE initialization bypasses
> __init_single_page(), which means copied struct pages do not run the
> vmemmap zone consistency check.
> 
> Verify each destination after copying the template so the fast path gets
> the same validation as regular page initialization.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> ---
> v3:
> - Retarget zone verification to
>    zone_device_page_init_from_template() after integrating the helper
>    series (suggested by Mike Rapoport)
> - Collect Reviewed-by from Lance Yang
> 
> v2:
> - Apply the zone verification in memmap_init_page_from_template().
> - Collect Reviewed-by from Mike Rapoport.
> ---
>   mm/mm_init.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index a9d848c92678..0129152b74d8 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1082,6 +1082,7 @@ static void zone_device_page_init_from_template(struct page *page,
>   		set_page_address(template, __va(pfn << PAGE_SHIFT));
>   #endif
>   	memcpy_nontemporal(page, template, sizeof(*page));
> +	vmemmap_optimization_verify_zone(page);

For PAGE_SIZE-aligned devdax, dev_dax_probe() leaves
pgmap->vmemmap_shift at zero. When section_activate() populates a full
section for this pgmap, it records compound_page_order = 0.

   memmap_init_zone_device() (pfns_per_compound == 1)
     -> zone_device_page_init_from_template() (each template copy)
       -> vmemmap_optimization_verify_zone()
         -> pfn_to_section_compound_order(page_to_pfn(page)) returns 0
         -> vmemmap_optimizable_order(0) returns false

With CONFIG_DEBUG_VM and CONFIG_VMEMMAP_OPTIMIZATION enabled, the
section-order lookup runs for each copy. The zero order makes the
condition short-circuit before either page_zone_id() call.

Once patch #4 splits out the base-page loop, could we put this check in
the compound tail-copy loop? Like the following:

diff --git a/mm/mm_init.c b/mm/mm_init.c
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -734,7 +734,6 @@ static void __meminit 
memmap_init_page_from_template(struct page *page,
  		memcpy_nontemporal(page, template, sizeof(*page));
  	else
  		memcpy(page, template, sizeof(*page));
-	vmemmap_optimization_verify_zone(page);
  }

  void __meminit memmap_init_compound_page(struct page *head, unsigned 
long pfn,
@@ -754,8 +753,10 @@ void __meminit memmap_init_compound_page(struct 
page *head, unsigned long pfn,
  	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
  		nr_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
  	/* Initialize the tail pages from PFN-independent template page. */
-	for (unsigned long i = 1; i < nr_pages; i++)
+	for (unsigned long i = 1; i < nr_pages; i++) {
  		memmap_init_page_from_template(head + i, pfn + i, zone, &template);
+		vmemmap_optimization_verify_zone(head + i);
+	}
  	prep_compound_head(head, order);

  	pageblock_migratetype_init_range(pfn, 1UL << order, MIGRATE_MOVABLE,

Thanks,
Qi

>   }
>   
>   /*

