Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795492702;
	b=rVpn25q6MgtsQAHX4GuiUhykOaDAFZO9RxRxz3NO5nC7PsLY0fnN9OYs8KW4lO0M2x/2
	 3LUshIZCgeh3suZK9csptMLwMSVdZdUrL8xOYo9nkmsylC0yp4EjLT9ReI93hbFbDMwAg
	 Y7MEIshrCQQpCIluvGp9cVeBrhtTVKclyCQNH7fa2/3TB1QqEEtq5uOJcnz52YSlyAPIy
	 mDj4q5MTZfP98xCp5YLCyl0bX1LOJxFPnFMHvF2WNvNFuBCiu2rj2eV+1Rv+jDrnVs8xc
	 pxXII2yTZzUbiJx2dBqUu+rMSYEvcx1Jx+5LpgU2gWumIgI3ssRpds2gyf5dyDlspRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Gv4uJJGyzmSUG7P381t7O1IG6z0LrgKIDZorRLIr+gM=;
	b=hzpVbHgkv+aZ1h1poEdPR9QmhGw2hHN3uUPDIOQp4nu8o52Vfu03H+iFgWTeS7Bm191h
	 CTfZMlMixhWXqY1G07YPRioqmdEwwiWMjBxVsM8TM1nmhSAXeU0ImHUda8XgJFoLNxsT/
	 MlOWgVupEDY51tGZreY6/UScQ+n+Ix02ABrpAmJbhi38VLQkuMjEcMFaFXWEH8IO9EZT+
	 vTkeCAf9yzdgLG4KIU5HG+gnH3ZteM1keEcUaZGtP7nxgLHzSBgKlQxDEWbttBk35GRzU
	 UTIUGUpJWoKDVhsRW76CG+6b9gVvkawS26Ohh2egY0g8x6+590+21bzcpaeE5QO2SzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PxtOG0sa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3E4606A692
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB3E4606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PxtOG0sa
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso4204761d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:58:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795492700; cv=none;
        d=google.com; s=arc-20260327;
        b=cVxZRkyha2tcoqDrCU+cbdzgCJ+wUR9wkW1u8o1luhmsMuCkGdfuFQxyNgwe8kYW+V
         b42/W01vUQbo8cbcbqA9aNpCuP07nchBCb5IFwHSsAuKhR1576Rdgd03tSg0PZb5k5D3
         Jkt1jcXUmloRY6+8H/RSmYWYC2kk0t/VcfpfHsxWPb6CWfZlppSjvRSm6tXTZJfWACVW
         gxXfEYuLuJ2HEteq4vBl6kvXGDK1VUJlpU4KnFRfjuxRwBDwykEJwJ0iIE8UCg4thhgN
         RXnBH6YBrbfZtu0a4EoQ24puWqdAUVImACwBylafGFz8ABibB44zXp14mW82WgccSGYL
         g6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gv4uJJGyzmSUG7P381t7O1IG6z0LrgKIDZorRLIr+gM=;
        fh=1i30tp5zX+1P/2jSCEw98UZ4FtEcGhNioPANtuzseHA=;
        b=MrZ9U+SsCmDG8xiZiE2Eh6Vi66qdyodPij2M+bJNETooUY3sJgcbs9ZWaxgqekVTh9
         B+38mSQFxlriEpClKlVJyP9fr/pDxMkMBYYGrYecJG1w4dL9ufmJAs9hGmzry+dS4LYI
         Vo63JHuljii3VicVkQe81+d5QmRYKyR8QHHZdepFon7DC6P48pjZGF0GQB3ObTNA24/A
         w0AjrlcJmJW+ST9Z5GxrVKIyPs8mmWnNBQkJ/kodZV0xb/JRl8Wdw7o60m0XHKiKDm4A
         wZUW2NMIu+BwavKEnPbYGQKDNczftBanE1JEluTKhGaYLzKlC1iRGvACEPz8kIVHt8TY
         lv7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795492700; x=1796097500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gv4uJJGyzmSUG7P381t7O1IG6z0LrgKIDZorRLIr+gM=;
        b=PxtOG0sajQzEhabKB2Mkf4MLf17B3Ho9WW65npnbA7iGvHICftEZ4g5v/TERRZqpoR
         8ikLHtKiJQcGbvz5mZY1QdTXPs4+zG/ddxLhPBVCq96gAqz/43Kl5IgBaOTd2R4PaIWE
         2wygysdVjTS3WIfsyqMbMs8mYTq+cOK1+2An1NkQ++285BFlq1B352pzKJxHCPf077vM
         xzM6Las/d2PmK5OHyWkT2LcZUnnIEFSHNEEWl4JahDbLhVBNhyNn6f3q9S+/6RGEjLyt
         +BHtz+MJNwvVXzI4pJjO3ZaTJIatpPmzby/sZjlI/wHXKd83Ph//6HzjQC/hMSHvZHGb
         biKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795492700; x=1796097500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gv4uJJGyzmSUG7P381t7O1IG6z0LrgKIDZorRLIr+gM=;
        b=CJzLycYAj/la2ed+bUlo3URgCuwThf8pMjcbGkurTs9NTh9I+L0S6Ecp8Xl+GV/5X1
         eDJrhTzKbkmBnSI6qzh4tOrw84hgKNKhBBZj3iImnSYWFIfF0H4fW0qn+S5NpQ+9Le8D
         XjDEblXfD3rBs5pvd6Nkv38erqKUO1/JokvKZGGYaRmOnsgY5DGZZdaHDD41YcjpseuL
         PPicZbXYdEd56FzhIIwuvooJwQhLyB7WT4kpT87hnsB+Z2vGxaTdSyLRza28SmSfFm5B
         0UXlzuGmUN3TvlGcjlRIxpqMx250tYNaMJA/Cqy/nQbTJwhJTnCZTd0GxM2401LdL0NR
         jmGQ==
