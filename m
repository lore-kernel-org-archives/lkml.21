Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795218369;
	b=n9q/lUr9WRlTK4PVB1M0z9ATgcsx86ZzPnZr733rGwOuM5RahOiMf319g/Rgpp0zpWSF
	 amG9dh5ZPsEw7VzcwnOE7jo47WWxrnag0zlNax+mcWTbxEtlHCNGqNufVdHaPC+TF7ryk
	 +QU7R2z+Xi6EK8EXCveNPitO7LdKlwgSUweRfmNSZqdPlSuIvvFFJBDeqJFdEt6AfRM/p
	 lJx0OZE4zTr6XzdbgwH/5t7UaxrybrkEIyLImda5tdBLPmZyDdaL6+gz34YQuwA6kwB/Z
	 fUkdjDSPAHIfeYAUpIPZUbQy2+D8kX/PLdlXfysDzpTTK8Q0vRWitLV61zfwtGjN9pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TF/OrXQqNDrjszpeflyaDCo7TdpIhYTZUC07gi7hq5U=;
	b=evfk7M9ifeidMFKfb24OVGf1+z9zRPt92kDkUsXMjo9+zhZWaJdGDVZI9IKjwSTTYAfR
	 gNfCcf0oUUPlpINCaBeIdjMTVrrHgHbzE06utAShOI6jg3J3cCYVq9Q+0WNiYfTXsM5Kz
	 pF6bK7YLihesoUTOGXxHiD09WJpFJ0c9Mc3489m7n69rP8dq4UNUNb0zfi2K9md6i8R4Q
	 otjWO3tzMMQc4h73n2iz1MhlvGXduG+pGAvbmLbDPhbs08IXrEe1iad6YJQjFeocA4qzk
	 voSpL3JY/q9+h4wZrgIx3geMRXaipmcT+ksMqqbPeUUWtf8nX5BS3tIuZwrtybejPHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+PiW6VL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD99C606A6BA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD99C606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+PiW6VL
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so904503f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:46:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795218363; cv=none;
        d=google.com; s=arc-20260327;
        b=b6ERktnaCgQJRgbaJqrgti7+UaAcsGGuHu2a1RlKp4kzA8SC9RUwKNNKiqL1CFelfX
         YhQPdhKxAVZ0b5Dv1spW/lrR/EVDbCNEyhSPs9qqh4hVuSKi+xQFkWbf4OkK3LlV2zro
         x1PegsEReEryVRLeYrlNhCRvNaG96j+/QqmL0Jw+AnrMmzUYJZJXcGfbpB1wSlh9vPdy
         UA3UJekLLB3lFvUG09iyEXZd5rP1KY8oejWn2b4Ae4hMpkhAzF2JXQP1ivM49pvspYJU
         +PCaCXxiLDVuhelKthXXG8nKmM4GZJpXDQ7Big53kkxbF8CHAi7edL9zA4og5zvZ2Ec9
         J/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TF/OrXQqNDrjszpeflyaDCo7TdpIhYTZUC07gi7hq5U=;
        fh=+GNjal+pQAJDxRURzWOB6MUxPaFU/0rSD/wJRDBzlgE=;
        b=k41prFE/q4A80f/R+X0nLqkWeGxVULmTuiZzcBa/hbgLyTfJDz/AqRA+yD4pj6ZjnB
         +ecPtvRddHrNrlUVpkFLDDlLasNWJo5KOA73GlMPMn9YXQweDw3XCD1ZyeGYmHAZa1hl
         x2Z1Hota1gfvd+Im2dBxZfnF0dMWjME0OvpBPSfDHO4x3WkNvI6Puxl+EPYzwazNPrk5
         PBBMiE981bBY/QopPxT7UGeCIZnNHzg4KyzkqU91AUJWtKeDh9R7RpRpchxOtR/XMr7R
         0Z3IRsWCmbu3pgnVAmxCWMhpYDXB+rC4Tvj/YheH1QJuJFG2We61e/cxv3zqBa4O48I4
         Ql+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218363; x=1795823163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TF/OrXQqNDrjszpeflyaDCo7TdpIhYTZUC07gi7hq5U=;
        b=k+PiW6VLolf7vxB9lvbl12ZRcokDbxDeqo2OwzDCtb5oh7HN1Muk107TvcLKvY5d3S
         zCzI+eGRqAHnGXi8pv+Mn+fuPxwf7sJFac7hxyd1VGIugN8u9wRq75/vydRyAZlByNLb
         AtBeSeWV4kPcurTpIPO03IYjJxoYVJx/pjXN4fbEdaMUa8/qWkTyR3EIYzTvYGoR/GsN
         XeD+lqZujpj2itzyNpa2X9wLeg6EQcsUbRbRLd10hQim2wFHI4JIZqzwGJuZgw36UOXu
         8HVXDp/8Ri6Jaos7M7jcCbA6UYOp/SYh/S6p0f1ex1Mn6MMPkCXEV5nQnbSQsUkPklte
         9c9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218363; x=1795823163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TF/OrXQqNDrjszpeflyaDCo7TdpIhYTZUC07gi7hq5U=;
        b=QyH/lXsexiGLmptwZ8Dxn+xnu0xwnmmu8EmBFE5CrKCbwbcIyClzNAq3krRmYXSJC4
         WDTVSSJAUsKZVp21p3aIjlAuBKQgaVsm494F21B8dxXpy1y89kO7dsi91E0FKJ9wWn0+
         R+Ts50WZU1Rv7WTe7GP6cCmOWqezKoKcxBLIg8OZ7lX9TidgmN2otAAgS0ISz5Air6Ld
         vf8kauuA5vGZ2SyDdSiG907bjhIdJsvc9kS5hLw3hnHeVKKfod6NgyhMK0efcp8sGtvJ
         xd4sbiffRJyMNBI/tOk9EY9GqnJMWS2a+hG77POF1ONlzaeP8LtLve2LrZ4nVEJ8At5D
         NJ3Q==
