Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795450809;
	b=dQb4e5yG0BD3ayM0LL/PliRVcgxnGxAQFaQJONXSHRoWcICDFrvBHvGH5zIC6dVy3lkT
	 7cpbH566jRXkobMyrxEVJlqK9G1jQPXCkJqAobZBLGS1/sUqxsKs6OTUuYdu4Afxh5G1C
	 5h2/qBdr8Pe4Qu43NJlMPay9BLIh1IXnOh9/acCRMjV/1Y7AgOKNzdhvhi75MN4149UE1
	 Isj79YNruuk9oTgIRQlRsFaOfCATSfF2oOuRxkt5rYIt2A263HH5cUjC+23nCkKoirWWu
	 ouD0h+qPdAEfkfn+kfsyWatjdKgf2VKm8fqCau4TTghZLCpgsxUPPmzSglq24Q8+cCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mldqwpxZeD1p8uw821ZK1a2yAWOs86dOj1gRQG3CmFQ=;
	b=xWIVyYx594N+BzavP/44Qpa1g89wI4L6tw+iKkYHBKFIV+bC0kOxeAviFi1B2YHUFSJW
	 JtP74pNmWmQ9p89V09DKaHwaUYU9vs7pXdL2554FytVcb8vR19eYFI9teRxGGBNES6Mk0
	 9IM6Avznuatrpr9hyPC+qHzsQnfOoep+KYtgWNG/Rcyoi51VNnegXvo86tGDz8/uWDtqX
	 a0+VKp04edpiIcBQv+4mQT7OfuV3FwC9dLGdVirYwRSIp6C6bE93Vt2Sp4XdBpFY5wa+Q
	 zjq0K9dEh3CwNZvj1zYIg+9XJ20bfx7UzxLWVz+5cpT0gCpaWM3JmrcxmF9q7HmWtHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iPyfLdUU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C3C606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6C3C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iPyfLdUU
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55be673e029so440141cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795450808; cv=none;
        d=google.com; s=arc-20260327;
        b=NMz/3Pb04KX0eymoO/MogmvW9HpuQ2X775MefueSqnlLcQkWD5vXgbph5hl9VDXtw9
         v/DLqXdKxp36H7+c/Y45dnfipNdg7hG7FAenyxcgtxxFvmZDJ4nTjimQxZccqt1HHgXj
         EdvjSENQEHsd5IX4o1SjSEZEbbppoF/jUwC/q5Uo4V9lKaAwVozqvxx+rEKBK+ensrUX
         wo/VSnu9mMDnt39ZjnIAyBlCgtPeVRpM0zOqBLEgXxJXq6qRH7HDmCjajoQsWyIvJbwL
         y5JXsWKUFmmxtt/HGWseWduJNWUrIR2tp+DlOPiXV/ftJtsbOP6JJ0oXMffpxXnIP1el
         m09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mldqwpxZeD1p8uw821ZK1a2yAWOs86dOj1gRQG3CmFQ=;
        fh=82S+q6nVToUBEBf5K7mkQu1Nv/M8ds9YTGGMvC48DPM=;
        b=dRuwdj0Udfxl1AuMrxRh1GxxZepOk5z14yCyOlkISubCbk4NKZZpTg93bfudSk34tc
         hgp8e3+v3I7ZPpZq3xt9juTFaFof1M+EeZuAIWkzFxRrHc+AiVoeVqBfslaidskHw+i+
         NSeTo26HtnCSDtMVmZurbk5AfLXNrYtXyYTYEopZ6ovpPMLG8LUR502PRgUgNu3lvO8m
         +n+L6Ky8LVELiYg/ih5E1cliW02JLbQkSa3ioO/s/1pg2959+V8fiFucQc+FMIMBV2ix
         rDKGagwuaxNy6SoOD2LwqoD3JFiOY4eogfw5Y2x30oHavUvDwM4U3vmuFOe8D6pS7Z9K
         ck2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795450808; x=1796055608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mldqwpxZeD1p8uw821ZK1a2yAWOs86dOj1gRQG3CmFQ=;
        b=iPyfLdUU3+ISjOgV2XrTMJofTEDIIrxoFabWb3cxEESEWwTun+rHKG0mCtb+OHnmis
         qJP8vw14yLvD2gZ1eXA8aEkNG2K8/Xhl6KrljZ+NffltOTLEoPqfBpjDcSaYUp/UMxVx
         2nx55HF4KpeJdIbCJpFrXOWzQnp43/1bKh/GUd2Fj4qb8TK6qP+0arnMstKhSKmtFWKR
         s8fXHqiwf4fU3UEaQWpfPN8DeXXKHB+uJLoD9Uge0y744X45J/5Q1JyG4196QBb4M03V
         reI5fcQMuh5juhfIcb6IRFRc52Dhx6CydN7A49C6k7JGmwzltx7wzFWyYywhddTv+1T/
         sUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450808; x=1796055608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mldqwpxZeD1p8uw821ZK1a2yAWOs86dOj1gRQG3CmFQ=;
        b=GJmYeWx4HEJ6chvKEKHvB56okEOo5yDsQ7d4aImYGXHA59vbugxQ0+yhY7Hh/c+6uX
         5HGPua6SO9iYW4LA9TA7Q++lpO59GOFzCjE4g+vLPqmu8d01C1yCi8Al+MOXSdIaSLUB
         LZeoQr/h0Gx/BYW/CHw4b071wCdRSBoTlY9Ko4Wcm3hm78yPVSXf8AOYdSY7CbJ+NPi5
         Y/1KAEsn3i1BDOxPcP1ZFa7nHGe3rMLo0fLZqR04rU534r2Kwbf03umM8eiyeFUe3p0C
         cj3JKq2CDnR5M+2RMJWT9usjlUAys5nhtqN14CAKvgdsFcmQFyU26AQ3RWhwyymNY4Id
         L0xQ==
