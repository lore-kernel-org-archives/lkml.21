Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795215726;
	b=fpg+VhbzvvUQMuib416cZQrf8tFXwXtqZ9NT4me7Mk85VZODaUcdmO38rYTrVCFdgDwL
	 ng1h/26YMxu1gaUeNatMuIz6vjZU6Pi/SKg0Yq9tZ6v7J3YVGBiuPP4V83IecWbYcm3ip
	 QTHTmnkLsknM25xSTK/cxKpCaxLV/kSo2UTzNusRU309XDbCt5K1bGShi0S31Q8XfjxC7
	 81gXQGrHy38psedj6DScgZ/Z4pHKEP3ATR16KPEAvQ1lw6v3pciNnvj82PLhWS2a0oxuv
	 hu84rgKFhDKvQBPwtpeqz97v4FeL2NIKNMNqNk4NLOPejgcB2xIZp6F2HSu7aw17RKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sB5iWeLIdXSk/z2yiFdp6RKCyaPz4LeSJqW6ibv5E1o=;
	b=B4QYVYcmRP9wWo5kLOb3i5CWvultl1mYlMmDrK4NZfPCGULxusr1PrMXddShsQdWpiKU
	 +xibcQXxB22+lPx47tyuB6rALtIB2cs+cmAPO4qZpRx3B+FZHefppyJ8KLzLsIWGuRJ3o
	 jqJx2HJL/dWLT5BGlMGvM8eZtnXor828cbCDouqh+PVOOKbT7q4LBg1QqsOg6J8bfYi5S
	 i7AgfYq1UBy6YAqrnElNE0BQTJtCM4pKNMmhQpr6y0vjfeyoEnt1bYwQ/vO2mQ5Ovv+T2
	 s8KLYhcMFNfbPOwLSDdeS5j7iXQlAY2TrcPEa9PkxQOg7Jsxg+g38iQ5CJaDJwAyjhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDHhYohU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0671A606A686
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0671A606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDHhYohU
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so11156591fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:02:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795215723; cv=none;
        d=google.com; s=arc-20260327;
        b=P4iqa4BRfc+ZQ9+KN06aIlT8udyyI2+RToKOcQNkrh73H5yofuw4vaBQyrZ62EfC5h
         w8CfHIvIYToV22AevSVxH8pgWj+UtlGWvUX353zb+P9IFTkZuyRxIXlSVAk4ruNC676w
         ar+UEaquxC9qMSux7eqe2PK8c8U7mdffZIf0mnAp7aTAVOzbOUbBnUWVaZ3IQhkWuIug
         U1g5X6T6Z/MZfiPXeJaJiYG2/aZdJUwu7UzsN3WAf0zyTD+S6tTP/FuYC7jNa/aQqRdT
         oLx+Fbd12IFBCVwXlsA/QRxA/hE0bthE5drhw1FJik241jNjyr7QYYHSRNLnh6ABuTx0
         7oVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sB5iWeLIdXSk/z2yiFdp6RKCyaPz4LeSJqW6ibv5E1o=;
        fh=k8/xe6ijs+hZcYN8Gzeq3wPNJPknoWrt0e7UFR8aeGQ=;
        b=PF420/zaL4Uwcaz3qHh+Vi2qa2/jgMFF+d2LM8o0Da0Vpkgm0KEyQ/S/O1BjPuWgc8
         iVyK94FhdADkEk76SDHNoBV1vYLY1z/Tjrq68cDonag9FussHDLJDGMPNHc7VtRmEMpc
         b78im/RxXLEYZwmqzqX6mSagw4EAmxnVAT8cFWfJWCJ8qNbUclhBROtjPl6IpHv0qVCp
         cUchd1n/z3xf0BPO6WXIQskMXxKmrVrG5c7qAboH3yKw9Ldgc1HdI6vLvMYv5+ZXQAYv
         UFcIt3R1ageXx9pgTqCoF1AZycXm4PJg9fir1JC+h74r5bzZddfm/bemyJCTrNy60lc9
         VRXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795215723; x=1795820523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sB5iWeLIdXSk/z2yiFdp6RKCyaPz4LeSJqW6ibv5E1o=;
        b=PDHhYohUmZZS+wBX0o8ymsSGC1EY+NXbavNEk6S3+r9zE6NVnZsD2KyqT1bzkPqg68
         pg6PdsdGVsYrg2Ni87JZTksy4Qt6ICd+DcI/mfWmjM8pyMqNPeo689NFVrzL5w56lDuk
         ikw2UkL5Mh06+thVf3sQ6l9rvfPmTNAfbOZwrKiDpMofbQyltN3SR+uVImwywLrCHcPh
         PHG5/mJYCdFUBIbq4FRW0oPM+sJlTcupS0Xq780+IWh6MI5gr8mndOVbIjBvkqbkCgby
         oufmbhXXXTHevdAWpvfXlDckrWCVqLiCcgDP3WUe+/nvfyTXIYnR1iY1Z3Ik0rG5zxOb
         GQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215723; x=1795820523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sB5iWeLIdXSk/z2yiFdp6RKCyaPz4LeSJqW6ibv5E1o=;
        b=ouLAYl7FzMe/jDWVFOIezWfjtqOtzoMjxyQrn3wjsKsJji6pohzc/HtjqEACubHjSG
         Wbo8SonHd+DI2mamgo4tBuXa0213zfKNCx5rT3/ktvZMlWUqgBmxjWekJSsh9uCIKANR
         bSLtqfkAVhd9N0s5lG8XVYpuVN1jBJUzlRVlQ7CZL7rHqn4DiYhGTxPYjfeemCOB5kc6
         ey85k+ovFIEgYORHDtJ2g3Ds2awFwt8I/OdU5KKZvGZ6+rMSueX9opws+NDVnOEnCzUg
         mypA5W7tzXNZ67J68Guj6zY2FyWYc92Uqh+Igc5IJh2bTezWmxKGtF2+Y2Wms2Dfv593
         W4Bg==
