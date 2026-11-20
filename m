Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162854;
	b=JnM8jSfqvJwuqQPeyL+u2sDgTl70C5sjQ74JyoOJ+H7Kdy8862N6xkMOKY7bzEVe1rvD
	 32HDJ1WdP8M4ZsoCMZuULjZqPGWCuEgekiFsxCr6vcYGbuxmgO1jj1mkbkLeQG/rUvvfd
	 crHjEyqEPRTiRUsljkh75Jhuc/m1fn3mo+3XTa8bd1v1A3miLH+Enp6vZbdEeP1Ia1R99
	 qfO/avU1ZyO8qq9troGmh9z5DYvQhzQYs42pIyeCpi674d5PJKKhhhR3U/xUtGp2aKG/Y
	 be74r5MY99yaCaGbyl1PDejwZ8UwFHrIK6JRqNGhoskR8mVulcLvH1t9pHtpRUQ2DRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dg/jopXxk1E9Yu4E4faWsNPyyS6g9t3vWRabNCt8U08=;
	b=2wJAfJ4G6XqBrP9mhCb25NpHyeMtMtLV5OEhePyBIWq00aZeMf5KbTgnt7sQhHDpCL+p
	 8583CWsaiYi80oJancIxWb9MgQNfQSP5VGDvQmZLFm5oCj52FLI/xsdycq20w3bo5sCbR
	 Qi5gqLgVxoF5oIrV++kZ6W7/xcpAU1z7QkbNtW9WlBbQ5It0IeL2lRcN/KLGAXFEXTif1
	 6SnZ5/1qxCobEJpYwhucpL3Owt41YKOFtyB8EXnCqQBumG1spNSci+SaqI3mdbNOyLs6R
	 nVu/QO0BiuhfFdtDiv9Y7JtVjThavRfVEzCoI20NgGEhZUr1vx3h/fSkUSdoWgHFUrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="az5K/zBC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F265606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F265606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=az5K/zBC
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso3119285e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:20:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162853; cv=none;
        d=google.com; s=arc-20260327;
        b=hFD0gcYj+hEb3FFnaejyumcfhCUvYtsRxFEU7MfhN9Y/Sbv3n12re7n5XLx+v1FoKq
         rhUMoH5M16MFWnOPBDpOKYe+RS6KqPZJOpvsh4o7cIUMY4UjrKGP6Cz/Gbe9RYGU18r2
         9HanE92sfZSQI5UrJEMTiWqxLoLbjjlDGGrrx/FaAUH01t4slJGQLQREPiBHjWEgaM2O
         /YBj6tY9f9gpIOjMHmyMR62uLbHSNCdFtUPGfWEcC4hbJi7dH79/mk3je+R7GgJQnD6/
         WVo0jG1jc08jLP8k1i9uMPN+V5kmBoDstvubbo+vLhCzJWBLtrgPk9wU6y2GzzMFtLj1
         eZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dg/jopXxk1E9Yu4E4faWsNPyyS6g9t3vWRabNCt8U08=;
        fh=3B7aIuhSywURSZJKfOphUPeEVrotZmrRLbtIVnUzTi8=;
        b=T8mvB9EqBWYO6YpbKJ0S1oBmbJIibRCa4wKN4VHbxi91Uy5Db2J1kCO60dqW4s8fv5
         awXU4qNEZe3AKm2ZrnoFqXSJZ8u9ovyo5FX2htwEpUbxJIif3KzIREMwmgstlCW4BuaO
         irXc7r79xzu/yJIyn4CK8BWOFmTQcKRdtx2EmyPIs3m9vB/niB+ktvKBJ0pYHFc65X6j
         fBxA7U9Tj4lpWYzoP4fywrWB0MsS5v+5ud/BQsAiwfLW9zX5axaSfdOs1vpcCXsSgm+2
         miXoP47HvXgemfWOy0efy2GMah1hPVKYNobE7or9PGQbg+Mk7FugW7D08F1qckygoDaz
         6XaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162853; x=1795767653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dg/jopXxk1E9Yu4E4faWsNPyyS6g9t3vWRabNCt8U08=;
        b=az5K/zBC/ipw8cIpvmCDPlExgbekQXMk9qeMOJUnBI+k8OIm+upU3lWB5F3aimivlR
         Krs9xUXrh5x53XpmnQpV/WNTdyfT6Peo7lHnb/nfdG/gSpwcmGgZZ1Repz+zSnYK/LHK
         6t3lmTZaxSQyuh/+taCFNFEaJXVzU8/8H3Lc4VgFq6pZfA4gwblZhrwDJFiGFmQsU46/
         5gJ8r5zfwfUMnRK5XDwj8hkl+Gkr2QOvSGSaPDH8BreuWc1UuGznUFoBT/MVnPuynuKU
         8Z32GKM8dbM2mf84q9Tqh7GjbLuM0KN35VghcDZo4ASn200L30eD7YHtTj77Pjg36dmO
         fw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162853; x=1795767653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg/jopXxk1E9Yu4E4faWsNPyyS6g9t3vWRabNCt8U08=;
        b=1Xnw/ZAX7+AzqTr8m88vUtj6+3MkwcFNfj7lPtaymGo5slQSvP2jySvs/uQlxS5HF9
         NUvqtLOxD+/H8RqNcNZH7r31HFAFgHJRU8Hepyid7OsCChwjUt2StHbpZAENzKLdMFU2
         gewNyVvoOHOcl/cqSX//e7zMTtpoWuRSe0Ep84ZIiA9Ph/iLKOhWHjC36eDVvCIQdQ5X
         fLvrU/9U7V7+iPBosqhmcNpjE0OMTgf0fdoPWLjWdV5gBizgt3M03Uf5zbWQY43h6axR
         v2NM7QWIRH0j1O6cK+GVFTuBbZFL/YzoTiJ/4fnuz2UE6U7qIKQtOaAPJvBFE0212lMj
         06jA==
