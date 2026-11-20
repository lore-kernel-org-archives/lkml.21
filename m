Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795213812;
	b=ARL5W+YjQxpZpRGW5JWWH0Tnfm3+OX7gb4Gb/BYW/zpbFv66IV4/TKEm7Rwo+9WMx90f
	 EQ27XfNk2FyDfFdQxJBTeoulEF3ixf6UVHRB63nqrMQgC7rsuB5l6SBgE3E55Tp8iHWk2
	 J88zoQGwTLOJALJw27vKP/L78sK9MIKIxrKr2AwkQEzF5cmvEy0YS1WWjzyQlottzBYDk
	 wHm1f7CaMiGELTkUyPXN9DvH3T4Got28zLqax1a10C7cLyRr+wJHSWDW7SovRvz/smi0W
	 hJFa8jEIgRtn83TrdkmTlURqw4UQrgBNovZ8RLFM13mEX49xvQElhAeEBmRNv2/FqSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oSCVbmqxiQi2DoLmGcMaMHvDma566TKArudq046yQIs=;
	b=aVwj1rD3nYY4v/yesRnyYLa2DPK0fQiCkVz3RsC06X53LR9af5JjVMUs9cjgAgpqDBPm
	 V5WH7QLk4SMAHNrIkI8RBOm77NJN5Es5OTVKBGUi89avGyR1oni/C1v2BFXarZzOrFx21
	 0V8/0/1Hw5HF0hq+YzolpoairMMHjDL9dbxZG+47XUJKzWe9h1I23fc2DfaO7Kjbaz2AW
	 Yh8piff4sgPe0KoPMdhguh66tsRroivWaMgFKqOTdvN8TLxwnVRg+GIik+5OxBQupyKdg
	 Wmo0mNCODfKo2oBnurOqi8hShYEAuhwM9vnfU3pQscQPGTa2EBbe7rn3QHEY/3qDF6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UfYhOUT3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B77D606A695
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B77D606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UfYhOUT3
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533202fe429so90241cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:30:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795213811; cv=none;
        d=google.com; s=arc-20260327;
        b=dv/xj8gN98dR26hfBkINzJyeGWwrsl60wDi+OZYkcBPUXRMeLP+MR0AhhBr5bGG3gn
         wiaD0LeCvqOtDuWZWv1wc/wmwspKXGbuu8atN7j4N8nIA+BLmY4z3QgD/mHK3PIS52pQ
         62X9T1xSpqjIyZYKi1daCAVTwihDi/mwyeGHbsmXGzug+eRNTCQaG4jh+QLHfq3yywwR
         yP1Yaf/BBQb2rkTfeFfgy0jG3N4b5AWtNaL38GDdDOFgF60rSQoZ9fFUsNa+70OoQHbC
         rNYaeFC5z+G+td5ucS5D1lshTgFty4TnUrL9z46G0+l0rrxXKDe2fi0p0OlfsCHif0og
         28Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oSCVbmqxiQi2DoLmGcMaMHvDma566TKArudq046yQIs=;
        fh=ybi/r7dHTdG3qOYYPtfJ6t/LyQ8SgHIGHDTHxRAqeFQ=;
        b=aZrWjr0ayj+LZ1b1pfgIwsCH5+J7MskdM0aQjLQOZtrweByusTiTcaSQvXXJc5PZx5
         T4q4dqrb7jcBz32YxBkQ/iBklW/mU1Phsuq/EneXZTj967aA1otzpXKTgDsb4flUHB4L
         4vlhJl+CpfmAWmW0NGc5ZzqykzGnA7aIKK9UgLvOgyH5CreHAb/vCuW5IoY80ZrwPDUH
         TfmyN5oeUc3dZ7jb9sYYl8Y0xLmpCHzsk92oR4e7AqhxoBo81GZIPkTRRkfgxrGnebhY
         8j8/TZYbgdI1OpDWo2XcHFC2d1zlp2efDIjvWWy4+Q1VwOLLkYB53yanj4AMUtNBRk7r
         KS5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795213811; x=1795818611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oSCVbmqxiQi2DoLmGcMaMHvDma566TKArudq046yQIs=;
        b=UfYhOUT3dxc2qlOiiTHhXygeaN7DDhHg3RcqwF+JA/Af+r9GX5xPUqoeaMc0wEelqF
         SVBbW26SOjUVI8xzE2wd2FoBUE1QZqxC3MUjFJ6YbgHS/mFyOFYXsQ3xcPp+mZi1ypL8
         tz7rZEnH35k1jQTYMpe7SNraaIpptninIFFsSprvh4YsGS9uFDDMzQimdmfyoG+AxtLG
         yGIyFaHh3BItb+IkF66Cx4mU/uMSRWRtBxmWgpPMSBJbBHMkweaVrH7vG7kspyknp+xS
         f28iHmZZr2X2+be8I/g5giQUT0wthfw46V+FN7Jq+yMe5/Oa1o0Hu1Zh2mxdO4qqY6kh
         16+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795213811; x=1795818611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSCVbmqxiQi2DoLmGcMaMHvDma566TKArudq046yQIs=;
        b=n/KtXWvrW23qAShsxxBrYaYJXpMcmKfbJ2b/yX+O4BLn5ht0eLfxXNflRXDR5dq4CL
         GoEnoa5WAbgEvM2uoDOrJ7PPGv0xpoQDchtiMioJSsuKYTU9ikFtppFwlMxzSOWEk0XJ
         JAfKhzNgP4dnBWlsCARauG7L5/dOG96KT6Wa1bV2w4p6vREW01MwsCENj7vwim/134hJ
         hFnCeajTYfSG2M2VA9B628Io60Dip3S9h7nd/ojLGGn0sOGtJxtwRT+faLMMhgrubF6/
         JIjNnXo2QYCusyip/+7UpE6EulueadVzCR7zm77r4FQY+a/FbEl5MjvPcl97+Jz4PSlW
         vICA==
