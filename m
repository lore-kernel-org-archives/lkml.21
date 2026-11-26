Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675900;
	b=p5May59dYD+1wgtH6Ka6LEBQG/UyJIgZt3tkr/XANNaG6u5CynjP1OVIIadz9FFzQf0S
	 a2K0nTQ6xD9vQH8o0iEsd1mHeYB20eRRX9jz1DmnStM7COEukX9JYJBY4xE2xk+m0o6vp
	 L591xv5KA488LaUQy6Z0i0UnGGziO9QGFw1x0SA00r/f/9IODdd6tZ9QndV3M0SUBhm3i
	 N0wzj4y7gvl23z4PM0AwrTwN1jQur5T7D5r/EeiYXYshcTtwFdUjc6teporFlso32csT0
	 aOv9d3LpaeRfco2NTo/YKcxHY/xSOm96n01zrK5GVkk5z+l78BJeyF3usekN9GCiQfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qgZPY9XxUKQr2+5N7yniU8q2qGiJR/Q11OQDMcZeiiE=;
	b=5Gr8W40Zw9bLGR9g8byYORvRKrmjWcKSWw+5EVdo7+b3xfenF5VsECJT5XY19/B/TpH3
	 cXjwP6N8+tVAxBbS8L+N54/SAfC8bQw6eEv5q1s2FeC6yrBT55j3nXbX0OqaGk98O4Dfd
	 K08GA+1UtCGnnJ6A/UAwss4EzPx+d7vEWVM/aWd/hAtguMrHytuRJANEwATGuZO7FLQVe
	 LAJ6XxcOpYHSxel4YzFfEMxM3GoxIH8cu0bfFFZAT/SlB7is+fJHdByD6x/vIa55jIaNl
	 bpgLbp1tQB/XhEZ9Pb2CutGtZe868fStH9oDFFiPwIB2+bYnHPe0P02hqVB+FXuYy0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v7q8/mp2";
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E609606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E609606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v7q8/mp2
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3b4be95e0aeso895914a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675900; x=1796280700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgZPY9XxUKQr2+5N7yniU8q2qGiJR/Q11OQDMcZeiiE=;
        b=v7q8/mp21ZPaY5sFea6Vda6lNQvVJcIdX4Gf98tOlU8xITGUc5m6xIxqmwn8TIMisb
         /UWIpHiXD5KNutNTItM2iqxQ5mEA1ol1CXcHWMxkGr4SxbWCrPqpStNXGhgtyDCnfaNk
         HTpqXpqKT2WoWSL4m46chCbt60vjNu8Qrr/ZcaJtAy7Ko+OelS1dQkVb7z/CXqNXXENl
         ImzROkxP9f70ajInFQr5Izw4JEPcCkAh+U5GqLxj8Lw2TMhNO1H0tYmC3N4rnoE8cuaI
         3uMlQGbGRvcDKCh/B8gY+rC1dK36/0Li2ZUG5qNc4KikXJSZxsNVyvOuBS2jvMQ7SI+Z
         oujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675900; x=1796280700;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgZPY9XxUKQr2+5N7yniU8q2qGiJR/Q11OQDMcZeiiE=;
        b=1CTe0nuD+OGi6t44Raabh+mChvxwOIJ/izj3Buvm3jwXoAJOQnzYrG8KcH9u7shySD
         forUUMYypFo5+xKuMJD90BzbmxpOXqyALFRCUKcMbH3OiLsEHhTqpZurdGPnOwQJA96n
         jIP2Vj29vYFpBNZziuQDuctNdXDn631kcoNQ0+WhhqPkHvZBYkbp7J/jeCZrkJLL5ECh
         SCYwoQX4YcC8pzX8WLMO0AMnQp/Do4pI0528uRL9yiifY4wCdHpcRhC6CPTA+iCpjSKg
         CKBt5MBBOLIlHIMPtz+PAW5EgY18AZbdT/7j9NGt1kO5KPKxLc54GUOtPKM9ip4fnkx8
         sPDQ==
X-Forwarded-Encrypted: i=1; AL+hErFfuqBGL22KUo0cdzygvHYwrVxKMNVQYjsFeDJfq8W6C1jMiZckWaDyjQ73u/4KzRQWOMD2p0i+0+Ry5X0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ueBneuFLfLQs1+kmYH4g5brLxYsIyfheGIaWvcdD3k87xKWHz
	wzNQhX+IJJF6FucysFjJf0iPZtfz+b+Em4FmsUTw5OJLEp4udYu107uD
