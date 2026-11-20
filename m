Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795218028;
	b=Dkv2ejAhvwPdQURb6749Irtt6VzfMocRc+reOyATf18KAyfNambV7j+gwDchq5hzoEg2
	 FQt0wtWHiWNa3oZ232Tu14ggz/3iRMZOdK3T0lErH8FCBTNC4OXvCGUHRvJfCPvyHNWUQ
	 Dp390DOVBNLrw0beDO2xZlZSNCF1PWGb0RXxRbu/iGPTEnbOUvPXG1231D5MsuHDqQv8Z
	 bSvGMTdHWTFTLBy90co8ljVDu1SQfil0GxmhfXX3Ujzfw+1k30Pp/seUcMEkJa58EJT1D
	 ibK7wWapPaJcEgo2V3kp6O5AZPAUUeMBJsw3vekG2pRGZlKz7Hu/lJmXSI9c2h3P43g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VXsP6Kzw4Fd0TFm2S4Fc1qx6wAsu/iBIUZpt3s1NHMU=;
	b=CoF7FBXZ6eZZ0DRbwP8vLt9e63CGtnRDFf2yKUiOXMaqdJBySh6CZuBk00Qao/WUBVrM
	 aNGJhNZ8Pri9fcJ4FYbo1uNPbhLVGLFhuHUtrlLHiyQIoMdmMS8euMwLZXEWhwDRXs4JV
	 1jiiE5+T26Dj9BnKmvVpMeTu/rgXztGCtsWo6OJgJjjMmz4RMAFgd4NQiyt8okm6KI/Xe
	 A4NgWMaYfIuHusf9ogHq/9LUBFqGhIYwugKWsgiwB6cuXXt7YAQTsBy9h6JucAXsrufB7
	 1BbXKtiM4lB4TtuIAUGjs6qnkcpP786Ycs/b9wRfkdCdoeEbe1aBUA7kL3M1KdB+5GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RE+7Mnls;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734B7606A6A7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734B7606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RE+7Mnls
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ada7d53082so16470191fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:40:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795218026; cv=none;
        d=google.com; s=arc-20260327;
        b=HQ9euv2BtiaBIUGksVTnZN9PkYCRMCp5PHdi5+CaA8YjMdYPG6ylE2ItTYoD22FXBo
         EJJnR0IuUMdbyWTpi15kogACIzqLla/akugwJRzTDPw4mHUJuxQB43C39YFDiRm0Ec6n
         uQYD16KWYJBKO3WmXh4gIDshQCWYkpSPRpXbUBe+aPf6aHFSaj6iUFEKX7x0hvnyTYfe
         rBcW/1uHzLtfdM7W3cA/vPL+XYqeMmhZCGVIQuaeaLeszO+lpXL5vkrtgVDHBzSSNLic
         gXYGKE5J11S00dDP/95qOoXLRZNZO9Brz/e0Z9LQmPK2WnXAW9e4uJZJ7M3PatSnCyZ1
         o7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VXsP6Kzw4Fd0TFm2S4Fc1qx6wAsu/iBIUZpt3s1NHMU=;
        fh=djc3J6u6lcuiP+1cGkc1Opo4aI1UHwbvAorZrMSEXiE=;
        b=PpMCimVr/3HOLrZGvzb0sQOxvQWFqXh+2fjeHLh/gY89JwvJ+W/LjPOM8Gy/SzgeQV
         MOFcddWVsFwilTyscpfBwja4nRD6l/cUf4aGhAjSNpLyWByXthvPFTufrLuflIpLlMVi
         hKwj2syjH6OG+2hE4+U8S+rQN07R8Fe74SWd172HbQcGBJmW9QpEvn5+0+biAXpR/vEP
         iHQekTRlyNzKVF+hQodkpFQBPHsK9cuvvvcE2mXwUA9fH1iHcRGJoxxjm3xa+WonyjVQ
         ePiSX4fHH5Wykxj25K/yDM7csO6oQ9z7vWfvVUYggzXl48Z7k2XRhe2xaw/vOu9U/QML
         Xecg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218026; x=1795822826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VXsP6Kzw4Fd0TFm2S4Fc1qx6wAsu/iBIUZpt3s1NHMU=;
        b=RE+7MnlsRLphUloxltXudhTXKXdCfhGSXX0L5oMnOegVyN1NsUwzUN3aB80FwHSsGG
         lIILr8mL7K4108f3SkTyx6wAwI8c3BH7af+gpjlLFqANi/KaDGEMJsaIpriVQP/DUgSW
         RwUzQpIv5fsyeX/Hld+ylvmxpaQyppLeyO+G/JAVYE4FbYyP0ey+ZA+aBjfs/elEykMo
         S+8nB8rMVSC7F2vDazjyoqdFvnebmyQ7CN/zkoEgHsOdWFCmGKGBU4Ubm4BFqpCjJWu6
         daNB6JOaN1OZsg0ry7usSuX3gVygnBCpFpTC9IEMcZJuUSm3zWWYqplsXUte2fRiTxHz
         Vn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218026; x=1795822826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXsP6Kzw4Fd0TFm2S4Fc1qx6wAsu/iBIUZpt3s1NHMU=;
        b=Q1h/gXUo+laXDUPogQZ0zh5fOCedPKQF8yfjJhCgajDTy7mqm9GLv15mCi5Qsn6phH
         CkHxEN1+XWpXTpRegpnAN6aVDJrMlurp4pcXFjr4ESJPuor/sc1UgxjWurEyju4+i2+Z
         PV5nGzF9rZkT/Sp1q9c/YiNFiXLvSvp1N5Q7nQMLDHM45Uy9aGnuicIpdg2VuDpI6fVA
         rPg/bLfHi6pqMbF+8QnSkuOi16DJQuMye3foj4hz5IiL+fV8CLug/yl281CwGvw4Lmdt
         tPLRgYtIg0HO7UlQCgwMKaonROaPBJyzRX1fqiGuvdQd+f57/KouQUDor7gF5CPa44Mc
         R8iw==
X-Forwarded-Encrypted: i=1; AL+hErHTD4gbt3x2ThdyIZg1ziOV3aJciuZQeBZwf1WBPiPr3Z3/WvMz8Fsd2l7Dcxyi82VNo9f8eM+EX8RKYgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KAlDZz/yk3JXBupLRpuy1yJMpL1GE846fpQJCYp+EsZodobxV
	HUIkMmkQjSyPZ0v19eB1p+E6ORN27ih1YoyrJ68AgE6gtQ3mVSA0Ya15QIolKEf+THGVMa3WtAK
	iUKxLd/1rUJWBgqELxxrQhyVVX5Jn98g=
X-Gm-Gg: AZFdTZe76CyAbARTBh5uEh2HmQ8SAhhr1AELJykl4FsZq5K7HcnBHnbPZcTlsD0Z/IN
	T3LWLtKdMmdX11a11iz9shYnuDOK8QJ52XQmX7otvTnf9SrMPlaiKqGVUQJzDAhlIikXePgTGyu
	cSvctolze0DEFVcmmHg35QNTMiRQHKt4TFPxprAPx7/iqkrYL9k5uM2DKd/yrKViZe31M7qvT05
	pJaN1z2Pk/W7H2aeV41P/HUY7enLJBDKIJZknxtshAklBb9T2KjIcwnlAGJa7v6kvuXYZgEJUV/
	zIraLZn2e4uu6PbNITnnmEQ34bSWY1zgOBAVJFqpWTXSOsHJZCu04ed0YqnH3gfzLJ1qStg0DKh
	2GAdI98aqxcBICdXfSDYHFGA2/HEY4gAfNvOfkFR5z+9tBz9C0XEyoL5nmHc=
X-Received: by 2002:a2e:9fc2:0:b0:3ae:c43:d892 with SMTP id
 38308e7fff4ca-3ae7b71b82fmr14829431fa.1.1795218025362; Fri, 20 Nov 2026
 15:40:25 -0800 (PST)
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
 <20261120041906.5785-7-kanchanapsridhar2026@gmail.com> <CAKEwX=Ok9rom97s1GbrdJHNLqQTj-C=iieFHnbtUVY7skO0DGA@mail.gmail.com>
In-Reply-To: <CAKEwX=Ok9rom97s1GbrdJHNLqQTj-C=iieFHnbtUVY7skO0DGA@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 20 Nov 2026 15:40:13 -0800
X-Gm-Features: Aa3M54osVsiYW3ZTm9lfCyqxR5ht3NZx9SXV3Yfo9go8drjU5olk5SDW1EIK3-g
Message-ID: <CACpmpocBaeKVVN7VSm7g4dN+TXoRC-ywjzJ2H2g39BQSp5pd2A@mail.gmail.com>
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

On Fri, Nov 20, 2026 at 3:08=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
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
>
> It's not a lot but do we need multiple buffers here for all software
> compressors? Other than the hardware accelerated compressors,
> compression happens sequentially, no?

That's true, compression happens sequentially. However, multiple
buffers here helps software compressors because it allows the
"batch-centric" compute and lean working set concept, which results in
the sys time improvements (cache locality, fewer cache evictions).
Hence, I think multiple buffers here benefit latency.

>
>
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
>
> The wb_enabled stuff sounds like sth you can pull into its own patch?

Do you mean we should obtain wb_enabled status once and pass it to
zswap_store_page(), and factor this into a patch before patch 6 in
this series? Sure, I can do this.

>
> [...]
>
> > -       /*
> > -        * We may have had an existing entry that became stale when
> > -        * the folio was redirtied and now the new version is being
> > -        * swapped out. Get rid of the old.
> > -        */
> > -       if (old)
> > -               zswap_entry_free(old);
> > +       for (i =3D 0; i < zc->nr_pages; ++i) {
> > +               struct zswap_entry *old, *entry =3D zc->entries[i];
> > +
> > +               old =3D xa_store(swap_zswap_tree(entry->swpentry),
> > +                              swp_offset(entry->swpentry),
> > +                              entry, GFP_KERNEL);
>
> This range is guaranteed to be contiguous and always belong to the
> same zswap tree right? Why are we not using xas API here?
>
> (Or maybe we can do this as follow-up/in a different patch?)

Great point. I was looking into this based on your earlier comment,
and was studying the repercussions of obtaining the xa_lock once,
followed by __xa_store() or xas() API, but still needed to figure out
a few things, hence tabled this for a subsequent patch:

 - Impact on zswap loads from being locked out for significantly more
time, potentially causing page fault handling errors.
 - Impact of holding the xa_lock for 4 entries at a time during zswap
stores: would it result in errors due to the task blocked in an atomic
path.
 - Ascertaining if the assumption is true: contiguous range of offsets
is guaranteed to always belong to the same xarray.
 - Comprehend tree rebalancing with xas approach, would it change the
above assumption.

This seemed to require some more focus, and deserving of a patch of
its own. I agree, we should pursue this in a follow-up patch.

Thanks,
Kanchana
