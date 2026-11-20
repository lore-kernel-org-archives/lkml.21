Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795217152;
	b=uDwLF4hKWQsjLCBbYB9QzEgbG4yLWgT1/scVJr0ows0lWF4yAD6cEb/+ZQ2x712JsrMw
	 SZvOnM1eS0pCD72ZQwSi9k4nDae+L/J6cNrTqBA95YWzejleH8Vn6TfwVrqdcz4qdV1yM
	 +wORW2mKgFcQt+D/b4lnSnmo1j5y+iHJdifRUtTos5dUX1ODjLofJvk5NDiAeJNQpAnK6
	 0UVVN1fhNueO9TMXX0CYzrLj0JE/2rJppDWPKyAZXO6YjW/Z61XNNblwigE1NdLlIXLlc
	 Cf3bxjx99+llo8nmv7QDSjn+PsA2/V264jNmoawbiPL8pPuHmyMcaE0iVRB8zglHFvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uhqyN4jXJHLUBn1qwHjxlBTy4/pOd3Ul8pRQ56L+gFg=;
	b=tmNzSYFmdwTRwuao0RrBWQJG6aC7YTVhyXMdw/qZ+vAOF52wTPwA6r10JiIq4GrJv9+6
	 37NiDgYobkncxwZdtS4b/UAyPryWNnYartgVdVosIQZVV/bI4Fh9JaEJcByEofzjnqjDA
	 zz+Z87qYhvWgw1WKjOlg6fsVH41itK2E/AJgDYgR68dEiyOluoIQz++lDipUxV2bWbLxD
	 mx7ouO/w3KoDmkzo5dm92vW1uA5QwoH7aaoSKlo3Pit6JEwrwbAb7mR+zUML2a+zfy2wI
	 WWs/QT88u6pD0hDLN4dpfmT278RbrtZ64pl2jkNUH/llXHL6XdWFhWkp52BvBETZvMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iug5rYpk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874DF606A6AA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 874DF606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iug5rYpk
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so13090935e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:25:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795217148; cv=none;
        d=google.com; s=arc-20260327;
        b=prHTaNKXqK8Fk2s326F596jCiN/WhW26Pvry6ZrYMzU+6go5McZrjzEPiyMhAhmc8H
         d1a/TeBLAlAFlz/bVj1XUywAfyrPGfcKh+hzpRdMHkAqNDuJAX9qhZ9pv40bopUByu3E
         rt4VFElmae4QDWOtDMeLTwJGQdCiW1dKZWTuDmHsBdVGWV8CQZkUVawmQ6MIqKr+HVa7
         5CB2Sv/FKl04xIdyM3LGpPcWxmNJfB9YkSEFHxWk0FV/vPKm/iBFmgV2S1m5ObFVhi6l
         jsrpjcK7PJ224ND03Bv/4uCTFJkrpSdkJxalXONWWJNn6uDKAWiXSUzPNuFgUp2vcevh
         v5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uhqyN4jXJHLUBn1qwHjxlBTy4/pOd3Ul8pRQ56L+gFg=;
        fh=cyZneKk42kwz9Q4WHGS0bdN3dRZ8PxZrHGu6vQ89RjY=;
        b=Zy9EpOg5eRi1wJ2Fnlz2TVCswBCsMoKvpi/aAL/nTBYs2NODcLeaoEcVwGIr9vXIaS
         pALZyGjNTPY53Ff2Aym8zJQqi1bizExzNuwMuomqr8tLMwIIUZ7sSz0XTbMRTpI9klsw
         Jne1fb4QSS7zFBf07di9oQ5nBqR8kX4GoC78qJ1eZk/g+rpTMwhdpOOCT/WE6wiI0mo2
         715Whq85yzF9Hg4sC5ADYSAH/LlnfGGIA1xav1c4ZQf2SVPmAVtDGiDF2PooE1sC48uc
         U+TrBv7W1UwZRzmMfVwWjPHVbOt/Oj33p75fNV6Fyoe8XNsER1DsnFXW4oLeIE0eNrAz
         c83Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217148; x=1795821948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uhqyN4jXJHLUBn1qwHjxlBTy4/pOd3Ul8pRQ56L+gFg=;
        b=Iug5rYpkb63trXFYAZIABlw71nTfIZkoV45ljefihZBMA8G9uaMIFFlc19D6zQlbl7
         ip/9M40h7lkjnx4yA+LYv1LMm3XowhrXhTYCqheynKySQY5jyDcbsZxRak/i8VAHhxcI
         DZn4GIOeFC+Jwskx1ojyNPZr9gopq9ldq0Klx/TgjV9cOCkKi8hT8+lGxSjqNDcYt8IX
         mHtSBBe/tZztN2mq/KhgHPlSif45vum6UrveD8cNRW9M9xNbS3nTJc8j1I0p9m5i5qII
         cNNSU4Dvpqy24aQryOPG4XDPOdbRuvmY3nh5ITjM/Zw6KKC6+k0g7ZR8fkUGr9lPp/Yq
         QvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217148; x=1795821948;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhqyN4jXJHLUBn1qwHjxlBTy4/pOd3Ul8pRQ56L+gFg=;
        b=CmWfXvdujv8GLxdNizTA9Fy1hcRyxubsGA5PC89iEEZgzWfyDv4k8fgnyaV4Zyubmo
         2/z4fzYqU3HVuFNezpHBBcpPIOhi+xcJjIhTwaUY6OJuOemtACT6k9HFZyqUy/QA6YC6
         W3YEeP4EKW38YnG/XE7X+2UzsCNVJET1SOAsZqpBerTe9nbLGcAnLnrQjkIorK4m6cZw
         FrD2JizOo/8EDIZHrqBoj1xdV4v5StMCVrEB1vk/4WfyM9FPZrq2Hp+i2HqxVpc0u73G
         3ln1jxeU6IHLJjLzh70qxHE4eC7v8z/mOLdCihos3sPsBzRk+/IcZwLwUxuoc/9MnoyO
         L6SA==