X-Gm-Gg: AZFdTZeQhRYKslB+ijOWFvqP80ISKHhGG5oVT+I4JSjxdyxQp8DvKE73AlVbUoacrPs
	zK/fzp4g41H2NbKa5YvUkcuoWqudEUMK8neXx1jUc07F7IsYOF0wrxaD1tNkO+7mN+XsAizmtDP
	sr0kfInWjFsj2S6lRrU02Ei9xMdhdBMl9jyQ74Vh1Gu/pwJUgoElBeB1TTr5mwc8ciV5/mBlXwI
	3yta/+4V7zOrJu7F6xZr6l/G4MYfYLevvDxRzoNtRZdZkKu136laTyTGY7OF3iAQ22x0mI3kSIf
	RZLO/PF6T1SFqlX/1RzEF1pLzwqcu4+4hSAHlwDjOWE2glPOMZvJzT+t73shwpwzSDr3ax8ggaf
	6ZcK3xrSG/AOCMFOHyJDX/TpVVOioi5YYfls5GpIKgdpa1BhOit5vDKysYBeW//n/zkl/ZrljMu
	Gj6bKYbeze1CHNy+ToOmwK9SBq1vvoQh5l+UetpSPexbBQSnbr0HhOI4SNmgsW1RZDipw0Ina0U
	E7VTZkyxoHfBPF9jnXKKN6qTrPsCurjHTiW8j3lArv6QWDOdwRpA0VqoxKL7qkxOJevw4AYmpJu
	JnN2iUaDlHZ+FRiaAEYd2Zo1gALsp9KEAZANUQ==
X-Received: by 2002:a17:90b:3e48:b0:3ac:a521:95e with SMTP id 98e67ed59e1d1-3b41c94ce48mr19675123a91.47.1795675899855;
        Wed, 25 Nov 2026 22:51:39 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm33651753a91.5.2026.11.25.22.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 22:51:38 -0800 (PST)
Message-ID: <b50cd305-3528-445d-bfa6-e4d7ada43b13@gmail.com>
Date: Thu, 26 Nov 2026 14:51:28 +0800
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
Subject: Re: [PATCH 2/3] mm/migrate: batch PTE restoration in
 remove_migration_pte()
From: Wandun <chenwandun1@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, shivankg@amd.com
Cc: david@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, byungchul@sk.com,
 gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com
References: <20261120032949.2036731-1-chenwandun1@gmail.com>
 <20261120032949.2036731-3-chenwandun1@gmail.com> <awBjoC-YFf6KPYT1@gremlin>
 <fa05e353-0786-42de-96fd-8a9b1ee725ac@gmail.com>
