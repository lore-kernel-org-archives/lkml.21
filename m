Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795507674;
	b=5TvfOI0v2FJ0WcDHwUlQ5XdqgWJtDvGqyc8gwGul82kSDXQR6Jrkl986kCw0ZfwsMAS9
	 3H4TNqCbigoGp6rtXMXXqlGfXhMQJ3E5yQIK6ZPZbxq3ZifejsdWrTKzGzD46uuY3I/ua
	 0KbOZicxwqycQkkdLUAu1opVV4VVYaC5aIt8PN8f6z3mEs2PGmCZDfF+i9j349h5X5mrD
	 OSYtI5nS/a1vo1g8X0fotk5I+aRo0e1Ii9EgLZ/otRrZxrpeiaNfIuj5r3I/AZTOLn6Pr
	 SpPvmLLwiRCqrFGzO1kktnG9fKNuWJ0vJ1iInuobK3UbOPmewmYjCSqyJR1paC9UM+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OOD5TK3jDZSV0gxKAkHVgIM6aEdA8CEYNdRPZbFoBkE=;
	b=EaRelqJH98H69YW5CPZzVfBRE6hkIbW5UXcCCfwy45GzGN9kVwxZvOaYqrRjtVS0wL5Y
	 IgA6GhlqrRXrIBqLWo7w6K3Hq5B1F8arJIcL0bu0Tmptr2UuSpHFhnNhSsPHPklF1hOQo
	 ypToA97HRccIM59G7IvYvI62cJL0iPEewaRWVKSL78mK6ju4dx1+7m+mO7wxiLioDAfG+
	 450gZKI85+UY9U+HO+r0LTT1cVyB4rHL74JzfZxDX/zWZBfy7hpzB0N/SqfgDitv4QfZZ
	 D/tCFSi38goBHdLqOF125yDsfBzGNXtlWAEvo+vwOSnOBMQsT4wS6+8X1G35PCT8/sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PfTLfnnP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AAE606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19AAE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PfTLfnnP
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67be1e468a8so3902438d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795507673; cv=none;
        d=google.com; s=arc-20260327;
        b=Gjx2XqaYnmSi6NoMBMldC/qxvn4X2k/jGKmaD+WEkcfCBnAwj/RsHEZ/hDOx4fYWyG
         C3XU6VSRX4466Ei812wc5OpxLX78aZHkhQF/m3SMtNpDCF+6P4T/gK2JasIovXmuLm4I
         B8PBRJJeriRV9zrb5YgmGfObL1jnAXWzUF1itSdBa8kxKudJukSq7+qxG4Nuw6BsBe7b
         W6kdiPYv9UnPz2QHTSLkngS9HTcw1SGgZLXLawvtRCSVZ7sJXdHKJV6oUvdKbYSsiCGk
         WmzRVBJgsv2M/XBvM55uT5o2dRatLfi0tD+B8kxGCKMcgx5JaOLhspZYuNdXWNewgNMt
         fPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OOD5TK3jDZSV0gxKAkHVgIM6aEdA8CEYNdRPZbFoBkE=;
        fh=Py6ep44pv25yw5eQ/PYNkHf41AYCWzU7pGZGH1P0c+I=;
        b=EZczDNKSXn3u7lCjAcKdFmwqxaVuYuK0vdEewhBpL9iDRqWPaBhji1TBGIiuQAdPU3
         Amz//mIGr4XFvJ+BxraVF49q5bpMqRIzJsqb/lWobelRNYrklGr8xO5fhSlF+UPo1omv
         T2FcySGv9wGR2UXUbJUty+sIwoh2F3/A/JFJcQBZOekMeX9x13rEbknlCSktZiQ2uphA
         seq6aYSkNflTJVBAaG0GimTOZ/xQIwdbEe3xIVByPfgaLztNmqNaxTRuioYO65JLLVHa
         nGo+sKDiLclgbt12dKHQHMosgFEjUINnOzaA5mvqgN/IdFNeciFRlAwfljMnpcRx0YJL
         nf4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795507673; x=1796112473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OOD5TK3jDZSV0gxKAkHVgIM6aEdA8CEYNdRPZbFoBkE=;
        b=PfTLfnnPyZwEWZM4MA3KtYJMXmk0EJEE5TYL/eG9Bxh6WZ2t1/QJrFOlnVbC/L8+iX
         uZEzzqcmJ1vcvblADZruL0jqRnv0yKrixSF43Qak7MVMT4EgcvwSBd8vYFO2hE/UZpP7
         JKzzOuhK1jdXmoRTm1Ade5ckip2TwyPN76BRC8FOc3WDWRktp6a+0tNQQI81WDgwqbwA
         MyJLoNg3rRaD6YwUky3ik7Uj1Smv241Kl8AX4ETvugn95AJbUurJlxITqzx1kz+xvj6g
         v2bcy3MLjXvr6dpbP78GD/OT9xSvZuLeo/W0OPnfzQcjWss4B1CDCIY8fpgmHA/VVrFm
         QglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507673; x=1796112473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOD5TK3jDZSV0gxKAkHVgIM6aEdA8CEYNdRPZbFoBkE=;
        b=ZELgL80uitSwCYLM0dklLxFnOiL944YW+RDlOec4nHesdVJX32sDpHSvfG9e2jyShK
         N/eT2dgCNrzMXoqWi1H/PLh+5zIh2REQden7D+2qcEcgaUMhO3Y2mMNB6lc+o+8y6Tl3
         jezpKToqTG0CkH4U64uGHIK7Ope3Ai9I2ArC6Gzlb14fLXYmNtHILVgL35UpgT4k1gSo
         HFi6vJW3zMZdqD+woh7T3hUZxlo6lDm9pC2RpuI89onp4O08H7r1YHHjhujYVXKcbNNz
         2rT201HmsMqmVsgSX9anc6Bv+l9sooseQnmNxl4QYH8ve5Az7Hb8ma1Zm94i2Xsjg3R2
         EMzg==
