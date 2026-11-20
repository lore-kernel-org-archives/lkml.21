Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795208855;
	b=nslE/nNxsgPog6M7GkmnoY8UvO7UAtuJyvFvuoH7xOfsPrLQzvzRNiezBxPwut5t+QGx
	 ZuzWSXCGQY1GZvJzAImzs4K8AbgzwZ/AigqxPS1ZbMT+hGopvk3stdfcP5n51Fz1dyZqY
	 344Xfj6rWKMd0g4ypZ4muML+UPLv6cQkxxWSr7ZPyaIPyXZTcO+blYXKvpsGCHtl7EXu4
	 wz697583X7URb3KKb5dKYuduqQqskDywlQYaLtj+p4s/EH4rH9gLc0tZTKU+zqdAeB66P
	 rXKdp1zUP4vII8bX2ahD+2kmH1iS1y692HjBrdrHEDnA9DcS/T0mqZshCCO7SDjyo6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=23FU4s0qSHIWACezHPWGWY27dHdjz6IS0tWZIdmWGk4=;
	b=k7CI7znQ9t9fimpc9gV3Ne5A2c9NLsMwzMxYEzB8ZAdODCS2OuNzDuJwpjghYp60ElG9
	 dy0KfS3VwLSdDMClEVd2Nideu/xyrlf7rLzdtSOqCB7Yglqoabxuldut4UzSuid92c7PR
	 UTNiG0xaQkHAk2wimGNQ/qk/HhkjHgUCz+IJO62otUjvbfRcKjDKvzo13flWLg+QgFJNC
	 PG5CvWQQxGk0NWG3lZ56ssmEXTbtW39wU4swYep23QSeUeCYAoRu0sD/dCiWcSXaillAy
	 FtZznaaOEDhIwRGtckDTftiLTpusZ244MJh+wT84Dvoz8APwGkvnfwNZQRmwSQz+1zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aeD4rAwF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD98606A6AE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD98606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aeD4rAwF
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55c7445cf85so14601cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795208852; cv=none;
        d=google.com; s=arc-20260327;
        b=YBBsJ06YNuhk4gr5KjYBrPHznBDkXj2BfB8AQs3IsNlCgto2sisig4qAaPkuAGjv1q
         U7Xpu2SBvW22Bq/f5bDoL5s7HrwyBHs4vBZjAlhKGelfisyCpcdC1AWTAg2m+LvLVBOl
         m0fOS2BOi6MXj+zsA9t8YoqUTl0hyAocaTE6oXDH1+G6nhHsDfbKzE2SI84nnmPp41c0
         2vQie5c3cWDQlcZbKYaLCUoMWfnnXubfgoPfu+q8fHnIvOF8NErm0UsU8L/fGIdk4NUi
         8hKXJACJ9yPHUDeGNmMoVSfxxv3nI5BE+aWLESnmDEOzoaYyFLiSwKfEZOOfLHvx5FJc
         N6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=23FU4s0qSHIWACezHPWGWY27dHdjz6IS0tWZIdmWGk4=;
        fh=hFizJs40zF0/HbZMeJScbXAe7kDkM0MkUp0p8+7Ftrw=;
        b=QXB/7BGRzedrcjefPzvLw8iZTVF0007Nam2J1HgGBZwG9bYSPDKkcaqn1bGMQfqwVI
         JY5PbMclg0/sv8Vv5qjiCR5tiKdEZTZl96yLoCiNJtFp/DbFfsbuG+HYpB9QkzjoEtOE
         GK6648EWj4pNXDGfhFfK5q9zE3HgGM1/dNlCi94GsARgGl9LnwRZZ7JG8P4ojaENIqIK
         OLbrkNrdAHWuopRJ7QqeUo1H1ZyiyV1y2lpAzTZDyf3z5nB7fDYOPxXFguI6KAS7lq8z
         BIL+z+tnXNQgyWvrTMMsLa8H+gH1Jdl8XPvhWr+HajdTbF4d2HshrL4vcnGkTrUDMDuj
         WD7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795208852; x=1795813652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=23FU4s0qSHIWACezHPWGWY27dHdjz6IS0tWZIdmWGk4=;
        b=aeD4rAwFibHyfyyt9/G7CWzXDAY1C+oB6GgRnGuIUQTamLzpLR3T70BL/LK6jn4bs3
         iMEY/3XOW2CRer9GsWaMXC1NBZYip+ctIouNBhGf80ziNIjkW8Jv7wp0SvOywkcPMNr3
         5ipcFXKjtIPIMUHiiesweJSSfGSJ2jdp20NeXctIxHHVjaGTbQF2Oo30Xl2v8/s4U20v
         JHE0KCgQjUIuM6XPY59pcJJUo4upxCaNLonSnkQ4gYUcPhXRwnWNUCH7Ec2hRYolhwqF
         vRZxEsG8bKvvGFZu2S2wvyBsPPFBGMdtAnmJQMAR8UVGdKKBT6h4pN9kZqvsttpNUFPM
         3hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795208852; x=1795813652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=23FU4s0qSHIWACezHPWGWY27dHdjz6IS0tWZIdmWGk4=;
        b=VXTn2iFhraNT1Tou5t5Ntd28iMpeOAjt82qYJixWbXYBVK8QiR6FxxV34b3Z71WQj/
         eX/D/oemsqWWmBNfmSBah+IEpuaN2BTgmRN6A0Ok96g3pWTvKL342sv+t3PTEJBC382I
         n28Bt8lQ1ebhnug+NHAhC7WzW7cdz7JsesPw+oT2PF9FTc6PaoLcTGQ+gamFrpdPlX0P
         N/jYymKA055Avxw2ggd+nAWQj8veYyiHfn2qo3W3TooGAvKb0bRhZ4lO5gtFnGAhNR8L
         k7C8NpcPvSBWpscL4zf21GVwt1r3D5jHl6Qeskryv1KpZAuug8GNN8nsCEFoLcHhFca5
         sUYQ==
