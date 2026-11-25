Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622996;
	b=Vlhjr3UHT00Ml3X55nJ8ak2K8msUYW74ySTyGHUaqN2gknaIrla4rlSV7BKVsMxhfW7M
	 dSl2b8a1KanzKeuoAcdx+L2/6gvKX2A3kFSVOreUjmS9Kxru+oe8vZxiX6l3Yyrsc5yFf
	 EYVL5GfqHuTJsCHisvW41A4L6GWRFe4AVwwajycgEjDE61DIr9i40X8WgGdLJUX4ioa0V
	 B0BfILGUWq5H7iLTivy6lNwl/06w+ccZVqjbnk+yWHeXx1DzWM+wy9FpVi90+bYm8omEy
	 cH88JL3AH+X3kOSb7r6t9HkpWV5gS3PDzb1JTFdqVWUj+wWsSPGoyzoZxXVQPSyIsVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SH3WD86btuINr/uxcoF6S242mnrN0umh75GOIi7csNw=;
	b=a3ifBvLHd+DdJB8Gedujobq6APF52uEg/Zlton56u4Nn40G9jhM2bRwu/MpZoMcfWMI5
	 T7ZoI1Sat+jU33qs2tT1pVOZgYnXEoellSZqjkou2sSqcOOEzOfBd8z8s2Stiwe/hXhhj
	 vkwXgtQCv+LBodTXQOaO6PBQ5oUqprIMm3q8wq0Gf/+CkuFXUTviCtB8yVrmBIFNhFpp8
	 daqe/MuRnRSwmFxZTM9bjp/ZPVnv1BvpuNpHF78nQoMzinLvPJX3RLR3EPcZvK7sttjPA
	 i8paxS+odXBfnzye+NQq4pWYxgMrShz3SMsAiUBa6brB1iAN+xg6xssR9poaoFouKDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ieOkfxCi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A37606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A37606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ieOkfxCi
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c51bf011392so20775166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:09:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795622995; cv=none;
        d=google.com; s=arc-20260327;
        b=nhX7v85uZ2TVoGkhgm1+Gx8I19f5V+t5CuYrSMrNufBAbf6Y9F9/pPqWoZDGniyCxR
         lFqCDWDKqNCB5UW0eM82+uo5vBkYIHulHAzYibBGM24nEdj9XNeB1zQHtDoNQ+3e6sOH
         E6xfQTjMqs+To130UF61CPGOZz7GcLiVpRXvbZJ/fImzToRA8fZs5KN0VLJ6dPbyxyJB
         5uh4yVZdKuI1wYNoF2SV2HWlryjRBemxx8eeXSoIb+qhopcgc/UGfTrjac84OBfXwSdT
         ZJCtPpWl315JKpAFymd1A2NQ4jrLHaQJxl/JTn8op0sXFrYHmqqvSSZvS1Y3vN1UJJtq
         GevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SH3WD86btuINr/uxcoF6S242mnrN0umh75GOIi7csNw=;
        fh=Nk+2orRytdP4JiDeyYnBvRYXy7cRBukCLBj/3mGzW2Y=;
        b=OeGgznlkUHPny/LEgQK0EBK23l5SMi5EbH8Vj8Y+WYTdD2BEb6RZkgrdkvbSuuFcjM
         KmQOBbH+HeOn3UY+bZI4riFd0Alq17g/GA2ahOXEBhFPL89bpJ9T+CRTFJvtr4bEp8OG
         GabnCGPaySLNOElxZbpjUPDn6hdWIdyPrAksN0UWJUaX8tDrw63H5kQrQYnC+/s75QIB
         FUcqsa3ynB+fx7J4bleGniz78hAuJkbtFgWVf78kkmqrrdeJCEEfSDyEddhPWBzDtQs4
         +7jc7fc9gErXukrX4zOQazsBKcTzkt0kXUgTPRWJ6lvwnG+CzvSOnOydH+FGqEkRKntc
         NqPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795622995; x=1796227795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SH3WD86btuINr/uxcoF6S242mnrN0umh75GOIi7csNw=;
        b=ieOkfxCi/6EaarioN16swJ8tcJZCzvtt5+TPfCZC1cz9sCxhicnOBkKpoUz0LY1CIx
         Yik83OPJnQh95gCPmXYFGOwAF5SmqsH+fM7XvvBP9cyJb4FCAi2Psa9S7pJ8BFAAf65j
         nJpX+iG12uzZfxGOzI1JviYLUkaz3nUnpKmBLNHr6hr7wupOVo6yGHcfDaGWxrCSvLyT
         Mncbu4OmxoEgz+Dfcejhh6Ar4OsNy1pTEy+ltaiFghtfGwWGoHx76DAqqGzN20yZsNcs
         ncGVLbvYcRk/Wug+YpQUE14TJDs6QB/HnTlHrYQ6K1DknDCqn3YvEHMYXcuKwsy8WgRn
         SyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622995; x=1796227795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SH3WD86btuINr/uxcoF6S242mnrN0umh75GOIi7csNw=;
        b=xnX80MJfWVbC31NNhNv5pqg49xO5Oc51yCyXwL0TnVD0oRkRwwRycNDSMOmhNH9DJ5
         rlJm8Jq/6vK5CBzCsqvKUg5msjTXDon4Z+h3NTb08a4p922HOdWWnjbZjGd6UsUSULwR
         ueAdnWXvC7fSh1J159kV8wUBl2//3P9FM5ubOEIYfJrS1opCkA9ST1HOh/yManL0Oo66
         V58gFubrAMLvxWWVzRNxzDROo+l47/LjA7XUGVzb6QQvZd01oZRIvJG8ZhUtp3tlyqro
         g79IvyJ/94Swki1MG0IIMOJw3y3ykAeWH0YyqPIBfbyzOmDdL8g5LvATs0aNXxB24yGB
         gaTw==
