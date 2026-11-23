Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795398206;
	b=u8PjRQpgVZKiOxphF2HXMADTTRi6T272Fcx12EL9zMjFrWvshr1KjCYyoICbmRLNiPNy
	 G93Udis1p+fVZnHkXttjEFnuUmjh9B9KvD2p1lFTIQLZeV7tw3q9uCB35rhEi8S6SJckx
	 9+RoqKhgw/a9HBhcKwLfQ9YDWjoHmo3rDEk+AcN80WKnbI0IAL0bZ4dgerW1ZkgPHEO2I
	 QqKUPKQJ3bTcRW1Q06sEv9YC3AM8iXB5AoSXOeBMPy1kmLFHQkIVFbrnPlDR+6pZ+GzBL
	 ySAuF3WZ9ROD/gbVAzVMffh1Rrdw0kjXWntZ9pRqJyslXcQ18UGxf9PNVtFmeMsupMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BrVQwSIPnVhHdrsgKZy8tODX9WT1tDuIYLyA3zVqg3w=;
	b=L0fpkhyUCpw8Djn38o0ThOfNje77g7MP6Ku7NRlws4a6eO2Kom/ZOlUSAe5loz1JkXaE
	 48U0QBPWjyJ8KCt77S3adf7O/zmCyrkSWc4btcN8krCKFEAHgfKr4tudyo5Rd6blXth2V
	 wVE642W9VVR6oLNDgyZVZeqlYLLMBFMfnK4T+D4ZdOE1kRBdd9ct0k28aOnLEHQpH+CKg
	 z4rJ2P/mbcvADL06hxT5srZr9gLb7mMdxFPYtY5x67VUrmuIxDgKT2drSquw5521IIBZp
	 IQzxhORXK9tOX08Wqp4RNtV57v3MHIdQZO64E0bLHCnA1bbzgPu/6zmETO303Qjra0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IGoAg5tG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7889E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IGoAg5tG
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so27182935e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795398205; cv=none;
        d=google.com; s=arc-20260327;
        b=j/+KQyaQ6arsfEydYpwUq9f3EuWqW9YOe2tEr6bzFE9+55fp4gHOdmKI+fK4OTp3M1
         LLVnW3x4mjWx/0AzuN8Qy+wOtByEs0Amp88rKp1XP0yPrJGQDhl2DMF+A/y9PELQVRMR
         c1JPLQ2vYFMMVR/zAxp1zKBOgFk7eU9rTIZvnk25V85oIUr71VEnDiu+9iuCxOVH12Ic
         cO0QirQdhr9Rb987NwJ7j8v92JvwvHT5jiEsLTx3vjtCi9ScSwqBaVU0YlvRjC2tocF+
         k+/xjTGmkVlDZV44lZ9ernTk5b7vMue7tprZxIwsCv82SQ4JjkmyeY2G3HNIKCL8Q1oD
         P3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BrVQwSIPnVhHdrsgKZy8tODX9WT1tDuIYLyA3zVqg3w=;
        fh=4joJwHINJyE2ZuYeXfnm5koUOXBtyes2Z00FQ8Jmev0=;
        b=YVUTvCa0ocxFoEyxDaCkjAJF7xabaaCrXIBt2EFZ4RIeoZKVYbOO5zqRsCOc5A8RR1
         PuMc3PxPthBmmLHQjcjizpPfhUFm/PV9587js3aJuivDUtjyBazGxe+uarw/s7lr6vG3
         7dDO8C6FeKLeU3ZfTnwZa5EhakpcL+GCo35JktoAicJveQLCWOiNYhD2a7hsQ6x6bNpQ
         Sva2TWZ2H8uN64Sdj6Qd728u6HgdZwxtFhXu1hC+2jX5G06EEHeY/BdauPl+bP5LiQvS
         QyL5duJXEqTwMzDIhGWOUGVKurm12fOAmZFoJann+6BIBQiHbnl2CO/eGMg6Q0EExgMM
         cNpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795398205; x=1796003005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BrVQwSIPnVhHdrsgKZy8tODX9WT1tDuIYLyA3zVqg3w=;
        b=IGoAg5tGSlsFW3Yk2c+abGP3gmEAFuEi8j/bd7Ecqf96yRpcx4UHUPxBRRvyBu3FqM
         lE1v41tlfMMxOsYpkgVzeK3Ci1JDi3viDdZBdXJpDyNLN3Z1O70suye1/hL0rVaf4UUG
         jG1k3ywZ/hdlsFYQggU3iDIV92foavnmliY/dZaa0cQhSXZsYWVaYms0xoU9ibkxqjkz
         dIMQ4o1TJv1EWlXKW++a7gpd4P4BhTUtPUC+KkIvZJ4eOmbfkKL2rF+LFBcMWxRmrKNC
         zVwoC8H0SJ1TUzlLYGbw6IIseyYRLTE7w291p6gxXkSLEMjqQNxqcJhpS8t2jWjyFKQM
         NV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398205; x=1796003005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrVQwSIPnVhHdrsgKZy8tODX9WT1tDuIYLyA3zVqg3w=;
        b=VNhlGWQiMkqaFcpMrS6f4kYABZxJ9rni9chP8f8O3MKSd0xLchbNSL/HJOSE/dOQai
         r1pYUrw9mTM+mPEpibSLRdCOsE784/321ry9wUanKfgBcZVa1Tv293k+MQatdgZbPaSF
         51FBRRARJIo6311J+kcLNl/BEUl1gySQs+obw67ramUeSz63Jd3dvq4mo9wO4GPX+n9x
         Wnk7DPSpxlK8Qn3S3XVOkxy7TaZ05VV47EGtLdCNNXJChGnbD52wm5xzy/aFwYhK+WSQ
         LXzLo+KUjsNQDYi6frQcDD+M4SZlqTGZ/3M0KgzsxdvVx+kbWA8hFXGJSnsJXiyubLMC
         e8rg==