X-Forwarded-Encrypted: i=1; AL+hErFfL99Cb187B3nMbCf13PiLlwSYbxPGwSq+75jAdEcpGHxNs3jTCbNVdyxtQLIdwLm8cVOQALD1q2dV/n0=@vger.kernel.org
X-Gm-Message-State: APuU4Z88EP8rEQvlV6/Yqejo1AxBfFUHXVdlIehR96Zc1SRTbgpnO6zD
	k+pIe7/mN1QhOyMEs0l+pk6sSxBUbONyltSkCpk0QEnGwyDTGY9H03M5/Z0E3TkwSegPWBF0+Qs
	sRdjDWvNZG+8zRr+vbp0LjTBJt7JdKk+nBve5nx4b
X-Gm-Gg: AZFdTZclP3xhnKnD8q8fLN4pVDoDLyxhDugI/TcIh1bDKBzWi80pypiUYd7GXgqeKH1
	ZCugvNJyxQdpEKRqU4vv2c+88WFr5ugHVZ1PuDa9I974EUgmtE4IbIzO48hVKDZTTv08S/i3Biu
	NitpBsn+tPxxj1pTZSGzG5uLsuh33n2LBRvXNa8B6sv9Hym0o86bw/16luz0iLNMAILHYfFucGL
	v3GYKWaK2Q2DMF7IwpSEKqR4s/Ot8kHxuxesHMkAXpnH+VHVue2YJ5EOaivhKO1bN9cAnovVFYq
	D9s2L42cFFYfnQT+QCVKKhMVen0jv8cVoBVe+1EfhudXdb5fNxpFEGhp/cpka7a+H6vXKJqV/8T
	dc2PPT4EIbruo7OjQUm9+mkbOflbxLGFscV9+MZ3KxunrKZWx1EzwyPPpTQc6mKYTVwUCFtQ=
X-Received: by 2002:a05:622a:5a12:b0:536:6ea4:e6a0 with SMTP id
 d75a77b69052e-55d89047301mr36389711cf.11.1795450806808; Mon, 23 Nov 2026
 08:20:06 -0800 (PST)
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
 <1020e36e-83bb-407b-8a6b-7669f04c26c3@arm.com> <CAJuCfpHtWJvs4F2L+QCMe9gMJ-qmcj4Q1G4hqVqFe6Z6gPoQ1Q@mail.gmail.com>
 <cb8d8dc5-4ccc-408f-acaf-2f1faa0a1983@linux.dev>