X-Forwarded-Encrypted: i=1; AL+hErFrM9WH7thvjFTjGm2mkKEydJs+j1r36j8ZE+S06cKb361eif+8PJA8bTU5lqgyZ/9dFiQa1PxxpmqXK3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZiIw0A1NPLk9slPSSvO0JRz/e23mf9nNfC3ovho6fPoZpT9hX
	RJ4+YL9nscZcBJvjqIC2g4XS/iig6lbots8lJT17E9Y/FIHsz48Z7EZMoFncYaduLnQSVC0NRbZ
	ecVrxkQ7CjX/V+ajcymjsk6j01J40DsV/dvNWma9r
X-Gm-Gg: AZFdTZcIgLDHoLfndghFP+R4w1dPW/EGhWPoCVgdv5ybLyuQZd7TL4mp9rwggExMkS4
	MEWKzeydWhWOYa+PhPJAZf7wOLkXLbs9kIW2KCCLUXCk1AvfxgHCQq0apPv3Cb1Ib6pGX/Xf9gt
	rbFmFOnKfzkpZSndXf+38xm80p7u1ZJT0W/yFku/2QNpDOgiez3cJ3lSTsCrRerzvMt0/has0B4
	CDAOlY80H0PYsJ3dnZcJeKOBfBpmZ9xZgTWgWI6jx67pcGvJELbLxgCIt3vnl29+5NyuX2ILOZk
	gnTdnGr0hVyYfLd9d+j60QmQtJLgd7UjuoVBx0xCHNiIJM82NfElwOoioHeUFBajzMsr6AyicIx
	we90vVJZOxLH0doU2vKKIFBjlvDqASrTpQ0X7nVoQDMoHMaO96HMYyw6Ug3RiLyluaCtmD+U5GH
	3Ju0dQDnH9JG7xSXPluZSwYaMYreuWQ4F4JHTIJ+d+xa4Nl1my+9Q=
X-Received: by 2002:a17:907:608c:b0:c2e:6a4f:a88b with SMTP id
 a640c23a62f3a-c513a1f5c8cmr1559863766b.0.1795622994038; Wed, 25 Nov 2026
 08:09:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-7-jthoughton@google.com> <CF94E7D7-87D2-4523-9343-512EE00094FA@linux.dev>
 <CADrL8HW8+eFt5f1VBQ0zt-ioiU3X150W4ROaKf2Nzw4j9+0i_Q@mail.gmail.com> <09A53080-61DE-472D-9A37-38B524C76FF9@linux.dev>
