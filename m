Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594818;
	b=Nn6oQvc8i+6EYluNw25X+1lejZOVhpyjhstZ/QoDgWn6jJcokF9WcBefi4Xy6qW/XKuj
	 JnCzaiKDDuOYoIjutWnTb67cR7xHdu8gtC8ETot9sW0b1zdS7qbp4BEKbx6tmIcPD4oIL
	 lmms5rhjwwby8Pbi47+8zcYZg8VnYDAkEQ1mzkpD7C+7SZcsCnwIyvHsm7huXCl2RWKsV
	 C4OQ/TTk9BMQryzY3OXShEXdBMsIidGy2vUzP/9N+q8VpWYGOUJlOldeslCVUDwzN9wFj
	 Q856GpNxVCnbDJQxU9l3j95AVYhpKmBd8kYZ/XXjP4i86M0WTQcBFvX8fsHkgEVivCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594818;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QfZ3lG2uOxeiODVkla0mMOvEHpv7y5P99cIsSRHzDec=;
	b=fjXB9/gAk/wvLIblDkKJYv17Fd56rLp26wJR6grqsL1KPbO1cIbUlNotWN63C+6U0Y07
	 F8CVqEShHFOVdXpimCZrJlwqA97XCNgh1bCtVzoxdLcMscQ8a7m9Mcy+LulYC4jAWNkZs
	 itE7sPZf13kOo3tb00Yz4rWCPG29RdF3t3qyGFd1+rg/3b7pSWkfjZdLyprW9A5KzwGzj
	 nVH4NGKwuP111bpttVLfWduCbq7lpx03ppJJu8J4jQQBNMda1krh43o2/AuyZbMF7taVu
	 9gD0S/mhj37WmrpilFqqPErn9poOjF++q4F48Z9f8Xaz5vVZZdcfYKt/B0ekLxaKUzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y0E4pc8T;
	arc=none smtp.remote-ip=95.215.58.226