X-Forwarded-Encrypted: i=1; AL+hErHMh+u5Z1q6+Y7yuhW7JPk6nPSLpwEnPYUJzDz5rrI7qKNkNBB/qspiiGIEXEwa+vnW0lTD7Vrp7z4UNOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GhsgIy9haKMND7hDN8G9qxygc6UuzHXsT5cC/ZUKcTNiGGVI1
	0hBR6dp9onqE2n1CT8wU1oqA9dOTRfX4OxrOzetvhDSGLdgCzNzCrqkaI5A9iqzV/UmLRZkq5hx
	7WolP+u6A6r38sMcwxaVsRoJvCx8RuhU=
X-Gm-Gg: AZFdTZdckFgi85Or41fk8AFm6GIt63zOaEbwifuuRfCHQ0HxONmHai8R/zbeOy4pKPi
	HdjIm1D4S5AKyh+hvTRNbmKbhCQqDIdU0Lf4EjgmRSeKH7oUveZq71v8exLf4+/H019jHiy0V5z
	9g5GKOfaIN0lbgtoxaQpyeZSaWlCeEgK2MZpgY6N/b5SA1W4WrB/AiYmDL59mNfiGxEpl0XF5hw
	KxEWO62wwMAzKT3HGcOKIs8+9QZO9lwADtmnj/UwbMOSUdaW2u1Z4BvWFEgJCU9ZEjlSmaivD0j
	v1HV0p47Uadl3cFBUgbuKFQZul5OF6XhG3EbOQQ1f89UkP26Ijh0GTvK27usWLA/ayx04V9SpUg
	QuWJO7X2cfH0X8gU7SWY0dyP6hZ+CdWAIYSNU