X-Forwarded-Encrypted: i=1; AL+hErFocnTqvu809mIWvvsOpaKgF/REs+XmknzKx/e39dtLSLvuDvhU57OCJeuSjIZWIRqoP+hMub5NLwtTEQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a9hbIbYNOEi0QmMg/gDhikLG0VX/nfstv4Ns0soTwvoe/A3Zq
	CdiT/HKBCtPR/8pacpcyFLqKWFbqBlwg0ZEpj7hW9uc8ZQQbfE23CY+FECCxQiWczVknHxCnUqa
	sbGlvifaUpC2CsYJLMx1yknsKvypZq9rzAKZJE4V8Sw==
X-Gm-Gg: AZFdTZccGFZzhw8evUXnnIPSsudFlq1OjmJyvdgsrtjPfi6rZmDVlIRtwg+aU1uabyI
	NAhp+kPJEhlr6UPJ6OHto2+e+vOWsQ1OA/CUAaKvA7lOsDjkpWMrAcgOSfIlwbXQBX+imC1usLT
	4WxoW1F4HH/fy9du7jYwjonKD3HRKGhHj0FYsGRiUVV0BfW5AVNEgwfzTgKZqWYRSpisS/UBBR7
	TJoV6mB8EDaJg6+F4wGWxPiY9WMyketXLpBNhf6u4/fh0t3Dn/vdJUBDh3UQsY4HOyRHbGo3em4
	eA7WugkhbxpCEgweUHC4pYbGU8rfZIKjXLaJqkO3/5vTjJn0SC1m4rsf8V8l9bxPj484NQowUZs
	mH8e5hTAlS9nDZX67O0ZyX0MmiCuag8boULao
X-Received: by 2002:a05:690e:150e:b0:67d:eb12:7327 with SMTP id
 956f58d0204a3-67df44790c9mr5429914d50.91.1795507672913; Tue, 24 Nov 2026
 00:07:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611240743.6AO7homY042860@mse-db.zte.com.cn>