X-Forwarded-Encrypted: i=1; AL+hErE9s9nedPaLEOgrSyN90nFucPsogFV157BYcwyWDv/HDHVkK/4mfit4EvhNpFOGJxGs+65wfW7vwRT0ri4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jkYwxTdIsL5rHDCYo+i5YlDvFo6bbplKTTlYf0Pf2Jubzwfs/
	rs8UbLWe45NLakq7VBuiMvkY34COIrFJJVr4yK+ffyzEVIJFmqnMlr8umIp+D4W6rXamdbo89da
	6UNI++vm6ruwwkPF8MzENMqG9PWzohX9amPFK6roi
X-Gm-Gg: AYBFou36fWr9GzgHdul/myMbKJFIlNint0nNo6qcRIUlwMvOKaZ6YPOIQPC/3bUCLCp
	kwKABNPBoqtpEJf7apPsio2SpEcbP1+eMl9dkk2bNCcqu2pfT/RlL4fTHXVjGhTSV3FXMzZA/Go
	XjfGHVrCD54Ilo2cEkGnuWTs4P/1UNcLvX1gNfQLb2SwbeGm663INITlg9zlyPYmXYKmgToWuo2
	WN7AF9AlEguQqZuIZQNwd6NDYAlhkbh5v/qcNW5dAPZ3jTJ8GvcZ2nF5cldkR8M9S/mp+V/jt52
	w+IiEe8EoK3ve+3oR1SJpzeprdpkVyFohoDHN5k1StOgmKOCWNv7hChUlT5nVGL/MQCwDYDXvzH
	ReDp9qA3WOa6aGnA1Rgi+1hpsU5XKM1wbv4DSWNM4JbwkftVIzH5s2qdlqWtDaE7xQm9cJUjFfb
	IojL3mRe2pUMcwqojG16dqG6rY
X-Received: by 2002:a05:622a:2b44:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d88013e93mr5507861cf.2.1795213810431; Fri, 20 Nov 2026
 14:30:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116071325.263682-1-hao.ge@linux.dev> <20261116071325.263682-7-hao.ge@linux.dev>
