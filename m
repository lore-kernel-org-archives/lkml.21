Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795218682;
	b=awr7rphNw//dBTZlQ3zMWFzcLMXJcsKIBGcbhi4dgS75pL5t7NDqo7nP1JRfRzvU5Qzd
	 3QtmQqFVJsNLLSdfSbieVPh7UxvY2CgHXdTlnmK06yjdLo0TlK6JB9N+88RPGm9Te7Fz8
	 YryChFykYZeksbB0J5YdHcaawmcnNhAaeJRBiiIzdUyLrBzQzVHktcGHsA3tBk8iohPu1
	 lKaJ6+4nCeni4epVFAn0LqI1R+H4DuFyCSCe7VAg8CjUuX2FNPhrbU+OuMSoDrDMWdgQc
	 S5I7mITKCg09DMNSN9NFmo5HWJAW7tnXgP1q/9G662OBWiZ0zRrAknCdN0F9wqYqUfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KHxTN0uS+Qg1aDUZNJtoDzFicoj8vWJ+yr5kM/h7aeY=;
	b=V9zc59o0kfjJawd1njhY4ouKEGdjQO//R5YzE2q14w0l9PczsmBOzYcXcIxQUfiCpbBf
	 4v/NjfaXUpiQZLOwIr3SvjqcLMOcel++Z8ZKQwv86QtzaNbeAaXo5FBju84o6GcQJZ+Ok
	 BAvPLfhcjtdwHISlaLL68gcsdbH5wBMTTo1svE+5dPV01kL6PB5mWvDOg0SohBS2htYk7
	 ieXk9X0yRqP/OiEjaTF6wUqpG4MLHRoIRcEYYjqma/ATVxz+we4c26+aPmAHwJZPF4+iK
	 gZEidjdC4L3iIDQHdhX9qcqNaD1bSq4zraceSL6VuWX7ceath247QUo5m+8KoN7U8Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StStSgBw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1600606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1600606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StStSgBw
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14470729eso1214913e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795218677; cv=none;
        d=google.com; s=arc-20260327;
        b=kz9viQubp1VtZWYatVYpSZl/rX0cApUCtxeLSwqATkt97x4Am+fonW1NCMg/x3ITH8
         7d6rGMG5HiW9KTNxZaidsAqWTd4s5OP0lFDY5YHoEZrDS2akJdAW0KoKV5zbR//vmTht
         unGRNuLRLZbJ7UMTEmMpjQEZU8nfl9U6JDGH+dbVzil9n+huFaYdtQE14fQLImQBHU65
         pURpSH8QzUlv+830jQwOuCAZ7gwAdtqnq9WLNbJTWRMjZA0E/VxmWeybr0dRmBTlrpjz
         W//6FfFV9kjxRGSJF5mnLt5cqpr4CmwOTOO1goEOXTInO9ZNOa1jLGXhdVQMFvfPphPN
         7BFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KHxTN0uS+Qg1aDUZNJtoDzFicoj8vWJ+yr5kM/h7aeY=;
        fh=K+aF3jbBUDy8rQqueuat2OhvDcW2Grt9W9cuZD75eLk=;
        b=SULDusSnxgsI5X2MkkgRr31znJ3g279CytudIpLgqFHhIdC0BdOkqUCqNa+GCrCn6n
         6j9jrsYKBMDI+xL57tGRpRhAZCRrytvLRyNcRhX6i+3QeRYZISh3DOepToqLy63jSPQQ
         CBnzB2Gju6yEbIa1DbDnUtcAWsHewiBHQC8S4QhNPlDZiOJYKD4ElgqGHNIUFZsGFGkV
         V7e8pADbbO/6OI8yRiUB9ppbD4WycuuKQ9TGzMNlGYbv402IaTOADnRHhp+HGcOkTuqK
         7oLLIMdTCd1vpJGrfx6FTbs5GE7iaFnzqfiRrdMc76jFd0odPcGw5tElJ3xOD7mm29vD
         M2Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218677; x=1795823477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHxTN0uS+Qg1aDUZNJtoDzFicoj8vWJ+yr5kM/h7aeY=;
        b=StStSgBwqT9sMp6/7BXRRH5W7+XhxeyfsKRSJhwdqGRFKiu1P/ExdW4+gCD77bVp0C
         keMt0+TKoHMJF+kKjTPx3WVS/Ox+cGVSTQ/qLfHjONK11hc+11km+HgLgpB0x/y3BFyS
         zrUhlVM0nQcqJloTQzWGnA/pZY2sgCdzmgzKWXrnZZ/MBWhXZG/tBiU3O5XqVRBl25ya
         76BeqBCYZ8fHFTPDD+CTmTYvpELpEJ5gBm2xlTI2ZhAE3Wvj6PdvNBRsGhjfyhLEZ6UE
         +2jxyPJFSj2VZ7JylIclS24YCBMDHyeLpoXXnzfiSw6D1hhrNoAzMJnvJvXjhQnv4owX
         Gkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218677; x=1795823477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHxTN0uS+Qg1aDUZNJtoDzFicoj8vWJ+yr5kM/h7aeY=;
        b=2BItKMcVJc3z5jGH0Nc/rTn5XHgGEmyVRjHF3yoI2pR1dT0wQs3x2x9wKfJV6YyE9Y
         mAjqVM/q/CGiBVWSXyYrcO4Z/5C4Lu5BRu2Dq7AcvgdeyccnwvWv4zcAQvzHhahrMurj
         uoyeKftYhLUKCVBclSEbDiNXeZZcuSK7yn4qv0jm74jROjSo3j4JK1tCvTOSdnOGFuIJ
         VZtEVffHRQlZu6lKyjAfeTIM7IkjNR77RnTs2cpHAf5h+mH9nt2/CDsly+aDdIFE0IAx
         OaKRU/osArefmSZXgTGXaFvhYGwGICue+7NrYC+leAR7CxnlP/cx38LZHbuonLNfs5s2
         oX/A==
