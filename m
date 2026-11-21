Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795225007;
	b=RAP7TvkwiGgQTorVkkeLhq4T5QOKUQstTR9HN9HO75G5uv0ndLueAAmYk0AhgtkNE6Sz
	 PmUtUx4QbC/IFnmFm9jZQSxfseMDfsHEwgFIzf/KX5ESnIsxZuPd62lm0ftzq6QXUWClP
	 +k1juTjOsqi+B0O6+AFFJuyeauuMm5GYk8PJ1vVpc8a5bwzhslHQFC9xv/iIyMK3diSvZ
	 AJkW4ocSdQhUqjA9dsfN3dk3YNxUAXoqG43jzS6YMnIbyB9gtReAkYshJT8ap2iNy4N4d
	 n6rXfNxyKEhtvlWvdvb+QFpzSLK6LR/Jj6SoQXBOiJOyKIknAyVw3lfhH20Tg7fehZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K0GTi1D3/sOSvq62k+dOmi8FEYi6pvAy49neuOOswQM=;
	b=EeglJXcdzop706Z5j24ZGsDir/+qpl00G38Xww5rsc0XjHBlUAvwL3x4xvxdU3CDZ+2I
	 4RyNVmzqUysNsEobeKx8V9mWY70yRDxLJyK5gFWyuCCrqpaKQvhEpntt+9/wMZSEN/qWH
	 wr60mo/pMagcBtvZxQ7XI/kxkDjkDgSPGjX2A9ftbnO0o0gxkm4qJ+pUK0OrIBFVRdd9Z
	 I/S2O3TH0Af/kkIx3mlJO/HvlZgastjiMVE6hwnjMSslxMxjsSVyLUvpYMChowpVyvLoB
	 UnnNzm2b5NTcBugVRxK5NADDZbETgkJJBXQ6DwFmApm6bCPyQSS2oWY2qxOupm8SaNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVemKX6y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67CE606A688
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C67CE606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVemKX6y
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so14100181fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795225000; cv=none;
        d=google.com; s=arc-20260327;
        b=NSeD9uPnGoNKynd8MT4L4pIVnLBkJPscaZsNapE00nGQ3oqQ3g0zeB5a1mlRvoyyXU
         jPo/u7SE3lpIksRxCX4zVMUq2J6DOoZRTzJqsY419fjwUcFXARTvHueBfcl8XpNVP4aB
         00nmpY132DAnlqxHudyrs1Ewk3vqJwX2DndeM3vlbx21h2RnSTCysnQQWaTO8E5n4gZV
         LjBTVwiFduDH30Hmyj7zDbUCNBB3OUaLhZnZSmPe9AifQGnmoAkt7jE9TPC0B4sbwLbs
         Y/LAFwtAqAJ56US8zWUyJ2eVQB71KiUKA87Jcwlof1FkDIPwUUa80qkrFd/RSNIZ/vQ1
         zdSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K0GTi1D3/sOSvq62k+dOmi8FEYi6pvAy49neuOOswQM=;
        fh=G/TJWIrc11MtgnAoEc69mrp++ywTDZoF4VBCaUqcqko=;
        b=k3d6nCdMXcZeQXB6MtotqcamTVN7T/3sZ9+QRGavYZsvMelU176MkwdiIy7fG9Twro
         +T5l81JwGP6LumGKUR2GqYkoSSThB+2tmppqcdsXd3y8ZV/w8MeHvlQLCUWG9lUf0at4
         cFdxTXeFcqIeorxhco2eymUvh65d5g6imLx2mERLXyTI4YKv77J2cICbCERpsvaQsv4S
         vF5KdghabQZUJQvv0oYNDpV90SITHUptHS/gwylAr5Pz8qEMjE3O8GAJYhgmfNBNC2r3
         B0m2n6cTk4nUMuFw4Le+pfNmG1wpfSvpQ8Pq51k+ADCce9eLDI0j3cH7cDg4FJXxubMu
         tzlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795225000; x=1795829800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K0GTi1D3/sOSvq62k+dOmi8FEYi6pvAy49neuOOswQM=;
        b=VVemKX6ycG5CMVtsLzV59geYQP6Z1zz79C8wnoFccXjxxnx53SV0T69Cgeu1kEOGLv
         DdRvfzX9N0lPSJlDaXmuzhJTJ61a1gvgDymyCvtcYCX65bhNtgatYoYdJySycFPjET89
         YFYU+TET2TK5v8h5I0nFaeF6nqayuKd+Urw1f8K14AgZTSuwfDGYybnANqurraAkQfeT
         ObFc1SQ3IzWq199O5/k2VedGEQpZ1TAbTcT0Jcdo32lA1jrVHksg7fWN34mzjMlm/j0F
         3wCgxibALa+I4YlwdqONat5mbBVc/XGmuNZEJnVY9PBdRhjo5AJ076MlsWKLQ1tE7Ods
         SkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795225000; x=1795829800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0GTi1D3/sOSvq62k+dOmi8FEYi6pvAy49neuOOswQM=;
        b=GZ0HPDZN+8xVOOQauYQ3/MUbFYZP2JbB9Nmalgm1KRwPkoLhIN4IbRtq3EvYT0Ueiw
         gUggFxT39mM4nbQHN/+4Iujk35MU863/iVWzL11Q4uZlvZzSGDjtzirF1HnSZX4q1/6l
         Sl9B+5+BbVbWhGOewqWXOBC70lB3L3uItnKQ7C5CH2pCgXRVxtfpZmRHiEHATqlwsi8n
         7QHBoBNMUXTCLG0D8VrdZ+GKYGnfsaY62GgolHor1dNGNtfUrtfZcMAZmjtbkql7DoMb
         mlcu9d8OTbtGmQ+4tw6f8ijU2BOwVtQSHp+tib2GklBpTa906x0QG2S7JPKthobMMQ85
         Lr9Q==
X-Forwarded-Encrypted: i=1; AL+hErGOJJuuwNCRZz02UE2ZbqYyBtQEy2u2TJnK5maGl8YaDHcq2tu6eAzkKLRHoqLmp9mxhgkBKXbHFn+vtA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WJQt2YaNewcg2Alpp2TOExhDVU5z+2uBa2HD9u8otKp0qreSp
	8fS336/G0Xu9sP0aYoWr/EaEHH3i4ziacqsRwcGFBtsNwmQ0QKf5MoMeeWIqQu/SMbt+OaCFHH/
	8NDvNWtWJeCjknx40KsuZgP0hbsudoCQ=
X-Gm-Gg: AZFdTZf3YU/Mea4fc0oW9iTdEmPN176DWIcYE9fC4vXIrA7T1t9gaf6QpfxTAFhulnm
	32UcXMhc/VoMTctyo31qFDW2Pkfk8cIuUJjQ5NRFQQfTsxcYjsK/J7NXQ/ti/7EqQKxamJgDuWD
	wkvedkQHBGgfOEK0iI/qajUxgeV1ryaGCmDcdAug5hTrA1xSPUmPy78h0YpdFhq4N+hOhsROA3d
	mFbATzyMh+RuD+O9oasjmGYPF6bucUID59KlhcdtvhvjChLFeBMxkvRghYlSrT6GEfKXuuZuhzK
	hX8yd2DIQTT4HNS9XgAjieD22pYegmoRGu/wLAl+BdFWC4hQ1jlhpt891NmPcO33rMAsY7Mpo1z
	Se5K2mq/GgLsfRzjx3ciOoGHfFvHwvA8ywZvu
X-Received: by 2002:a2e:bd06:0:b0:3ac:7ad6:2003 with SMTP id
 38308e7fff4ca-3ae7f9b1020mr13168511fa.6.1795224999709; Fri, 20 Nov 2026
 17:36:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com>
 <20261120041906.5785-8-kanchanapsridhar2026@gmail.com> <CAKEwX=PuyT7WhrA3nEQQTyw1H_5D_ZxEcSZYQSF0MyUTii36MQ@mail.gmail.com>
In-Reply-To: <CAKEwX=PuyT7WhrA3nEQQTyw1H_5D_ZxEcSZYQSF0MyUTii36MQ@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 20 Nov 2026 17:36:27 -0800
X-Gm-Features: Aa3M54oYJbz1gF7DnN1eSJnxvBH5vcc-wU5reSCTlWZdMlRlH4dttzatd7d_HsQ
Message-ID: <CACpmpoeerjFsaZ7ap9wJCFDGHdtepbGxeSkh4QFo2VkMKKUEAw@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] mm: zswap: Refactor and optimize
 zswap_store_pages() batch operations.
To: Nhat Pham <nphamcs@gmail.com>
Cc: hannes@cmpxchg.org, yosry@kernel.org, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 3:46=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Thu, Nov 19, 2026 at 8:19=E2=80=AFPM Kanchana P. Sridhar
> <kanchanapsridhar2026@gmail.com> wrote:
> >
> > Subsequent patch series will be submitted, that implement ideas buildin=
g
> > upon this batching framework:
> >
> >  1) Replacing zsmalloc with SLUB allocator, comprising of kmem_caches
> >     for a finite # of compressed size bins. This enables bulk allocatio=
n
> >     of compressed buffers in a batch that belong to the same size
> >     bin. It gets rid of significant zsmalloc latency overhead (locks,
> >     compressed data spanning zspages, etc.), without compromising memor=
y
> >     efficiency.
>
> I don't think this will be a good idea, because it will make
> compressed memory unmovable.

Yes, SLUB comes with the constraint of the compressed memory being
unmovable. However, I want to better understand the trade off between
compressed memory migration vs. potentially representing it as SLUB
unmovable memory that needs to be written back. I was hoping to
include a discussion of my understanding of the pros-and-cons when I
submit this RFC, to get your thoughts.

>
> >
> >  2) vmscan reclaim batching of hybrid any-order folios, that will submi=
t
> >     a batch of folios to zswap_store()'s batching framework to optimize
> >     storing of batches of pages from different folios, in addition to
> >     within large folios.
>
> This one might be more complicated than its worth, but I'm not sure.

This does benefit latency a lot! But, one step at a time :)

>
> >
> > Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> Code mostly LGTM.

Thanks for reviewing and providing valuable comments.

>
> > ---
> >  include/linux/memcontrol.h |  12 +++
> >  mm/memcontrol.c            |  23 ++++-
> >  mm/zswap.c                 | 181 +++++++++++++++++++++++++------------
> >  3 files changed, 153 insertions(+), 63 deletions(-)
> >
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 980358bc6f49..93f060818c14 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -1244,6 +1244,11 @@ struct mem_cgroup *mem_cgroup_from_css(struct cg=
roup_subsys_state *css)
> >         return NULL;
> >  }
> >
> > +static inline void obj_cgroup_get_many(struct obj_cgroup *objcg,
> > +                                      unsigned long nr)
> > +{
> > +}
> > +
> >  static inline void obj_cgroup_get(struct obj_cgroup *objcg)
> >  {
> >  }
> > @@ -1921,6 +1926,8 @@ static inline void mem_cgroup_calculate_protectio=
n_path(struct mem_cgroup *root,
> >  #if defined(CONFIG_MEMCG) && defined(CONFIG_ZSWAP)
> >  bool obj_cgroup_may_zswap(struct obj_cgroup *objcg);
> >  void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size);
> > +void obj_cgroup_charge_zswap_many(struct obj_cgroup *objcg, size_t siz=
e,
> > +                                 u8 nr_pages, u8 nr_incomp_pages);
> >  void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size);
> >  bool mem_cgroup_zswap_writeback_enabled(const struct mem_cgroup *memcg=
);
> >  #else
> > @@ -1932,6 +1939,11 @@ static inline void obj_cgroup_charge_zswap(struc=
t obj_cgroup *objcg,
> >                                            size_t size)
> >  {
> >  }
>
> Why do we still need obj_cgroup_charge_zswap() at all?

Ok, I will delete it in next rev.