X-Forwarded-Encrypted: i=1; AL+hErFQCDX6pPTMHzhoEbATAvtLZKe7Acg8TXLFdLFBx8YtD6BfMTwAjEjzCUdykgL099PwDFZC+QZi5SDOv8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8RCsO4NBIux2KxtaZhmDteYlxH9bgGvJ1cav4fDmIZeW8yLPQ
	SHgZLhiMd7FNecU+IzI8uRepIej1OnCtj+FLZlm1gomqAoiAsM/4VBNLD+uKjsVOdfmW0Vlfj8o
	ZiMxewFgtOEvqowpDfqRCrtelIbXKQ42Z9fS+NPcZ
X-Gm-Gg: AYBFou2nDHtdWHYCrutKUETjYDcvn5nySSE+QEbqNwyVOI+hehPZft+FybFqABPXnas
	9Sag8CxSZiDEYRy5XR593diDLlRJjNUBsadqRDyEGfDAOTX4Fpq8R1277zs7X6wMoJqwH4zgzVN
	LsxHF72SOItduLp6g8tGaJq0w4/m0nMMEFUdXcpMwVk7LJwOLQjnMLAvn1BTQoVzmVD6kSaoI+5
	wBIS9waoRtykDBWrP6Bh+yIBCxic5+8InBS0jQjJ8erB0xLf3pm6eI3IXAc1+0pRq1gU6JrUJVc
	odiAXXxAiVCX6T1p9C5wmdHN7Pghz50Td5QG/fd2QImnePwdqjESF6Uo/fQ/QHbUAXu9aslPTk1
	1SR2VLRCdueKcXdBvuSo2RcqbczbHWDKqtTU0L9J6UxI2xEQo42rixMOILdAbpH4uR0mv5YOrT5
	Nvar1gbhlfC+TiAtn4lEjYGp1At0Xw/2btBYMg0ydRDIEgsQ==
X-Received: by 2002:a05:622a:c15:b0:530:e335:4ef with SMTP id
 d75a77b69052e-55d88014944mr3653311cf.2.1795208847503; Fri, 20 Nov 2026
 13:07:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116071325.263682-1-hao.ge@linux.dev> <20261116071325.263682-2-hao.ge@linux.dev>
 <1020e36e-83bb-407b-8a6b-7669f04c26c3@arm.com>
In-Reply-To: <1020e36e-83bb-407b-8a6b-7669f04c26c3@arm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 20 Nov 2026 21:07:15 +0000
X-Gm-Features: Aa3M54oHBR0Q2Es3gvoLgXXE93aLU88piHn6n8RQiRkJo_c2VMPM-YJNeTPQZo8
Message-ID: <CAJuCfpHtWJvs4F2L+QCMe9gMJ-qmcj4Q1G4hqVqFe6Z6gPoQ1Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm/vmalloc: skip cond_resched() in the vmap
 unmap paths when atomic