X-Forwarded-Encrypted: i=1; AL+hErG7eVAIPAR0slOVBelv3/UpkQ1gJw4ADaT+JDwJCd3OM5k+9U7JTu9Fhzv+x8vaDo9nICGAt2opVRGHzZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GmAN6IhY/dT5dEQI9ccHx82+SOAOC31t2uu+54zztOVVUZnC4
	J8yXO9np+/yqS3IAVFk+VrsZNrS6UwUo0tI+mBRupEt6d/n2EUUmNCx5rUQejmVEFaygB7PQynG
	Rml/xHeYyPWkUqCOgsNpK3sZbotgs07E=
X-Gm-Gg: AZFdTZdO1/WqBzDGBqKI6c1PThF8YtbiyKiKeT8/xVpcb6/hJkgy+/668i52Obt9DuE
	SVIks1HT8tp4Qpsi4DY3ktL5sgfXEVdY0tdjb+3HigvnkS8gZTlJvYToCZb1Dm/5UFPfIFlQ4EO
	OzTciq6BoR56FeRDQAYgXVw1we/ohVWQ0gaeremxgkwvqP5ynwgIUwx0550KTbhk1O8uMQ/EgnH
	Q14OqkX5jTuodWBoA+bEat5iJvub6oXL5kV9Mi05UKFTSkE88AX1KNveSZNa+gJHcXT6Wye9gTY
	6ATEHpB35lmlV4Vw5U5gL6tPqyEveE5oro+IVOq4NOQfW52oZ+IgkmZOyNEVoQj/puwA35tms4d
	+4Rg/QOPT7wP8QGCmpu1fbxot3TzAmJ5M8OmFkxcGj1GWI8KenKnRnKMhIQ==
X-Received: by 2002:a05:6512:3da4:b0:5c1:57ba:f848 with SMTP id
 2adb3069b0e04-5c1bc576a77mr1562754e87.0.1795218676722; Fri, 20 Nov 2026
 15:51:16 -0800 (PST)
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
 <20261120041906.5785-7-kanchanapsridhar2026@gmail.com> <CAKEwX=Pr6t8w676ztfrONaKrRKoy6NS1priTb2c2XUikNhYU7A@mail.gmail.com>
