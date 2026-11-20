Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162636;
	b=k7/RTh2o1j6UsYpGYUDOsI72ADnuYX5IQJv3edp4saFkBkjZqMUoDJuMkRseB/r4q2OP
	 ryTGIJtfzAPUiWa85HP1NezW6kZFEpIKkpc7WsSxbkqCr1ZKBP4qak919hCJcGxGYEZS6
	 05yGo/sOohH0Cec0fJIm9VigGhQxLbtcW3rjZzPUf4Uz6fzm3BHkSQULoam35LSublTUu
	 uyPc5+/QGtwXy6kJ6XG6tdGeoFYFjfHxix1wzgJ8Y6P6xYnwxIqtw46i8YKfcD9awW1/p
	 ovbZaVQeVXqZ4ZEp76nhMw7YOA1Ief2abHuO+KZ0qVBF+s7PoiCaDvykLTl/ped0H2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I9NquCUCJSJuGXe0n1gktrr9r7y4Jk/ICWggLQ59hqA=;
	b=gkx56X6oakaAvU7O4UJ2cR2rDULHm7kWtjytEOsjIjbS3KBZiET7z1Ex3l1kQpxXB6zB
	 k5KQYFCl1Y9CS5ko4K6Lz0Ip3CKATjUeFpbEEVvJQFbBk63CHuzTDT9zxR9Ar0EL9c/Tz
	 ZPtsVs5m5rD5vE5wCQ2w8MjBYAD6VvFaCDE9dYlIF/IIx4fWDhKgf5Gua+Vino28/7/cU
	 9p+pM0aE20AFZ2burIn4vj+k7p1lp3STctqeXBmvhMxISUmMYOvV6mo9uG4Uapmbd0apl
	 qTOIga4SAKgGH/rTD7naBJN7JyB8pKD+cBfv+4goeasazQ0BFbUHOzjdlXDtWB9NzYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qzyr9V2Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD8E60A2626
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CD8E60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qzyr9V2Z
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso3689885e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:17:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162633; cv=none;
        d=google.com; s=arc-20260327;
        b=aND9zFyttSV3VDxUnFrEByWGK/YyByzv/ts5G+/Z7yWbECbucjx638smOXKwwY5T/l
         LOp6MfDzbMhR5MFnTZJ6jOerd9wBO52p8e8YGIM4tLTx3h+n7osxr+GHKi9rrhyUU/fw
         pXPpMGayiRTJFr/GO+zopEUH4xAXZIIiLwt1UyBzMHrbOFQoKZC5m8f3W+2STJ4qZJUZ
         u62CSaWhOAFH7LyuHYiAK6ebgoUoBxH5Lr39uQaz13pdLwgM6dIbR+Hmf/GwItUML/06
         bRH3KouRHsgEKb6IykV+cSPcI5fllfQgRFlBs4UtPaz5DrfeecvqPjjtA15GLQD3xMI4
         RSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I9NquCUCJSJuGXe0n1gktrr9r7y4Jk/ICWggLQ59hqA=;
        fh=AJfRJu9/zlH+jVUElIbYBJFpDgy6/ZodYMpd86K5qWU=;
        b=r+eZzBcuK/4TxWjoMejDW2gfYikIlf9YVkcj7NVuqiqsvEz9ZYaN1cyFlx1Gaj4mt3
         vRdocLQfcjzkNT7BaX88b+9k8xJTEEnd5TtN8+44Vf9ChhvnX9ke7HC3kQABI5+DZ9sg
         8ODoHaAJKAbmQMtbCUF3N73zxgibWeRfCrYZNJAnH5T3N19xstuS1b0ylcGA7K1pRA40
         F4jMdjdCHlUChG35mNfcy+78IMkjDntIL3JNPB5hXrRbEM3vNWCx9hHCC4onQ2KBLTdT
         ki5q/eHTKEDypi55KfDDk/AFzDUaLv1q4rNnnemWYFkfS4+QLNt10DZZWjpi2bIX063s
         WwlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162633; x=1795767433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9NquCUCJSJuGXe0n1gktrr9r7y4Jk/ICWggLQ59hqA=;
        b=Qzyr9V2ZUUNAmMCtKFt7ZwiRQuhbO4ihXqXfeYwH+kUPtxrrZnUUi3M9pOrCOUlp4b
         xZC9ddeS7rgMOpmpaaJK04UfLDWEvvKzjPM4KC7W7DRfEJ0IsCdIUL3tlODHZZ6F9YJ5
         TsSQ4HqMX0Q4sGp7PgJCyp4Lpu95hdK7S7i42S3EVAIm5V2NDcQLOZKDLZKiXyDD43Px
         g1a8h1S+RnauOtF4eM8i8OwEdoFX9bILpLf/4oS++dAnRGRygs6qWbyP8H8L0RF1IKt+
         vuwcxO1dWmk14EDODYERIslIKQZopJwo9MixTm1ovAtNEgAgalIRczmkl8qD9fFXZflK
         ZU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162633; x=1795767433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9NquCUCJSJuGXe0n1gktrr9r7y4Jk/ICWggLQ59hqA=;
        b=tN9PGuk7U81u6LsHy8/MZ38y376GZx7I5MY967PL9bIjI7gMXJaXbsHQP2qAesS/om
         8jx4zxsxOKvFjS9/gyA+DA9Yg3M9zh41a0HP4z1LqaljljeoxewAOO2316Tx3buyAisr
         8RCJeaevojvSOCYe31Nj8iE70whdgGJx8mt+M5UvISkGBhN5nST3CLaR+Ouy9VfPIvkF
         zzCQLD9mJBN7Dhx+X1S2VeYAKzbZM4ROTdoxHelhnvZ1z9Ucjy+EtsAXt2EPDBDs3r4p
         fKsNpKidJ0e8ISK4jUUWIWp9IjKIPuezHdt2szYQ14CDiRQfeFS8azga3XzMzTPovO9a
         x1Kg==
