Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599448;
	b=MPIxpzL6CXxQtxl9ogXwzEDtIMmaCZdMqvRa5YXOsDkLvpRwwqLWZNu0Q9TsMh/+wYXq
	 dZY2JGwAz4vknsvrGNQWWreKvCwstMgWYTmyur79Tzv/7sMv0QndrzwbCKHNHjyp4SI+O
	 RR65cvn6+JwFbrlUMfD1e/gQkAjWEXkaGKzzDiLNWhvhx18Ys3vGICdvkDhuOFdMUrvsV
	 L9g/6m5zANYq6N7jaVidp5yYTibsA8rLOSeUgtNA7BAKzQL+5jvrpF+AzoCDuj8lorWU7
	 sR46noHFVJdrK+lXZ0l2Bw/apiejXHY1wFfgKB5PUFmGcmYrtIr2IgQaLfSD4rp4e4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599448;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=k5xHf2lhPr/RExrawLrN0PmhwGouCpcZE5UnOts9ZAQ=;
	b=tkpgSc8DKPx/0rLdtsYfHsjWa0eaJEqSL4R57tsU++De1TKAcKOJUK/LQqVDxw+JdagR
	 +cgfglx/g6e0vkvjst0qQ3QufQKGjM91KNwFx7DIK3e2Yx8TtxRU3uSkrvoHt6fy6nMEu
	 lJ86oQLO2wHxo7x0EmQoEJqGYFmXmvg/NZbuyDjSMZgoTL2zFFBTfhrb5AqFWA0NDoEKC
	 s8nt5A7tvt1uJnL5yTYvQVssettMK6TAyDc0QVh0KlYYli7LZtp1EkGDJCaVVTY2EfeyB
	 SuK2OXpMFVHG7zyvkZIz+UipGWmAnbYDqSveva77GVxvkmqhL/9Irej1ox5Y4ZZl5Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IWSBa6bB;
	arc=none smtp.remote-ip=91.218.175.99