X-Forwarded-Encrypted: i=1; AL+hErH4MD+/wl1w0y4sqYptPYPl72bPa1K6kqOfa8aMj4kN3hjvUFDuLvlv0FMEISZRVTMDZHeZGfSVKJ6ci0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vV3RLw0kssgjgvUzmhiZpSOLG6FAfKnrHOWEfZa66vsUCa81x
	pWwV769EceN/R/qATda8S7td7t8AoGbN0mhkvAPpMAugvzUy4cSDrHTqoa2Y13xYIZ19CeQJVwW
	z7lqsNSYJ3YAP4RQj7ci4wkOB38bFJuA=
X-Gm-Gg: AYBFou3SAiVdNQ59JlTHrXM7A7FlrT+mNN+dMkLKBn/VOsbc3jXF58U5HzRH15H4w/W
	et/BUSCJ032c8it85//drO14Qhyg6WWVtuwM6UtZyC2mhQXnZhWN4uejr4m/L+daEahy4Q7+fpD
	idleXXcHO1bO2MkV+IVd4M1gkEaTToxh9B2+fu8+pM0YNk85FMZcxLCa0sbXZ4NorDk5ajz9CG7
	qDt5G+hrWGy+edKGDUfDzO+0nm5d/eBsz7LIcWhNjeuWk2bxYTT466yyLQRJfJypjdJlWCWhWK4
	PUITIbQ4Y7xrlBYKcl+l28ucKjFrj1Kvn2jBWtJqVsjn27PweGdoxYbb7lObCsXyppFM5fSkPJe
	Ei5kOOhoOwgNq9LaHHZbPNxXTvL8w17qi7Y4D9/eo7LJnCKARe5jKFFCN6rkPRzlsRDEmq0vRFX
	2fQBKghOK/
X-Received: by 2002:a05:600c:5303:b0:4a2:1655:87db with SMTP id
 5b1f17b1804b1-4bb88785d2fmr48529755e9.0.1795162852274; Fri, 20 Nov 2026
 00:20:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-9-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-9-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:20:40 +0800
X-Gm-Features: AclHuK--KpLypcFnORd8WwLwhQcGdUQKeMSvpl7k7o-cD-MnrCJ80Uob7th_vPU
Message-ID: <CAN_Opa9CuEB4NiE_+c=033ziMxqo243Ev3JB0_ctgk27kD-GsQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/17] mm/mglru, gup: mark folios referenced via a fast helper
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Kairui Song <ryncsn@gmail.com>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:03=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> Introduce folio_inc_lru_refs_fast(): raise refs from 0 to
> LRU_REFS_REFERENCED via cmpxchg, or just set PG_referenced for the
> classical LRU as before. No counter update or promotion is needed,
> nonzero refs are left unchanged.
>
> This helper only aims to be fast, it exists so the gup fast path can
> stay a fast path. The new helper doesn't account refs above
> LRU_REFS_REFERENCED but that's fine for now as GUP never used that
> or anything similar for CLRU either.
>
> Convert the gup fast-path sites. No behavior change for classical LRU.
> There isn't any regression for MGLRU either.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 25 +++++++++++++++++++++++++
>  mm/gup.c                  |  6 +++---
>  2 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index b15c3618a1f2..3323a3c7336b 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -483,6 +483,31 @@ static inline bool lru_gen_del_folio(struct lruvec *=
lruvec, struct folio *folio,
>  }
>  #endif /* CONFIG_LRU_GEN */
>
> +/**
> + * folio_inc_lru_refs_fast - Bump folio refs count without promotion.
> + * @folio: the folio
> + *
> + * Raise refs from 0 to LRU_REFS_REFERENCED and leave hotter folios
> + * untouched. For the classical LRU, a plain PG_referenced set.
> + */
> +static __always_inline void folio_inc_lru_refs_fast(struct folio *folio)
> +{
> +       unsigned long new_flags, old_flags;
> +
> +       if (!lru_gen_enabled()) {
> +               folio_set_referenced(folio);
> +               return;
> +       }
> +
> +       old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> +       do {
> +               if (lru_get_refs_flags(old_flags))
> +                       break;
> +               new_flags =3D old_flags;
> +               lru_set_refs_flags(&new_flags, LRU_REFS_REFERENCED);
> +       } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));
> +}
> +
>  static __always_inline
>  void lruvec_add_folio(struct lruvec *lruvec, struct folio *folio)
>  {
> diff --git a/mm/gup.c b/mm/gup.c
> index 2b405cce2ca5..596e62954659 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2911,7 +2911,7 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, =
pmd_t *pmdp,
>                         gup_put_folio(folio, 1, flags);
>                         goto pte_unmap;
>                 }
> -               folio_set_referenced(folio);
> +               folio_inc_lru_refs_fast(folio);
>                 pages[nr_pages] =3D page;
>                 nr_pages++;
>         } while (ptep++, addr +=3D PAGE_SIZE, addr !=3D end);
> @@ -2980,7 +2980,7 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, =
pmd_t *pmdp,
>
>         for (i =3D 0; i < nr_pages; i++)
>                 *(pages++) =3D page++;
> -       folio_set_referenced(folio);
> +       folio_inc_lru_refs_fast(folio);
>         return nr_pages;
>  }
>
> @@ -3022,7 +3022,7 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, =
pud_t *pudp,
>
>         for (i =3D 0; i < nr_pages; i++)
>                 *(pages++) =3D page++;
> -       folio_set_referenced(folio);
> +       folio_inc_lru_refs_fast(folio);
>         return nr_pages;
>  }
>
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