X-Received: by 2002:a05:6512:39c4:b0:5c1:4f00:7b77 with SMTP id
 2adb3069b0e04-5c1bc6804cemr1456732e87.1.1795215722461; Fri, 20 Nov 2026
 15:02:02 -0800 (PST)
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
 <20261120041906.5785-6-kanchanapsridhar2026@gmail.com> <CAKEwX=P7To+AV9X3cXLCcuw5yoigdB8w5Ns9c9mDxJf+u5k8xA@mail.gmail.com>
In-Reply-To: <CAKEwX=P7To+AV9X3cXLCcuw5yoigdB8w5Ns9c9mDxJf+u5k8xA@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 20 Nov 2026 15:01:50 -0800
X-Gm-Features: Aa3M54reRvLfoPZ5kvwPE0ioyJYfTZ8WSgE2duE6U9TLy4oHWqSA0alj0n9Xqgc
Message-ID: <CACpmpodffHWFu_Zfzx8tb3ghO_PJAMu1+LyaRXtmwK5a5GmzSw@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] mm: zswap: Store the folio's node id in the zswap_entry.
To: Nhat Pham <nphamcs@gmail.com>
Cc: hannes@cmpxchg.org, yosry@kernel.org, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:46=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Thu, Nov 19, 2026 at 8:19=E2=80=AFPM Kanchana P. Sridhar
> <kanchanapsridhar2026@gmail.com> wrote:
> >
> > When storing a folio in zswap, save the folio's node id in the zswap
> > entry instead of relying on the zswap_entry being allocated on the same
> > node. This enables optimizations such as batch allocation of zswap
> > entries for large folios using kmem_cache_alloc_bulk() that does not
> > support specifying a node id.
> >
> > Accordingly, replace the SLUB allocation in zswap_entry_cache_alloc() t=
o
> > be node-agnostic.
> >
> > The size of the zswap_entry remains unchanged as 'referenced' is lumped
> > in with the 'length' (as it doesn't need a full unsigned int anyway).
> > A build time assertion checks for the zswap_entry's 'length' bitfield
> > being large enough to represent PAGE_SIZE, which can be 256KB on some
> > architectures.
> >
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Suggested-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> > Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
> > Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> LGTM for the most part:
>
> Acked-by: Nhat Pham <nphamcs@gmail.com>

Many thanks, Nhat :) !!

>
> > ---
> > + * nid - NUMA node id of the page for which this is the zswap entry.
>
> Maybe "NUMA node id of the original page of this zswap entry"?

Sure. Will make this change in my next rev/patchlet.

>
> >   * handle - zsmalloc allocation handle that stores the compressed page=
 data
> >   * objcg - the obj_cgroup that the compressed memory is charged to
> >   * lru - handle to the pool's lru used to evict pages.
> >   */
> >  struct zswap_entry {
> >         swp_entry_t swpentry;
> > -       unsigned int length;
> > -       bool referenced;
> > -       u8 pool_idx;
> > +       struct {
> > +               unsigned int length:ZSWAP_MAX_COMPR_LENGTH_SHIFT;
>
> I could have sworn we agreed to just inline this macro.

True, however, per Yosry's earlier suggestion, I added a build time
assertion for whether ZSWAP_MAX_COMPR_LENGTH_SHIFT has enough bits to
represent the architecture's PAGE_SIZE, and could not determine a
sizeof/other API that returns a bitfield's size in bits. Hence I
resorted to the macro.

>
> (btw how many bits do we still have here? )

We now have 4 bits after "referenced":

struct zswap_entry {
        swp_entry_t                swpentry;             /*     0     8 */
        struct {
                unsigned int       length:19;            /*     8: 0  4 */

                /* Bitfield combined with next fields */

                bool               referenced:1;         /*    10: 3  1 */

                /* XXX 4 bits hole, try to pack */

                u8                 pool_idx;             /*    11     1 */
        };                                               /*     8     4 */
        int                        nid;                  /*    12     4 */
        struct zs_handle           handle;               /*    16     8 */
        struct obj_cgroup *        objcg;                /*    24     8 */
        struct list_head           lru;                  /*    32    16 */

        /* size: 48, cachelines: 1, members: 6 */
        /* last cacheline: 48 bytes */
};
