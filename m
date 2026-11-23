Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466975;
	b=Pbb1eW5NPNCKGInBZB/OxW9WbAvCIfyZidraQEDxWbqDvVQR5/xwLQqeLUj3oeO+mBvl
	 XxbWV893G/VOZ8QNVzLXAos8Ta/4rXaxUVXPwxDN3E2fPIyncN4/hSUyTT6BU9yyKAllU
	 MJqIZCeTry1Gv7I2qoCwLz1PJSwro05GDK/G8dyPPePvvn/6M0RtmVVAfla63xlHEWfgl
	 rgCDzP84miFTjudJgIBQCOdEdYb6+RN/YP2DVlZSObB6ssWTkOSUozim6rSUinYSHAjUm
	 dshnqIg+dvY3qTh21Pvf6juY0SpTojJYn37VKTuxXljQsVq0lUxZ7+91PlmyZymRTgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BwAkFqLrDZuJNQfsb1QIWJWTzXXHyVshwDglsm6PKrE=;
	b=nwGynphUXakUA6M/Apz3wfMMlyEW1dfXV26Hu/A6GxnT4XV70dy6me2REmbuQfNrf9+3
	 H1cmjxPWeiX50RDPiHTPdfhyK/Amtt3C90BWD11LdlwluEb0p+1DnRUvT69UiFW9lg2d+
	 zGs3CtmlnY7i16sJTXA6I/Vebap6/wx1SQZlebIeYCBq4yT4VJAIYfngl9XJVR0LsRC9g
	 81wYtER/i2CqNHUs/h3I7WtToHA/DXZyhvVRJe835xRzTt5XSTgxNCD9HgKk9IWIf6bVk
	 cigI55C0N01rY5qWd7t6HOwyg4Fj7lsz73PGkf/QApXEmm7BnMD97B06DY/9wCdXLPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aCT8P0pw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0516606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0516606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aCT8P0pw
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4cdc606b47so643432066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:49:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795466973; cv=none;
        d=google.com; s=arc-20260327;
        b=UZy2p8sRAMbIDVjG/pImthuhf+ndWXmQvI1VIZP0dC4OW1G22mDdq204xLnZjpGHRj
         EIEJH1o2osJJHVvrNBWNZTmwOM8AMV32YKkpZGjO3uWABqmiSJjSv6TfwWlMnPYYOamN
         mjnWIH+jTj3SnA5n5yus1rKKEHqTMqRV7JTSIGUaSR4dIthiumL8hpuHF46WxqGk7tRq
         NRUh9SMlubdUsg/c2sADNw8+tcWQFeE4/YjFyEqfdabrTGLmIuqNz2e+fEVshwU8T8Ai
         bIbdi8t+BJyCWn/ufVqg9Zh6HBLpzAmfG177ySlWJvyYBWsHfDD7sXe6XoAztPU3A5cW
         areQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BwAkFqLrDZuJNQfsb1QIWJWTzXXHyVshwDglsm6PKrE=;
        fh=eAn3vcFoCCaU74XCJCSQ4yTqZqx84OS4N60N1LNd+n4=;
        b=iLnm2rON6kmldCB/oqYWd57NSfImTEoytMpMPMXvWwDqkW8ECUNY6vDECl9lQT28Uu
         a6+RWgeTKIhsyK2wJjPx/6ghXCB3kDJlUdaMvPgwCqI/p7qpXKWSbAMRAg+jz5sF4itm
         lJq/5IulV3nCT2uG9PuSOOUIgseCAk9SFPKi+q7ZtlkebpE/K5Sa2DByv7gAE7r48unZ
         P8oeQdEPB71XwUxjkJUfykSeZ6uPT67ior8ss0FI9xFmnT0gXcA92Ts61RL4Aoc2GWyo
         SoFDSH67XrKtMjUCPRB/ZSzJyglkMQPLy6ugii7HZCk+X1wvD6gcLY6U/pFlIUlA3gHl
         AxfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795466973; x=1796071773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BwAkFqLrDZuJNQfsb1QIWJWTzXXHyVshwDglsm6PKrE=;
        b=aCT8P0pwDFn9KKQhHznx1a9DRHLRJFClL6cz8FQUAy3P0za5D3LGTkF+jKKPX5v2BY
         a1ckF3N1Cs/oQRXNe27WAt9KNq+S0hi/t3gMfg0AtjSN9z8wOyPFNeJY+9Y/sbnBMOtH
         L+W9pP/TIePA9rxEw5NZwj6zEPaBhA5FH36qXJG+Rv7FvJpAWq/gCFRa580OxjYUKPkl
         Fk7FgB2Mmm8mpuvh+eqUBcu1Lp/xcx+7RszSOXO5gevrXe8sBnNskOJA+AdjBknaWfmF
         zRGcndXcb8MPVme7pI5BHi6NdsQ0HAugCByjFhffVDhGMfj+jPjHlki7mK9PnryVPkjZ
         OwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466973; x=1796071773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwAkFqLrDZuJNQfsb1QIWJWTzXXHyVshwDglsm6PKrE=;
        b=xnKgmJ361gKQMnEnBV+VoUbGrgQ4NHdLbBf085f9wk9mT2ukAvdbS18ByfxJGz6FaX
         4AVVWm2FMgPDJmtNB8UjT6IYGKcoudZBofW7y6ZPnYfjOEAubzqyDophIX/wUG7vomjX
         C4Bgdm0uAN9QWxGshzK8jbLny1FRigf58AC9hvZYa5CO8k+hrennAp3EPsKG5iYCKOGd
         5nfMS2DQ8I4QAlJQUSDVgUD3eyGGeFUw1ZWhczG5fkRfPc3c6/YRc92bxO71l1g2A3IM
         PkG+fZe1A/WxjR4KK+clhSZpdpGHyiOKAgmkRrXhvy3x8JJQdAbHCMoDNEXsPSxR0Zxx
         A9Ow==