X-Forwarded-Encrypted: i=1; AL+hErHsvZ7czRMkSFeFg0f6kTy6P3a5stSn9UoLa8kINu7xBY5roMNoCvKR8xPKdbx8KLz9+JMK09tTQh2Ns0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+wAsJQKEwRdliJNUqNHc9RoOv+yTQTbj0pFLfnPd59B9IMM6L
	4zbaeJbOMaEdNCtDNvK8m4rFYUP+9IzHk+TwbdINn0UvM4fQ5PKazuRTqgXENg2qPw9oIvss6gn
	2h/LIBGKttFjTxvtZDL0Yz0by/aZMWBA=
X-Gm-Gg: AYBFou0pH0hsdMQwD//O+RuVxh40+1nsXs7daMCvHAg5KPa7tuN+GtDeGuTxygmXYG+
	+Sbyi/9UjVKsZekPxvgt9JE2gaj7FL/q8v0E2DeiS1lCk1VqKwwgGTWXZ34uAlolQGJR5Wz2sg/
	cKRIA368+geAx8omFPJEwWQcquNiGSG8ZrYebQRQIqmpoRgckBUWj+Q7a1l0rACIiFNvqNWUvdF
	Jhoft2znTXUaUe4DooDIMoM1cO5f1271MeLYeSeXsC/WFez6V6JuzswGVlBalEbpFxunuvnwoIA
	ZL1ezyQStJ6OtO/Posl2yKSS6JLkg1uDHIuQP+04zkcJRuHJLaa1J+qUZ9IVN91TMOt2nn27oLe
	hhyOqKtYuQzKwLj8gq7R37orLaRdobvap5x76+NIXnJ+w4SrmlRoybUCnnpoSkJCRZg==
X-Received: by 2002:a05:600c:b8a:b0:4bb:7007:4a5a with SMTP id
 5b1f17b1804b1-4bb88817772mr45942875e9.23.1795162632893; Fri, 20 Nov 2026
 00:17:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-7-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-7-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:17:00 +0800