X-Forwarded-Encrypted: i=1; AL+hErF6zxv5c0aoB5VV8bAJQRYYF+m8hAJ0MrlKaSfs7AmBAQJsFe/0QNoPMsFX51IdVEiQPylRfBOO9nOPbAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cIfLFosFmqhu9g3+1gUGIOCkfhOV/AG+GzVzFwdi0lg5OvyNd
	njge6J/UEggrtlW3fA7/9ZcMt9Iu5NH4cBGvRqv3F71HRnUWp5G3S9y53MGcTz502v8fJTJSt2n
	nMKu1bEOxxrc+G9dKdyQkvfyotL3VOE8=
X-Gm-Gg: AYBFou0/NDA/R4Hb7shelJ/CHD+bFtEa6T/i+3ERvCmi5REm4z/UHAGxEDxnoXk8PZp
	VfWJx5ZORaoShAYG6o3t9NVc37ewo70WANfjfKgqn4glt96Kmlcmgl4OFDRxd0MEsurts4+carJ
	0pDfTPXNG3wrNOe1UiCH7w3c2U2l8VwMsuJF0R3ykeyKtxpaOmyZHh2fLTsRk7aP2p7qr++RTnN
	O+ojoSFaTfFCHFJt7s02d6UocuHQ21kOGUPh09rEOCD11WPFVQ50Rrc3AqHh2T/Ewt5Dj1Lzdor
	p5eNqbil3Lz/E5+dwWNYGp3U8TchIfTyl7vo1lnj0U3OtCj2nxOEdUoRFHzHbnxW0J1JHaUE5mT
	I/87t6ksBwjoZG4Gq23jDy3GdJO4teK8F2RoerlkFq1RWhYz28RtD2LoRGBzr1HILQu1Q+4eRiW
	wBSELAR9/d9u+nMXsKKb1Z0RyDVWuvyHl+xdLoJNBaHJ+DK+1PM4svtc8=
X-Received: by 2002:a05:600c:4e0e:b0:4a1:da58:1ee with SMTP id
 5b1f17b1804b1-4bb88938dc9mr114117765e9.31.1795217147625; Fri, 20 Nov 2026
 15:25:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com> <20261120041906.5785-7-kanchanapsridhar2026@gmail.com>