>
> > +static inline void obj_cgroup_charge_zswap_many(struct obj_cgroup *obj=
cg,
> > +                                               size_t size, u8 nr_page=
s,
> > +                                               u8 nr_incomp_pages)
> > +{
> > +}
> >  static inline void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg,
> >                                              size_t size)
> >  {
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 091401cecf39..2236f5ba6304 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -6345,6 +6345,23 @@ bool obj_cgroup_may_zswap(struct obj_cgroup *obj=
cg)
> >   * compression and storage in zswap for this cgroup to go ahead.
> >   */
> >  void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size)
> > +{
> > +       obj_cgroup_charge_zswap_many(objcg, size, 1, (u8)(size =3D=3D P=
AGE_SIZE));
> > +}
> > +
> > +/**
> > + * obj_cgroup_charge_zswap_many - bulk charge compression backend memo=
ry
> > + *                                from compressing a batch of pages.
> > + * @objcg: the object cgroup
> > + * @size: total compressed length of a batch of compressed objects
> > + * @nr_pages: # of pages that were compressed to store in zswap
> > + * @nr_incomp_pages: # of incompressible pages to store in zswap
> > + *
> > + * This forces the charge after obj_cgroup_may_zswap() allowed
> > + * compression and storage in zswap for this cgroup to go ahead.
> > + */
> > +void obj_cgroup_charge_zswap_many(struct obj_cgroup *objcg, size_t siz=
e,
> > +                                 u8 nr_pages, u8 nr_incomp_pages)
> >  {
> >         struct mem_cgroup *memcg;
> >
> > @@ -6363,9 +6380,9 @@ void obj_cgroup_charge_zswap(struct obj_cgroup *o=
bjcg, size_t size)
> >         rcu_read_lock();
> >         memcg =3D obj_cgroup_memcg(objcg);
> >         mod_memcg_state(memcg, MEMCG_ZSWAP_B, size);
> > -       mod_memcg_state(memcg, MEMCG_ZSWAPPED, 1);
> > -       if (size =3D=3D PAGE_SIZE)
> > -               mod_memcg_state(memcg, MEMCG_ZSWAP_INCOMP, 1);
> > +       mod_memcg_state(memcg, MEMCG_ZSWAPPED, nr_pages);
> > +       if (nr_incomp_pages)
> > +               mod_memcg_state(memcg, MEMCG_ZSWAP_INCOMP, nr_incomp_pa=
ges);
> >         rcu_read_unlock();
> >  }
> >
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index df59ab0c1029..5e1fb5624ffb 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -491,12 +491,12 @@ static int __must_check zswap_pool_tryget(struct =
zswap_pool *pool)
> >  }
> >
> >  /* The caller must already have a reference. */
> > -static void zswap_pool_get(struct zswap_pool *pool)
> > +static inline void zswap_pool_get_many(struct zswap_pool *pool, u8 nr)
> >  {
> > -       percpu_ref_get(&pool->ref);
> > +       percpu_ref_get_many(&pool->ref, nr);
> >  }
> >
> > -static void zswap_pool_put(struct zswap_pool *pool)
> > +static inline void zswap_pool_put(struct zswap_pool *pool)
> >  {
> >         percpu_ref_put(&pool->ref);
> >  }
> > @@ -1603,55 +1603,60 @@ static void shrink_worker(struct work_struct *w=
)
> >  * main API
> >  **********************************/
> >
> > +/* Functions called by zswap_store(), that operate on batches of pages=
. */
> > +
> >  /*
> > - * Store multiple pages in @zc->folio, starting from the page at index=
 @start up
> > - * to the page at index @end-1.
> > + * zswap_init_entries() co-locates most of the zswap entry fields' set=
up under
> > + * the assumption that all phases of store processing will succeed. An=
 important
> > + * marker to simplify catch-all cleanup in zswap_store_pages() is done=
 by
> > + * initializing each entry's @handle to ERR_PTR(-EINVAL).
> >   */
> > -static bool zswap_store_pages(struct zswap_store_context *zc,
> > -                             long start,
> > -                             long end,
> > -                             struct zswap_pool *pool,
> > -                             struct obj_cgroup *objcg)
> > +static inline void zswap_init_entries(struct zswap_store_context *zc,
> > +                                     struct zswap_pool *pool,
> > +                                     struct obj_cgroup *objcg)
> >  {
> > -       u8 i, store_fail_idx =3D 0;
> > -       bool ret;
> > -
> > -       zc->nr_pages =3D end - start;
> > -       zc->folio_start =3D start;
> > -
> > -       VM_WARN_ON_ONCE(zc->nr_pages <=3D 0 || zc->nr_pages > ZSWAP_MAX=
_BATCH_SIZE);
> > -
> > -       ret =3D zswap_entries_cache_alloc_batch(zc, GFP_KERNEL);
> > -       if (unlikely(!ret))
> > -               return false;
> > +       struct zswap_entry *entry;
> > +       u8 i;
> >
> >         /*
> >          * We co-locate entry initialization as much as possible here t=
o
> >          * minimize potential cache misses.
> >          */
> >         for (i =3D 0; i < zc->nr_pages; ++i) {
> > +               entry =3D zc->entries[i];
> >                 /*
> > -                * Set pool_idx before the xa_store() below publishes t=
he entry, or a
> > -                * concurrent reader could resolve a stale pool_idx lef=
t by slab reuse
> > -                * to an unrelated live pool.
> > +                * Set pool_idx before the xa_store() in zswap_tree_sto=
res()
> > +                * publishes the entry, or a concurrent reader could re=
solve a
> > +                * stale pool_idx left by slab reuse to an unrelated li=
ve pool.
> >                  */
> > -               zc->entries[i]->pool_idx =3D pool->idx;
> > -               zc->entries[i]->swpentry =3D folio_swap_entry(zc->folio=
,
> > +               entry->pool_idx =3D pool->idx;
> > +               entry->swpentry =3D folio_swap_entry(zc->folio,
> >                                                         zc->folio_start=
 + i);
> > -               zc->entries[i]->objcg =3D objcg;
> > -               zc->entries[i]->referenced =3D true;
> > -               zc->entries[i]->nid =3D zc->nid;
> > -               INIT_LIST_HEAD(&zc->entries[i]->lru);
> > +               entry->objcg =3D objcg;
> > +               entry->referenced =3D true;
> > +               entry->nid =3D zc->nid;
> > +               INIT_LIST_HEAD(&entry->lru);
> >         }
> > +}
> >
> > -       for (i =3D 0; i < zc->nr_pages; ++i) {
> > -               if (!zswap_compress(zc->folio, zc->folio_start + i,
> > -                                   zc->entries[i], pool, zc->wb_enable=
d))
> > -                       goto store_pages_failed;
> > -       }
> > +/*
> > + * zswap_tree_stores() stores the batch entries in xarray and adds the=
m to the
> > + * zswap LRU list. If an error occurs during xa_store(), localized sta=
te
> > + * unwinding is done to erase prior batch entries from the xarray and =
delete
> > + * them from the zswap LRU list. Remaining batch cleanup occurs in
> > + * zswap_store_pages(). As batch entries are processed, we maintain ag=
gregate
> > + * statistics to do the accounting in one bulk operation.
> > + */
> > +static bool zswap_tree_stores(struct zswap_store_context *zc,
> > +                             struct zswap_pool *pool,
> > +                             struct obj_cgroup *objcg)
> > +{
> > +       u8 i, store_fail_idx =3D 0, nr_incomp =3D 0;
> > +       size_t total_batch_comp_length =3D 0;
> > +       struct zswap_entry *old, *entry;
> >
> >         for (i =3D 0; i < zc->nr_pages; ++i) {
> > -               struct zswap_entry *old, *entry =3D zc->entries[i];
> > +               entry =3D zc->entries[i];
> >
> >                 old =3D xa_store(swap_zswap_tree(entry->swpentry),
> >                                swp_offset(entry->swpentry),
> > @@ -1663,13 +1668,11 @@ static bool zswap_store_pages(struct zswap_stor=
e_context *zc,
> >                         zswap_reject_alloc_fail++;
> >                         /*
> >                          * Entries up to this point have been stored in=
 the
> > -                        * xarray. zswap_store() will erase them from t=
he xarray
> > -                        * and call zswap_entry_free(). Local cleanup i=
n
> > -                        * 'store_pages_failed' only needs to happen fo=
r
> > -                        * entries from [@i to @nr_pages).
> > +                        * xarray. Local cleanup in 'tree_store_failed'=
 needs to
> > +                        * erase entries up until now.
> >                          */
> >                         store_fail_idx =3D i;
> > -                       goto store_pages_failed;
> > +                       goto tree_store_failed;
> >                 }
> >
> >                 /*
> > @@ -1680,22 +1683,10 @@ static bool zswap_store_pages(struct zswap_stor=
e_context *zc,
> >                 if (unlikely(old))
> >                         zswap_entry_free(old);
> >
> > -               /*
> > -                * The entry is successfully compressed and stored in t=
he tree,
> > -                * and further failures will be cleaned up in zswap_sto=
re().
> > -                * Grab refs to the pool and objcg, charge zswap memory=
, and
> > -                * increment zswap_stored_pages. The opposite actions w=
ill be
> > -                * performed by zswap_entry_free() when the entry is re=
moved
> > -                * from the tree.
> > -                */
> > -               zswap_pool_get(pool);
> > -               if (objcg) {
> > -                       obj_cgroup_get(objcg);
> > -                       obj_cgroup_charge_zswap(objcg, entry->length);
> > -               }
> > -               atomic_long_inc(&zswap_stored_pages);
> > +               total_batch_comp_length +=3D entry->length;
> > +
> >                 if (unlikely(entry->length =3D=3D PAGE_SIZE))
> > -                       atomic_long_inc(&zswap_stored_incompressible_pa=
ges);
> > +                       ++nr_incomp;
> >
> >                 /*
> >                  * We finish by adding the entry to the LRU while it's =
already
> > @@ -1711,17 +1702,87 @@ static bool zswap_store_pages(struct zswap_stor=
e_context *zc,
> >                         zswap_lru_add(entry);
> >         }
> >
> > +       /*
> > +        * Each batch entry is successfully compressed and stored in th=
e tree,
> > +        * and further failures will be cleaned up in zswap_store().
> > +        * Next, we do bulk accounting for the batch: grab refs to the =
pool and
> > +        * objcg, charge zswap memory, increment zswap_stored_pages and
> > +        * zswap_stored_incompressible_pages. The opposite actions will=
 be
> > +        * performed by zswap_entry_free() when the entry is removed fr=
om the
> > +        * tree.
> > +        */
> > +       zswap_pool_get_many(pool, zc->nr_pages);
> > +       if (objcg) {
> > +               obj_cgroup_get_many(objcg, zc->nr_pages);
> > +               obj_cgroup_charge_zswap_many(objcg, total_batch_comp_le=
ngth,
> > +                                            zc->nr_pages, nr_incomp);
> > +       }
> > +       atomic_long_add(zc->nr_pages, &zswap_stored_pages);
> > +       if (unlikely(nr_incomp))
> > +               atomic_long_add(nr_incomp, &zswap_stored_incompressible=
_pages);
> > +
> > +       return true;
> > +
>
> Can you add a comment that we only clean up the current batch here,
> and the clean up of other batches in the folio are deferred to
> zswap_store() (or whereever up the stack it is handled?).

Sure, will do.

>
> > +tree_store_failed:
> > +       for (i =3D 0; i < store_fail_idx; ++i) {
> > +               xa_erase(swap_zswap_tree(zc->entries[i]->swpentry),
> > +                        swp_offset(zc->entries[i]->swpentry));
>
> xas API?

Sure, I need to spend time on it, thinking best if it is a subsequent patch=
.

>
> > +               zswap_lru_del(zc->entries[i]);
> > +       }
> > +
> > +       return false;
> > +}
> > +
> > +/*
