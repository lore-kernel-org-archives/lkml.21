Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982649;
	b=Cr2+iws+rcHsr6KEjxhryjpU6nAImDPkiShuxlLfeK/sRNhpmExni7e5sIGSIwMdTy2G
	 COgztB+OAuO7Y8J2v29yLBayGpu57TyqY3ra3oPx4SV0c9sC3N/0VIV8ZqdrMuGhoSg1G
	 Zaw14KPftui3WkEy6dN+vKFGd1Wt9KpWN3TjX3fOLsXscyBqNDQMDDMPbqw1pkCBZf6WK
	 cHdFncB6tc9PObmrOr6xp4e7uPcsigUeWTC/xDhoZorgWHSwVRjTQHipjxEyP9w9yFkmg
	 MCjyXYOpRHojJdyGW4rmB4w5fz2W988gym/7fid+0Evq9mmypJPzYeO26uInee0fqIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982649;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=n9fOIxOwET96uC8roh03DOKW3+w63/lkWzkOzpEHPkw=;
	b=wykArgNeAGM5z9Ol/ooYl2F3osr+enSrrYt9eTH2pvgf//ZNaadRgUJQL33kn8JHXkME
	 5xevJtZGhRBnMYZhCUT7MZjldFlfEFbaN3lPdAm7A3SSclEQ+ZKAqwK4vcq9NWZRgB5sC
	 g2ft1zPD2fkyfy7DLPjoGc8aJw2KyuJ6oggQdcc1tAk+UuzhmQL4Pd4pz6lLRVTTUYunF
	 RbwH7KnJ6ZlGUaSGLJg6Fvq8+mgYn4gFp73X8170RQ779OxSbKIg9BktJHKt9nZBCPsf+
	 7K98loCHup571CT9aW+5+WjF+ykCD2lJ6hYcuI37h3k7KYo/q4SwcukC5tSoct7QiFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=BjUkOhsx;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD4606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04BD4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=BjUkOhsx
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794982638; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=n9fOIxOwET96uC8roh03DOKW3+w63/lkWzkOzpEHPkw=;
	b=BjUkOhsxibtOHntEP80wZvqrf7BlR5gSSaiB3Fx+Ih2lldjz63JktpXeJIwtJCVwngaM3cei/Q5d3k/9W0hbq/OF6vlBJm32pNNKh++7oC7bEuvS59G2h47099vaYHouBzKjCiuCOsugQCCG7xgXcA0KAfbGQt17oiT6RCcoj+g=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R281e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XF.fYJZ_1794982636;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XF.fYJZ_1794982636 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 14:17:17 +0800
Message-ID: <1001fb37-5db0-4b25-9807-0cc39d9ba03a@linux.alibaba.com>
Date: Wed, 18 Nov 2026 14:17:16 +0800
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
Subject: Re: [PATCH v2] mm: use memory barriers for non PMD-sized folios to
 sync
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, riel@surriel.com,
 liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com,
 lance.yang@linux.dev, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <6274e62645b9f176dd10d7a79e86b900a39cec5f.1794898535.git.baolin.wang@linux.alibaba.com>
 <avxb050XeV895evT@gremlin>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <avxb050XeV895evT@gremlin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/26 9:53 PM, Lorenzo Stoakes (ARM) wrote:
> On Tue, Nov 17, 2026 at 03:00:30PM +0800, Baolin Wang wrote:
>> Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped folios")
>> uses PMD lock via sync_with_folio_pmd_zap() to synchronize when a cleared
>> PMD is found while unmapping a folio.
>>
>> However, for non PMD-sized folios, the only PMD clear that can race with
>> this unmap is PTE table reclaim, which clears the PMD only after the rmaps
>> for the table have been removed. This is plain message passing, and taking
>> the PMD lock is more than needed, like I did in the previous patch[1].
> 
> But it doesn't automatically mean that you _have_ to use fragile memory
> barriers?
> 
> Correctness and robustness in the future are important right? You need to
> justify this properly.

Sorry, I wasn't clear. The point of this patch is to avoid a possible 
performance regression from taking the PMD lock to sync for non 
PMD-sized folios. So using memory barriers can avoid this.

The description below explains why memory barriers are enough here.

>> Without barriers, the walker can observe the cleared PMD but a stale
>> mapcount on weakly ordered architectures:
> 
> You mean without the PMD lock?

Yes, will make it clear.