X-Forwarded-Encrypted: i=1; AL+hErFMpPjGFJWRSBJU38/uV8mELYvVQfXydIlqCCsRDf8BbTP0NUvK5BXdp189eZor3fd9OjYQl8HaPkI6R6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DxPJuDycXDuE0LftXN+AWBlskImxLXmEkLDpLSkKM6Kfd7d/E
	B4C4nIC624Yo2uXKLhrdKUPT0HeGqAjwZTK52VgJe5Y0A9oJaFPPLxrlx6cvKnRfM9isTuQ+m/f
	alzL66n+xB1Gy7hvSdEPlHSpq0+HXiXY=
X-Gm-Gg: AZFdTZf6SSLIZtgPZjG3NAvxbykmWnA501gQ6IH4pstgKACbFbDtavbX0bhwigKHOUC
	DoHjYhODlqQocgayi++/uAqHoMCHz3f1CmZfsj4HUsgEhlFgKqSJc2dNdi/eiagmvKGg1CfsrlG
	PnLgUHXvTt2/+7Z2p7H0oL/CRUjxHQmnII8yLwPKl1WMinggr05XZNV5eWTzOoMCp/XlcahaEkC
	Pl5iav6RqgqEHcvqE0QSkI3cD76gvo9qzyfmeFGLJya8BVeMstVZ6MUnRlnWFj9On5TPmf5hsNG
	J/ieyhm9HCjwSbe8U1xRxNkLTlw/7qGMyRjvDIEe3K8lHN7R4CMBKRgoNvIV5QceX2V8OUbyamP
	NzZCuTFAbTWzCbYlU/Ym8pUXzig3rD2cGI1WllkOnJxi67ZFFd1vgMPsU2Ks3VXpsaERP14nlDe
	3qUeOvQSOUctXktlwHaX99HacnHrn4FZCkPTapx8ofhuIgAg6fpMBQpVPBw0/UnMRW9VonBtVmt
	w==
X-Received: by 2002:a05:600c:8b11:b0:4bb:6871:8f21 with SMTP id
 5b1f17b1804b1-4bb88822346mr213653915e9.23.1795398204221; Sun, 22 Nov 2026
 17:43:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
 <20261119-mglru-fg-v5-16-9eee2fe97a2d@tencent.com> <CAN_Opa-+nb0vxQ+HsENCG2fEEMZoxG9Sy_DBC4CLkWjNLzDWKw@mail.gmail.com>
 <CAMgjq7CEdWvv8m9GtWMG=8OFy+1Sehx3HBJt2D=9hntwvfbf6w@mail.gmail.com>
In-Reply-To: <CAMgjq7CEdWvv8m9GtWMG=8OFy+1Sehx3HBJt2D=9hntwvfbf6w@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 23 Nov 2026 09:43:12 +0800
X-Gm-Features: Aa3M54oNBYyw9pCyIXqZNWTI0hkUvgld-jGgCS21qlijWr31Z0q9q7Y9XszeYmQ
Message-ID: <CAN_Opa8L3Ygfu5o7Y8ZD9GTmiEygCXpq2TzAJtwgQChdyb2dSQ@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] mm/mglru: make folio_inc_lru_refs lruvec lockless
To: Kairui Song <ryncsn@gmail.com>
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
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:33=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Fri, Nov 20, 2026 at 5:42=E2=80=AFPM KunWu Chan <kunwu.chan@gmail.com>=
 wrote:
> >
> > On Thu, Nov 19, 2026 at 5:04=E2=80=AFAM Kairui Song via B4 Relay
> > <devnull+kasong.tencent.com@kernel.org> wrote:
> > >
> > > From: Kairui Song <kasong@tencent.com>
> > >
> > > The lruvec spinlock in folio_inc_lru_refs was only taken to keep
> > > concurrent aging from corrupting the size counters.  This is no
> > > longer needed: the per-generation counters are atomic, and the
> > > active/inactive ABI counters are updated per folio and linearized by
> > > the CAS on the folio flags, so concurrent aging can no longer corrupt
> > > them.  The same argument is what lets folio_reset_lru_refs() update
> > > the counters without the lruvec lock.
> > >
> > > Use folio_lruvec_live_get()/folio_lruvec_live_put() to hold the RCU
> > > read lock around the lruvec lookup, and drop the spinlock entirely.
> > >
> > > Without the lock, aging can advance max_seq while a promotion is in
> > > flight.  Generations are indexed by seq % MAX_NR_GENS, so the folio
> > > flags can return to the value read earlier and the cmpxchg succeeds
> > > with a target gen computed from a stale max_seq.  Recheck max_seq aft=
er
> > > a gen-changing cmpxchg: if it moved, account the committed update and
> > > retry with LRU_REF_FORCE, which promotes the folio to the newest gen.
> > > The retry may count the access twice, which is acceptable and avoids
> > > folio_activate(), whose LRU lock causes latency jitter.  smp_rmb()
> > > orders the flags read, including the one returned by a failed
> > > cmpxchg(), before the max_seq read.
> > >
> > > Also simplify the post-CAS accounting guards: gen is only assigned
> > > non-negative values after the old_gen < 0 early exit, so gen !=3D old=
_gen
> > > implies gen >=3D 0, and lru_gen_update_size() needs no explicit guard=
.
> > > The active/inactive ABI update keeps its gen >=3D 0 check because an
> > > off-LRU folio has no lruvec to update.
> > >
> > > Signed-off-by: Kairui Song <kasong@tencent.com>
> > > ---
> > >  include/linux/mm_inline.h | 10 +++++-----
> > >  include/linux/mmzone.h    |  3 ++-
> > >  mm/vmscan.c               | 51 +++++++++++++++++++++++++++++--------=
----------
> > >  3 files changed, 39 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > > index 77f514143266..2c6cbd0df686 100644
> > > --- a/include/linux/mm_inline.h
> > > +++ b/include/linux/mm_inline.h
> > > @@ -317,10 +317,9 @@ static inline bool lru_gen_is_old(struct lruvec =
*lruvec, int type, int gen)
> > >                gen =3D=3D lru_gen_from_seq(min_seq + 1);
> > >  }
> > >
> > > -static inline void lru_gen_update_size(struct lruvec *lruvec, struct=
 folio *folio,
> > > -                                      int old_gen, int new_gen)
> > > +static inline void lru_gen_update_size(struct lruvec *lruvec, int ty=
pe,
> > > +                                      struct folio *folio, int old_g=
en, int new_gen)
> > >  {
> > > -       int type =3D folio_is_file_lru(folio);
> > >         int zone =3D folio_zonenum(folio);
> > >         int delta =3D folio_nr_pages(folio);
> > >         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > > @@ -399,7 +398,7 @@ static inline bool __lru_gen_add_folio(struct lru=
vec *lruvec, struct folio *foli
> > >         /* use the refs from the atomic snapshot to avoid raced updat=
e */
> > >         refs =3D lru_get_refs_flags(flags);
> > >
> > > -       lru_gen_update_size(lruvec, folio, -1, gen);
> > > +       lru_gen_update_size(lruvec, type, folio, -1, gen);
> > >         if (lru_refs_is_active(refs))
> > >                 lru +=3D LRU_ACTIVE;
> > >         __update_lru_size(lruvec, lru, zone, delta);
> > > @@ -429,6 +428,7 @@ static inline bool lru_gen_del_folio(struct lruve=
c *lruvec, struct folio *folio,
> > >         unsigned long flags;
> > >         unsigned int refs;
> > >         int gen;
> > > +       int type =3D folio_is_file_lru(folio);
> > >         int zone =3D folio_zonenum(folio);
> > >         int delta =3D folio_nr_pages(folio);
> > >         enum lru_list lru =3D folio_is_file_lru(folio) * LRU_INACTIVE=
_FILE;
> > > @@ -452,7 +452,7 @@ static inline bool lru_gen_del_folio(struct lruve=
c *lruvec, struct folio *folio,
> > >         if (!reclaiming && ((max_seq - gen) % MAX_NR_GENS) < MIN_NR_G=
ENS)
> > >                 folio_set_active(folio);
> > >
> > > -       lru_gen_update_size(lruvec, folio, gen, -1);
> > > +       lru_gen_update_size(lruvec, type, folio, gen, -1);
> > >         if (lru_refs_is_active(refs))
> > >                 lru +=3D LRU_ACTIVE;
> > >         __update_lru_size(lruvec, lru, zone, -delta);
> > > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > > index 2680e15b6de9..235fb04f8d78 100644
> > > --- a/include/linux/mmzone.h
> > > +++ b/include/linux/mmzone.h
> > > @@ -540,9 +540,10 @@ enum lruvec_flags {
> > >  #define LRU_TIER_MIN           0U
> > >  #define LRU_TIER_MAX           (MAX_NR_TIERS - 1)
> > >
> > > -/* Access source flags for folio_inc_lru_refs() */
> > > +/* Flags for folio_inc_lru_refs() */
> > >  #define LRU_REF_MAPPED         0x1U
> > >  #define LRU_REF_EXEC           0x2U
> > > +#define LRU_REF_FORCE          0x4U
> > >
> > >  #define LRU_REFS_REFERENCED    0x1
> > >  #define LRU_REFS_WORKINGSET    0x2
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index 78a1b4de7076..4576a7a369e3 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -876,37 +876,35 @@ void folio_inc_lru_refs(struct folio *folio, un=
signed int flags)
> > >         long nr_pages =3D folio_nr_pages(folio);
> > >         struct lru_gen_folio *lrugen;
> > >         struct lruvec *lruvec =3D NULL;
> > > +       bool aged =3D false;
> > >
> > > +retry:
> > >         old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> > >         do {
> > >                 new_flags =3D old_flags;
> > >                 old_gen =3D lru_get_gen_flags(old_flags);
> > >                 old_refs =3D lru_get_refs_flags(old_flags);
> > > -               file =3D folio_flags_is_file_lru(&old_flags);
> > >                 refs =3D old_refs + 1;
> > >                 gen =3D old_gen;
> > > +               file =3D folio_flags_is_file_lru(&old_flags);
> > >                 if (old_gen < 0)
> > >                         goto out;
> > > -               /*
> > > -                * Lock the lruvec if the folio is on-list. We are al=
ready
> > > -                * doing lazy promotion so in theory we don't need th=
is,
> > > -                * but for now, concurrent aging would still corrupt =
the
> > > -                * size counters.  This is a temporary limitation and
> > > -                * will be lifted very soon, so the lock here is not =
a
> > > -                * performance concern.
> > > -                */
> > >                 if (!lruvec) {
> > > -                       lruvec =3D lruvec_live_lock_irq(folio_lruvec(=
folio));
> > > +                       lruvec =3D folio_lruvec_live_get(folio);
> > >                         lrugen =3D &lruvec->lrugen;
> > >                 }
> > > +               /*
> > > +                * Read the flags before max_seq, paired with the sto=
re of a
> > > +                * gen, which samples max_seq first.
> > > +                */
> > > +               smp_rmb();
> > >                 max_seq =3D READ_ONCE(lrugen->max_seq);
> > >                 max_gen =3D lru_gen_from_seq(max_seq);
> > >                 if (old_gen =3D=3D max_gen)
> > >                         goto out;
> > > -
> > > -               if (flags & (LRU_REF_MAPPED | LRU_REF_EXEC)) {
> > > -                       /* Promote second page table access or execut=
able */
> > > -                       if (refs > LRU_REFS_REFERENCED || flags & LRU=
_REF_EXEC)
> > > +               if (flags & (LRU_REF_MAPPED | LRU_REF_EXEC | LRU_REF_=
FORCE)) {
> > > +                       if (lru_refs_is_workingset(refs) ||
> > > +                           flags & (LRU_REF_EXEC | LRU_REF_FORCE))
> > >                                 gen =3D max_gen;
> > >                         /* First access only defers eviction of an ol=
d generation */
> > >                         else if (lru_gen_is_old(lruvec, file, old_gen=
))
> > > @@ -931,9 +929,19 @@ void folio_inc_lru_refs(struct folio *folio, uns=
igned int flags)
> > >                         break;
> > >         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_=
flags));
> > >
> > > -       if (gen !=3D old_gen)
> > > -               lru_gen_update_size(lruvec, folio, old_gen, gen);
> > > -       if (lru_refs_is_active(old_refs) !=3D lru_refs_is_active(refs=
) && old_gen >=3D 0) {
> > > +       if (gen !=3D old_gen) {
> > > +               /*
> > > +                * Gen-index reuse can fool cmpxchg(). Retry lockless=
ly, accepting
> > > +                * an extra reference to avoid folio_activate() laten=
cy.
> > > +                */
> > > +               if (unlikely(READ_ONCE(lrugen->max_seq) !=3D max_seq)=
) {
> > > +                       flags =3D LRU_REF_FORCE;
> > > +                       aged =3D true;
> > > +               }
> > > +               lru_gen_update_size(lruvec, file, folio, old_gen, gen=
);
> > > +       }
> > > +
> > > +       if (lru_refs_is_active(old_refs) !=3D lru_refs_is_active(refs=
) && gen >=3D 0) {
> > >                 enum lru_list lru =3D file * LRU_INACTIVE_FILE;
> > >
> > >                 __update_lru_size(lruvec, lru + lru_refs_is_active(ol=
d_refs),
> > > @@ -941,8 +949,12 @@ void folio_inc_lru_refs(struct folio *folio, uns=
igned int flags)
> > >                 __update_lru_size(lruvec, lru + lru_refs_is_active(re=
fs),
> > >                                   folio_zonenum(folio), nr_pages);
> >
> > Could this leave the parent's local active count too high?
> > Isolation can debit the child's active count after the refs
> > 2 -> 3 CAS. If CSS_DYING is set before the stats update, the credit
> > can go to the parent. On SMP, reparenting can clamp the child's
> > negative local count to zero.
>
> Thanks again for the careful review.
>
> But hmm, I'm not sure what you mean by "too high". Maybe there is a
> temporary skew of counter due to various races, but we are fine with
> that, it will be consistent soon.
>
> The key here is update is gated on gen >=3D 0, and the gen is part of
> the CAS: only a folio that is actually on an MGLRU list has its
> refs-based active/inactive credit already accounted will be recredit
> the counter update here. An isolated folio has no lruvec to attribute
> it to, so nothing will be changed.
>
> And for reparenting, we are also following the ordering in the
> document: the updater holds rcu_read_lock() over the lruvec lookup and
> the counter update, and reparenting waits for a grace period, so
> either the memcg is already dying and we credit the parent, or the
> update lands on the child and is part of what reparenting moves
> afterwards.
>
> So the credit and the reparent move always cover the same folios and
> land on the same side: there is no path where the parent is credited
> for a folio it does not end up owning, and no debit that lands where
> the credit did not. I don't see anything to fix here.

Thanks for explaining, Kairui. I had isolation after the CAS in
mind, before the stats path rechecks CSS_DYING. I'm happy to leave
that for a follow-up.

Here's my tag for 16/17, also sent in the 15/17 thread.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