To: Dev Jain <dev.jain@arm.com>
Cc: Hao Ge <hao.ge@linux.dev>, Uladzislau Rezki <urezki@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:02=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 16/11/26 12:43 pm, Hao Ge wrote:
> > The vmap failure paths can be reached with GFP_ATOMIC or GFP_NOWAIT
> > since commit b186a94227b7 ("kmsan: remove hard-coded GFP_KERNEL
> > flags") and commit 8da89ba18ed4 ("mm/vmalloc: handle non-blocking
> > GFP in __vmalloc_area_node()"), so an undo of a partially installed
>
> You mention this commit too, implying that vunmap_range_noflush() can
> be called in atomic context right now, but in this patch in
> vunmap_range_noflush() you pass 'true' unconditionally to
> __vunmap_range_noflush()?
>
> Can you give me the call chain existing in current kernel which makes
> this bug trigger? In case it does not exist but is only triggered when
> you add the rollback code later, then this patch is not fixing a bug.

Yeah, IIUC this is a prep patch for later changes and does not fix any
existing issues, therefore should not have any Fixes tags and should
not be CC'ed to stable.

Other than that LGTM.

>
>
> > mapping may have to run in atomic context, where the cond_resched()
> > in vunmap_pmd_range() cannot schedule.
> >
> > Give __vunmap_range_noflush() and kmsan_vunmap_range_noflush() a
> > can_resched argument and skip the cond_resched() when it is false.
> > The existing callers are on sleepable paths and pass true, so nothing
> > changes for them.
> >
> > Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_pa=
ges_range_noflush()")
> > Cc: stable@vger.kernel.org
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/all/sashiko-outbox-178439@kernel.org/
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > ---
> >  include/linux/kmsan.h |  8 ++++++--
> >  mm/kmsan/hooks.c      | 14 +++++++++-----
> >  mm/vmalloc.c          | 24 ++++++++++++++----------
> >  mm/vmalloc.h          |  3 ++-
> >  4 files changed, 31 insertions(+), 18 deletions(-)
> >
> > diff --git a/include/linux/kmsan.h b/include/linux/kmsan.h
> > index 7da9fd506b39..0016c032d1e7 100644
> > --- a/include/linux/kmsan.h
> > +++ b/include/linux/kmsan.h
> > @@ -150,11 +150,14 @@ int __must_check kmsan_vmap_pages_range_noflush(u=
nsigned long start,
> >   * kmsan_vunmap_kernel_range_noflush() - Notify KMSAN about a vunmap.
> >   * @start: start of vunmapped range.
> >   * @end:   end of vunmapped range.
> > + * @can_resched: whether the unmap walk may call cond_resched(); pass
> > + * false from atomic context.
> >   *
> >   * KMSAN unmaps the contiguous metadata ranges created by
> >   * kmsan_map_kernel_range_noflush().
> >   */
> > -void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end=
);
> > +void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end=
,
> > +                             bool can_resched);
> >
> >  /**
> >   * kmsan_ioremap_page_range() - Notify KMSAN about a ioremap_page_rang=
e() call.
> > @@ -355,7 +358,8 @@ static inline int __must_check kmsan_vmap_pages_ran=
ge_noflush(
> >  }
> >
> >  static inline void kmsan_vunmap_range_noflush(unsigned long start,
> > -                                           unsigned long end)
> > +                                           unsigned long end,
> > +                                           bool can_resched)
> >  {
> >  }
> >
> > diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
> > index a706666db097..69008b085658 100644
> > --- a/mm/kmsan/hooks.c
> > +++ b/mm/kmsan/hooks.c
> > @@ -136,10 +136,13 @@ static unsigned long vmalloc_origin(unsigned long=
 addr)
> >                                                KMSAN_META_ORIGIN);
> >  }
> >
> > -void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end=
)
> > +void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end=
,
> > +                             bool can_resched)
> >  {
> > -     __vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end)=
);
> > -     __vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end)=
);
> > +     __vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end)=
,
> > +                            can_resched);
> > +     __vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end)=
,
> > +                            can_resched);
> >       flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
> >       flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
> >  }
> > @@ -168,8 +171,9 @@ static void kmsan_iounmap_pages(unsigned long start=
, unsigned long end)
> >               if (origin)
> >                       __free_pages(origin, KMSAN_IOREMAP_META_ORDER);
> >       }
> > -     __vunmap_range_noflush(shadow_start, shadow_end);
> > -     __vunmap_range_noflush(origin_start, origin_end);
> > +     /* ioremap metadata mappings are always GFP_KERNEL, so resched is=
 safe. */