X-Forwarded-Encrypted: i=1; AL+hErF86QEZQP7Xs0BlpRRppuSVKA52RIor6yRM9tDr9zu3+okDDzvr6T+t36PBEUOM4QWBuoGT5Epn/2t4DW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tw0KOF3+wgoApr+Sz8BkjVWU3GMHP29FxJs7dlN7boA41qNdu
	XWqmuJKFNXOt4UJA/88CPRN7rnEk2PKomZFavK0i1x1dsTxbRB025jk4FuU78fhL+JZcID3C1pr
	B6C7kCnguEoNtm54iuh3c2xbS2cmRTYd7f4mU3KNaJg==
X-Gm-Gg: AZFdTZc2SWGZD1MuzX4iZjVSJsEus8PQ+qhVmIfeCVS+nTacAteRalBSc8Kzjiamdm0
	+uJQpXlVT6qIJRQh7egwZhesi1T+H/hGfQpP7OawnAF4HBlusfGrdeY54cbUSwGYgaY6xUto462
	qTqoUYV7cJ0eM85jXVqddW9TwC8D2dsAfJTK7WDvzYAZFEWf3MtdW7oEHnZQAUa1ixclv69qbIh
	t6BrJJ0LaYOg8KnKVhTR6LDie39Etn8lhkED8UZEAvebq54o2QgFMCXTomZ47eOz8X8fO3IMozz
	5JT9dw7avzQWD6PzZUR+7K5PTi3QlQLlw2IPNydSJw4a2W/bWofZHGt+5zeipnsqXphUrsSXM0S
	W23oHQzvEpIpPlDea2aRNA4NY27HN7MSRzDtb
X-Received: by 2002:a05:690e:440d:b0:67c:1c81:fe59 with SMTP id
 956f58d0204a3-67df44077c4mr3119996d50.12.1795492699638; Mon, 23 Nov 2026
 19:58:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611230851.6AN8pFDD065900@mse-fl1.zte.com.cn>
In-Reply-To: <202611230851.6AN8pFDD065900@mse-fl1.zte.com.cn>
From: Muchun Song <songmuchun@bytedance.com>
Date: Tue, 24 Nov 2026 11:57:43 +0800
X-Gm-Features: Aa3M54osbbQsBQ30OQPILu59VKnjdwijA1lNndox2VeAUO0QbDMk_0iqr7KJXdU
Message-ID: <CAMZfGtWxmbASYdVBVhLFRDmQGqCunuUS+OqxPVzQpCT9n8pqYQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: allocate split linear mapping page tables
 via the standard page table allocation APIs
To: li.hanting@zte.com.cn
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:51=E2=80=AFPM <li.hanting@zte.com.cn> wrote:
>
> Hi,

This is the commit message body, which should be a bit more formal.
You can place expressions like these after the three underscores.

The subject is rather long.  How about:

riscv: mm: Fix split linear map page table allocation

