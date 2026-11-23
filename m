Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422317;
	b=eonrIpjnjEEdp7f/wOpmNb3kLKONFbnhysZNTurbNvU/RV0wvLqgc21sN2jlh9O4aakF
	 QMBnaPqeulWXJzq1Fis/rJ6xU5KMvnnOycFtnMaaG999VF98Qwif1tPC/vV9RjjQzeRZT
	 5aUO53XZ7QEgiqazWWhKPs07KbEqxDbIepe5iTd8EUF9KCqoTH0ikAg7+nzya/Yi+kIsO
	 aWr/F8ayPpuM6+rrbmsqvwMGNwtIS2PFxU9qgqOGJ6NXYxJ4yQy4CzfmAAAYnoaMr2fT2
	 SzJlDTbgojEblTGnYUtSRZEivM8gmT3z93/SjJP2kM4oUQbHAJyjsGTgSeHzij4YVCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422317;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8YkplbXySmaATV+c/q6e7xLQY22MT4Kz4HxoeelC/D0=;
	b=YYKmLUWCxbQwJ0E3Q71V3eSV7FTKH0a9sw18sm0z0ZE5uw/2Zi+jAtmVkqdHKov+j+Ks
	 biPbd5JesBjnjwOZw3sJsri+d7Mlx0P1hCuClZCHyYYDPiZaTriDExEXZHFWq9M0ZOIFJ
	 jD1Qg9RTN+h7yBQJb8dn5IMJzXuidzYbpzcgyR3DqSUpOa+HgOnBQpDCVneS+J7+qTYe2
	 iE7BWlGGpGeyG/KylqVHut/0xrsppLDfTqNrumSh6C4X+3ezwXy+jh9G3OTr9cdvzxsXi
	 JE8DTj8uEtzBjXZ0eSOavTglcDjMEzgq11+ZC4F5ct7ZR1tJpn7PvY4+DFYZuWnTM4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K4tdWnI7;
	arc=none smtp.remote-ip=91.218.175.251
Received: from mta0.migadu.com (out-251.mta0.migadu.com [91.218.175.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C18E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C18E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K4tdWnI7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=l4Q+B3ckN95O70apojBJmX15Pn2GOJj1UkSRM7DYdlM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795422314; v=1; x=1796027114;
 b=K4tdWnI7VAaOpGFYykIOHfraLSZpvDCbo4InoudFv3P5AUuX3dru72rbEbJ6Bz6yqjUSV9jW
 jwFpqdz7hvbsQDEU5+IuJMhaTjjWKQKypul1pV3Gru5SAThd4I0mUmtXFvqga8+kBn79vbhYWg+
 VdqgRbudRCYd7k1p1/Azwttk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d3238756a42eef48;
	Mon, 23 Nov 2026 08:25:13 +0000
X-Mizu-Trace-ID: d3238756a42eef48
X-Migadu-Flow: FLOW_OUT
Message-ID: <c861d701-09f8-4fc1-a527-e4efd911ef5f@linux.dev>
Date: Mon, 23 Nov 2026 16:25:01 +0800
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
 <20261120100856.16929-3-songmuchun@bytedance.com>
 <a3add5b9-a69e-4e06-b91c-c23db9b6e1ca@linux.dev>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <a3add5b9-a69e-4e06-b91c-c23db9b6e1ca@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/11/23 15:00, Qi Zheng wrote:
>
>
> On 11/20/26 6:08 PM, Muchun Song wrote:
>> Several struct page fields have the same initial values for every 
>> page in
>> a zone. __init_single_page() initializes this state as part of its
>> per-page setup, while the shared vmemmap tail path open-codes only a
>> subset.
>>
>> Factor the PFN-independent state into memmap_init_page() and use it for
>> both regular and shared tail struct pages. Keep section-, PFN- and
>> instance-specific initialization in __init_single_page().
>>
>> This also initializes the last cpupid and KASAN tag for shared tail
>> struct pages consistently with regular struct pages. Since
>> memmap_init_page() marks ZONE_DEVICE pages reserved, remove the 
>> redundant
>> update from the memory hotplug path.
>>
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> v3:
>> - Rename memmap_init_page_common() to memmap_init_page() (suggested by
>>    Mike Rapoport)
>> - Remove redundant ZONE_DEVICE reserved-page initialization 
>> (suggested by
>>    Mike Rapoport)
>>
>> v2:
>> - Remove __meminit from memmap_init_page_common() so HVO shared tail
>>    pages can call it after init text is freed (reported by Sashiko).
>> ---
>>   include/linux/mm.h  |  8 --------
>>   mm/mm_init.c        | 37 +++++++++++++++++++++----------------
>>   mm/mm_init.h        |  1 +
>>   mm/sparse-vmemmap.c |  7 +------
>>   4 files changed, 23 insertions(+), 30 deletions(-)
>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks.

>
> One nit below.
>
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 8883b780b76d..d8bafcd92791 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -3096,14 +3096,6 @@ static inline void set_page_node(struct page 
>> *page, unsigned long node)
>>       page->flags.f |= (node & NODES_MASK) << NODES_PGSHIFT;
>>   }
>>   -static inline void set_page_links(struct page *page, enum 
>> zone_type zone,
>> -    unsigned long node, unsigned long pfn)
>> -{
>> -    set_page_zone(page, zone);
>> -    set_page_node(page, node);
>> -    set_page_section_from_pfn(page, pfn);
>> -}
>> -
>>   /**
>>    * folio_nr_pages - The number of pages in the folio.
>>    * @folio: The folio.
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 0129152b74d8..08d6e47bde22 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -602,15 +602,27 @@ static inline void 
>> vmemmap_optimization_verify_zone(struct page *page)
>>               page_zone_id(page));
>>   }
>>   -void __meminit __init_single_page(struct page *page, unsigned long 
>> pfn,
>> -                unsigned long zone, int nid)
>> +/* Initialize PFN-independent fields common to pages in the same 
>> zone. */
>> +void memmap_init_page(struct page *page, enum zone_type zone, int nid)
>>   {
>>       mm_zero_struct_page(page);
>> -    set_page_links(page, zone, nid, pfn);
>> -    init_page_count(page);
>> -    atomic_set(&page->_mapcount, -1);
>> +    set_page_zone(page, zone);
>> +    set_page_node(page, nid);
>>       page_cpupid_reset_last(page);
>>       page_kasan_tag_reset(page);
>> +    atomic_set(&page->_mapcount, -1);
>> +#ifdef CONFIG_ZONE_DEVICE
>> +    if (zone == ZONE_DEVICE)
>> +        __SetPageReserved(page);
>> +#endif
>> +}
>> +
>> +void __meminit __init_single_page(struct page *page, unsigned long pfn,
>> +        unsigned long zone, int nid)
>
>                 ^ enum zone_type zone?

You are right. But actually, I didn't modify this line, this should be a Git
display issue. Otherwise, this patch will end up mixing in the declaration
changes for this function. I think the right approach is to submit a
separate patch later to handle this cleanup.

Thanks,
Muchun

>
>
> Thanks,
> Qi

