Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422087;
	b=31e2Z+T21YSkr+WG1nQ7QQfO1u5OZJWUKg+0bCvsxi+fiuxJbEeyetvnR88IEx4MWZci
	 oZUkpcN/GtWelr+SsQ1qRSVvOLKkmLbSg81stkRy9pLLz/I+qhWsTr2MoHTbAyP/3DeS/
	 4zr8dRp8iHrWBHnMbgg1kuSPpXzrx4kL8GDjaNwFxTmCMThvI7k5PtG84/my4oOxUgQG2
	 JjLXIZBJ66TCOfvznIOFbarPhNIn4r/XrD+HzCk6JGVSgKvgj8bMt5ThIHXPynIvCkcYo
	 UWwn809wxeZCXFc/AUKDBg71LmABw2pmCjnFc5UjME3U3CstrPZMwVGf+/ghLkhMIGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422087;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NsGN37ONxhWiQHsuGTHmCPtePmFZQ90N8jgbH9R3tjs=;
	b=PT2hpqHn2kRwsntKwvA7iSHP6e20HEPI+Yv8hvIuMJhQj3Vqwi7hsh4UXbJ2Kx9lGAw6
	 p77G3ISiQ9Tm7AaJ0Oqfwyvl9yyJyAJp9F1zabfWo3CstdJC1392TR4AR8aXY9yFfsf09
	 gnj+rs8QcZeH2SOBsd14Ap6XcY+idjQZWQNA5y/ruNk8sREBYCqakcexdNhnuJKUJLi0B
	 tpQ4y55ZYK7W1jz9q0Ye1VWj5XtjquEao1eIzdXr7d8dQvF2BkyHq4op79bpXtwwQamIa
	 8duxqQ9AEtohXB9Tl3pZQ2FYhl1uAJWjhUECjp9P/Th6h8tx1Dj7e8n18eReoTQJlDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vkAEmZUc;
	arc=none smtp.remote-ip=91.218.175.149
Received: from mta0.migadu.com (out-149.mta0.migadu.com [91.218.175.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4C8606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vkAEmZUc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jFAjxaLybVulQPxCbHrlgyE2DA1FJX+f642lA9A44iM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795422083; v=1; x=1796026883;
 b=vkAEmZUcXYkIQJ9hICBvhjRzH+Sb5JvwVL9/6oE4EhLf0nUusrSTAnWPC8XkzVAeSZ1XMSTk
 7hM+eGZn70MF4lVAhU4AlbdxGCZBuv5VJc3NacMS2PSnGJLvb7GP34UQPuNlmNd/QRcUo+vxGB9
 5vf22GmvaSkGPK8cLrq1OXTw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 09738cf93fe26e03;
	Mon, 23 Nov 2026 08:21:23 +0000
X-Mizu-Trace-ID: 09738cf93fe26e03
X-Migadu-Flow: FLOW_OUT
Message-ID: <4570f62a-b85b-442d-93a4-075cf7c59717@linux.dev>
Date: Mon, 23 Nov 2026 16:21:17 +0800
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
To: Muchun Song <muchun.song@linux.dev>
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
 <10263c9e-2d58-4149-a3c4-df9cac11b041@linux.dev>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <10263c9e-2d58-4149-a3c4-df9cac11b041@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/23/26 4:15 PM, Muchun Song wrote:
> 
> 
> On 2026/11/23 14:39, Qi Zheng wrote:
>> Hi Muchun,
>>
>> On 11/20/26 6:08 PM, Muchun Song wrote:
>>> Template-based ZONE_DEVICE initialization bypasses
>>> __init_single_page(), which means copied struct pages do not run the
>>> vmemmap zone consistency check.
>>>
>>> Verify each destination after copying the template so the fast path gets
>>> the same validation as regular page initialization.
>>>
>>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> Reviewed-by: Lance Yang <lance.yang@linux.dev>
>>> ---
>>> v3:
>>> - Retarget zone verification to
>>>    zone_device_page_init_from_template() after integrating the helper
>>>    series (suggested by Mike Rapoport)
>>> - Collect Reviewed-by from Lance Yang
>>>
>>> v2:
>>> - Apply the zone verification in memmap_init_page_from_template().
>>> - Collect Reviewed-by from Mike Rapoport.
>>> ---
>>>   mm/mm_init.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>>> index a9d848c92678..0129152b74d8 100644
>>> --- a/mm/mm_init.c
>>> +++ b/mm/mm_init.c
>>> @@ -1082,6 +1082,7 @@ static void 
>>> zone_device_page_init_from_template(struct page *page,
>>>           set_page_address(template, __va(pfn << PAGE_SHIFT));
>>>   #endif
>>>       memcpy_nontemporal(page, template, sizeof(*page));
>>> +    vmemmap_optimization_verify_zone(page);
>>
>> For PAGE_SIZE-aligned devdax, dev_dax_probe() leaves
>> pgmap->vmemmap_shift at zero. When section_activate() populates a full
>> section for this pgmap, it records compound_page_order = 0.
>>
>>   memmap_init_zone_device() (pfns_per_compound == 1)
>>     -> zone_device_page_init_from_template() (each template copy)
>>       -> vmemmap_optimization_verify_zone()
>>         -> pfn_to_section_compound_order(page_to_pfn(page)) returns 0
>>         -> vmemmap_optimizable_order(0) returns false
>>
>> With CONFIG_DEBUG_VM and CONFIG_VMEMMAP_OPTIMIZATION enabled, the
>> section-order lookup runs for each copy. The zero order makes the
>> condition short-circuit before either page_zone_id() call.
> 
> You are right, but we really don't care about the performance of a
> debug kernel.

Yeah, it doesn't really matter much in practice.

> 
> memmap_init_page_from_template is used to init a single page, just
> like __init_single_page does. Therefore, in a sense, the template
> version should be handled the same way.
> 
> So, what do you think?

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi


