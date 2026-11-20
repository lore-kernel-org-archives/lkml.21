Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162833;
	b=OtGhchn2m7sUKc6AwEvPltFDpQlnsDMy1yclmLCDtpgI5v4w2PA3DkRJcsDNWTYJKcQK
	 TCqy6A2Eh2RUZS4ZRk1xWCukHVHxizdBxSbcAodj85jx/RajHV9xxYI7Xt+sppFphQb1/
	 7+8zpqoD2jR7M3E0GF5STHEACbts6BXBxbp9I5BY4TYqVAP/c5PzAdpB+Ep4AZbt4RHuQ
	 3AcmmYXD2wEoCfEV0gh9RZ+jcZbomnTqA794h6UHJL5gM1DYqGryweS9tPXzEU0IC2UQM
	 4qUbOqHG6F3C0AS6D0HVE6jcwQGx4vi3k4FEDFoqnOsSD+BKJ/LCFdUhRsMO53BcK6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ud3dyyf/JEY/R/2fhpQWVjOi5aq4aTlLAjlkAINyk4c=;
	b=CHSk6pCOaF+9DQlBqRQ0xJAfxTsdn/BlROlUtYgE3AR0TeuW7mhSmq1x1ucXjSzThcSC
	 xsipCCCJTI9X9jXKMe1BdadLFvTjvNjgVWy9aSSCbqSyFcRbw5gxx8DjeNYp75kblZ/wk
	 Yunh9zR/UwBWm1Wm8se0j7gcrmSfjq9LVfMefz2qzyObMmqjA2PtTsHsBqjeKvY62K6A9
	 4ujuvF3MOdiIwdWPT2FOeY8GEzHLbcpkuuzCD1cEcP0nnE7M/QF3116aMRayaFSc61kmm
	 R7z0CY55iHA1TfoGMnFM21KUYFxdioCVdrTiftYuopMpvNVG5QGCa6/MIWJDjYvy4Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8HoSI7f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D652E60A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D652E60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8HoSI7f
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so13624285e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:20:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162827; cv=none;
        d=google.com; s=arc-20260327;
        b=sez7wrmTwflA0Hbnp8Y3fxxnxFoe+n/Zg2ubep0bAGWhNR/FWvMPNgz9uuJiWDgnKj
         ErWisoqsfZ3xV2QJu82td5nkz5utF5PuQd0HiYrtzNslW887TIx/8JNeGC9oDxmGcvda
         5v4AEpG4/I+a65grPyAgoXR5IxQGnk3VEC0N68dL24WrYUxwcIJ/6sTKKx47UZdLwHB8
         u5Hl+YiPnaxw/jQlxKAlzzCkr5PQIHZX8Sv5bfCClJ85Jm9b2ivZb9W1cQFpNxOmBQg7
         f2b7Ow/M4YprCvnxfVazhaUPWxthbaJGQOeefj5R4z0g+2Lxj0e/MC5BDfpx2nWeWuZJ
         1klA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ud3dyyf/JEY/R/2fhpQWVjOi5aq4aTlLAjlkAINyk4c=;
        fh=2mfWvpj7Xs+FnnwRJ1ubrKDnoQaGeFvFzfFJcXYP1xA=;
        b=Z7AVoODAzPZVm+x9tTmq02yqA40mco/Fo4jw38ogLkheDIKuDuLobbr+9MLC1fje5Z
         QqWfkY1q0wjKHOjusTpZH9XHvCNLcXD23sM6D51qTmoW+cYeP3Af8sAZUZWHZ7ebNPj6
         3AZeyhvQ7be7mMVP56fzGp8ftY6pBDeGarlohdoRkKWcDC56o5QWdFHYpvCz18v4O4O0
         8nx7v2liErpeNBhbezTvr2f50xeYNA0US8UdNU8hwRSLpU0G2ZtwYbZnYSt4+KyNWjdB
         W/OGDEdgP++nNC0WfhiqaV72r25ZPD3TOXObuyKVpvejMhgQPjpDJkeDqxpsyunPswd5
         K+fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162827; x=1795767627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ud3dyyf/JEY/R/2fhpQWVjOi5aq4aTlLAjlkAINyk4c=;
        b=C8HoSI7fmzQqSFOXS31oD3FBLkxhz9Ruego3Dv1D3lPfU8LERi3bOVkE94w0HiSOnz
         Q2sQUYXxgTh1jIlulfxC2RSVcBvHlWBQKOOb+VVwD5MG9/Yyy00BbNSEb2o1LmJpvot7
         glPZJ3rY1I6sFhRlA46IqU/mdSBy0EjvpwkbzcydC4keBozMmPNXwgutpB3w9VEsM6JC
         bUwQaYX4lLQ9QMptax4kLlFUTcVxcQt7Fq/9pLSffdHgGQJyMGgTUbyYNVSPUJ7SGQ3d
         okHWgDdJ7gT5RIroMQ7jmBqmfPmkubd3C6mnFeXTYA7xoL7nxmXZC0bx1qeKCAN47EjL
         OKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162827; x=1795767627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud3dyyf/JEY/R/2fhpQWVjOi5aq4aTlLAjlkAINyk4c=;
        b=SDkIZY8D1D1CdfLNbscC8medkH2xp34f7pIfd9bjS6irUZuzzsAYu/EES4H87BtPEn
         LHXwTDdOq3r4GtaI2pi3LE6B6C5GAnaZ0CsmzLUiuFp2nDLJFLLCXm5U0Z9A4EXhL6MG
         4JvKBeaGRnNt7jiy2m6Cn1q8afciSKcIghqN/6IZbo/DiStQeaa+rypDCye3qLSI/Zzy
         tt/8hR3N9P4TB0ZhcSYR3EDnAl5eLfPO8jLDAq8YyszhY2THRtka6nZO+DuzfghHcCMW
         REHIOZrhg5NPUwX21Yfyb4+Cf7XKicdZw/GFn1+A93d59RoaVZGIBauxvFutCZjtIb+0
         PMYA==
X-Forwarded-Encrypted: i=1; AL+hErHuRpo6+oVZ9dYqrYBfzwhP/tGtlFWjIJWdqW/LLICXCDHNXNiEu93i1DKqxEg/GHVQgq1FGfEITLf6rWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z91Xnov8SoD+f0cNI9ZXgVn4iwN1dcOIpe65+bB/Y3Js9TZuqp5
	UmS835uACLsWGF/N/IAethcU5dZUC1Ij3yDTFUXq/zP2k+lSxPnvtlP1nEnI+tphIgqu+xPVdI+
	UqJZxBPUgjtY0+upHCwbax089/siEQuA=
X-Gm-Gg: AYBFou3elgXJrwhueUDRbIH/9Vk4f+LL5VUghYcNaMjU2SKI0j4+nlu8sDpQ2sajf9z
	zXohzEqJzUWKCs/+o7ndrhlQXa8QyjZqm5M0wenHOSuI6jQoZzqBPeurjtDAcZhZ7zCVMpJuRno
	HSREu3SZ4cPiOkLrEsToqdUw3eSiLGVUpOCtqxhLRJRZi1UZikmTiMyFOJgyFx4eLxr86VYwkwY
	qz8q+eaMz//LdLDqAurYhGh9x1KiA0JFxC3cLATA/ZaFJNRI1YUJq4fScMDaua6V8SQwdiEhvlJ
	8htdfvsa7rNbU+2IB5TpdEAPO3AFpiWrdflpU5XvJ5EarIWNK2j32c+Gc8g23awAHEAsFlvwwdY
	R5N0jMTLKMGli245NHk4CNzSAnrjOxBKn1UWKy8EdG2olIyTWvd8ZWYJlTS2DzJMf
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id
 5b1f17b1804b1-4bb887fc396mr47908935e9.3.1795162826538; Fri, 20 Nov 2026
 00:20:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-8-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-8-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:20:12 +0800