In-Reply-To: <cb8d8dc5-4ccc-408f-acaf-2f1faa0a1983@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 23 Nov 2026 08:19:54 -0800
X-Gm-Features: Aa3M54qAZLYw0m2OwS5IQ2Il_ZIKZH-wm8JIT48ds8WuRflK3snOxTbasMdxo14
Message-ID: <CAJuCfpHfz-nNhhN2kDgi07eTMNjMEh+ZK2Ejuxb=-q8wbanJDg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm/vmalloc: skip cond_resched() in the vmap
 unmap paths when atomic
To: Hao Ge <hao.ge@linux.dev>
Cc: Dev Jain <dev.jain@arm.com>, Uladzislau Rezki <urezki@gmail.com>, 
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

On Sun, Nov 22, 2026 at 10:17=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Suren and Dev
>
> Thanks for the review.
>
> On 2026/11/21 05:07, Suren Baghdasaryan wrote:
> > On Thu, Nov 19, 2026 at 5:02=E2=80=AFAM Dev Jain <dev.jain@arm.com> wro=
te:
> >>
> >>
> >>
> >> On 16/11/26 12:43 pm, Hao Ge wrote:
> >>> The vmap failure paths can be reached with GFP_ATOMIC or GFP_NOWAIT
> >>> since commit b186a94227b7 ("kmsan: remove hard-coded GFP_KERNEL
> >>> flags") and commit 8da89ba18ed4 ("mm/vmalloc: handle non-blocking
> >>> GFP in __vmalloc_area_node()"), so an undo of a partially installed
> >>
> >> You mention this commit too, implying that vunmap_range_noflush() can
> >> be called in atomic context right now, but in this patch in
> >> vunmap_range_noflush() you pass 'true' unconditionally to
> >> __vunmap_range_noflush()?
> >>
> >> Can you give me the call chain existing in current kernel which makes
> >> this bug trigger? In case it does not exist but is only triggered when
> >> you add the rollback code later, then this patch is not fixing a bug.
> >
> > Yeah, IIUC this is a prep patch for later changes and does not fix any
> > existing issues, therefore should not have any Fixes tags and should
> > not be CC'ed to stable.
> >
> > Other than that LGTM.
>
> Right, this is a prep patch for later changes. I will drop the
> Fixes tag, this patch fixes nothing by itself.
>
> I would keep the stable Cc though. The next patch, "mm/kmsan: undo
> the shadow mapping when the origin mapping fails", is the real fix
> and it depends on this one. Per stable-kernel-rules.rst, patch1 in
> a series should be marked for stable inclusion when patch2 depends
> on it, otherwise the fix lands in stable without its prerequisite.

It might be worth spelling this out in the changelog to avoid
confusing Greg and Sasha.

>
> Or did I misread the rules?
>
> Thanks
> Best Regards
> Hao
>
> >
> >>
> >>
> >>> mapping may have to run in atomic context, where the cond_resched()
> >>> in vunmap_pmd_range() cannot schedule.
> >>>
> >>> Give __vunmap_range_noflush() and kmsan_vunmap_range_noflush() a
> >>> can_resched argument and skip the cond_resched() when it is false.
> >>> The existing callers are on sleepable paths and pass true, so nothing
> >>> changes for them.
> >>>
> >>> Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_=
pages_range_noflush()")
> >>> Cc: stable@vger.kernel.org
> >>> Reported-by: Sashiko <sashiko-bot@kernel.org>
> >>> Closes: https://lore.kernel.org/all/sashiko-outbox-178439@kernel.org/
> >>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> >>> ---
> >>>  include/linux/kmsan.h |  8 ++++++--
> >>>  mm/kmsan/hooks.c      | 14 +++++++++-----
> >>>  mm/vmalloc.c          | 24 ++++++++++++++----------
> >>>  mm/vmalloc.h          |  3 ++-
> >>>  4 files changed, 31 insertions(+), 18 deletions(-)
> >>>
> >>> diff --git a/include/linux/kmsan.h b/include/linux/kmsan.h
> >>> index 7da9fd506b39..0016c032d1e7 100644
> >>> --- a/include/linux/kmsan.h
> >>> +++ b/include/linux/kmsan.h
> >>> @@ -150,11 +150,14 @@ int __must_check kmsan_vmap_pages_range_noflush=
(unsigned long start,
> >>>   * kmsan_vunmap_kernel_range_noflush() - Notify KMSAN about a vunmap=
.
> >>>   * @start: start of vunmapped range.
> >>>   * @end:   end of vunmapped range.
> >>> + * @can_resched: whether the unmap walk may call cond_resched(); pas=
s
> >>> + * false from atomic context.
> >>>   *
> >>>   * KMSAN unmaps the contiguous metadata ranges created by
> >>>   * kmsan_map_kernel_range_noflush().
> >>>   */
> >>> -void kmsan_vunmap_range_noflush(unsigned long start, unsigned long e=
nd);
> >>> +void kmsan_vunmap_range_noflush(unsigned long start, unsigned long e=
nd,
> >>> +                             bool can_resched);
> >>>
> >>>  /**
> >>>   * kmsan_ioremap_page_range() - Notify KMSAN about a ioremap_page_ra=
nge() call.
> >>> @@ -355,7 +358,8 @@ static inline int __must_check kmsan_vmap_pages_r=
ange_noflush(
> >>>  }
> >>>
> >>>  static inline void kmsan_vunmap_range_noflush(unsigned long start,
> >>> -                                           unsigned long end)
> >>> +                                           unsigned long end,
> >>> +                                           bool can_resched)
> >>>  {
> >>>  }
> >>>
> >>> diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
> >>> index a706666db097..69008b085658 100644
> >>> --- a/mm/kmsan/hooks.c
> >>> +++ b/mm/kmsan/hooks.c
> >>> @@ -136,10 +136,13 @@ static unsigned long vmalloc_origin(unsigned lo=
ng addr)
> >>>                                                KMSAN_META_ORIGIN);
> >>>  }
> >>>
> >>> -void kmsan_vunmap_range_noflush(unsigned long start, unsigned long e=
nd)
> >>> +void kmsan_vunmap_range_noflush(unsigned long start, unsigned long e=
nd,
> >>> +                             bool can_resched)
> >>>  {
> >>> -     __vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(en=
d));
> >>> -     __vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(en=
d));
> >>> +     __vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(en=
d),
> >>> +                            can_resched);
> >>> +     __vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(en=
d),
> >>> +                            can_resched);
> >>>       flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
> >>>       flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
> >>>  }
> >>> @@ -168,8 +171,9 @@ static void kmsan_iounmap_pages(unsigned long sta=
rt, unsigned long end)
> >>>               if (origin)
> >>>                       __free_pages(origin, KMSAN_IOREMAP_META_ORDER);
> >>>       }
> >>> -     __vunmap_range_noflush(shadow_start, shadow_end);
> >>> -     __vunmap_range_noflush(origin_start, origin_end);
> >>> +     /* ioremap metadata mappings are always GFP_KERNEL, so resched =
is safe. */
> >>> +     __vunmap_range_noflush(shadow_start, shadow_end, true);
> >>> +     __vunmap_range_noflush(origin_start, origin_end, true);
> >>>       flush_tlb_kernel_range(shadow_start, shadow_end);
> >>>       flush_tlb_kernel_range(origin_start, origin_end);
> >>>  }
> >>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> >>> index ccaf158c5b7f..3c0d9e69b886 100644
> >>> --- a/mm/vmalloc.c
> >>> +++ b/mm/vmalloc.c
> >>> @@ -429,7 +429,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned=
 long addr, unsigned long end,
> >>>  }
> >>>
> >>>  static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigne=
d long end,
> >>> -                          pgtbl_mod_mask *mask)
> >>> +                          pgtbl_mod_mask *mask, bool can_resched)
> >>>  {
> >>>       pmd_t *pmd;
> >>>       unsigned long next;
> >>> @@ -451,12 +451,14 @@ static void vunmap_pmd_range(pud_t *pud, unsign=
ed long addr, unsigned long end,
> >>>                       continue;
> >>>               vunmap_pte_range(pmd, addr, next, mask);
> >>>
> >>> -             cond_resched();
> >>> +             /* The undo path may run in atomic context. */
> >>> +             if (can_resched)
> >>> +                     cond_resched();
> >>>       } while (pmd++, addr =3D next, addr !=3D end);
> >>>  }
> >>>
> >>>  static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigne=
d long end,
> >>> -                          pgtbl_mod_mask *mask)
> >>> +                          pgtbl_mod_mask *mask, bool can_resched)
> >>>  {
> >>>       pud_t *pud;
> >>>       unsigned long next;
> >>> @@ -476,12 +478,12 @@ static void vunmap_pud_range(p4d_t *p4d, unsign=
ed long addr, unsigned long end,
> >>>               }
> >>>               if (pud_none_or_clear_bad(pud))
> >>>                       continue;
> >>> -             vunmap_pmd_range(pud, addr, next, mask);
> >>> +             vunmap_pmd_range(pud, addr, next, mask, can_resched);
> >>>       } while (pud++, addr =3D next, addr !=3D end);
> >>>  }
> >>>
> >>>  static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigne=
d long end,
> >>> -                          pgtbl_mod_mask *mask)
> >>> +                          pgtbl_mod_mask *mask, bool can_resched)
> >>>  {
> >>>       p4d_t *p4d;
> >>>       unsigned long next;
> >>> @@ -496,7 +498,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned=
 long addr, unsigned long end,
> >>>
> >>>               if (p4d_none_or_clear_bad(p4d))
> >>>                       continue;
> >>> -             vunmap_pud_range(p4d, addr, next, mask);
> >>> +             vunmap_pud_range(p4d, addr, next, mask, can_resched);
> >>>       } while (p4d++, addr =3D next, addr !=3D end);
> >>>  }
> >>>
> >>> @@ -512,7 +514,8 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned=
 long addr, unsigned long end,
