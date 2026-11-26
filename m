Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656717;
	b=df+epJ1Z9Wi7ogaS7A4MW4owl77tKycx33/Xq0eluhAOdXkmNUMS9OT0/oOLYRfZv34v
	 NC9xQuUD0R+v6oKwUkovsCHBYUgmhhqX/o5lR8Ob/AwKka54gIHtL0Hzz6asBXiJfuZxv
	 pAy5qzcBZSkbh5SzQPJ8+kOUnQA1wdQ7bRyi1f3Mt7NOhI4q7GZzc9BMoDQ2WMOG0jvqF
	 mFEdiACTUn0KLFBqGzwrcGZOf1jZwvD3Y+JBUyz4GFZ6VcJaEDjPjQ7OnAzgFCivVjiYb
	 mrSQ1wPm9NP+Tm0ColMiBrgCa4Jx/KGsKTZNZ09kOv/kEzjXrSaRYmCQFJ2newROYDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656717;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=wde9udkd5zQ9CLQ7aWUsNIZCwjF2DEOdelZVAWlC9I4=;
	b=ByzbSq34pSsW1QJGWRhS0czhVtClvn2Xn3joQE6KYWLpd9pMy10Sj0c/al/n9desJlLY
	 b9a8PynkTje3EiZwOQtduslCgeJIs+GHhInv1DXcC7W5GG95cag47eDJNMcYOzr9vfWng
	 OYil3D1dyTabzR9gDS/D+lNmVJiwnUNxp0hh1rJm46GOHBXlRWbhX2JhG52XaHVE3SnIz
	 mzkmZXkHKngLaGiSqwPW9kFmE4CNC/h8lamgnNGy5R3VmH2Nh870Vc7UrbIPrf2okWdz6
	 cCD1MHLXwncsSzt51dV0EkJpNVtwhVWzT/aw96rJM8GVfLD7A7D7i75JxVpm7dwmwWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HJFjtV1d;
	arc=none smtp.remote-ip=95.215.58.22