X-Gm-Features: AclHuK_oxtudcnoh95U_WO0vrwwpF-uDqqiNW6HAKd9dIMedRC4HEEVfEGFR52A
Message-ID: <CAN_Opa_3vb54=6pMeRfzBpTmXG0Bfprhjw8H1mzA8NZ4c51U-Q@mail.gmail.com>
Subject: Re: [PATCH v5 08/17] mm/mglru: move add/del LRU size accounting out
 of lru_gen_update_size()
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
> Pure code shuffle, no behavior change.  lru_gen_update_size() now only
> updates the per-generation counters plus the promotion move; the
> addition and deletion active/inactive accounting move to
> lru_gen_add_folio() and lru_gen_del_folio(), which know the generation
> and can apply the active-window test directly.
>
> The unevictable case is untouched: unevictable folios never enter
> lru_gen_add_folio() and keep being accounted by lruvec_add_folio() as
> before.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 180db43c3a85..b15c3618a1f2 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -322,21 +322,9 @@ static inline void lru_gen_update_size(struct lruvec=
 *lruvec, struct folio *foli
>         if (new_gen >=3D 0)
>                 atomic_long_add(delta, &lrugen->nr_pages[new_gen][type][z=
one]);
>
> -       /* addition */
> -       if (old_gen < 0) {
> -               if (lru_gen_is_active(lruvec, new_gen))
> -                       lru +=3D LRU_ACTIVE;
> -               __update_lru_size(lruvec, lru, zone, delta);
> +       /* return now if not a promotion */
> +       if (old_gen < 0 || new_gen < 0)
>                 return;
> -       }
> -
> -       /* deletion */
> -       if (new_gen < 0) {
> -               if (lru_gen_is_active(lruvec, old_gen))
> -                       lru +=3D LRU_ACTIVE;
> -               __update_lru_size(lruvec, lru, zone, -delta);
> -               return;
> -       }
>
>         /* promotion */
>         if (!lru_gen_is_active(lruvec, old_gen) && lru_gen_is_active(lruv=
ec, new_gen)) {
> @@ -391,6 +379,8 @@ static inline bool __lru_gen_add_folio(struct lruvec =
*lruvec, struct folio *foli
>         int gen =3D folio_lru_gen(folio);
>         int type =3D folio_is_file_lru(folio);
>         int zone =3D folio_zonenum(folio);
> +       int delta =3D folio_nr_pages(folio);
> +       enum lru_list lru =3D type * LRU_INACTIVE_FILE;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>
>         BUILD_BUG_ON(BIT(LRU_GEN_WIDTH - 1) !=3D MAX_NR_GENS);
> @@ -408,6 +398,10 @@ static inline bool __lru_gen_add_folio(struct lruvec=
 *lruvec, struct folio *foli
>         set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_active=
), flags);
>
>         lru_gen_update_size(lruvec, folio, -1, gen);
> +       if (lru_gen_is_active(lruvec, gen))
> +               lru +=3D LRU_ACTIVE;
> +       __update_lru_size(lruvec, lru, zone, delta);
> +
>         /* for folio_rotate_reclaimable() */
>         if (reclaiming)
>                 list_add_tail(&folio->lru, &lrugen->folios[gen][type][zon=
e]);
> @@ -432,6 +426,9 @@ static inline bool lru_gen_del_folio(struct lruvec *l=
ruvec, struct folio *folio,
>  {
>         unsigned long flags;
>         int gen =3D folio_lru_gen(folio);
> +       int zone =3D folio_zonenum(folio);
> +       int delta =3D folio_nr_pages(folio);
> +       enum lru_list lru =3D folio_is_file_lru(folio) * LRU_INACTIVE_FIL=
E;
>
>         if (gen < 0)
>                 return false;
> @@ -445,6 +442,9 @@ static inline bool lru_gen_del_folio(struct lruvec *l=
ruvec, struct folio *folio,
>         gen =3D ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
>
>         lru_gen_update_size(lruvec, folio, gen, -1);
> +       if (lru_gen_is_active(lruvec, gen))
> +               lru +=3D LRU_ACTIVE;
> +       __update_lru_size(lruvec, lru, zone, -delta);
>         list_del(&folio->lru);
>
>         return true;
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