X-Forwarded-Encrypted: i=1; AL+hErFCMAV8YL2dDHAPC1ZmDV3czApsx4f6lwvmC7/br9V8Zq9Ox+cKJudorIpHK+aLVjg8kEU62ZjRbd83J+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9wpkgi25MG4YBqEpWfwL2ZCaduU57qEG7kfo/2owpUGuZ2b7m
	+IVctKqO5rNAfiehJ9Pf+NPIiv8PRJZ3qirXKfJxCn8FiZ76jP2sogbGjzTYbJxpG3Upl/o6L7R
	jsN/kMwPy3+YVovj6t4CNW1v1Z1X9MD72uX5TjvEM
X-Gm-Gg: AZFdTZfIBSRnWl5Gn5VWmw/QkGSACQVli5afLtNc+fF0lQBEVaruI1BF5rd2gUqiShu
	MilONcBnXMS309Dm4OFYFQ30fmT6OT4hyp7tVlk9+L+yCggsKiiwM+PGFqp1rJ5Qhdot6e/feOX
	0YSLrHf5ZnRfr23WPAHfd/9Ss7ahJH6VSY4+Znm9p5Kpf2/jALIXj0YBdiGDVjDq5y/yi9QTHJr
	MTpRYHlkxqqMrtLLR52TevdMduFKWlZMs+aHt7ckz+N1l0eKie2zKxuzfleCWtAI7dwNVHGAxpw
	iqL/BduAUhQttzwxo45aRPVlQY/te01/dJ7OoS+SusCZA8XsQPyPLq0bs/aQpjJGA6pqapL1oQg
	B9eIsPLRSaW9qOjstIfsfYmCiekz4PPGmi3SrB0OsDMdirQUbLDmMxB9BYsimq1GkbjuFKehWBC
	mSGmJNP+I3fkQwX9Fni4misjxAIWlGDUqq6pkQpQarVo8vsE/lEcA=
X-Received: by 2002:a17:906:da0e:b0:c41:731c:534 with SMTP id
 a640c23a62f3a-c513a8590b8mr737596766b.24.1795466972524; Mon, 23 Nov 2026
 12:49:32 -0800 (PST)
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
 <20261122184453.2668189-5-jthoughton@google.com> <4508589C-2E30-4DAB-9465-73121835D0D8@linux.dev>