Received: from mta1.migadu.com (out-22.mta1.migadu.com [95.215.58.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4325606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4325606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HJFjtV1d
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bBmr2JO5Sg+M7romhELnWXSnHAmxM4rIPKq9RYfx+nY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795656714; v=1; x=1796261514;
 b=HJFjtV1dTYydkzGEtv/b2Sr+dk9hFl8SG3iK5Z9j1eeEe15YaPQaPaMm8TG4dxqOHB2HdHPI
 Bnw/nM7PCPB/oObULZvFtxfVoeEqwa+39mgndLuf2WgNsmDTezN/PCUPdJyPQOlNsNRbia0Xkr0
 voSglgB1vqTsssuY7epghzSY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1454f8f9569628e6;
	Thu, 26 Nov 2026 01:31:54 +0000
X-Mizu-Trace-ID: 1454f8f9569628e6
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 06/19] hugetlb: Optimize bootmem folios that were not
 pre-HVOed
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HV2m6DO=r-mezNONV_w0BtrN1_7Wph+mHUsAsYBf5FR2g@mail.gmail.com>
Date: Thu, 26 Nov 2026 09:31:37 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <82B8672D-CB14-4765-A541-67D574382F86@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-7-jthoughton@google.com>
 <CF94E7D7-87D2-4523-9343-512EE00094FA@linux.dev>
 <CADrL8HW8+eFt5f1VBQ0zt-ioiU3X150W4ROaKf2Nzw4j9+0i_Q@mail.gmail.com>
 <09A53080-61DE-472D-9A37-38B524C76FF9@linux.dev>
 <CADrL8HV2m6DO=r-mezNONV_w0BtrN1_7Wph+mHUsAsYBf5FR2g@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 26, 2026, at 00:09, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Wed, Nov 25, 2026 at 4:37=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>=20
>>=20
>>> On Nov 25, 2026, at 00:58, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> On Sun, Nov 22, 2026 at 10:11=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>>> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>>>>>=20
>>>>> Boot-time gigantic folios are expected to be pre-HVOed through the
>>>>> section-based vmemmap optimization, so the bulk optimization pass =
for
>>>>> bootmem folios was dropped.
>>>>>=20
>>>>> However, arch_support_vmemmap_remap() may not yet
>>>>> return true when bootmem folios are allocated (e.g. on arm64, =
where
>>>>> support depends on a system-wide CPU capability), while it does =
return
>>>>> true by the time the bootmem folios are gathered. Such =
architectures
>>>>> disable the section-based vmemmap optimization in their vmemmap
>>>>> population path (see section_vmemmap_optimization_disable()), so =
the
>>>>> folios are not pre-HVOed and would never be optimized.
>>>>=20
>>>> Yeah, when I removed support for this part of the code, I figured =
you
>>>> might add a new patch in the future to add support back. It is =
fine.
>>>>=20
>>>>>=20
>>>>> Optimize such folios when gathering bootmem folios. Their tail =
struct
>>>>> pages have all been initialized by memmap_init_compound_page(),
>>>>> as they were not pre-HVOed. Pre-HVOed folios are skipped by
>>>>> vmemmap_should_optimize_folio().
>>>>>=20
>>>>> Signed-off-by: James Houghton <jthoughton@google.com>
>>>>> ---
>>>>> mm/hugetlb.c | 11 +++++++++++
>>>>> 1 file changed, 11 insertions(+)
>>>>>=20
>>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>>> index 72839e98f998..8756c0206922 100644
>>>>> --- a/mm/hugetlb.c
>>>>> +++ b/mm/hugetlb.c
>>>>> @@ -3325,6 +3325,17 @@ static void __init =
prep_and_add_bootmem_folios(struct hstate *h,
>>>>>     unsigned long flags;
>>>>>     struct folio *folio, *tmp_f;
>>>>>=20
>>>>> +     /*
>>>>> +      * Bootmem folios are normally pre-HVOed through the =
section-based
>>>>> +      * vmemmap optimization. However, an architecture that can =
only
>>>>> +      * determine whether it supports HVO after bootmem =
allocation disables
>>>>> +      * the section-based optimization (see
>>>>> +      * section_vmemmap_optimization_disable()), in which case =
the folios
>>>>> +      * were not pre-HVOed and must be optimized now. Pre-HVOed =
folios are
>>>>> +      * skipped.
>>>>> +      */
>>>>=20
>>>> I'd like to condense these comments to something like:
>>>>=20
>>>> /*
>>>> * Some architectures do not support section-based vmemmap =
optimization,
>>>> * so their bootmem folios should be optimized here with folio-based
>>>> * optimization.
>>>> */
>>>=20
>>> Applied in v4, thanks!
>>>=20
>>> Also just so you don't miss it, would appreciate your thoughts on my
>>> reply to Sashiko's comments on this patch[1]. Let me know if you =
would
>>> like me to do something different.
>>=20
>> I think the diff below might be a bit simpler. You might think that =
when
>> HVO is turned off, it could still cause some unnecessary TLB flushes. =
You
>> don't need to worry about that, because I've added a global guard to =
make
>> sure it doesn't happen. Take a look here [1].
>>=20
>> [1] =
https://lore.kernel.org/all/20261124110530.3004071-3-songmuchun@bytedance.=
com/
>>=20
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index b2c14f4f99b7..69a7d4ca8b1b 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -3345,6 +3345,7 @@ static void __init =
gather_bootmem_prealloc_node(unsigned long nid)
>>        LIST_HEAD(folio_list);
>>        struct huge_bootmem_page *m, *tm;
>>        struct hstate *h =3D NULL, *prev_h =3D NULL;
>> +       unsigned long vmemmap_unoptimized =3D 0;
>>=20
>>        list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
>>                struct page *page =3D virt_to_page(m);
>> @@ -3368,6 +3369,8 @@ static void __init =
gather_bootmem_prealloc_node(unsigned long nid)
>>=20
>>                if =
(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
>>                        folio_set_hugetlb_vmemmap_optimized(folio);
>> +               else
>> +                       vmemmap_unoptimized++;
>>                section_set_compound_order_range(pfn, nr_pages, 0);
>>=20
>>                list_add(&folio->lru, &folio_list);
>> @@ -3387,6 +3390,8 @@ static void __init =
gather_bootmem_prealloc_node(unsigned long nid)
>>                cond_resched();
>>        }
>>=20
>> +       if (vmemmap_unoptimized)
>> +               hugetlb_vmemmap_optimize_folios(h, &folio_list);
>=20
> This hunk needs to also be added to the `h !=3D prev_h` piece inside =
of
> the loop, otherwise we could miss optimizing folios for some hstates.

Oh, you are right.

>=20
> I prefer the early return that I've re-applied. It's a lot more

LGTM.

Thanks,
Muchun

> straightforward for me. Let me know if you really want me to switch it
> with your suggestion.
>=20
> Thanks for all the feedback, Muchun! I really appreciate it.
>=20
>>        prep_and_add_bootmem_folios(h, &folio_list);
>> }