X-Forwarded-Encrypted: i=1; AL+hErFTzVIPatmYVSr6yzxAPyqN557Ayl0TUSx8qJMT3VsNomu4cxr6whB3YJrNRnNEubsC0Mq8RxXEFrqDgds=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8Adf5sbFQ0kOv0OxMQiecxE4cO4gIEyBJzHnuN7sw5O5/CaKc
	UQhzf48uxQ98bwkFveNS8LphbRjvpddrqIyj82FAsZoabtEo6lr7MCroHcFmSZNJO1jVDt6H8AC
	OKmhU16JNrdNscIbUKQ9dSX3ZMYWdZGHYtJZCc4A=
X-Gm-Gg: AZFdTZeSndbKSPz3tnSDSxyLa0LAo+FK/kVwU67C4s3BQGLWD/mMGcbJU7VnWhnprsJ
	D4HFg92sb30IjY4CaIbSz5LOEhd0N/DCKCI1LNvh/fmyyBmU0SaTRLaxZ3j3tAiNh28bEpgTDTe
	eb2UJF/13VAiWVjSPhVffis3zhNWAiEzLDJjs8X1o3lUDOJWBgw3Fd7S+UVj/QHhLQQOjNPjkuV
	WuL0F/+827n9Ks1ihWXP5G+k2ULKvO511Qucp/g2NuQ+d3kZHlaSG9EzZHzpVIRNC86Q69Nv6Ua
	mRogkowRTUYwvToVQwGi0gG4Gg0ZAeGCvWrjwe0qZuHKUjeWIlCLxWNA1yyLR9ObH90fP8bWFuj
	0r1uWcCRf+rSpK6EdX1spN/TkC5ivofzlqKD2x48FlI6wCr3QBT9+UG/TvQMTge9BmCKeezQNAq
	6QEwbDakKuw2sFg+AYK+H8dr/vS8ouRzBS+zaMehBDkV4E0w1tjcl7aJGjEV6RvRPHEIQOfSOpP
	zQa
X-Received: by 2002:a05:6000:29ce:b0:4aa:6e52:23a9 with SMTP id
 ffacd0b85a97d-4abb0e46a60mr7207679f8f.15.1795218362987; Fri, 20 Nov 2026
 15:46:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com> <20261120041906.5785-8-kanchanapsridhar2026@gmail.com>
In-Reply-To: <20261120041906.5785-8-kanchanapsridhar2026@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 20 Nov 2026 15:45:51 -0800
X-Gm-Features: Aa3M54qBweF4AdtgZgj0DVvcadIsjWZqHEyP6IMH8n9Wq-G2vfGRxjefsq91gJw
Message-ID: <CAKEwX=PuyT7WhrA3nEQQTyw1H_5D_ZxEcSZYQSF0MyUTii36MQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] mm: zswap: Refactor and optimize
 zswap_store_pages() batch operations.
To: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Cc: hannes@cmpxchg.org, yosry@kernel.org, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 8:19=E2=80=AFPM Kanchana P. Sridhar
<kanchanapsridhar2026@gmail.com> wrote:
>
> Subsequent patch series will be submitted, that implement ideas building
> upon this batching framework:
>
>  1) Replacing zsmalloc with SLUB allocator, comprising of kmem_caches
>     for a finite # of compressed size bins. This enables bulk allocation
>     of compressed buffers in a batch that belong to the same size
>     bin. It gets rid of significant zsmalloc latency overhead (locks,
>     compressed data spanning zspages, etc.), without compromising memory
>     efficiency.

I don't think this will be a good idea, because it will make
compressed memory unmovable.

>
>  2) vmscan reclaim batching of hybrid any-order folios, that will submit
>     a batch of folios to zswap_store()'s batching framework to optimize
>     storing of batches of pages from different folios, in addition to
>     within large folios.

This one might be more complicated than its worth, but I'm not sure.

>
> Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>

Code mostly LGTM.

> ---
>  include/linux/memcontrol.h |  12 +++
>  mm/memcontrol.c            |  23 ++++-
>  mm/zswap.c                 | 181 +++++++++++++++++++++++++------------
>  3 files changed, 153 insertions(+), 63 deletions(-)
>
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 980358bc6f49..93f060818c14 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -1244,6 +1244,11 @@ struct mem_cgroup *mem_cgroup_from_css(struct cgro=
up_subsys_state *css)
>         return NULL;
>  }
>
> +static inline void obj_cgroup_get_many(struct obj_cgroup *objcg,
> +                                      unsigned long nr)
> +{
> +}
> +
>  static inline void obj_cgroup_get(struct obj_cgroup *objcg)
>  {
>  }
> @@ -1921,6 +1926,8 @@ static inline void mem_cgroup_calculate_protection_=
path(struct mem_cgroup *root,
>  #if defined(CONFIG_MEMCG) && defined(CONFIG_ZSWAP)
>  bool obj_cgroup_may_zswap(struct obj_cgroup *objcg);
>  void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size);
> +void obj_cgroup_charge_zswap_many(struct obj_cgroup *objcg, size_t size,
> +                                 u8 nr_pages, u8 nr_incomp_pages);
>  void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size);
>  bool mem_cgroup_zswap_writeback_enabled(const struct mem_cgroup *memcg);
>  #else
> @@ -1932,6 +1939,11 @@ static inline void obj_cgroup_charge_zswap(struct =
obj_cgroup *objcg,
>                                            size_t size)
>  {
>  }

Why do we still need obj_cgroup_charge_zswap() at all?

> +static inline void obj_cgroup_charge_zswap_many(struct obj_cgroup *objcg=
,
> +                                               size_t size, u8 nr_pages,
> +                                               u8 nr_incomp_pages)
> +{
> +}
>  static inline void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg,
>                                              size_t size)
>  {
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 091401cecf39..2236f5ba6304 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -6345,6 +6345,23 @@ bool obj_cgroup_may_zswap(struct obj_cgroup *objcg=
)
>   * compression and storage in zswap for this cgroup to go ahead.
>   */
>  void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size)
> +{
> +       obj_cgroup_charge_zswap_many(objcg, size, 1, (u8)(size =3D=3D PAG=
E_SIZE));
> +}
> +
> +/**
> + * obj_cgroup_charge_zswap_many - bulk charge compression backend memory
> + *                                from compressing a batch of pages.
> + * @objcg: the object cgroup
> + * @size: total compressed length of a batch of compressed objects
> + * @nr_pages: # of pages that were compressed to store in zswap
> + * @nr_incomp_pages: # of incompressible pages to store in zswap
> + *
> + * This forces the charge after obj_cgroup_may_zswap() allowed
> + * compression and storage in zswap for this cgroup to go ahead.
> + */
> +void obj_cgroup_charge_zswap_many(struct obj_cgroup *objcg, size_t size,
> +                                 u8 nr_pages, u8 nr_incomp_pages)
>  {
>         struct mem_cgroup *memcg;
>
> @@ -6363,9 +6380,9 @@ void obj_cgroup_charge_zswap(struct obj_cgroup *obj=
cg, size_t size)
>         rcu_read_lock();
>         memcg =3D obj_cgroup_memcg(objcg);
>         mod_memcg_state(memcg, MEMCG_ZSWAP_B, size);
> -       mod_memcg_state(memcg, MEMCG_ZSWAPPED, 1);
> -       if (size =3D=3D PAGE_SIZE)
> -               mod_memcg_state(memcg, MEMCG_ZSWAP_INCOMP, 1);
> +       mod_memcg_state(memcg, MEMCG_ZSWAPPED, nr_pages);
> +       if (nr_incomp_pages)
> +               mod_memcg_state(memcg, MEMCG_ZSWAP_INCOMP, nr_incomp_page=
s);
>         rcu_read_unlock();
>  }
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index df59ab0c1029..5e1fb5624ffb 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -491,12 +491,12 @@ static int __must_check zswap_pool_tryget(struct zs=
wap_pool *pool)
>  }
>
>  /* The caller must already have a reference. */
> -static void zswap_pool_get(struct zswap_pool *pool)
> +static inline void zswap_pool_get_many(struct zswap_pool *pool, u8 nr)
>  {
> -       percpu_ref_get(&pool->ref);
> +       percpu_ref_get_many(&pool->ref, nr);
>  }
>
> -static void zswap_pool_put(struct zswap_pool *pool)
> +static inline void zswap_pool_put(struct zswap_pool *pool)
>  {
>         percpu_ref_put(&pool->ref);
>  }
> @@ -1603,55 +1603,60 @@ static void shrink_worker(struct work_struct *w)
>  * main API
>  **********************************/
>
> +/* Functions called by zswap_store(), that operate on batches of pages. =
*/
> +
>  /*
> - * Store multiple pages in @zc->folio, starting from the page at index @=
start up
> - * to the page at index @end-1.
> + * zswap_init_entries() co-locates most of the zswap entry fields' setup=
 under
> + * the assumption that all phases of store processing will succeed. An i=
mportant
> + * marker to simplify catch-all cleanup in zswap_store_pages() is done b=
y
> + * initializing each entry's @handle to ERR_PTR(-EINVAL).
>   */
> -static bool zswap_store_pages(struct zswap_store_context *zc,
> -                             long start,
> -                             long end,
> -                             struct zswap_pool *pool,
> -                             struct obj_cgroup *objcg)
> +static inline void zswap_init_entries(struct zswap_store_context *zc,
> +                                     struct zswap_pool *pool,
> +                                     struct obj_cgroup *objcg)
>  {
> -       u8 i, store_fail_idx =3D 0;
> -       bool ret;
> -
> -       zc->nr_pages =3D end - start;
> -       zc->folio_start =3D start;
> -
> -       VM_WARN_ON_ONCE(zc->nr_pages <=3D 0 || zc->nr_pages > ZSWAP_MAX_B=
ATCH_SIZE);
> -
> -       ret =3D zswap_entries_cache_alloc_batch(zc, GFP_KERNEL);
> -       if (unlikely(!ret))
> -               return false;
> +       struct zswap_entry *entry;
> +       u8 i;
>
>         /*
>          * We co-locate entry initialization as much as possible here to
>          * minimize potential cache misses.
>          */
>         for (i =3D 0; i < zc->nr_pages; ++i) {
> +               entry =3D zc->entries[i];
>                 /*
> -                * Set pool_idx before the xa_store() below publishes the=
 entry, or a
> -                * concurrent reader could resolve a stale pool_idx left =
by slab reuse
> -                * to an unrelated live pool.
> +                * Set pool_idx before the xa_store() in zswap_tree_store=
s()
> +                * publishes the entry, or a concurrent reader could reso=
lve a
> +                * stale pool_idx left by slab reuse to an unrelated live=
 pool.
>                  */
> -               zc->entries[i]->pool_idx =3D pool->idx;
> -               zc->entries[i]->swpentry =3D folio_swap_entry(zc->folio,
> +               entry->pool_idx =3D pool->idx;
> +               entry->swpentry =3D folio_swap_entry(zc->folio,
>                                                         zc->folio_start +=
 i);
> -               zc->entries[i]->objcg =3D objcg;
> -               zc->entries[i]->referenced =3D true;
> -               zc->entries[i]->nid =3D zc->nid;
> -               INIT_LIST_HEAD(&zc->entries[i]->lru);
> +               entry->objcg =3D objcg;
> +               entry->referenced =3D true;
> +               entry->nid =3D zc->nid;
> +               INIT_LIST_HEAD(&entry->lru);
>         }
> +}
>
> -       for (i =3D 0; i < zc->nr_pages; ++i) {
> -               if (!zswap_compress(zc->folio, zc->folio_start + i,
> -                                   zc->entries[i], pool, zc->wb_enabled)=
)
> -                       goto store_pages_failed;
> -       }
> +/*
> + * zswap_tree_stores() stores the batch entries in xarray and adds them =
to the
> + * zswap LRU list. If an error occurs during xa_store(), localized state
> + * unwinding is done to erase prior batch entries from the xarray and de=
lete
> + * them from the zswap LRU list. Remaining batch cleanup occurs in
> + * zswap_store_pages(). As batch entries are processed, we maintain aggr=
egate
> + * statistics to do the accounting in one bulk operation.
> + */
> +static bool zswap_tree_stores(struct zswap_store_context *zc,
> +                             struct zswap_pool *pool,
> +                             struct obj_cgroup *objcg)
> +{
> +       u8 i, store_fail_idx =3D 0, nr_incomp =3D 0;
> +       size_t total_batch_comp_length =3D 0;
> +       struct zswap_entry *old, *entry;
>
>         for (i =3D 0; i < zc->nr_pages; ++i) {
> -               struct zswap_entry *old, *entry =3D zc->entries[i];
> +               entry =3D zc->entries[i];
>
>                 old =3D xa_store(swap_zswap_tree(entry->swpentry),
>                                swp_offset(entry->swpentry),
> @@ -1663,13 +1668,11 @@ static bool zswap_store_pages(struct zswap_store_=
context *zc,
>                         zswap_reject_alloc_fail++;
>                         /*
>                          * Entries up to this point have been stored in t=
he
> -                        * xarray. zswap_store() will erase them from the=
 xarray
> -                        * and call zswap_entry_free(). Local cleanup in
> -                        * 'store_pages_failed' only needs to happen for
> -                        * entries from [@i to @nr_pages).
> +                        * xarray. Local cleanup in 'tree_store_failed' n=
eeds to
> +                        * erase entries up until now.
>                          */
>                         store_fail_idx =3D i;
> -                       goto store_pages_failed;
> +                       goto tree_store_failed;
>                 }
>
>                 /*
> @@ -1680,22 +1683,10 @@ static bool zswap_store_pages(struct zswap_store_=
context *zc,
>                 if (unlikely(old))
>                         zswap_entry_free(old);
>
> -               /*
> -                * The entry is successfully compressed and stored in the=
 tree,
> -                * and further failures will be cleaned up in zswap_store=
().
> -                * Grab refs to the pool and objcg, charge zswap memory, =
and
> -                * increment zswap_stored_pages. The opposite actions wil=
l be
> -                * performed by zswap_entry_free() when the entry is remo=
ved
> -                * from the tree.
> -                */
> -               zswap_pool_get(pool);
> -               if (objcg) {
> -                       obj_cgroup_get(objcg);
> -                       obj_cgroup_charge_zswap(objcg, entry->length);
> -               }
> -               atomic_long_inc(&zswap_stored_pages);
> +               total_batch_comp_length +=3D entry->length;
> +
>                 if (unlikely(entry->length =3D=3D PAGE_SIZE))
> -                       atomic_long_inc(&zswap_stored_incompressible_page=
s);
> +                       ++nr_incomp;
>
>                 /*
>                  * We finish by adding the entry to the LRU while it's al=
ready
> @@ -1711,17 +1702,87 @@ static bool zswap_store_pages(struct zswap_store_=
context *zc,
>                         zswap_lru_add(entry);
>         }
>
> +       /*
> +        * Each batch entry is successfully compressed and stored in the =
tree,
> +        * and further failures will be cleaned up in zswap_store().
> +        * Next, we do bulk accounting for the batch: grab refs to the po=
ol and
> +        * objcg, charge zswap memory, increment zswap_stored_pages and
> +        * zswap_stored_incompressible_pages. The opposite actions will b=
e
> +        * performed by zswap_entry_free() when the entry is removed from=
 the
> +        * tree.
> +        */
> +       zswap_pool_get_many(pool, zc->nr_pages);
> +       if (objcg) {
> +               obj_cgroup_get_many(objcg, zc->nr_pages);
> +               obj_cgroup_charge_zswap_many(objcg, total_batch_comp_leng=
th,
> +                                            zc->nr_pages, nr_incomp);
> +       }
> +       atomic_long_add(zc->nr_pages, &zswap_stored_pages);
> +       if (unlikely(nr_incomp))
> +               atomic_long_add(nr_incomp, &zswap_stored_incompressible_p=
ages);
> +
> +       return true;
> +

Can you add a comment that we only clean up the current batch here,
and the clean up of other batches in the folio are deferred to
zswap_store() (or whereever up the stack it is handled?).

> +tree_store_failed:
> +       for (i =3D 0; i < store_fail_idx; ++i) {
> +               xa_erase(swap_zswap_tree(zc->entries[i]->swpentry),
> +                        swp_offset(zc->entries[i]->swpentry));

xas API?

> +               zswap_lru_del(zc->entries[i]);
> +       }
> +
> +       return false;
> +}
> +
> +/*