In-Reply-To: <4508589C-2E30-4DAB-9465-73121835D0D8@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Mon, 23 Nov 2026 15:48:54 -0500
X-Gm-Features: Aa3M54q05It1n2eRJ6pQdCziUJwvWp3TC8VwynDcMWXjuCwyJF5MV-bvGGuFHUc
Message-ID: <CADrL8HUstWR2pajfYYzRqL7HziVfzZAXJas6MqJkK6pVxSzXEg@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
To: Muchun Song <muchun.song@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 9:47=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote=
:
> >
> > set_pte_at() cannot be used to replace in-use vmemmap PTEs on arm64, so
> > replace it with a more specific routine, try_update_vmemmap_pte().
> >
> > try_update_vmemmap_pte() is used for modifying page table entries such
> > that there is a guarantee that no fault will be taken.
> >
> > For the generic implementation, please note one difference: set_pte()
> > does not invoke page_table_check_ptes_set(), but set_pte_at(), the call
> > we are about to replace, does. However, this is a functional no-op
> > because page_table_check_ptes_set() does nothing for init_mm PTEs, whic=
h
> > vmemmap PTEs are.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > arch/loongarch/include/asm/pgtable.h |  2 ++
> > arch/riscv/include/asm/pgtable.h     |  2 ++
> > arch/x86/include/asm/pgtable.h       |  2 ++
> > include/linux/pgtable.h              | 22 +++++++++++++++++++
> > mm/hugetlb_vmemmap.c                 | 32 +++++++++++++++++++++++-----
> > 5 files changed, 55 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/incl=
ude/asm/pgtable.h
> > index f87603135131..123eda3f6035 100644
> > --- a/arch/loongarch/include/asm/pgtable.h
> > +++ b/arch/loongarch/include/asm/pgtable.h
> > @@ -633,6 +633,8 @@ static inline long pmd_protnone(pmd_t pmd)
> > #define pmd_leaf(pmd)         ((pmd_val(pmd) & _PAGE_HUGE) !=3D 0)
> > #define pud_leaf(pud)         ((pud_val(pud) & _PAGE_HUGE) !=3D 0)
> >
> > +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
> > +
> > /*
> >  * We provide our own get_unmapped area to cope with the virtual aliasi=
ng
> >  * constraints placed on us by the cache architecture.
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/=
pgtable.h
> > index 2ebd5fa5adc5..c8d05bc12cc8 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -1172,6 +1172,8 @@ static inline pud_t pud_modify(pud_t pud, pgprot_=
t newprot)
> >
> > #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> >
> > +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
> > +
> > /*
> >  * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs tha=
t
> >  * are !pte_none() && !pte_present().
> > diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgta=
ble.h
> > index 000fc6c1ca37..271cdc61de3a 100644
> > --- a/arch/x86/include/asm/pgtable.h
> > +++ b/arch/x86/include/asm/pgtable.h
> > @@ -1372,6 +1372,8 @@ static inline pmd_t pmdp_establish(struct vm_area=
_struct *vma,
> > }
> > #endif
> >
> > +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
> > +
> > #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> > static inline pud_t pudp_establish(struct vm_area_struct *vma,
> >               unsigned long address, pud_t *pudp, pud_t pud)
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index bc1353f03b08..ab33df268955 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -458,6 +458,28 @@ static inline void set_ptes(struct mm_struct *mm, =
unsigned long addr,
> > #endif
> > #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1=
)
> >
> > +#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
>
> Why not ARCH_WANTS_VMEMMAP_UPDATE_PTE? Then x86, loogarch and RISC-V do n=
ot need define
> this macro in their ptable.h.

You're basically asking to make this opt-out instead of opt-in, right?

I like making the different architectures explicitly opt in to the
generic implementation; it forces any new architecture to decide if
the generic implementation is correct for them. But I don't feel
strongly.

I'll switch it to opt-out in v4 unless you or someone else tells me otherwi=
se.

>
> > +/*
> > + * try_update_vmemmap_pte - Remap PTEs used by the vmemmap.
> > + * @addr: Base address of the remapped PTE.
> > + * @ptep: Page table pointer to be overwritten.
> > + * @pte: Page table entry to write.
> > + *
> > + * This function is only to be used to update PTEs that map the vmemma=
p. The
> > + * only valid transitions supported by this function are: leaf-level
> > + * (PAGE_SIZE), valid-to-valid. The pfn and prot bits may be changed.
> > + *
> > + * Implementations of this function must ensure that, while the update=
 is taking
> > + * place, CPUs will not fault on the remapped virtual address.
> > + */
> > +static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *pt=
ep,
> > +                                      pte_t pte)
>
> Please rename it to vmemmap_update_pte, all HVO-related helpers will be p=
refixed
> with vmemmap.

Okay, will do.

>
> Again, I still recommend having this function return void. That will make=
 the