In-Reply-To: <09A53080-61DE-472D-9A37-38B524C76FF9@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Wed, 25 Nov 2026 11:09:16 -0500
X-Gm-Features: Aa3M54o_hFax3FlT4U3L1WrxJk7av4zfqy7DgK21ApX3Y58oo7HyZderBGv4ryc
Message-ID: <CADrL8HV2m6DO=r-mezNONV_w0BtrN1_7Wph+mHUsAsYBf5FR2g@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] hugetlb: Optimize bootmem folios that were not pre-HVOed
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 4:37=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Nov 25, 2026, at 00:58, James Houghton <jthoughton@google.com> wrote=
:
> >
> > On Sun, Nov 22, 2026 at 10:11=E2=80=AFPM Muchun Song <muchun.song@linux=
.dev> wrote:
> >>
> >>
> >>
> >>> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wro=
te:
> >>>
> >>> Boot-time gigantic folios are expected to be pre-HVOed through the
> >>> section-based vmemmap optimization, so the bulk optimization pass for
> >>> bootmem folios was dropped.
> >>>
> >>> However, arch_support_vmemmap_remap() may not yet
> >>> return true when bootmem folios are allocated (e.g. on arm64, where
> >>> support depends on a system-wide CPU capability), while it does retur=
n
> >>> true by the time the bootmem folios are gathered. Such architectures
> >>> disable the section-based vmemmap optimization in their vmemmap
> >>> population path (see section_vmemmap_optimization_disable()), so the
> >>> folios are not pre-HVOed and would never be optimized.
> >>
> >> Yeah, when I removed support for this part of the code, I figured you
> >> might add a new patch in the future to add support back. It is fine.
> >>
> >>>
> >>> Optimize such folios when gathering bootmem folios. Their tail struct
> >>> pages have all been initialized by memmap_init_compound_page(),
> >>> as they were not pre-HVOed. Pre-HVOed folios are skipped by
> >>> vmemmap_should_optimize_folio().
> >>>
> >>> Signed-off-by: James Houghton <jthoughton@google.com>
> >>> ---
> >>> mm/hugetlb.c | 11 +++++++++++
> >>> 1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> >>> index 72839e98f998..8756c0206922 100644
> >>> --- a/mm/hugetlb.c
> >>> +++ b/mm/hugetlb.c
> >>> @@ -3325,6 +3325,17 @@ static void __init prep_and_add_bootmem_folios=
(struct hstate *h,
> >>>      unsigned long flags;
> >>>      struct folio *folio, *tmp_f;
> >>>
> >>> +     /*
> >>> +      * Bootmem folios are normally pre-HVOed through the section-ba=
sed
> >>> +      * vmemmap optimization. However, an architecture that can only
> >>> +      * determine whether it supports HVO after bootmem allocation d=
isables
> >>> +      * the section-based optimization (see
> >>> +      * section_vmemmap_optimization_disable()), in which case the f=
olios
> >>> +      * were not pre-HVOed and must be optimized now. Pre-HVOed foli=
os are
> >>> +      * skipped.
> >>> +      */
> >>
> >> I'd like to condense these comments to something like:
> >>
> >> /*
> >> * Some architectures do not support section-based vmemmap optimization=
,
> >> * so their bootmem folios should be optimized here with folio-based
> >> * optimization.
> >> */
> >
> > Applied in v4, thanks!
> >
> > Also just so you don't miss it, would appreciate your thoughts on my
> > reply to Sashiko's comments on this patch[1]. Let me know if you would
> > like me to do something different.
>
> I think the diff below might be a bit simpler. You might think that when
> HVO is turned off, it could still cause some unnecessary TLB flushes. You
> don't need to worry about that, because I've added a global guard to make
> sure it doesn't happen. Take a look here [1].
>
> [1] https://lore.kernel.org/all/20261124110530.3004071-3-songmuchun@byted=
ance.com/
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index b2c14f4f99b7..69a7d4ca8b1b 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3345,6 +3345,7 @@ static void __init gather_bootmem_prealloc_node(uns=
igned long nid)
>         LIST_HEAD(folio_list);
>         struct huge_bootmem_page *m, *tm;
>         struct hstate *h =3D NULL, *prev_h =3D NULL;
> +       unsigned long vmemmap_unoptimized =3D 0;
>
>         list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
>                 struct page *page =3D virt_to_page(m);
> @@ -3368,6 +3369,8 @@ static void __init gather_bootmem_prealloc_node(uns=
igned long nid)
>
>                 if (vmemmap_optimizable_order(pfn_to_section_compound_ord=
er(pfn)))
>                         folio_set_hugetlb_vmemmap_optimized(folio);
> +               else
> +                       vmemmap_unoptimized++;
>                 section_set_compound_order_range(pfn, nr_pages, 0);
>
>                 list_add(&folio->lru, &folio_list);
> @@ -3387,6 +3390,8 @@ static void __init gather_bootmem_prealloc_node(uns=
igned long nid)
>                 cond_resched();
>         }
>
> +       if (vmemmap_unoptimized)
> +               hugetlb_vmemmap_optimize_folios(h, &folio_list);

This hunk needs to also be added to the `h !=3D prev_h` piece inside of
the loop, otherwise we could miss optimizing folios for some hstates.

I prefer the early return that I've re-applied. It's a lot more
straightforward for me. Let me know if you really want me to switch it
with your suggestion.

Thanks for all the feedback, Muchun! I really appreciate it.

>         prep_and_add_bootmem_folios(h, &folio_list);
>  }
>
>
>