X-Gm-Features: AclHuK87_PiI6KLw_fxUiiW6AWziAjedbgzbNSGoCid8qtKuQuZJuSbue31J1p8
Message-ID: <CAN_Opa_mk5xH5LtV04f=ooQuVatjbEviN6jxkayAatzqkie4qg@mail.gmail.com>
Subject: Re: [PATCH v5 07/17] mm/mglru: make folio lru referenced times count
 a generic API
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
> Pure code shuffle, no behavior change.
>
> Make the folio LRU refs helpers available regardless of CONFIG_LRU_GEN.
> Without MGLRU the extra bits are never set, so they are inert. Move the
> lru_gen_* helpers into the CONFIG_LRU_GEN section.  This prepares for
> unifying the API for checking folio referenced and workingset status.
>
> folio_migrate_lru_refs() now migrates the complete refs count,
> including PG_workingset (bit 1 of the encoding), bitwise identical to
> the direct copy dropped from folio_migrate_flags().
>
> lru_set_refs_flags() skips the nonexistent mask bits when
> LRU_REFS_WIDTH collapses to 0, preserving the two independent flags for
> !CONFIG_LRU_GEN builds.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 55 ++++++++++++++++++++++++-----------------=
------
>  mm/migrate.c              |  2 --
>  2 files changed, 28 insertions(+), 29 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index f38dad1198fc..180db43c3a85 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -184,6 +184,12 @@ static inline int lru_get_gen_flags(unsigned long fl=
ags)
>         return gen;
>  }
>
> +static inline int folio_lru_gen(const struct folio *folio)
> +{
> +       return lru_get_gen_flags(READ_ONCE(*const_folio_flags(folio, 0)))=
;
> +}
> +#endif
> +
>  /**
>   * lru_set_refs_flags - Set the LRU referenced count to folio flags.
>   * @flags: pointer to the folio flags
> @@ -206,7 +212,8 @@ static inline void lru_set_refs_flags(unsigned long *=
flags, unsigned int refs)
>                 *flags |=3D BIT(PG_referenced);
>         if (refs & BIT(1))
>                 *flags |=3D BIT(PG_workingset);
> -       *flags |=3D ((unsigned long)refs >> 2) << LRU_REFS_PGOFF;
> +       if (LRU_REFS_WIDTH)
> +               *flags |=3D ((unsigned long)refs >> 2) << LRU_REFS_PGOFF;
>  }
>
>  /**
> @@ -252,13 +259,31 @@ static inline void folio_set_lru_refs(struct folio =
*folio, unsigned int refs)
>         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));
>  }
>
> +#ifdef CONFIG_LRU_GEN
>  void folio_inc_lru_refs(struct folio *folio, unsigned int flags);
> +#else
> +static inline void folio_inc_lru_refs(struct folio *folio, unsigned int =
flags)
> +{
> +       /* Should not be called with !CONFIG_LRU_GEN */
> +       WARN_ON_ONCE(1);
> +}
> +#endif
>
> -static inline int folio_lru_gen(const struct folio *folio)
> +/**
> + * folio_migrate_lru_refs - copy the reference state to a new folio
> + * @new: the destination folio
> + * @old: the source folio
> + *
> + * Transfer the reference state to @new during migration: the MGLRU
> + * refs count, or PG_referenced and PG_workingset (bits 0-1 of the
> + * encoding) for the active/inactive LRU.
> + */
> +static inline void folio_migrate_lru_refs(struct folio *new, const struc=
t folio *old)
>  {
> -       return lru_get_gen_flags(READ_ONCE(*const_folio_flags(folio, 0)))=
;
> +       folio_set_lru_refs(new, folio_lru_refs(old));
>  }
>
> +#ifdef CONFIG_LRU_GEN
>  static inline bool lru_gen_is_old(struct lruvec *lruvec, int type, int g=
en)
>  {
>         unsigned long min_seq =3D READ_ONCE(lruvec->lrugen.min_seq[type])=
;
> @@ -424,20 +449,6 @@ static inline bool lru_gen_del_folio(struct lruvec *=
lruvec, struct folio *folio,
>
>         return true;
>  }
> -
> -/**
> - * folio_migrate_lru_refs - copy the reference state to a new folio
> - * @new: the destination folio
> - * @old: the source folio
> - *
> - * Transfer the reference state to @new during migration: the MGLRU
> - * refs count, including PG_referenced, or just PG_referenced for the
> - * active/inactive LRU.
> - */
> -static inline void folio_migrate_lru_refs(struct folio *new, const struc=
t folio *old)
> -{
> -       folio_set_lru_refs(new, folio_lru_refs(old));
> -}
>  #else /* !CONFIG_LRU_GEN */
>
>  static inline bool lru_gen_enabled(void)
> @@ -470,16 +481,6 @@ static inline bool lru_gen_del_folio(struct lruvec *=
lruvec, struct folio *folio,
>  {
>         return false;
>  }
> -
> -static inline void folio_inc_lru_refs(struct folio *folio, unsigned int =
flags)
> -{
> -}
> -
> -static inline void folio_migrate_lru_refs(struct folio *new, const struc=
t folio *old)
> -{
> -       if (folio_test_referenced(old))
> -               folio_set_referenced(new);
> -}
>  #endif /* CONFIG_LRU_GEN */
>
>  static __always_inline
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 28a8d7734735..c8c49357df87 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -796,8 +796,6 @@ void folio_migrate_flags(struct folio *newfolio, stru=
ct folio *folio)
>                 folio_set_active(newfolio);
>         } else if (folio_test_clear_unevictable(folio))
>                 folio_set_unevictable(newfolio);
> -       if (folio_test_workingset(folio))
> -               folio_set_workingset(newfolio);
>         if (folio_test_checked(folio))
>                 folio_set_checked(newfolio);
>         /*
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