> >>>   *
> >>>   * This is an internal function only. Do not use outside mm/.
> >>>   */
> >>> -void __vunmap_range_noflush(unsigned long start, unsigned long end)
> >>> +void __vunmap_range_noflush(unsigned long start, unsigned long end,
> >>> +                         bool can_resched)
> >>>  {
> >>>       unsigned long next;
> >>>       pgd_t *pgd;
> >>> @@ -527,7 +530,7 @@ void __vunmap_range_noflush(unsigned long start, =
unsigned long end)
> >>>                       mask |=3D PGTBL_PGD_MODIFIED;
> >>>               if (pgd_none_or_clear_bad(pgd))
> >>>                       continue;
> >>> -             vunmap_p4d_range(pgd, addr, next, &mask);
> >>> +             vunmap_p4d_range(pgd, addr, next, &mask, can_resched);
> >>>       } while (pgd++, addr =3D next, addr !=3D end);
> >>>
> >>>       if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> >>> @@ -536,8 +539,9 @@ void __vunmap_range_noflush(unsigned long start, =
unsigned long end)
> >>>
> >>>  void vunmap_range_noflush(unsigned long start, unsigned long end)
> >>>  {
> >>> -     kmsan_vunmap_range_noflush(start, end);
> >>> -     __vunmap_range_noflush(start, end);
> >>> +     /* The unmap paths are sleepable, keep the resched point. */
> >>> +     kmsan_vunmap_range_noflush(start, end, true);
> >>> +     __vunmap_range_noflush(start, end, true);
> >>>  }
> >>>
> >>>  /**
> >>> diff --git a/mm/vmalloc.h b/mm/vmalloc.h
> >>> index d8372a4f65c4..4ec114a75f04 100644
> >>> --- a/mm/vmalloc.h
> >>> +++ b/mm/vmalloc.h
> >>> @@ -44,6 +44,7 @@ int __must_check __vmap_pages_range_noflush(unsigne=
d long addr,
> >>>
> >>>  void vunmap_range_noflush(unsigned long start, unsigned long end);
> >>>
> >>> -void __vunmap_range_noflush(unsigned long start, unsigned long end);
> >>> +void __vunmap_range_noflush(unsigned long start, unsigned long end,
> >>> +                         bool can_resched);
> >>>
> >>>  #endif /* __MM_VMALLOC_H */
> >>
