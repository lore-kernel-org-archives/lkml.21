Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431050;
	b=cpIf/ZvQ/O+RMk6d1qHpvBi4zhPYOGT+AM+xXLaK1ZQffitG2pgL2W8fBnxcQvsrlLGH
	 GwDUWj89xDil+D4XrlgLuTawYwUOMvfi6sgZEIU7oxVC4mCRo+RFMt+mLmLhmw7ezCUoN
	 ctavJDSXpbaAKgPn9CxV14wk2JIcDnMZ+5UCp+683zgDvPYxSch92gLhmKeGdHsEWR8hq
	 2q0ENM4ITfWWgzZlPvqoAdW9qaMCDDagrYV2sYuLccnP2ZRbqj6OLjCWC+Pu1xhoakjzK
	 6Zm4WW+ww1ZZfRq1PWWhYp7NzWp5XAAC8dr1acfD/BfPxPGw2xWGNsWkO4U5sbWO43w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431050;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vhvizTOCvV4TIlk2GcF40P/D+TPRIEQFdThENdsfieo=;
	b=KfRujAmxSbuO3Nv/QSZoE1l1tVE3RuHAuUygVut586yYhxL7Ti5HsHd2QUWZGobYFAdI
	 7+fYVt77pRfiUGmdVieIKjvd3gUO/UmhJN2RkN4w3tucOk/VptWSDmBCaj8fdMoTKRpkH
	 kpNyQYfbFf6rnx7Ezt3zddA6Yhl7MCF+CYSJonwvWs6BmMlA4xP8jaWfoI/Vz6+HPkTwi
	 M+Ne8VtAurqH4EEoyyeqtVut/Y5gvcVtDRejefS1xWvGc50eLuP+XIOFQuWdk9VZeDDtq
	 8d3egHWlBBObkiyHcP6WlWTvci+r2dqzntONmC1BUoegkNRXA05c+1mW5npUseica8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oR3Dklxi;
	arc=none smtp.remote-ip=95.215.58.127
Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B78606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B78606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oR3Dklxi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=viMFF8KDVrzt4/XX4zUzvKF7yd+58lRueswEeUuhWIA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795431048; v=1; x=1796035848;
 b=oR3DklxiA5CoSXAZwGsWaPrByW1kvROR7Kr3EoFwViPCxlgljJ+wob3xqCEsNUDPT8i4+ST3
 L7NIxTpQLucT7oY9wprkbBPdYbIZjVyg2v7V1n+r5GQj/tG3KRlrJvckZeMy4Jcr7lQV2yd5Ln4
 1fKa6HHBU/ZzBB6IKR2uZSHY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6aa3c8c191b175a9;
	Mon, 23 Nov 2026 10:50:35 +0000
X-Mizu-Trace-ID: 6aa3c8c191b175a9
X-Migadu-Flow: FLOW_OUT
Message-ID: <7fad5338-7e9e-4fcf-b369-20f80639a9e4@linux.dev>
Date: Mon, 23 Nov 2026 18:50:28 +0800
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
Subject: Re: [PATCH v5 07/11] mm/vmalloc: undo what
 __vmap_pages_range_noflush() mapped on failure
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
 kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-8-hao.ge@linux.dev>
 <CAJuCfpFvA5oqop2tovy33fKydx7n8Sm=X-hE0sJxpcR1gg5hMA@mail.gmail.com>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <CAJuCfpFvA5oqop2tovy33fKydx7n8Sm=X-hE0sJxpcR1gg5hMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Suren