> > +     __vunmap_range_noflush(shadow_start, shadow_end, true);
> > +     __vunmap_range_noflush(origin_start, origin_end, true);
> >       flush_tlb_kernel_range(shadow_start, shadow_end);
> >       flush_tlb_kernel_range(origin_start, origin_end);
> >  }
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index ccaf158c5b7f..3c0d9e69b886 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -429,7 +429,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned l=
ong addr, unsigned long end,
> >  }
> >
> >  static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned =
long end,
> > -                          pgtbl_mod_mask *mask)
> > +                          pgtbl_mod_mask *mask, bool can_resched)
> >  {
> >       pmd_t *pmd;
> >       unsigned long next;
> > @@ -451,12 +451,14 @@ static void vunmap_pmd_range(pud_t *pud, unsigned=
 long addr, unsigned long end,
> >                       continue;
> >               vunmap_pte_range(pmd, addr, next, mask);
> >
> > -             cond_resched();
> > +             /* The undo path may run in atomic context. */
> > +             if (can_resched)
> > +                     cond_resched();
> >       } while (pmd++, addr =3D next, addr !=3D end);
> >  }
> >
> >  static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned =
long end,
> > -                          pgtbl_mod_mask *mask)
> > +                          pgtbl_mod_mask *mask, bool can_resched)
> >  {
> >       pud_t *pud;
> >       unsigned long next;
> > @@ -476,12 +478,12 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned=
 long addr, unsigned long end,
> >               }
> >               if (pud_none_or_clear_bad(pud))
> >                       continue;
> > -             vunmap_pmd_range(pud, addr, next, mask);
> > +             vunmap_pmd_range(pud, addr, next, mask, can_resched);
> >       } while (pud++, addr =3D next, addr !=3D end);
> >  }
> >
> >  static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned =
long end,
> > -                          pgtbl_mod_mask *mask)
> > +                          pgtbl_mod_mask *mask, bool can_resched)
> >  {
> >       p4d_t *p4d;
> >       unsigned long next;
> > @@ -496,7 +498,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned l=
ong addr, unsigned long end,
> >
> >               if (p4d_none_or_clear_bad(p4d))
> >                       continue;
> > -             vunmap_pud_range(p4d, addr, next, mask);
> > +             vunmap_pud_range(p4d, addr, next, mask, can_resched);
> >       } while (p4d++, addr =3D next, addr !=3D end);
> >  }
> >
> > @@ -512,7 +514,8 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned l=
ong addr, unsigned long end,
> >   *
> >   * This is an internal function only. Do not use outside mm/.
> >   */
> > -void __vunmap_range_noflush(unsigned long start, unsigned long end)
> > +void __vunmap_range_noflush(unsigned long start, unsigned long end,
> > +                         bool can_resched)
> >  {
> >       unsigned long next;
> >       pgd_t *pgd;
> > @@ -527,7 +530,7 @@ void __vunmap_range_noflush(unsigned long start, un=
signed long end)
> >                       mask |=3D PGTBL_PGD_MODIFIED;
> >               if (pgd_none_or_clear_bad(pgd))
> >                       continue;
> > -             vunmap_p4d_range(pgd, addr, next, &mask);
> > +             vunmap_p4d_range(pgd, addr, next, &mask, can_resched);
> >       } while (pgd++, addr =3D next, addr !=3D end);
> >
> >       if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> > @@ -536,8 +539,9 @@ void __vunmap_range_noflush(unsigned long start, un=
signed long end)
> >
> >  void vunmap_range_noflush(unsigned long start, unsigned long end)
> >  {
> > -     kmsan_vunmap_range_noflush(start, end);
> > -     __vunmap_range_noflush(start, end);
> > +     /* The unmap paths are sleepable, keep the resched point. */
> > +     kmsan_vunmap_range_noflush(start, end, true);
> > +     __vunmap_range_noflush(start, end, true);
> >  }
> >
> >  /**
> > diff --git a/mm/vmalloc.h b/mm/vmalloc.h
> > index d8372a4f65c4..4ec114a75f04 100644
> > --- a/mm/vmalloc.h
> > +++ b/mm/vmalloc.h
> > @@ -44,6 +44,7 @@ int __must_check __vmap_pages_range_noflush(unsigned =
long addr,
> >
> >  void vunmap_range_noflush(unsigned long start, unsigned long end);
> >
> > -void __vunmap_range_noflush(unsigned long start, unsigned long end);
> > +void __vunmap_range_noflush(unsigned long start, unsigned long end,
> > +                         bool can_resched);
> >
> >  #endif /* __MM_VMALLOC_H */
>