Received: from mta0.migadu.com (out-99.mta0.migadu.com [91.218.175.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1348F606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1348F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IWSBa6bB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qq12iW/GfAR0dRAaMy1K7AX9iuydUIvkIBU6+z/H2qQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795599446; v=1; x=1796204246;
 b=IWSBa6bBkna41jsj8ZWeTM5E9j/lXWrq4rL+MR5TuEE38yqwCk17IeysPgN915zJZvyyjZTE
 xTAr659q93oRoGQiGIJVvcObUhGC2iFfVWku0zHSXkn5GPxU0Aceu2/dlqI6DDzFwlciimXZ0a4
 zjd5hbkg/I2UmjJeu6cWafvk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 442509cce5000c32;
	Wed, 25 Nov 2026 09:37:26 +0000
X-Mizu-Trace-ID: 442509cce5000c32
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
In-Reply-To: <CADrL8HW8+eFt5f1VBQ0zt-ioiU3X150W4ROaKf2Nzw4j9+0i_Q@mail.gmail.com>
Date: Wed, 25 Nov 2026 17:37:04 +0800
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
Message-Id: <09A53080-61DE-472D-9A37-38B524C76FF9@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-7-jthoughton@google.com>
 <CF94E7D7-87D2-4523-9343-512EE00094FA@linux.dev>
 <CADrL8HW8+eFt5f1VBQ0zt-ioiU3X150W4ROaKf2Nzw4j9+0i_Q@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 25, 2026, at 00:58, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Sun, Nov 22, 2026 at 10:11=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>=20
>>=20
>>> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> Boot-time gigantic folios are expected to be pre-HVOed through the
>>> section-based vmemmap optimization, so the bulk optimization pass =
for
>>> bootmem folios was dropped.
>>>=20
>>> However, arch_support_vmemmap_remap() may not yet
>>> return true when bootmem folios are allocated (e.g. on arm64, where
>>> support depends on a system-wide CPU capability), while it does =
return
>>> true by the time the bootmem folios are gathered. Such architectures
>>> disable the section-based vmemmap optimization in their vmemmap
>>> population path (see section_vmemmap_optimization_disable()), so the
>>> folios are not pre-HVOed and would never be optimized.
>>=20
>> Yeah, when I removed support for this part of the code, I figured you
>> might add a new patch in the future to add support back. It is fine.
>>=20
>>>=20
>>> Optimize such folios when gathering bootmem folios. Their tail =
struct
>>> pages have all been initialized by memmap_init_compound_page(),
>>> as they were not pre-HVOed. Pre-HVOed folios are skipped by
>>> vmemmap_should_optimize_folio().
>>>=20
>>> Signed-off-by: James Houghton <jthoughton@google.com>
>>> ---
>>> mm/hugetlb.c | 11 +++++++++++
>>> 1 file changed, 11 insertions(+)
>>>=20
>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>> index 72839e98f998..8756c0206922 100644
>>> --- a/mm/hugetlb.c
>>> +++ b/mm/hugetlb.c
>>> @@ -3325,6 +3325,17 @@ static void __init =
prep_and_add_bootmem_folios(struct hstate *h,
>>>      unsigned long flags;
>>>      struct folio *folio, *tmp_f;
>>>=20
>>> +     /*
>>> +      * Bootmem folios are normally pre-HVOed through the =
section-based
>>> +      * vmemmap optimization. However, an architecture that can =
only
>>> +      * determine whether it supports HVO after bootmem allocation =
disables
>>> +      * the section-based optimization (see
>>> +      * section_vmemmap_optimization_disable()), in which case the =
folios
>>> +      * were not pre-HVOed and must be optimized now. Pre-HVOed =
folios are
>>> +      * skipped.
>>> +      */
>>=20
>> I'd like to condense these comments to something like:
>>=20
>> /*
>> * Some architectures do not support section-based vmemmap =
optimization,
>> * so their bootmem folios should be optimized here with folio-based
>> * optimization.
>> */
>=20
> Applied in v4, thanks!
>=20
> Also just so you don't miss it, would appreciate your thoughts on my
> reply to Sashiko's comments on this patch[1]. Let me know if you would
> like me to do something different.

I think the diff below might be a bit simpler. You might think that when
HVO is turned off, it could still cause some unnecessary TLB flushes. =
You
don't need to worry about that, because I've added a global guard to =
make
sure it doesn't happen. Take a look here [1].

[1] =
https://lore.kernel.org/all/20261124110530.3004071-3-songmuchun@bytedance.=
com/

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index b2c14f4f99b7..69a7d4ca8b1b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3345,6 +3345,7 @@ static void __init =
gather_bootmem_prealloc_node(unsigned long nid)
        LIST_HEAD(folio_list);
        struct huge_bootmem_page *m, *tm;
        struct hstate *h =3D NULL, *prev_h =3D NULL;
+       unsigned long vmemmap_unoptimized =3D 0;

        list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
                struct page *page =3D virt_to_page(m);
@@ -3368,6 +3369,8 @@ static void __init =
gather_bootmem_prealloc_node(unsigned long nid)

                if =
(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
                        folio_set_hugetlb_vmemmap_optimized(folio);
+               else
+                       vmemmap_unoptimized++;
                section_set_compound_order_range(pfn, nr_pages, 0);

                list_add(&folio->lru, &folio_list);
@@ -3387,6 +3390,8 @@ static void __init =
gather_bootmem_prealloc_node(unsigned long nid)
                cond_resched();
        }

+       if (vmemmap_unoptimized)
+               hugetlb_vmemmap_optimize_folios(h, &folio_list);
        prep_and_add_bootmem_folios(h, &folio_list);
 }


>=20
> [1] =
https://lore.kernel.org/linux-mm/20261124165516.1182390-1-jthoughton@googl=
e.com/