In-Reply-To: <20261120041906.5785-7-kanchanapsridhar2026@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 20 Nov 2026 15:25:36 -0800
X-Gm-Features: Aa3M54ocqa_Rt1iaIcH01mzW7rcL-Me_kjHYSn1LGUejy8g6N8y75Tuvtfmivv8
Message-ID: <CAKEwX=Pr6t8w676ztfrONaKrRKoy6NS1priTb2c2XUikNhYU7A@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] mm: zswap: Store large folios in batches.
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
> Use batching when storing large folios in zswap. A new constant,
> ZSWAP_MAX_BATCH_SIZE is defined as 4U to support processing batches of
> up to 4 pages at a time while storing large folios. This commit
> modifies the "store single page" approach to "store a batch of pages".
>
> As part of CPU onlining per-CPU acomp_ctx setup, ZSWAP_MAX_BATCH_SIZE
> compression buffers are allocated to eventually be able to compress and
> store ZSWAP_MAX_BATCH_SIZE pages. This happens in subsequent commits.
>
> For existing software compressors, the extra overhead is the
> the extra 'buffers' pointer, 3 additional elements in 'buffers' and 3
> additional 4K space per 'buffers[i]': in all ~12 KB per-CPU on
> x86_64. Only the first buffer is currently used.
>
> zswap_store_page() is replaced with zswap_store_pages(), which processes
> a batch of pages and allows for batching optimizations. For now, only
> optimize allocating entries by using batch allocations from the slab
> cache.
>
> Avoid repeatedly calling mem_cgroup_zswap_writeback_enabled() for every
> page and only call it once for the folio, since the entire folio is
> charged to a single memcg. Similarly, obtain the nid once to use during
> each batch store of a folio. To facilitate this, a "struct
> zswap_store_context" is introduced to keep function parameter lists
> concise.
>
> Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
> Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
> ---
>  mm/zswap.c | 307 +++++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 217 insertions(+), 90 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 78d9694f75b5..df59ab0c1029 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -85,6 +85,9 @@ static bool zswap_pool_reached_full;
>
>  #define ZSWAP_PARAM_UNSET ""
>
> +/* Limit the batch size to limit per-CPU memory usage for dst buffers. *=
/
> +#define ZSWAP_MAX_BATCH_SIZE 4U
> +
>  static int zswap_setup(void);
>
>  /* Enable/disable zswap */
> @@ -144,10 +147,12 @@ struct zswap_acomp_req {
>         struct mutex mutex;
>  };
>
> -/* The compression mutex also protects the output buffer. */
> +/*
> + * The compression mutex also protects the output buffer(s).
> + */
>  struct zswap_comp_ctx {
>         struct zswap_acomp_req areq;
> -       u8 *buffer;
> +       u8 **buffers;
>  };
>
>  /* Separate requests, so that decompression does not wait for compressio=
n. */
> @@ -162,6 +167,7 @@ struct crypto_acomp_ctx {
>   * The only case where lru_lock is not acquired while holding tree.lock =
is
>   * when a zswap_entry is taken off the lru for writeback, in that case i=
t
>   * needs to be verified that it's still valid in the tree.
> + *
>   */
>  struct zswap_pool {
>         struct zs_pool *zs_pool;
> @@ -226,6 +232,15 @@ struct zswap_entry {
>         struct list_head lru;
>  };
>
> +struct zswap_store_context {
> +       struct folio *folio;
> +       long folio_start;
> +       bool wb_enabled;
> +       int nid;
> +       u8 nr_pages;
> +       struct zswap_entry *entries[ZSWAP_MAX_BATCH_SIZE];
> +};
> +
>  /*
>   * No RCU section is needed around the returned pointer: a stored entry =
pins
>   * its pool via percpu_ref (taken in zswap_store_page()), so the id cann=
ot be
> @@ -284,6 +299,8 @@ static void __zswap_pool_empty(struct percpu_ref *ref=
);
>
>  static void acomp_ctx_free(struct crypto_acomp_ctx *acomp_ctx)
>  {
> +       u8 i;
> +
>         if (!acomp_ctx)
>                 return;
>
> @@ -302,8 +319,12 @@ static void acomp_ctx_free(struct crypto_acomp_ctx *=
acomp_ctx)
>
>         acomp_ctx->acomp =3D NULL;
>
> -       kfree(acomp_ctx->comp.buffer);
> -       acomp_ctx->comp.buffer =3D NULL;
> +       if (acomp_ctx->comp.buffers) {
> +               for (i =3D 0; i < ZSWAP_MAX_BATCH_SIZE; ++i)
> +                       kfree(acomp_ctx->comp.buffers[i]);
> +               kfree(acomp_ctx->comp.buffers);
> +       }
> +       acomp_ctx->comp.buffers =3D NULL;
>  }
>
>  static struct zswap_pool *zswap_pool_create(char *compressor)
> @@ -388,6 +409,7 @@ static struct zswap_pool *zswap_pool_create(char *com=
pressor)
>  cpuhp_add_fail:
>         for_each_possible_cpu(cpu)
>                 acomp_ctx_free(per_cpu_ptr(pool->acomp_ctx, cpu));
> +
>  error:
>         if (pool->acomp_ctx)
>                 free_percpu(pool->acomp_ctx);
> @@ -778,6 +800,44 @@ static void zswap_entry_cache_free(struct zswap_entr=
y *entry)
>         kmem_cache_free(zswap_entry_cache, entry);
>  }
>
> +static inline void zswap_entries_cache_free_batch(
> +       struct zswap_entry **entries,
> +       u8 nr_entries)
> +{
> +       /*
> +        * It is okay to use this to free entries allocated separately
> +        * by zswap_entry_cache_alloc().
> +        */
> +       kmem_cache_free_bulk(zswap_entry_cache, nr_entries, (void **)entr=
ies);
> +}
> +
> +static bool zswap_entries_cache_alloc_batch(
> +       struct zswap_store_context *zc,
> +       gfp_t gfp)
> +{
> +       u8 i;
> +
> +       bool ret =3D kmem_cache_alloc_bulk(zswap_entry_cache, gfp,
> +                                        zc->nr_pages, (void **)zc->entri=
es);
> +
> +       if (likely(ret)) {
> +               for (i =3D 0; i < zc->nr_pages; ++i)
> +                       zs_handle_init(&zc->entries[i]->handle);
> +       } else {
> +               for (i =3D 0; i < zc->nr_pages; ++i) {
> +                       zc->entries[i] =3D zswap_entry_cache_alloc(GFP_KE=
RNEL);

Oh and why are we using GFP_KERNEL in the fallback path, but passing a
gfp to kmem_cache_alloc_bulk above?

(and it seems like the only caller of
zswap_entries_cache_alloc_batch() passed GFP_KERNEL for gfp anyway?).

Let's just drop gfp and use GFP_KERNEL if that's the intention?