>> CPU 0 (unmap folio)                 CPU 1 (MADV_DONTNEED, full PMD)
>> ================================    ================================
>> folio_lock()
>>                                      lock(ptl)
>>                                      clear PTEs
>>                                      remove rmaps   /* W mapcount */
>> [mapcount load satisfied early,
>>   folio still mapped]
>>                                      pmd_clear()    /* W pmd */
>>                                      unlock(ptl)
>> pmdp_get_lockless() -> none         /* R pmd */
>> skip the PMD
>> folio_mapped() -> true              /* R mapcount, stale */
>> unmapping assumed to have failed
>>
>> Pairing an smp_wmb() before the PMD clear with an smp_rmb() after the
>> PMD read forbids this outcome:
>>
>> CPU 0 (unmap folio)                 CPU 1 (MADV_DONTNEED, full PMD)
>> ================================    ================================
>>                                      remove rmaps   /* W mapcount */
>>                                      smp_wmb()
>>                                      pmd_clear()    /* W pmd */
>> pmdp_get_lockless() -> none         /* R pmd */
>> smp_rmb()
>> folio_mapped()                      /* R mapcount */
>>
>> If R pmd observes W pmd, R mapcount must observe W mapcount, so
>> folio_mapped() no longer reports the removed mappings.
> 
> This is insufficient IMO, you need to explain firstly why acquire/release isn't
> feasible (presumably because you can't synchronise the clear properly that way).

Sure. Using the PMD lock (with its implicit acquire/release semantics) 
would also work. However, as I mentioned above, the concern is the 
potential performance regression.

>> Pass a 'folio' parameter to sync_with_folio_pmd_zap(), allowing us to
>> skip those pfn walkers: pfn_mkclean_range and mapping_wrprotect_range,
>> which don't need synchronization.
>>
>> Similarly, skip sync for page_mapped_in_vma() since the subsequent
>> operations don't check the folio's mapcount.
>>
>> No changes for PMD-sized folios unmapping.
>>
>> [1] https://lore.kernel.org/all/542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com/
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> This replaces an easy-to-reason about lock with a very-hard-to-reason about
> memory barriers that are fragile and could easily break resulting in subtle data
> race bugs.
> 
> And you don't seem to have provided any perf numbers or anything to justify it
> unless I'm missing something?

Yes. Performance measument for this race path may be tricky, but I'll 
try to see whether I can show a measurable benefit with memory barriers.

> I'm a little uneasy about it honestly.
> 
>> ---
>> Changes from v1:
>>   - Pass in a folio for sync_with_folio_pmd_zap(), per David.
>> ---
>>   include/linux/rmap.h |  2 ++
>>   mm/internal.h        | 26 ++++++++++++++++++++++----
>>   mm/memory.c          | 12 ++++++++++--
>>   mm/page_vma_mapped.c |  4 ++--
>>   4 files changed, 36 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>> index 74cca0e3c726..62e7341de179 100644
>> --- a/include/linux/rmap.h
>> +++ b/include/linux/rmap.h
>> @@ -862,6 +862,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>>   #define PVMW_PGTABLE_CROSSED	(1 << 16)
>>
>>   struct page_vma_mapped_walk {
>> +	struct folio *folio;
>>   	unsigned long pfn;
>>   	unsigned long nr_pages;
>>   	pgoff_t pgoff;	/* Only meaningful if nr_pages > 1 and not a KSM walk */
>> @@ -876,6 +877,7 @@ struct page_vma_mapped_walk {
>>
>>   #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
>>   	struct page_vma_mapped_walk name = {				\
>> +		.folio = _folio,					\
>>   		.pfn = folio_pfn(_folio),				\
>>   		.nr_pages = folio_nr_pages(_folio),			\
>>   		.pgoff = folio_pgoff(_folio),				\
>> diff --git a/mm/internal.h b/mm/internal.h
>> index cd3675c044e0..ad7e051cb198 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -592,6 +592,7 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
>>    * sync_with_folio_pmd_zap - sync with concurrent zapping of folios
>>    * @mm: The mm_struct.
>>    * @pmdp: Pointer to the pmd that was found to be pmd_none().
>> + * @folio: The folio being zapped.
>>    *
>>    * When we find a pmd_none() while unmapping a folio without holding the PTL,
>>    * zap_huge_pmd() may have cleared the PMD but not yet updated the folio
>> @@ -600,13 +601,30 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
>>    * against later mapcount reads. Skipping the PMD without synchronization
>>    * could make folio unmapping code assume that unmapping failed.
>>    *
>> - * Wait for concurrent zapping to complete by grabbing the PTL.
>> + * Wait for concurrent zapping to complete by grabbing the PTL for PMD-sized
>> + * folios, otherwise smp_rmb() is sufficient.
>>    */
>> -static inline void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
>> +static inline void sync_with_folio_pmd_zap(struct mm_struct *mm,
>> +		pmd_t *pmdp, struct folio *folio)
>>   {
>> -	spinlock_t *ptl = pmd_lock(mm, pmdp);
>> +	if (folio_test_pmd_mappable(folio)) {
>> +		spinlock_t *ptl = pmd_lock(mm, pmdp);
>>
>> -	spin_unlock(ptl);
>> +		spin_unlock(ptl);
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * For non PMD-sized folios zapping, concurrent zap_empty_pte_table()
>> +	 * may clear the PMD after the rmaps for the table have been removed,
>> +	 * but later mapcount reads could still be observed before the PMD
>> +	 * read, making the folio appear to be still mapped after unmapping.
>> +	 * Order the PMD read before later mapcount reads, so that observing
>> +	 * the cleared PMD implies observing the rmap removals.
>> +	 *
> 
> This also makes me very uneasy, complicated reasoning like this is asking for it
> to break.
> 
> Also could this be smaller and clearer?

OK. Let me try.

Thanks.