>
> Commit 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel
> page tables") recently fixed a latent inconsistency in the x86 CPA code
> (assigned CVE-2026-97525): __split_large_page() allocated the new PTE
> page with a bare pagetable_alloc(), bypassing pte_alloc_one_kernel(), so
> the page table constructor never ran and the resulting page was neither
> flagged PG_table, nor accounted in NR_PAGETABLE, nor marked as a kernel
> page table.
>
> RISC-V open-codes the same pattern when splitting the linear mapping on
> behalf of set_memory_*(): __split_linear_mapping_{pmd,pud,p4d}()
> allocate the new page table pages with bare alloc_page(GFP_KERNEL) -
> three call sites in arch/riscv/mm/pageattr.c, introduced by
> commit 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX()
> by splitting huge linear mappings").
>
> As on pre-fix x86, the resulting pages live in init_mm without the
> PG_table flag, without NR_PAGETABLE accounting and without the kernel
> ptdesc marking. Under CONFIG_MEMORY_HOTPLUG, hot-removing memory tears
> down the linear mapping of the removed range via arch_remove_memory()
> -> remove_linear_mapping() -> free_p*d_table(), which releases these
> page tables through pagetable_dtor() even though the constructor never
> ran, underflowing NR_PAGETABLE on current mainline. Muchun Song's
> series "mm: Fix page-table teardown during memory hot-remove" [2]
> fixes the freeing side by skipping the destructor for pages without
> the PG_table flag, but the root cause remains: the allocation side
> still bypasses the page-table constructors, so these tables are
> unflagged and unaccounted for their entire lifetime.
>
> Align the three sites with the standard allocation paths:
>
>  - the PTE level switches to pte_alloc_one_kernel(&init_mm), exactly
>    like the x86 fix;
>
>  - the PMD and PUD levels switch to the generic pmd_alloc_one() and
>    pud_alloc_one(), which already handle the init_mm case by selecting
>    GFP_PGTABLE_KERNEL, running the level constructors and marking the
>    ptdesc as a kernel page table.
>
> No functional change is intended; the observable difference is that
> split linear mapping page tables are now properly flagged and

This is slightly misleading because the accounting, PG_table state and
hot-remove destructor behavior are intentional functional changes.  I
think it would be more precise to say that no change to the resulting
linear mappings is intended.