Content-Language: en-US
In-Reply-To: <fa05e353-0786-42de-96fd-8a9b1ee725ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/23/26 15:25, Wandun wrote:
> 
> 
> On 11/20/26 23:22, Lorenzo Stoakes (ARM) wrote:
>> On Fri, Nov 20, 2026 at 11:29:48AM +0800, Wandun Chen wrote:
>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>
>>> remove_migration_pte() restores PTE-mapped large folios one PTE at a
>>> time, constructing each new PTE and updating the folio references and
>>> rmap separately.
>>>
>>> Add migration_pte_batch() to find adjacent migration entries with
>>> consecutive PFNs and matching type and flags.
>>>
>>> When a batch covers the whole folio, the rmap helpers already call
>>> mlock_vma_folio(). Skip the explicit call to avoid double mlock
>>> accounting.
>>>
>>> Device-private PTEs encode PFNs as swap offsets. set_ptes() does not
>>> handle this encoding when constructing subsequent PTEs, such as on
>>> arm64 with a 16KB page granule, leaving device-private destinations
>>> unbatched. The next patch enables batching for these entries by
>>> advancing their softleaf offsets.
>>>
>>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>>> Link: https://lore.kernel.org/lkml/5f9c449e-43b3-4732-9c14-8199418cace0@kernel.org/
>>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>>> ---
>>>  mm/internal.h |  6 ++++++
>>>  mm/migrate.c  | 35 +++++++++++++++++++++++++++++------
>>>  2 files changed, 35 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/mm/internal.h b/mm/internal.h
>>> index 9f78c12882cb..e6ecf307d532 100644
>>> --- a/mm/internal.h
>>> +++ b/mm/internal.h
>>> @@ -552,6 +552,12 @@ static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>>>  	return __softleaf_pte_batch(start_ptep, max_nr, pte);
>>>  }
>>>
>>> +static inline int migration_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>>> +{
>>> +	VM_WARN_ON(!softleaf_is_migration(softleaf_from_pte(pte)));
>>> +
>>> +	return __softleaf_pte_batch(start_ptep, max_nr, pte);
>>> +}
>>>  #endif /* CONFIG_MMU */
>>>
>>>  void __acct_reclaim_writeback(pg_data_t *pgdat, struct folio *folio,
>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>> index 3c39d309e6bd..e000ef77ea87 100644
>>> --- a/mm/migrate.c
>>> +++ b/mm/migrate.c
>>> @@ -358,6 +358,7 @@ static bool remove_migration_pte(struct folio *folio,
>>>  	while (page_vma_mapped_walk(&pvmw)) {
>>>  		rmap_t rmap_flags = RMAP_NONE;
>>>  		unsigned long idx = 0;
>>> +		int nr = 1;
>>>  		softleaf_t entry;
>>>  		struct page *new;
>>>  		pte_t old_pte;
>>> @@ -441,17 +442,34 @@ static bool remove_migration_pte(struct folio *folio,
>>>  		} else
>>>  #endif
>>>  		{
>>> +			if (folio_test_large(rmap_walk_arg->folio) &&
>>> +			    !is_device_private_page(new)) {
>>> +				unsigned long end_addr = pmd_addr_end(pvmw.address, vma->vm_end);
>>> +				unsigned long max_nr = (end_addr - pvmw.address) >> PAGE_SHIFT;
>>
>> const please
> 
> Will do in next version.
>>
>>> +
>>> +				max_nr = min_t(unsigned long, max_nr,
>>> +					       PTRS_PER_PTE - pte_index(pvmw.address));
>>> +
>>> +				max_nr = min_t(unsigned long, max_nr,
>>> +					       folio_nr_pages(rmap_walk_arg->folio) - idx);
>>> +
>>> +				nr = migration_pte_batch(pvmw.pte, max_nr, old_pte);
>>> +			}
>>> +			if (nr > 1)
>>> +				folio_ref_add(folio, nr - 1);
>>> +
>>
>> Please let's not insert a bunch more open-coded bits in an already way-too-big
>> function :)
>>
>> If you need to add functionality to a function like this, please take the time
>> to pay down technical debt and refactor it first.
> 
> Sure, I’ll do some refactoring first in the next version.

I noticed that Shivank’s migration rmap batching series [1] covers much of the
work I was planning in response to review feedback. That includes the preparatory
refactoring and the restore-side PTE batching during the mlock discussion.

Given that overlap, I’ll put my series on hold for now and see what follow-up
work I can take on once Shivank’s series is merged.

I’d also be happy to work with Shivank on restore-side PTE batching if that
would be helpful.

[1] https://lore.kernel.org/linux-mm/20260813-migrate-rmap-batch-v2-0-3c5424c555c7@amd.com/

Thanks,
Wandun




> 
> Thanks,
> Wandun
> 
>>
>>>  			if (folio_test_anon(folio))
>>> -				folio_add_anon_rmap_pte(folio, new, vma,
>>> -							pvmw.address, rmap_flags);
>>> +				folio_add_anon_rmap_ptes(folio, new, nr, vma,
>>> +							 pvmw.address, rmap_flags);
>>>  			else
>>> -				folio_add_file_rmap_pte(folio, new, vma);
>>> -			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
>>> +				folio_add_file_rmap_ptes(folio, new, nr, vma);
>>> +			set_ptes(vma->vm_mm, pvmw.address, pvmw.pte, pte, nr);
>>>
>>> -			ptes++;
>>> +			ptes += nr;
>>>  		}
>>>  		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
>>>  			if (folio_test_large(folio) &&
>>> +			    nr < folio_nr_pages(folio) &&
>>>  			    ptes == folio_nr_pages(folio) &&
>>>  			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
>>>  				mlock_vma_folio(folio, vma);
>>> @@ -462,7 +480,12 @@ static bool remove_migration_pte(struct folio *folio,
>>>  					   compound_order(new));
>>>
>>>  		/* No need to invalidate - it was non-present before */
>>> -		update_mmu_cache(vma, pvmw.address, pvmw.pte);
>>> +		update_mmu_cache_range(NULL, vma, pvmw.address, pvmw.pte, nr);
>>> +
>>> +		if (nr == folio_nr_pages(folio)) {
>>> +			page_vma_mapped_walk_done(&pvmw);
>>> +			break;
>>> +		}
>>>  	}
>>>
>>>  	return true;
>>> --
>>> 2.43.0
>>>
>>
>> --
>> Cheers, Lorenzo
> 