In-Reply-To: <CAKEwX=Pr6t8w676ztfrONaKrRKoy6NS1priTb2c2XUikNhYU7A@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 20 Nov 2026 15:51:04 -0800
X-Gm-Features: Aa3M54pGq-g0FQY51hIMaRGadQCw3Jar2bC1oRgHGQK3b2ePQ8Bn-IWKzW3So3o
Message-ID: <CACpmpocuNQE=6m=WJ7oX_1ZP0WvwQm4T=6KFv3ya2k7oNvM=yw@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] mm: zswap: Store large folios in batches.
To: Nhat Pham <nphamcs@gmail.com>
Cc: hannes@cmpxchg.org, yosry@kernel.org, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 3:25=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Thu, Nov 19, 2026 at 8:19=E2=80=AFPM Kanchana P. Sridhar
> <kanchanapsridhar2026@gmail.com> wrote:
> >
> > Use batching when storing large folios in zswap. A new constant,
> > ZSWAP_MAX_BATCH_SIZE is defined as 4U to support processing batches of
> > up to 4 pages at a time while storing large folios. This commit
> > modifies the "store single page" approach to "store a batch of pages".
> >
> > As part of CPU onlining per-CPU acomp_ctx setup, ZSWAP_MAX_BATCH_SIZE
> > compression buffers are allocated to eventually be able to compress and
> > store ZSWAP_MAX_BATCH_SIZE pages. This happens in subsequent commits.
> >
> > For existing software compressors, the extra overhead is the
> > the extra 'buffers' pointer, 3 additional elements in 'buffers' and 3
> > additional 4K space per 'buffers[i]': in all ~12 KB per-CPU on
> > x86_64. Only the first buffer is currently used.
> >
> > zswap_store_page() is replaced with zswap_store_pages(), which processe=
s
> > a batch of pages and allows for batching optimizations. For now, only
> > optimize allocating entries by using batch allocations from the slab
> > cache.
> >
> > Avoid repeatedly calling mem_cgroup_zswap_writeback_enabled() for every
> > page and only call it once for the folio, since the entire folio is
> > charged to a single memcg. Similarly, obtain the nid once to use during
> > each batch store of a folio. To facilitate this, a "struct
> > zswap_store_context" is introduced to keep function parameter lists
> > concise.
> >
> > Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
> > Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
> > ---
> >  mm/zswap.c | 307 +++++++++++++++++++++++++++++++++++++----------------
> >  1 file changed, 217 insertions(+), 90 deletions(-)
> >
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 78d9694f75b5..df59ab0c1029 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -85,6 +85,9 @@ static bool zswap_pool_reached_full;
> >
> >  #define ZSWAP_PARAM_UNSET ""
> >
> > +/* Limit the batch size to limit per-CPU memory usage for dst buffers.=
 */