> accounted, so /proc/vmstat:nr_page_table_pages no longer under-counts.
>
> Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() =
by splitting huge linear mappings")
> Signed-off-by: Hanting Li <li.hanting@zte.com.cn>
>
> ---
> Changes since v1 [1]:
>
> - Switch the PMD and PUD levels to the generic pmd_alloc_one() /
>   pud_alloc_one() instead of a local helper, as suggested by the
>   Sashiko automated review. The generic versions already handle
>   init_mm correctly, which also resolves the first open question of
>   v1.
>
> - Correct the severity discussion. v1 claimed these page tables are
>   never freed; that is wrong under CONFIG_MEMORY_HOTPLUG, where memory
>   hot-removal frees them through remove_linear_mapping() ->
>   free_p*d_table() -> pagetable_dtor(), so the ctor/dtor mismatch can
>   actually underflow NR_PAGETABLE. Also pointed out by the automated
>   review.
>
> - Add the Fixes: tag and move the discussion notes below the tear
>   line.
>
> [1] https://lore.kernel.org/r/202611091101.6A9B1Nf3015337@mse-db.zte.com.=
cn
> [2] https://lore.kernel.org/r/20261008073021.2512665-3-songmuchun@bytedan=
ce.com
>
> Hello,
>
> One discussion point from v1 remains open:
>
> Since RISC-V never collapses the split linear mapping back, one could
> argue for deferring this change until free-path work actually lands.
> My preference is to take it now: with CONFIG_MEMORY_HOTPLUG the free
> path already exists today, and taking this now removes a trap for any
> future work on the linear mapping.
>
> (Note: the generic CPA rework series "[PATCH RFC 00/18] arch, mm:
> create a generic set_memory/change_page_attr core" would eventually
> replace this code entirely; this patch is intended as a small fix in
> the meantime. The series author has said he is waiting for such fixes
> to settle before posting a non-RFC version.)
>
> Comments welcome.
>
>  arch/riscv/mm/pageattr.c | 41 +++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -3,9 +3,11 @@
>   * Copyright (C) 2019 SiFive
>   */
>
> +#include <linux/mm.h>
>  #include <linux/pagewalk.h>
>  #include <linux/pgtable.h>
>  #include <linux/vmalloc.h>
> +#include <asm/pgalloc.h>
>  #include <asm/tlbflush.h>
>  #include <asm/bitops.h>
>  #include <asm/set_memory.h>
> @@ -109,23 +111,22 @@ static int __split_linear_mapping_pmd(pud_t *pudp,
>                         continue;
>
>                 if (pmd_leaf(pmdp_get(pmdp))) {
> -                       struct page *pte_page;
>                         unsigned long pfn =3D _pmd_pfn(pmdp_get(pmdp));
>                         pgprot_t prot =3D __pgprot(pmd_val(pmdp_get(pmdp)=
) & ~_PAGE_PFN_MASK);
>                         pte_t *ptep_new;
>                         int i;
>
> -                       pte_page =3D alloc_page(GFP_KERNEL);
> -                       if (!pte_page)
> +                       ptep_new =3D pte_alloc_one_kernel(&init_mm);
> +                       if (!ptep_new)
>                                 return -ENOMEM;
>
> -                       ptep_new =3D (pte_t *)page_address(pte_page);
> -                       for (i =3D 0; i < PTRS_PER_PTE; ++i, ++ptep_new)
> -                               set_pte(ptep_new, pfn_pte(pfn + i, prot))=
;
> +                       for (i =3D 0; i < PTRS_PER_PTE; ++i)
> +                               set_pte(ptep_new + i, pfn_pte(pfn + i, pr=
ot));
>
>                         smp_wmb();
>
> -                       set_pmd(pmdp, pfn_pmd(page_to_pfn(pte_page), PAGE=
_TABLE));
> +                       set_pmd(pmdp, pfn_pmd(page_to_pfn(virt_to_page(pt=
ep_new)),
> +                                             PAGE_TABLE));

Now that the page-table pages are allocated through the standard
pgtable APIs, could the parent entries also be installed through the
corresponding populate helpers?  For example:

        pmd_populate_kernel(&init_mm, pmdp, ptep_new);

and similarly pud_populate() and p4d_populate() for the upper levels.
That would avoid open-coding the virtual-address-to-PFN conversion and
make it explicit that these are non-leaf entries pointing to lower-level
page tables.

Thanks,
Muchun

>                 }
>         } while (pmdp++, vaddr =3D next, vaddr !=3D end);
>
> @@ -149,24 +150,23 @@ static int __split_linear_mapping_pud(p4d_t *p4dp,
>                         continue;
>
>                 if (pud_leaf(pudp_get(pudp))) {
> -                       struct page *pmd_page;
>                         unsigned long pfn =3D _pud_pfn(pudp_get(pudp));
>                         pgprot_t prot =3D __pgprot(pud_val(pudp_get(pudp)=
) & ~_PAGE_PFN_MASK);
>                         pmd_t *pmdp_new;
>                         int i;
>
> -                       pmd_page =3D alloc_page(GFP_KERNEL);
> -                       if (!pmd_page)
> +                       pmdp_new =3D pmd_alloc_one(&init_mm, vaddr);
> +                       if (!pmdp_new)
>                                 return -ENOMEM;
>
> -                       pmdp_new =3D (pmd_t *)page_address(pmd_page);
> -                       for (i =3D 0; i < PTRS_PER_PMD; ++i, ++pmdp_new)
> -                               set_pmd(pmdp_new,
> +                       for (i =3D 0; i < PTRS_PER_PMD; ++i)
> +                               set_pmd(pmdp_new + i,
>                                         pfn_pmd(pfn + ((i * PMD_SIZE) >> =
PAGE_SHIFT), prot));
>
>                         smp_wmb();
>
> -                       set_pud(pudp, pfn_pud(page_to_pfn(pmd_page), PAGE=
_TABLE));
> +                       set_pud(pudp, pfn_pud(page_to_pfn(virt_to_page(pm=
dp_new)),
> +                                             PAGE_TABLE));
>                 }
>
>                 ret =3D __split_linear_mapping_pmd(pudp, vaddr, next);
> @@ -198,23 +198,21 @@ static int __split_linear_mapping_p4d(pgd_t *pgdp,
>                         continue;
>
>                 if (p4d_leaf(p4dp_get(p4dp))) {
> -                       struct page *pud_page;
>                         unsigned long pfn =3D _p4d_pfn(p4dp_get(p4dp));
>                         pgprot_t prot =3D __pgprot(p4d_val(p4dp_get(p4dp)=
) & ~_PAGE_PFN_MASK);
>                         pud_t *pudp_new;
>                         int i;
>
> -                       pud_page =3D alloc_page(GFP_KERNEL);
> -                       if (!pud_page)
> +                       pudp_new =3D pud_alloc_one(&init_mm, vaddr);
> +                       if (!pudp_new)
>                                 return -ENOMEM;
>
>                         /*
>                          * Fill the pud level with leaf puds that have th=
e same
>                          * protections as the leaf p4d.
>                          */
> -                       pudp_new =3D (pud_t *)page_address(pud_page);
> -                       for (i =3D 0; i < PTRS_PER_PUD; ++i, ++pudp_new)
> -                               set_pud(pudp_new,
> +                       for (i =3D 0; i < PTRS_PER_PUD; ++i)
> +                               set_pud(pudp_new + i,
>                                         pfn_pud(pfn + ((i * PUD_SIZE) >> =
PAGE_SHIFT), prot));
>
>                         /*
> @@ -224,7 +222,8 @@ static int __split_linear_mapping_p4d(pgd_t *pgdp,
>                          */
>                         smp_wmb();
>
> -                       set_p4d(p4dp, pfn_p4d(page_to_pfn(pud_page), PAGE=
_TABLE));
> +                       set_p4d(p4dp, pfn_p4d(page_to_pfn(virt_to_page(pu=
dp_new)),
> +                                             PAGE_TABLE));
>                 }
>
>                 ret =3D __split_linear_mapping_pud(p4dp, vaddr, next);