In-Reply-To: <20261116071325.263682-7-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 20 Nov 2026 22:29:59 +0000
X-Gm-Features: Aa3M54pjipOW7ZzgZHb-E-Af8isX9CFT5XpnqdBhptBuFS7GWS9SCDR86t6dxYw
Message-ID: <CAJuCfpEZ15zhoBsHuO1CD2JpYOQ5SrjOaZ_RkR=y8Gne557qMQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] mm/vmalloc: undo what vmap_page_range() mapped
 on failure
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:14=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> ioremap and arch setup code map their ranges with vmap_page_range().
> When the walk fails half way, or the KMSAN metadata fails after the
> walk, the ptes installed so far stay behind. The caller frees the
> vm_area on the error path, so the next mapping that lands on the same
> range trips the BUG() in vmap_pte_range().
>
> vmap_range_noflush() now takes a mapped_end argument that the walk
> levels advance as they install, and vmap_pte_range() BUG()s before
> it installs over a pte that is already set. The ptes below mapped_end
> are therefore all ours, while a pte above it can only have been put
> there by somebody else, for example when the caller's range overlaps
> an existing mapping. On a walk failure the undo is limited to
> [addr, mapped_end), going further would clear ptes that are not
> ours. If the walk completed and only the KMSAN metadata failed, the
> whole range was installed by this call and all of it is undone.
>
> All callers are sleepable, the teardown passes can_resched =3D true.
>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 52 +++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 39 insertions(+), 13 deletions(-)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index d99d7710e1ba..5c1eacc2a0ac 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -117,7 +117,8 @@ static __always_inline unsigned long vmap_set_ptes(pt=
e_t *ptep,
>
>  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long =
end,
>                         phys_addr_t phys_addr, pgprot_t prot,
> -                       unsigned int max_page_shift, pgtbl_mod_mask *mask=
)
> +                       unsigned int max_page_shift, pgtbl_mod_mask *mask=
,
> +                       unsigned long *mapped_end)
>  {
>         pte_t *pte;
>         u64 pfn;
> @@ -143,6 +144,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long a=
ddr, unsigned long end,
>
>                 size =3D vmap_set_ptes(pte, addr, end, pfn, prot, max_pag=
e_shift);
>                 nr_pages =3D PFN_DOWN(size);
> +               *mapped_end =3D addr + size;
>         } while (pte +=3D nr_pages, pfn +=3D nr_pages, addr +=3D size, ad=
dr !=3D end);
>
>         lazy_mmu_mode_disable();
> @@ -188,7 +190,8 @@ static int vmap_try_huge_pmd(pmd_t *pmd, unsigned lon=
g addr, unsigned long end,
>
>  static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long =
end,
>                         phys_addr_t phys_addr, pgprot_t prot,
> -                       unsigned int max_page_shift, pgtbl_mod_mask *mask=
)
> +                       unsigned int max_page_shift, pgtbl_mod_mask *mask=
,
> +                       unsigned long *mapped_end)
>  {
>         pmd_t *pmd;
>         unsigned long next;
> @@ -203,10 +206,12 @@ static int vmap_pmd_range(pud_t *pud, unsigned long=
 addr, unsigned long end,
>                 if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
>                                         max_page_shift)) {
>                         *mask |=3D PGTBL_PMD_MODIFIED;
> +                       *mapped_end =3D next;
>                         continue;
>                 }
>
> -               err =3D vmap_pte_range(pmd, addr, next, phys_addr, prot, =
max_page_shift, mask);
> +               err =3D vmap_pte_range(pmd, addr, next, phys_addr, prot,
> +                                    max_page_shift, mask, mapped_end);
>                 if (err)
>                         break;
>         } while (pmd++, phys_addr +=3D (next - addr), addr =3D next, addr=
 !=3D end);
> @@ -245,7 +250,8 @@ static int vmap_try_huge_pud(pud_t *pud, unsigned lon=
g addr, unsigned long end,
>
>  static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long =
end,
>                         phys_addr_t phys_addr, pgprot_t prot,
> -                       unsigned int max_page_shift, pgtbl_mod_mask *mask=
)
> +                       unsigned int max_page_shift, pgtbl_mod_mask *mask=
,
> +                       unsigned long *mapped_end)
>  {
>         pud_t *pud;
>         unsigned long next;
> @@ -260,10 +266,12 @@ static int vmap_pud_range(p4d_t *p4d, unsigned long=
 addr, unsigned long end,
>                 if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot,
>                                         max_page_shift)) {
>                         *mask |=3D PGTBL_PUD_MODIFIED;
> +                       *mapped_end =3D next;
>                         continue;
>                 }
>
> -               err =3D vmap_pmd_range(pud, addr, next, phys_addr, prot, =
max_page_shift, mask);
> +               err =3D vmap_pmd_range(pud, addr, next, phys_addr, prot,
> +                                    max_page_shift, mask, mapped_end);
>                 if (err)
>                         break;
>         } while (pud++, phys_addr +=3D (next - addr), addr =3D next, addr=
 !=3D end);
