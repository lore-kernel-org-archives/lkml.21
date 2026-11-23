Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421757;
	b=OXZ6Y/gdXSoEVG8Lq1txNI91HVRt4S+qa6FggGEGgNUFVhI8JOFMCNn1zHJLni8u/PnE
	 AA9/woZQJcTno5tnFK+ZT7bkvFdSwcvFPmYem0OziuTxW9wllkWBa94SC1XXh6iIypudw
	 Th1mTD1soL83LKc//6Z0cjjdNdV+66chw9XinbdXdIn1x1OvAEImgXeGHuogNe2lDTTQq
	 gy1ZwfKBENzuVPBHQrZL49dvi1yZwIx9doh2Vjt3FrBgMVG1EXgxUoPa34JUrQuIDHKET
	 ep3w5RKxqrR1R+Kkkth/qZFAISE06rO2N2ejvsCWBGkT785w5TyewuydehrmxDhRMoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421757;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=g8ePjRGfYYLpqjroOmKpsQeQavrsi3h/4Ejiryunluo=;
	b=jVezaqcbtVeo/QZrTckxO1r9Tx91jKv3T3IqAuH6Ydsd3BCefEdO7JIOCRSCspECzI0R
	 sjFLAjTew3vynG+wHzzcCEnZZ0zoSZs7HYVnm84D78yYke6HeEBST4TSSoD0moUoqHgvN
	 TDqOtkaz2cvJLnKLy433rDkrciSJcg6QUfg/iRgZk+p/vBAg/KV/PxbKvdda9MgH5Nip3
	 Zg7f/4nrGxD+IhPEGo09uREEv6r84PKgyZNoZ8l/2j3MA7HPsfyeVWCRVW+aV/V+UFDGz
	 CI6FDgDEfmKUDjj9c19ms6/f5dAD9SxlmiuXmz3utmMJ70u50EuxX89+PIgZYXRYFYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m9CHwZ5n;
	arc=none smtp.remote-ip=95.215.58.210
Received: from mta1.migadu.com (out-210.mta1.migadu.com [95.215.58.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B395F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B395F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m9CHwZ5n
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nb6PRjiri+b9vY92PXaXr/1F1lf0xUZy2r1/mAPDNz4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795421754; v=1; x=1796026554;
 b=m9CHwZ5nJEfDr91H0pyk4z0d9pEy+GuGQGq8mR/ehouqsIEM12/M8kf0ozZDnw717bDoC/jV
 uCWoFSUsqaLXdQH7On3rv/s4F+h5XgVngROdd2WojXE35QZkD26Kd8OwoFXLvDWWTyK2+ExfKds
 9hLtnq1A/BcqFIeztXH1acK0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2427a9aaeab9286b;
	Mon, 23 Nov 2026 08:15:50 +0000
X-Mizu-Trace-ID: 2427a9aaeab9286b
X-Migadu-Flow: FLOW_OUT
Message-ID: <10263c9e-2d58-4149-a3c4-df9cac11b041@linux.dev>
Date: Mon, 23 Nov 2026 16:15:42 +0800
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
To: Qi Zheng <qi.zheng@linux.dev>
Cc: "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Li Zhe <lizhe.67@bytedance.com>, Andrew Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 James Houghton <jthoughton@google.com>, Lance Yang <lance.yang@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-2-songmuchun@bytedance.com>
 <240018e0-02c1-401a-a979-3f867526191d@linux.dev>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <240018e0-02c1-401a-a979-3f867526191d@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/11/23 14:39, Qi Zheng wrote:
> Hi Muchun,
>
> On 11/20/26 6:08 PM, Muchun Song wrote:
>> Template-based ZONE_DEVICE initialization bypasses
>> __init_single_page(), which means copied struct pages do not run the
>> vmemmap zone consistency check.
>>
>> Verify each destination after copying the template so the fast path gets
>> the same validation as regular page initialization.
>>
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Reviewed-by: Lance Yang <lance.yang@linux.dev>
>> ---
>> v3:
>> - Retarget zone verification to
>>    zone_device_page_init_from_template() after integrating the helper
>>    series (suggested by Mike Rapoport)
>> - Collect Reviewed-by from Lance Yang
>>
>> v2:
>> - Apply the zone verification in memmap_init_page_from_template().
>> - Collect Reviewed-by from Mike Rapoport.
>> ---
>>   mm/mm_init.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index a9d848c92678..0129152b74d8 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -1082,6 +1082,7 @@ static void 
>> zone_device_page_init_from_template(struct page *page,
>>           set_page_address(template, __va(pfn << PAGE_SHIFT));
>>   #endif
>>       memcpy_nontemporal(page, template, sizeof(*page));
>> +    vmemmap_optimization_verify_zone(page);
>
> For PAGE_SIZE-aligned devdax, dev_dax_probe() leaves
> pgmap->vmemmap_shift at zero. When section_activate() populates a full
> section for this pgmap, it records compound_page_order = 0.
>
>   memmap_init_zone_device() (pfns_per_compound == 1)
>     -> zone_device_page_init_from_template() (each template copy)
>       -> vmemmap_optimization_verify_zone()
>         -> pfn_to_section_compound_order(page_to_pfn(page)) returns 0
>         -> vmemmap_optimizable_order(0) returns false
>
> With CONFIG_DEBUG_VM and CONFIG_VMEMMAP_OPTIMIZATION enabled, the
> section-order lookup runs for each copy. The zero order makes the
> condition short-circuit before either page_zone_id() call.

You are right, but we really don't care about the performance of a
debug kernel.

memmap_init_page_from_template is used to init a single page, just
like __init_single_page does. Therefore, in a sense, the template
version should be handled the same way.

So, what do you think?

Thanks,
Muchun

>
> Once patch #4 splits out the base-page loop, could we put this check in
> the compound tail-copy loop? Like the following:
>
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -734,7 +734,6 @@ static void __meminit 
> memmap_init_page_from_template(struct page *page,
>          memcpy_nontemporal(page, template, sizeof(*page));
>      else
>          memcpy(page, template, sizeof(*page));
> -    vmemmap_optimization_verify_zone(page);
>  }
>
>  void __meminit memmap_init_compound_page(struct page *head, unsigned 
> long pfn,
> @@ -754,8 +753,10 @@ void __meminit memmap_init_compound_page(struct 
> page *head, unsigned long pfn,
>      if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
>          nr_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
>      /* Initialize the tail pages from PFN-independent template page. */
> -    for (unsigned long i = 1; i < nr_pages; i++)
> +    for (unsigned long i = 1; i < nr_pages; i++) {
>          memmap_init_page_from_template(head + i, pfn + i, zone, 
> &template);
> +        vmemmap_optimization_verify_zone(head + i);
> +    }
>      prep_compound_head(head, order);
>
>      pageblock_migratetype_init_range(pfn, 1UL << order, MIGRATE_MOVABLE,
>
> Thanks,
> Qi
>
>>   }
>>     /*
>