In-Reply-To: <202611240743.6AO7homY042860@mse-db.zte.com.cn>
From: Muchun Song <songmuchun@bytedance.com>
Date: Tue, 24 Nov 2026 16:07:17 +0800
X-Gm-Features: Aa3M54qVy_ZTjDekbWEQZL4rKpZRExSUgAWOCJOur9_RjV78JSMUFlskTD39pac
Message-ID: <CAMZfGtX4E96XN7suB9=0=xg8k9=S9Qe9otWYjH02oDtKPyXbkA@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: mm: Fix split linear map page table allocation
To: li.hanting@zte.com.cn
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 3:44=E2=80=AFPM <li.hanting@zte.com.cn> wrote:
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
> series "mm: Fix page-table teardown during memory hot-remove" [1]
> fixes the freeing side by skipping the destructor for pages without
> the PG_table flag, but the root cause remains: the allocation side
> still bypasses the page-table constructors, so these tables are
> unflagged and unaccounted for their entire lifetime.
>
> Align the three sites with the standard page-table allocation and
> population helpers:
>
>  - the PTE level switches to pte_alloc_one_kernel(&init_mm), exactly
>    like the x86 fix, and installs the new table into the parent entry
>    with pmd_populate_kernel();
>
>  - the PMD and PUD levels switch to the generic pmd_alloc_one() and
>    pud_alloc_one(), which already handle the init_mm case by selecting
>    GFP_PGTABLE_KERNEL, running the level constructors and marking the
>    ptdesc as a kernel page table, and install the new tables with
>    pud_populate() and p4d_populate().
>
> No change to the resulting linear mappings is intended; the observable
> difference is that split linear mapping page tables are now properly
> flagged and accounted, so /proc/vmstat:nr_page_table_pages no longer
> under-counts.
>
> Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() =
by splitting huge linear mappings")
> Signed-off-by: Hanting Li <li.hanting@zte.com.cn>

It's annoying that you didn't cc my linux.dev mail, because I used this ema=
il
in v2.

The changes looks good to me.

Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>

>
> ---
> Changes since v2 [2]:
>
> - Install the new page tables with pmd_populate_kernel(),
>   pud_populate() and p4d_populate() instead of open-coding the
>   virtual-address-to-PFN conversion, as suggested by Muchun Song.
>
> - Reword the intended-behaviour statement: the accounting, PG_table
>   state and hot-remove destructor behavior are intentional functional
>   changes, so "no functional change" was misleading; it now states
>   that no change to the resulting linear mappings is intended. Also
>   suggested by Muchun Song.
>
> - Shorten the subject and drop the greeting from the commit message.
>
> [1] https://lore.kernel.org/r/20261008073021.2512665-3-songmuchun@bytedan=
ce.com
> [2] https://lore.kernel.org/r/<202611230851.6AN8pFDD065900@mse-fl1.zte.co=
m.cn>
>
> Hello,
>
> Thank you for the review, Muchun. All four suggestions are
> incorporated in this version.
>
> One detail worth spelling out about p4d_populate(): unlike the
> previous open-coded set_p4d(), which falls back to writing through
> the pud alias when 4-level paging is disabled, p4d_populate() is a
> no-op in that case. The difference is not reachable here: with
> 3-level paging, best_map_size() caps the linear mapping at PMD_SIZE,
> so a leaf p4d entry can only exist when 4-level paging is enabled,
> where p4d_populate() matches the open-coded write exactly.
>
> The discussion about deferring this change until free-path work
> lands is now settled by Muchun's series [1] being queued for
> mainline: this patch fixes the allocation side of the same lifetime
> mismatch.
>
> (Note: the generic CPA rework series "[PATCH RFC 00/18] arch, mm:
> create a generic set_memory/change_page_attr core" would eventually
> replace this code entirely; this patch is intended as a small fix in
> the meantime.)
>
> Comments welcome.
>
>  arch/riscv/mm/pageattr.c | 38 +++++++++++++++++---------------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
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
> @@ -109,23 +111,21 @@
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
> +                       pmd_populate_kernel(&init_mm, pmdp, ptep_new);
>                 }
>         } while (pmdp++, vaddr =3D next, vaddr !=3D end);
>
> @@ -149,24 +149,22 @@
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
> +                       pud_populate(&init_mm, pudp, pmdp_new);
>                 }
>
>                 ret =3D __split_linear_mapping_pmd(pudp, vaddr, next);
> @@ -198,23 +196,21 @@
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
> @@ -224,7 +220,7 @@
>                          */
>                         smp_wmb();
>
> -                       set_p4d(p4dp, pfn_p4d(page_to_pfn(pud_page), PAGE=
_TABLE));
> +                       p4d_populate(&init_mm, p4dp, pudp_new);
>                 }
>
>                 ret =3D __split_linear_mapping_pud(p4dp, vaddr, next);