> > +#define ZSWAP_MAX_BATCH_SIZE 4U
> > +
> >  static int zswap_setup(void);
> >
> >  /* Enable/disable zswap */
> > @@ -144,10 +147,12 @@ struct zswap_acomp_req {
> >         struct mutex mutex;
> >  };
> >
> > -/* The compression mutex also protects the output buffer. */
> > +/*
> > + * The compression mutex also protects the output buffer(s).
> > + */
> >  struct zswap_comp_ctx {
> >         struct zswap_acomp_req areq;
> > -       u8 *buffer;
> > +       u8 **buffers;
> >  };
> >
> >  /* Separate requests, so that decompression does not wait for compress=
ion. */
> > @@ -162,6 +167,7 @@ struct crypto_acomp_ctx {
> >   * The only case where lru_lock is not acquired while holding tree.loc=
k is
> >   * when a zswap_entry is taken off the lru for writeback, in that case=
 it
> >   * needs to be verified that it's still valid in the tree.
> > + *
> >   */
> >  struct zswap_pool {
> >         struct zs_pool *zs_pool;
> > @@ -226,6 +232,15 @@ struct zswap_entry {
> >         struct list_head lru;
> >  };
> >
> > +struct zswap_store_context {
> > +       struct folio *folio;
> > +       long folio_start;
> > +       bool wb_enabled;
> > +       int nid;
> > +       u8 nr_pages;
> > +       struct zswap_entry *entries[ZSWAP_MAX_BATCH_SIZE];
> > +};
> > +
> >  /*
> >   * No RCU section is needed around the returned pointer: a stored entr=
y pins
> >   * its pool via percpu_ref (taken in zswap_store_page()), so the id ca=
nnot be
> > @@ -284,6 +299,8 @@ static void __zswap_pool_empty(struct percpu_ref *r=
ef);
> >
> >  static void acomp_ctx_free(struct crypto_acomp_ctx *acomp_ctx)
> >  {
> > +       u8 i;
> > +
> >         if (!acomp_ctx)
> >                 return;
> >
> > @@ -302,8 +319,12 @@ static void acomp_ctx_free(struct crypto_acomp_ctx=
 *acomp_ctx)
> >
> >         acomp_ctx->acomp =3D NULL;
> >
> > -       kfree(acomp_ctx->comp.buffer);
> > -       acomp_ctx->comp.buffer =3D NULL;
> > +       if (acomp_ctx->comp.buffers) {
> > +               for (i =3D 0; i < ZSWAP_MAX_BATCH_SIZE; ++i)
> > +                       kfree(acomp_ctx->comp.buffers[i]);
> > +               kfree(acomp_ctx->comp.buffers);
> > +       }
> > +       acomp_ctx->comp.buffers =3D NULL;
> >  }
> >
> >  static struct zswap_pool *zswap_pool_create(char *compressor)
> > @@ -388,6 +409,7 @@ static struct zswap_pool *zswap_pool_create(char *c=
ompressor)
> >  cpuhp_add_fail:
> >         for_each_possible_cpu(cpu)
> >                 acomp_ctx_free(per_cpu_ptr(pool->acomp_ctx, cpu));
> > +
> >  error:
> >         if (pool->acomp_ctx)
> >                 free_percpu(pool->acomp_ctx);
> > @@ -778,6 +800,44 @@ static void zswap_entry_cache_free(struct zswap_en=
try *entry)
> >         kmem_cache_free(zswap_entry_cache, entry);
> >  }
> >
> > +static inline void zswap_entries_cache_free_batch(
> > +       struct zswap_entry **entries,
> > +       u8 nr_entries)
> > +{
> > +       /*
> > +        * It is okay to use this to free entries allocated separately
> > +        * by zswap_entry_cache_alloc().
> > +        */
> > +       kmem_cache_free_bulk(zswap_entry_cache, nr_entries, (void **)en=
tries);
> > +}
> > +
> > +static bool zswap_entries_cache_alloc_batch(
> > +       struct zswap_store_context *zc,
> > +       gfp_t gfp)
> > +{
> > +       u8 i;
> > +
> > +       bool ret =3D kmem_cache_alloc_bulk(zswap_entry_cache, gfp,
> > +                                        zc->nr_pages, (void **)zc->ent=
ries);
> > +
> > +       if (likely(ret)) {
> > +               for (i =3D 0; i < zc->nr_pages; ++i)
> > +                       zs_handle_init(&zc->entries[i]->handle);
> > +       } else {
> > +               for (i =3D 0; i < zc->nr_pages; ++i) {
> > +                       zc->entries[i] =3D zswap_entry_cache_alloc(GFP_=
KERNEL);
>
> Oh and why are we using GFP_KERNEL in the fallback path, but passing a
> gfp to kmem_cache_alloc_bulk above?
>
> (and it seems like the only caller of
> zswap_entries_cache_alloc_batch() passed GFP_KERNEL for gfp anyway?).
>
> Let's just drop gfp and use GFP_KERNEL if that's the intention?

Good catch! Makes sense, I will drop the gfp and use GFP_KERNEL in the next=
 rev.

Thanks,
Kanchana