On 2026/11/22 11:58, Suren Baghdasaryan wrote:
> On Sun, Nov 15, 2026 at 11:14 PM Hao Ge <hao.ge@linux.dev> wrote:
>>
>> __vmap_pages_range_noflush() maps a struct page array and may fail
>> half way. The ptes installed so far stay behind, so a retry of the
>> same range, the __GFP_NOFAIL loop in __vmalloc_area_node() or the
>> module tags populate, trips the WARN_ON(!pte_none()) in
>> vmap_pages_pte_range() and fails with -EBUSY.
>>
>> vmap_pages_range_noflush_walk() now reports how many pages it
>> installed through its running index into the pages array, and
>> __vmap_pages_range_noflush() undoes [addr, addr + mapped_pages *
>> PAGE_SIZE) on failure. vmap_pages_pte_range() fails with -EBUSY
>> instead of installing over a pte that is already set, so the ptes
>> below that point are all ours, while a pte above it can only have
>> been put there by somebody else, for example when the caller's range
>> overlaps an existing mapping. Going further would clear ptes that
>> are not ours.
>>
>> This path can run with a non-blocking gfp mask, the undo passes
>> gfpflags_allow_blocking() as can_resched.
>>
>> Suggested-by: Suren Baghdasaryan <surenb@google.com>
>> Suggested-by: Uladzislau Rezki <urezki@gmail.com>
>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>> ---
>>  mm/kmsan/hooks.c  |  4 ++--
>>  mm/kmsan/shadow.c |  4 ++--
>>  mm/vmalloc.c      | 36 +++++++++++++++++++++++++++++-------
>>  mm/vmalloc.h      |  3 ++-
>>  4 files changed, 35 insertions(+), 12 deletions(-)
>>
>> diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
>> index 69008b085658..d830a4e649f1 100644
>> --- a/mm/kmsan/hooks.c
>> +++ b/mm/kmsan/hooks.c
>> @@ -208,7 +208,7 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
>>                 mapped = __vmap_pages_range_noflush(
>>                         vmalloc_shadow(start + off),
>>                         vmalloc_shadow(start + off + PAGE_SIZE), prot, &shadow,
>> -                       PAGE_SHIFT);
>> +                       PAGE_SHIFT, gfp_mask);
>>                 if (mapped) {
>>                         err = mapped;
>>                         goto ret;
>> @@ -218,7 +218,7 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
>>                 mapped = __vmap_pages_range_noflush(
>>                         vmalloc_origin(start + off),
>>                         vmalloc_origin(start + off + PAGE_SIZE), prot, &origin,
>> -                       PAGE_SHIFT);
>> +                       PAGE_SHIFT, gfp_mask);
>>                 if (mapped) {
>>                         err = mapped;
>>                         goto ret;
>> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
>> index 212449db34a1..452760a333e4 100644
>> --- a/mm/kmsan/shadow.c
>> +++ b/mm/kmsan/shadow.c
>> @@ -247,7 +247,7 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
>>         origin_end = vmalloc_meta((void *)end, KMSAN_META_ORIGIN);
>>         kmsan_enter_runtime();
>>         mapped = __vmap_pages_range_noflush(shadow_start, shadow_end, prot,
>> -                                           s_pages, page_shift);
>> +                                           s_pages, page_shift, gfp_mask);
>>         kmsan_leave_runtime();
>>         if (mapped) {
>>                 err = mapped;
>> @@ -255,7 +255,7 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
>>         }
>>         kmsan_enter_runtime();
>>         mapped = __vmap_pages_range_noflush(origin_start, origin_end, prot,
>> -                                           o_pages, page_shift);
>> +                                           o_pages, page_shift, gfp_mask);
>>         kmsan_leave_runtime();
>>         if (mapped) {
>>                 /* Undo the shadow mapping set up above. */
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 5c1eacc2a0ac..4f3c320a4849 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -725,7 +725,8 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>>   * may have contiguous chunks, as hinted by @shift.
>>   */
>>  static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
>> -               pgprot_t prot, struct page **pages, unsigned int shift)
>> +               pgprot_t prot, struct page **pages, unsigned int shift,
>> +               unsigned int *mapped_pages)
>>  {
>>         unsigned long start = addr;
>>         pgd_t *pgd;
>> @@ -748,6 +749,7 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
>>         if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>>                 arch_sync_kernel_mappings(start, end);
>>
>> +       *mapped_pages = nr;
>>         return err;
>>  }
>>
>> @@ -758,18 +760,36 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
>>   * The caller is responsible for calling flush_cache_vmap() after this
>>   * function returns successfully and before the addresses are accessed.
>>   *
>> + * On failure the PTEs installed by this call are torn down before
>> + * returning, so a retry sees a clean range; PTEs that were already
>> + * there when the walk failed are left alone. When @gfp_mask cannot
>> + * block, the teardown skips cond_resched(), it may run in atomic
>> + * context.
>> + *
>>   * This is an internal function only. Do not use outside mm/.
>>   */
>>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>> -               pgprot_t prot, struct page **pages, unsigned int page_shift)
>> +               pgprot_t prot, struct page **pages, unsigned int page_shift,
>> +               gfp_t gfp_mask)
>>  {
>> +       int err;
>> +       unsigned int mapped_pages = 0;
>> +
>>         if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
>>                 return -EINVAL;
>>
>>         if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
>>                 page_shift = PAGE_SHIFT;
>>
>> -       return vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
>> +       err = vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift,
>> +                                           &mapped_pages);
>> +
>> +       /* Undo the PTEs installed before the failure. */
>> +       if (err && mapped_pages)
>> +               __vunmap_range_noflush(addr, addr + (mapped_pages * PAGE_SIZE),
>> +                                      gfpflags_allow_blocking(gfp_mask));
>> +
>> +       return err;
>>  }
>>
>>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>> @@ -781,7 +801,8 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>
>>         if (ret)
>>                 return ret;
>> -       return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
>> +       return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift,
>> +                                         gfp_mask);
>>  }
>>
>>  static int __vmap_pages_range(unsigned long addr, unsigned long end,
>> @@ -3715,7 +3736,7 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
>>                 pgprot_t prot, struct page **pages)
>>  {
>>         const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
>> -       unsigned int prev_shift = 0, batch_idx = 0;
>> +       unsigned int prev_shift = 0, batch_idx = 0, nr_mapped;
>>         unsigned long batch_start = addr, batch_end = addr;
>>         int err;
>>
>> @@ -3734,7 +3755,8 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
>>
>>                 if (shift != prev_shift) {
>>                         err = vmap_pages_range_noflush_walk(batch_start, batch_end,
>> -                                       prot, pages + batch_idx, prev_shift);
>> +                                       prot, pages + batch_idx, prev_shift,
>> +                                       &nr_mapped);
>>                         if (err)
>>                                 goto out;
>>                         prev_shift = shift;
>> @@ -3756,7 +3778,7 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
>>         /* Remaining */
>>         if (batch_start < end)
>>                 err = vmap_pages_range_noflush_walk(batch_start, end, prot,
>> -                               pages + batch_idx, prev_shift);
>> +                               pages + batch_idx, prev_shift, &nr_mapped);
>>
>>  out:
>>         if (!err)
> 
> So, you are recording nr_mapped but not undoing
> vmap_pages_range_batched() partial mappings yet. You do that in patch
> #9. It's weird to fix one place but leave the other one until later. I
> would suggest merging patches 7 and 9 to have a complete fix.

Yes, that looks correct when revisiting these patches.

Thanks
Best Regards
Hao

> 
>> diff --git a/mm/vmalloc.h b/mm/vmalloc.h
>> index 4ec114a75f04..9ea28845f713 100644
>> --- a/mm/vmalloc.h
>> +++ b/mm/vmalloc.h
>> @@ -40,7 +40,8 @@ void clear_vm_uninitialized_flag(struct vm_struct *vm);
>>
>>  int __must_check __vmap_pages_range_noflush(unsigned long addr,
>>                 unsigned long end, pgprot_t prot,
>> -               struct page **pages, unsigned int page_shift);
>> +               struct page **pages, unsigned int page_shift,
>> +               gfp_t gfp_mask);
>>
>>  void vunmap_range_noflush(unsigned long start, unsigned long end);
>>
>> --
>> 2.25.1
>>