Received: from mta1.migadu.com (out-226.mta1.migadu.com [95.215.58.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB86B606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB86B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y0E4pc8T
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/919UxKRMyPlULBGJtfj9Q5QU8pqqMoGwH6XL9fnwpU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795594815; v=1; x=1796199615;
 b=Y0E4pc8THdsEx1zmo1BBP1WSc46ylAD4u0nTAgDtqG+t0su8WW+lI+cyTilfJ0oZVaOsXiaY
 b5OJVJM/YiiPlgPIP0OrTfAqBPxcc6ry8HEK+Wmd4iEoV3S+nb6+bpIjxtUnKalLAlQGtR0Kqm0
 UXj1DIgOXIPph2m4lvGVvtuc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 523a68c985d1740f;
	Wed, 25 Nov 2026 08:20:11 +0000
X-Mizu-Trace-ID: 523a68c985d1740f
X-Migadu-Flow: FLOW_OUT
Message-ID: <b63bc354-0f29-49fb-84ec-313bf4283360@linux.dev>
Date: Wed, 25 Nov 2026 16:20:00 +0800
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
Subject: Re: [PATCH v5 02/11] mm/kmsan: undo the shadow mapping when the
 origin mapping fails
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, stable@vger.kernel.org
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-3-hao.ge@linux.dev>
 <CAJuCfpHOZS6mp_no3wKmU3-S4HKspnbriUw8Mwtxf3nmw0-pfw@mail.gmail.com>
 <CAJuCfpFv=sCeib+SDWJNW6oqbNnhT+m3YjnfKh8jNkquzuYORg@mail.gmail.com>
 <793d63ff-c48b-431d-8a2a-4044feb45721@linux.dev>
 <81b05a10-1b20-4132-8cc6-c71b88f21414@linux.dev>
Content-Language: en-US
In-Reply-To: <81b05a10-1b20-4132-8cc6-c71b88f21414@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Suren


On 2026/11/23 18:15, Hao Ge wrote:
> 
> 
> On 2026/11/23 16:12, Hao Ge wrote:
>> Hi Suren
>>
>> On 2026/11/21 05:49, Suren Baghdasaryan wrote:
>>> On Fri, Nov 20, 2026 at 9:14 PM Suren Baghdasaryan <surenb@google.com> wrote:
>>>>
>>>> On Mon, Nov 16, 2026 at 7:13 AM Hao Ge <hao.ge@linux.dev> wrote:
>>>>>
>>>>> kmsan_vmap_pages_range_noflush() first maps the shadow pages and then
>>>>> the origin pages. If the second mapping fails, the first one is left
>>>>> mapped, and the callers do not roll it back. The next vmap of the
>>>>> same metadata range hits the stale PTEs again and fails with a
>>>>> WARN_ON() and -EBUSY in vmap_pages_pte_range().
>>>>>
>>>>> Undo the shadow mapping on that error path, the same way
>>>>> kmsan_ioremap_page_range() cleans up after a partial failure.
>>>>> __vunmap_range_noflush() only clears the PTEs; nothing has touched
>>>>> the shadow mapping, so no TLB flush is needed.
>>>
>>> After a second thought, kmsan_ioremap_page_range() does not skip TLB
>>> flushing. __vunmap_range_noflush() comment at
>>> https://elixir.bootlin.com/linux/v7.4-rc1/source/mm/vmalloc.c#L497
>>> says:
>>>
>>> The caller is responsible for calling flush_cache_vmap() before
>>> calling this function, and flush_tlb_kernel_range after it has
>>> returned successfully ...". There are no mentions of guarantees that
>>> mapped PTEs require explicit access to be cached. Please double-check
>>> if this is safe.
>>
>> That's a subtle detail. I've looked up the relevant documentation.
>> You are right, and my "no TLB flush is needed" was wrong.
>>
>> The Arm "Learn the architecture" AArch64 memory management guide says it
>> in "TLBs and Changing translations":
>>
>> https://support.arm.com/documentation/101811/0106/TLBs-and-Changing-translations
>>
>> If you change a translation table entry, or the controls that affect how entries
>> are interpreted, then you need to invalidate the affected entries in the TLB. If
>> you do not invalidate those entries, then the processor might continue to use the
>> old translation.
>>
>> The undo changes the shadow PTEs, so the TLB has to be invalidated.
>>
>> I also checked the Arm Architecture Reference Manual:
>> https://support.arm.com/documentation/ddi0487/md/-Part-D-The-AArch64-System-Level-Architecture/-Chapter-D8-The-AArch64-Virtual-Memory-System-Architecture/-D8-16-Translation-Lookaside-Buffers
>> rule R SQBCS:
>>
>> If a stage of translation is enabled for a translation regime that is not out-of-context,
>> any translation table entry for that stage that does not cause a Translation fault,
>> an Address size fault, or an Access flag fault is permitted to be cached in a TLB or
>> intermediate TLB caching structure as the result of an explicit or speculative access.
>>
>> So it may already be cached by speculative access even if there was no explicit access.
>>
>> For the kernel side,  Documentation/core-api/cachetlb.rst
>> https://elixir.bootlin.com/linux/v7.4-rc1/source/Documentation/core-api/cachetlb.rst
>> says that The "TLB" is abstracted under Linux as something the cpu uses to cache
>> virtual-->physical address translations obtained from the software page tables.
>> Meaning that if the software page tables change, it is possible for stale translations
>> to exist in this "TLB" cache. Therefore when software page table changes occur, the kernel will
>> invoke one of the following flush methods _after_ the page table changes occur:
>>
>> The condition there is the page table change, not whether the range was accessed.
>>
>> Likewise, I believe flush_cache_vmap() is also required.
>> The sequence in cachetlb.rst is
>> flush_cache_range()
>> change_range_of_page_tables()
>> flush_tlb_range()
>> so the cache flush has to happen before the unmap.
>> This is exactly the contract that the __vunmap_range_noflush() comment you quoted spells out,
>> the caller is responsible for calling flush_cache_vmap() before the call and flush_tlb_kernel_range()
>> after it.
>>
>> The code will do:
>>
>> --- a/mm/kmsan/shadow.c
>> +++ b/mm/kmsan/shadow.c
>> @@ -258,6 +258,13 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
>>                                             o_pages, page_shift);
>>         kmsan_leave_runtime();
>>         if (mapped) {
>> +               /* Undo the shadow mapping set up above. */
>> +               flush_cache_vmap(shadow_start, shadow_end);
> 
> Sorry, this should be flush_cache_vunmap.
> 
>> +               kmsan_enter_runtime();
>> +               __vunmap_range_noflush(shadow_start, shadow_end,
>> +                                      gfpflags_allow_blocking(gfp_mask));
>> +               kmsan_leave_runtime();
>> +               flush_tlb_kernel_range(shadow_start, shadow_end);
>>                 err = mapped;
>>                 goto ret;
>>         }
>>
>> Thanks a lot for catching this, I learned quite a bit about the TLB
>> along the way. 
>>

Let's revisit this. Unless I'm missing something, the unmap counterpart,
kmsan_vunmap_range_noflush(), appears to be missing its TLB flush.

Taking vmalloc as the example:

vmalloc
    __vmalloc_area_node()
        vmap_pages_range()
            vmap_pages_range_noflush()
                kmsan_vmap_pages_range_noflush()
		    installs the shadow/origin and flushes
		    their TLB at the tail /* flushed */

vfree
    remove_vm_area
        free_unmap_vmap_area
            vunmap_range_noflush /*shadow/origin PTEs cleared,
				   no TLB flush */
            free_vmap_area_noflush() /* area -> lazy list

    ... later, when the lazy list is settled: 
    __purge_vmap_area_lazy
        flush_tlb_kernel_range(start, end);
        /* no shadow/origin tlb flush */

So unlike the normal paths, KMSAN performs the TLB flush when the range
is reused and re-mapped, rather than flushing it immediately after unmap.

I'm not sure this is safe. Reading the documentation, this should not be safe,
perhaps I have misinterpreted the documentation.
If this was intentional, maybe a TLB flush is not required here, but if so I would
expect it in the purge instead, together with the main range. After all, vmalloc is
frequently called, and lazy TLB flushing is an existing optimization for vmalloc.

Would you mind taking a look at this concern, or letting me know who I could ask?
This would be a good opportunity for me to brush up on my TLB knowledge, and I would
greatly appreciate your input.

Thanks
Best Regards
Hao

>> Thanks
>> Best Regards
>> Hao
>>>
>>>>>
>>>>> Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_pages_range_noflush()")
>>>>> Cc: stable@vger.kernel.org
>>>>> Suggested-by: Suren Baghdasaryan <surenb@google.com>
>>>>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>>>>
>>>> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
>>>>
>>>>> ---
>>>>>  mm/kmsan/shadow.c | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
>>>>> index 0c88d89bf0d6..212449db34a1 100644
>>>>> --- a/mm/kmsan/shadow.c
>>>>> +++ b/mm/kmsan/shadow.c
>>>>> @@ -258,6 +258,11 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
>>>>>                                             o_pages, page_shift);
>>>>>         kmsan_leave_runtime();
>>>>>         if (mapped) {
>>>>> +               /* Undo the shadow mapping set up above. */
>>>>> +               kmsan_enter_runtime();
>>>>> +               __vunmap_range_noflush(shadow_start, shadow_end,
>>>>> +                                      gfpflags_allow_blocking(gfp_mask));
>>>>> +               kmsan_leave_runtime();
>>>>>                 err = mapped;
>>>>>                 goto ret;
>>>>>         }
>>>>> --
>>>>> 2.25.1
>>>>>