> overall code simpler. If we actually run into related issues in the futur=
e, we
> can add support for it then. I don't want to introduce unnecessary code
> maintenance now.

Thanks. I will just point back to my reply from v2[1]. I hope Catalin
or Will have thoughts on this.

[1] https://lore.kernel.org/linux-mm/CADrL8HWNaurYHGnpvC9qwr6bVU74YhhucCuho=
VYcvqmSX+R6+Q@mail.gmail.com/

>
> Thanks,
> Muchun
>
> > +{
> > +     set_pte(ptep, pte);
> > +     return 0;
> > +}
> > +#endif
> > +
> > #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> > extern int ptep_set_access_flags(struct vm_area_struct *vma,
> >                                unsigned long address, pte_t *ptep,
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 2e9cf8d39c89..b4d0311bcc4a 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -218,15 +218,19 @@ static int alloc_vmemmap_page_list(struct list_he=
ad *head,
> >       return -ENOMEM;
> > }
> >
> > +/*
> > + * Copy @src into the first page on @vmemmap_pages and return it. The =
page is
> > + * left on the list; the caller must remove it only once it has succes=
sfully
> > + * been installed in the vmemmap.
> > + */
> > static struct page *vmemmap_dup_page_from_list(const struct page *src,
> >               struct list_head *vmemmap_pages)
> > {
> >       struct page *dst =3D list_first_entry(vmemmap_pages, struct page,=
 lru);
> >
> > -     list_del(&dst->lru);
> >       copy_page(page_address(dst), page_address(src));
> >
> > -     /* Ensure updates to @dst page are visible before set_pte_at(). *=
/
> > +     /* Ensure updates to @dst page are visible before try_update_vmem=
map_pte(). */
> >       smp_wmb();
> >
> >       return dst;
> > @@ -248,6 +252,8 @@ static int vmemmap_optimize_pte(pte_t *pte, unsigne=
d long addr,
> >       const struct page *page =3D (const struct page *)addr;
> >       const struct folio *folio =3D page_folio(page);
> >       struct page *src =3D pte_page(ptep_get(pte)), *dst;
> > +     bool dup =3D false;
> > +     int ret;
> >
> >       if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), folio_order=
(folio)))) {
> >               dst =3D folio_vmemmap_shared_tail_page(folio);
> > @@ -255,16 +261,27 @@ static int vmemmap_optimize_pte(pte_t *pte, unsig=
ned long addr,
> >                       return -ENOMEM;
> >       } else {
> >               dst =3D vmemmap_dup_page_from_list(src, walk->vmemmap_pag=
es);
> > +             dup =3D true;
> >       }
> >
> > -     list_add(&src->lru, walk->vmemmap_pages);
> >       /*
> >        * Map the shared tail page writable intentionally. A lockless ge=
t that
> >        * read a non-zero refcount before the remap can still do its cmp=
xchg
> >        * after it. The refcount is zero, so the cmpxchg fails and leave=
s the
> >        * page unchanged.
> >        */
> > -     set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
> > +     ret =3D try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL=
));
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * We successfully overwrote the vmemmap PTE, so the page that wa=
s just
> > +      * unmapped can be freed, and if we mapped a duplicated page, rem=
ove it
> > +      * from the list so that it doesn't get freed later.
> > +      */
> > +     if (dup)
> > +             list_del(&dst->lru);
> > +     list_add(&src->lru, walk->vmemmap_pages);
> >
> >       return 0;
> > }
> > @@ -275,6 +292,7 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned=
 long addr,
> >       const struct page *page =3D (const struct page *)addr;
> >       const struct folio *folio =3D page_folio(page);
> >       struct page *src =3D pte_page(ptep_get(pte)), *dst, *tail;
> > +     int ret;
> >
> >       if (unlikely(!vmemmap_optimizable_pfn(page_to_pfn(page), folio_or=
der(folio))))
> >               return 0;
> > @@ -291,7 +309,11 @@ static int vmemmap_restore_pte(pte_t *pte, unsigne=
d long addr,
> >               return 0;
> >
> >       dst =3D vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
> > -     set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
> > +     ret =3D try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL=
));
> > +     if (ret)
> > +             return ret;
> > +
> > +     list_del(&dst->lru);
> >
> >       return 0;
> > }
> > --
> > 2.56.1.809.ga0b61035b5-goog
> >
>