> @@ -302,7 +310,8 @@ static int vmap_try_huge_p4d(p4d_t *p4d, unsigned lon=
g addr, unsigned long end,
>
>  static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long =
end,
>                         phys_addr_t phys_addr, pgprot_t prot,
> -                       unsigned int max_page_shift, pgtbl_mod_mask *mask=
)
> +                       unsigned int max_page_shift, pgtbl_mod_mask *mask=
,
> +                       unsigned long *mapped_end)
>  {
>         p4d_t *p4d;
>         unsigned long next;
> @@ -317,10 +326,12 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long=
 addr, unsigned long end,
>                 if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot,
>                                         max_page_shift)) {
>                         *mask |=3D PGTBL_P4D_MODIFIED;
> +                       *mapped_end =3D next;
>                         continue;
>                 }
>
> -               err =3D vmap_pud_range(p4d, addr, next, phys_addr, prot, =
max_page_shift, mask);
> +               err =3D vmap_pud_range(p4d, addr, next, phys_addr, prot,
> +                                    max_page_shift, mask, mapped_end);
>                 if (err)
>                         break;
>         } while (p4d++, phys_addr +=3D (next - addr), addr =3D next, addr=
 !=3D end);
> @@ -329,7 +340,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long a=
ddr, unsigned long end,
>
>  static int vmap_range_noflush(unsigned long addr, unsigned long end,
>                         phys_addr_t phys_addr, pgprot_t prot,
> -                       unsigned int max_page_shift)
> +                       unsigned int max_page_shift, unsigned long *mappe=
d_end)
>  {
>         pgd_t *pgd;
>         unsigned long start;
> @@ -346,11 +357,12 @@ static int vmap_range_noflush(unsigned long addr, u=
nsigned long end,
>         BUG_ON(addr >=3D end);
>
>         start =3D addr;
> +       *mapped_end =3D addr;
>         pgd =3D pgd_offset_k(addr);
>         do {
>                 next =3D pgd_addr_end(addr, end);
>                 err =3D vmap_p4d_range(pgd, addr, next, phys_addr, prot,
> -                                       max_page_shift, &mask);
> +                                       max_page_shift, &mask, mapped_end=
);
>                 if (err)
>                         break;
>         } while (pgd++, phys_addr +=3D (next - addr), addr =3D next, addr=
 !=3D end);
> @@ -364,18 +376,32 @@ static int vmap_range_noflush(unsigned long addr, u=
nsigned long end,
>  int vmap_page_range(unsigned long addr, unsigned long end,
>                     phys_addr_t phys_addr, pgprot_t prot)
>  {
> +       unsigned long mapped_end =3D addr;
>         int err;
>
>         if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
>                 return -EINVAL;
>
>         err =3D vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
> -                                ioremap_max_page_shift);
> -       if (!err)
> +                                ioremap_max_page_shift, &mapped_end);
> +       if (err) {
> +               /* Undo the part the walk installed before it failed. */
> +               if (mapped_end > addr)
> +                       __vunmap_range_noflush(addr, mapped_end, true);
> +       } else {
>                 err =3D kmsan_ioremap_page_range(addr, end, phys_addr, pr=
ot,
>                                                ioremap_max_page_shift);
> -       if (!err)
> -               flush_cache_vmap(addr, end);
> +               if (err) {
> +                       /*
> +                        * Only the KMSAN metadata failed, the walk mappe=
d
> +                        * the whole range. Undo it all. The callers are
> +                        * ioremap and arch setup code, always sleepable.
> +                        */
> +                       __vunmap_range_noflush(addr, end, true);
> +               } else {
> +                       flush_cache_vmap(addr, end);

This again skips TLB flushing after __vunmap_range_noflush(). I'm not
sure that's ok even if there was no explicit access.

> +               }
> +       }
>
>         return err;
>  }
> --
> 2.25.1
>
