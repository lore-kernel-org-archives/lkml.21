Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795231464;
	b=tP3FwqHtfvvINdVKrVfoBmHtcu48ctalDmegBxy+L5gh9fwJJgSH06paHNY92Pm1wOfJ
	 VUzOu0rYDNZBCY0IFWxxRqrgRCtgJpHpW9M6vZd85jpMYK3Ex5lwLf+4qLz03tEbdAp+5
	 hDwIo94pTB7qOCAwOIT25ZAdK+iFPH5MmGqJkfDM7PT1iSCykkIJ9W+7Q66BKSISC5ozH
	 gLFlhQ5nMMBPX/zIkBlASMt9Ex9JRBt8nkceHqn+o+PKY5mL4vN2ZduzO9z5h7eq+Do/3
	 QlmBBnBFD7yUA8EAaJTZyVBdAGRFOl36tVvhU56ryymyYmfTuksmWdxL2Hn0i/1JCHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RV7X5BTRWXgfZswCWiBQhKwLnqUxEdr1ZOglykX7/tM=;
	b=UFn/e9LJh1PsGhATmKMtXexAdPUIA0/ar6dVddsOo6YAVoSWJieratqnF+ut8W7s5iuZ
	 s/LWazL8Cu+dSg09wGSKnoKm5BhCJVNxChFp0w7XvXMAlgbMF6SeBTSs3fORSCjHlGzEO
	 S2MRD8CQmNGIIYcv3zPfeF7Fz7w9i0CBmLg5wdgeS/D5zF8liFc29fnQj2+xLbrYl41J8
	 1y/IzflmpCWW3I1fLILElnSc7WmjjCPjANPOk2VAVIxj8PCZJpZgbNhULK3XXF7OtWJit
	 CfEX9f1ZK+xy82fFYTp3je7SL2jPVxGj3s6cOz87+bIQSGDrUqFx9IOAg5bJb0ZiUNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lK2zJC8Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2FA606A6A8
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2FA606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lK2zJC8Y
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c1479be604so1117976e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:24:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795231462; cv=none;
        d=google.com; s=arc-20260327;
        b=l9udrAOK8LlybPFdYQHEQEhi+0HSzp1jFn9/pHJIT8gRSk+IE7vzX21SUYolWJhcEX
         7DShwK3VyohvoThvutu9ExeLNIefZ7zYJPC63vuqsnDN+xyF32yZSKVz9uZnLwA2EW9A
         Z7nW666Dw9yzJL5MuXcDXlvf8jW0ePOVI7+lgRKc+w7PyuYMUymrz+aI8xDY5MQkiONs
         DvVnBKSLOGywPoIu7CNpENn5LJOof9UbyAnJE3fEKA4QE6gAmsipfjE3r7w7pXL02130
         eVfjTFO+TTUOz6wE6R1gJ4gPKdwPVjw/C0QyNsUDfB2Q3Whmh8dbu4goziDuvAYpjjHN
         A0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RV7X5BTRWXgfZswCWiBQhKwLnqUxEdr1ZOglykX7/tM=;
        fh=PVQsjZ3fOgkh5ePEqCqph8mW8CpMZ9kldOBE9uGLrdc=;
        b=ScwK5WJ0Bye8RK9siHJCgpU7GwJ1yrgI/wKQUcGzrr3XOa7YcTB8lgMHBdZUjbG1dT
         48t0XMbnprnYZWD+n4xmyGyXsl88LrJLjj5guLlt4KhZov66c96uzukEHKbGns/G+0dP
         Vhihd+7ow2/pGz6ZyUzLEhb0wuezMIayg429RxNrtL9h34QIWkGdkdrqPlTqKE16FB9w
         hOUSAeo4XlqenFf5CRDjn7xSHPVXJJOCob4DH20wpuNFq1cfBQxLHVXPISf2KMhX+FVa
         V9xsKAy1dIApT/5bVAKd39S1Fjw7u8rKNe3AyuoGwe47z9VtXGNf0+4fq5/q2PMUfd7Z
         /TmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795231462; x=1795836262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RV7X5BTRWXgfZswCWiBQhKwLnqUxEdr1ZOglykX7/tM=;
        b=lK2zJC8YWdVpKTupaI0Ws8QhPVzrw3+wNs6AQ7OqLBooFnO5n1BEi8yC9tolqKb9Ho
         pjm9NMBh/r0LTgzPW+PYqAKTmbWHWsA8msZeLixfMPXz0s1C0CirVoPWWfZHiXEMK0Ly
         8AXPnIlI/hYBWF2GWUwFVcQHMV8V4jGHgE458Y6btN9v/dwWT/BL6lEfHp2Y2ZQmPPga
         ZufgJ0dDnS83oNVcCPAjA8UwISZcJ85xFyKoSTQIlnTrGjlV38N2srXhXtlRhDI5yYPz
         SRf+SJBwjN/N4bxLbM/jTzDFgN4NiNwDl/AcXnY3wUDAgCslpUuH1tAinp/CwRJ9uZKn
         37Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795231462; x=1795836262;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RV7X5BTRWXgfZswCWiBQhKwLnqUxEdr1ZOglykX7/tM=;
        b=xEtn9KkjwoFvHnU3XVn5x7/OphxmK4ry7WRTjQrspsFJf+f0oHFQ+GGfezNkxRSJXo
         kXRm5/ohNq7Xp/YGHbLkE8gQpQWN5VyrRGfF7uDOHpKdoF+nSRp14cwGF539tQa99AKo
         uus4SvtMKUs+xEfvOQ6f6wJVwTzZHt2gnVlvagJ+jqIgkrz8ysd2/LZSbNcbHiKeMP1C
         BssFXC0d1VHvhuunz4ItSLII++5/QlQZMtlWuHDFB6Te1Ptzf3jNmQOugyQMLPjdEam5
         PpnJcquVnrdMydWiTw51VH2Gu7e+wB7OZ1cJexYjsFJCN512RA8i1yG7YkVnnYkJJgJj
         VPBw==
X-Forwarded-Encrypted: i=1; AL+hErGuo1sZ/U7AwgBlE5hBSzL82yTEh/JwLynyVS8iSqbgMPtgARoQxCZuYoyTY2T09lLOnrMl+vXY3mfiQGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3QC7dkvrrjeqbNXw39oaAUCzaoO1kgUqyBGVTmwbkyX1/iimd
	Q6FVrsoqJFRhelz8++MyFZjNUBVEJOtaWEj6s5ZDNJBoKvRP698YpKa+iekOhLhdIWedtxBVA0k
	eKP4fgKBW7maVnOE1omR99ZqYIiFlQMc=
X-Gm-Gg: AZFdTZc+Hbxe47O9SbqbCSCYJEoimSJJM3g8KgI43KY4ExCY2O6IgyT2buzKHiMaVe0
	UNU2UzKJzSrn5T2ZsZfCYsyec7QqllX8dmKofKN0Qeby8mYioajdms2XxM8tV5oZW6+2QTj8Kgl
	BJ8iaEYTDW3oKJBu7MEFVsmUROZcFZoYoIP+Wq19LXhs5vG1cxw2ZlBuiiDQ6LuSYt3Z8V1aEYB
	YrJThXvNtUVoMmPQaAajUNXqnTLmcCm7MM3oTcNb+/eGn/oqLJrR0WcOPBVehRlGZD3FBscF5Qw
	1rFryr9QVp5ln8qdweuFYbEG/FEXjj5BjkrMvpDixpJgBiE68wKJHhxE5w+cQXZ5NmJgynur08N
	lEYz+16noJ6OdU2l6PLIfXP6dZcsrhsKVPUPx
X-Received: by 2002:a05:6512:1317:b0:5c1:5b02:1828 with SMTP id
 2adb3069b0e04-5c1bc80edc1mr1548759e87.25.1795231461863; Fri, 20 Nov 2026
 19:24:21 -0800 (PST)
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
 <20261120041906.5785-9-kanchanapsridhar2026@gmail.com> <CAKEwX=NtUEd7+Q2rW79LtObnjHT5uNFAUKfkRJJN1Wppe4Yc6g@mail.gmail.com>
 <CACpmpoe1SHgWQJaef-Je6x26FKYFAyV5xNs=krbWJQAYbG4rzA@mail.gmail.com>
In-Reply-To: <CACpmpoe1SHgWQJaef-Je6x26FKYFAyV5xNs=krbWJQAYbG4rzA@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 20 Nov 2026 19:24:09 -0800
X-Gm-Features: Aa3M54qz-mmUtI0xhD5IgBpoVa4asynU-5GRKsRyHTIYS3x2jpdGUOZQs8mJfgI
Message-ID: <CACpmpoeb62e8CbLiaS7vy5kG1dPP9Auvrx8CRYMPFTZtb8r+5A@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] mm: zswap: Batched zswap_compress() for storing
 large folios in batches.
To: Nhat Pham <nphamcs@gmail.com>
Cc: hannes@cmpxchg.org, yosry@kernel.org, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 5:17=E2=80=AFPM Kanchana P. Sridhar
<kanchanapsridhar2026@gmail.com> wrote:
>
> On Fri, Nov 20, 2026 at 3:55=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Thu, Nov 19, 2026 at 8:19=E2=80=AFPM Kanchana P. Sridhar
> > <kanchanapsridhar2026@gmail.com> wrote:
> > >
> > > A new batching implementation of zswap_compress() is provided for
> > > compressors that do and do not support batching. This eliminates code
> > > duplication and facilitates code maintainability with the introductio=
n
> > > of compress batching.
> > >
> > > The vectorized implementation of calling the earlier zswap_compress()
> > > sequentially, one page at a time in zswap_store_pages(), is replaced
> > > with this new version of zswap_compress() that accepts multiple pages=
 to
> > > compress as a batch.
> > >
> > > When the crypto_acomp is used to set up the per-CPU acomp_ctx
> > > during CPU onlining, the compressor's batch_size is obtained by calli=
ng:
> > >
> > >   crypto_acomp_batch_size(acomp_ctx->acomp)
> > >
> > > This is bounded by ZSWAP_MAX_BATCH_SIZE to limit the memory
> > > overhead and to reflect the store batch constraint of max # of pages =
in
> > > a batch. The clamped batch_size is stored in the per-CPU
> > > acomp_ctx->comp.compr_batch_size.
> > >
> > > As noted in previous commits in this series, ZSWAP_MAX_BATCH_SIZE
> > > per-CPU compression buffers are available for sequential and batching
> > > compression algorithms.
> > >
> > > Regardless of compression batching, we always process large folios in
> > > batches of ZSWAP_MAX_BATCH_SIZE.
> > >
> > > If the compressor does not support batching, each page in the batch i=
s
> > > compressed sequentially. For batching compressors, up to
> > > acomp_ctx->comp.compr_batch_size pages in the batch are compressed pe=
r
> > > call to crypto_acomp_compress(). The first phase of zswap_compress()
> > > thus only calls crypto_acomp_compress() until all pages in the batch
> > > have been compressed. When this finishes, the compressed buffers and
> > > compressed lengths for the batch are available in the
> > > acomp_ctx->comp.sg_table->sgl scatterlists.
> > >
> > > A new zswap_update_entries() then iterates through the (up to)
> > > ZSWAP_MAX_BATCH_SIZE SG lists in acomp_ctx->comp.sg_table->sgl,
> > > allocates zsmalloc memory and copies all compressed buffers to
> > > the compressed pool. All existing functionality on zswap
> > > writeback_enabled (or not) fallbacks under various error conditions
> > > denoted by the crypto_acomp_compress() return value [and with this
> > > commit, also stored in the individual acomp_ctx->comp.sg_table->sgl
> > > sg->lengths in the crypto_acomp_compress() fast path], is essentially
> > > preserved.
> > >
> > > A significant zswap architectural change is that the batched
> > > zswap_compress() incorporates Herbert's suggestion for SG lists to
> > > represent the batch's inputs/outputs to interface with the crypto API
> > > [1].
> > >
> > > The introduction of zswap_update_entries() presents an opportunity to
> > > optimize the task of storing a batch of compressed buffers. Subsequen=
t
> > > patch series will be submitted to optimize this phase by replacing
> > > zsmalloc with the SLUB allocator to improve zswap_store()/zswap_load(=
)
> > > latencies.
> > >
> > > The batching framework introduced in this series improves zswap_store=
()
> > > latency by a lot.
> > >
> > > Performance testing: usemem30 with 100% over-commit:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > Validation was done with mm-unstable as of 11-17-2026 (Baseline: comm=
it
> > > 866f761fd414) and with this patch series.
> > >
> > > v4 was validated on an Intel Xeon Sapphire Rapids bare-metal instance=
 with
> > > 48 cores.
> > >
> > >  Bare-metal instance specs:
> > >  --------------------------
> > >  - 48 physical cores
> > >  - 190G RAM
> > >  - 200G SWAP disk partition
> > >
> > >  Workload: 30 concurrent usemem processes, each allocates 10G:
> > >  -------------------------------------------------------------
> > >  The vm-scalability "usemem" test (unmodified version) was run in a
> > >  cgroup with memory.high fixed at 150G. There is no swap limit set fo=
r the
> > >  cgroup.
> > >
> > >  To quantify the performance benefit of zswap compress batching at sc=
ale,
> > >  30 usemem processes were run ("usemem30"), each allocating and writi=
ng 10G of
> > >  memory, and sleeping for 10 sec before exiting.
> > >
> > >   usemem -w -O -b 5 -s 10 -n 30 10g
> > >   echo 0 > /sys/module/zswap/parameters/shrinker_enabled
> > >
> > >  Performance validation methodology:
> > >  -----------------------------------
> > >  These settings were used to minimize variation:
> > >
> > >  - All cores were fixed to run at 2.4GHz with "performance" scaling g=
overnor.
> > >  - Turbo boost was disabled.
> > >  - CPU power-saving C-states restricted with:
> > >
> > >      GRUB_CMDLINE_LINUX_DEFAULT=3D"intel_idle.max_cstate=3D1 processo=
r.max_cstate=3D1"
> > >
> > >  The usemem30 experiments were run with the baseline mm-unstable as o=
f
> > >  11-17-2026 (commit 866f761fd414) and with this patch-series.
> > >
> > >  After booting into each kernel:
> > >
> > >   1) Constrain the cgroup's memory.high to 150G.
> > >
> > >   2) Run 2 warm-up iterations of usemem30. Don't use this data for be=
nchmarking
> > >      since sys time typically skews higher for initial runs.
> > >
> > >   3) Next, run 10 benchmarking iterations of usemem30:
> > >      - Log these high-level metrics: Sys time and individual usemem t=
hroughput.
> > >
> > >   4) Sys time and Throughput metrics were gathered for three mTHP set=
tings:
> > >
> > >      - 2048kB
> > >      - 1024kB
> > >      - 64kB
> > >
> > >   5) Benchmark summary data includes Sys time and Throughput componen=
ts from the
> > >      10 iterations of usemem30:
> > >
> > >      - Total Samples
> > >      - Mean Value
> > >      - Std Deviation
> > >      - CoV (Variance): Coefficient of variation (relative standard
> > >        deviation) measures spread relative to the mean rather than
> > >        statistical variance.
> > >
> > >  An LLM was used to help generate the benchmarking and data processin=
g scripts.
> > >
> > > usemem30 Benchmarking Summary:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > >
> > >  ---------------------------------------------------
> > >     Improvement with v4 zswap compress batching
> > >  ---------------------------------------------------
> > >   mTHP enabled:       2048kB     1024kB       64kB
> > >  ---------------------------------------------------
> > >       Sys time:      -13.87%     -2.64%     -1.72%
> > >     Throughput:       +3.85%     +0.42%     +1.31%
> > >  ---------------------------------------------------
> > >
> > > Detailed usemem30 benchmarking data:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > >  1) 2048kB mTHP:
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > >  ------------------------------------------------------------------
> > >  2048kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
> > >  ------------------------------------------------------------------
> > >                Baseline mm-unstable   v4 zswap compress batching
> > >                               (sec)        (sec)
> > >  ------------------------------------------------------------------
> > >  [Run 1/10]  Sys Time:    1581.414s    1356.252s
> > >  [Run 2/10]  Sys Time:    1642.874s    1478.929s
> > >  [Run 3/10]  Sys Time:    1594.458s    1411.252s
> > >  [Run 4/10]  Sys Time:    1580.988s    1380.959s
> > >  [Run 5/10]  Sys Time:    1579.654s    1380.609s
> > >  [Run 6/10]  Sys Time:    1627.765s    1345.582s
> > >  [Run 7/10]  Sys Time:    1593.872s    1334.485s
> > >  [Run 8/10]  Sys Time:    1623.189s    1405.471s
> > >  [Run 9/10]  Sys Time:    1661.954s    1433.365s
> > >  [Run 10/10] Sys Time:    1602.098s    1329.813s
> > >  ------------------------------------------------------------------
> > >
> > >  ------------------------------------------------------------------
> > >  METRIC: System CPU Time (Sys Time) : 2048kB mTHP
> > >  ------------------------------------------------------------------
> > >                Baseline mm-unstable   v4 zswap compress batching
> > >                               (sec)            (sec)
> > >  ------------------------------------------------------------------
> > >  Total Samples    :              10               10
> > >  Mean Value       :        1,608.83         1,385.67
> > >  Std Deviation    :           28.67            47.47
> > >  CoV (Variance)   :           1.78%            3.43%
> > >  ------------------------------------------------------------------
> > >  METRIC: Per-Process Throughput : 2048kB mTHP
> > >  ------------------------------------------------------------------
> > >                Baseline mm-unstable   v4 zswap compress batching
> > >                              (KB/s)           (KB/s)
> > >  ------------------------------------------------------------------
> > >  Total Samples    :             300              300
> > >  Mean Value       :         292,261          303,508
> > >  Std Deviation    :          12,946           20,806
> > >  CoV (Variance)   :           4.42%            6.86%
> > >  ------------------------------------------------------------------
> > >
> > >  2) 1024kB mTHP:
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > >  ------------------------------------------------------------------
> > >  1024kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
> > >  ------------------------------------------------------------------
> > >                Baseline mm-unstable   v4 zswap compress batching
> > >                               (sec)        (sec)
> > >  ------------------------------------------------------------------
> > >  [Run 1/10]  Sys Time:    1567.639s    1594.696s
> > >  [Run 2/10]  Sys Time:    1537.577s    1456.113s
> > >  [Run 3/10]  Sys Time:    1538.562s    1521.887s
> > >  [Run 4/10]  Sys Time:    1626.176s    1531.962s
> > >  [Run 5/10]  Sys Time:    1593.955s    1528.733s
> > >  [Run 6/10]  Sys Time:    1643.519s    1558.482s
> > >  [Run 7/10]  Sys Time:    1510.613s    1480.177s
> > >  [Run 8/10]  Sys Time:    1632.018s    1584.093s
> > >  [Run 9/10]  Sys Time:    1569.424s    1528.915s
> > >  [Run 10/10] Sys Time:    1552.747s    1570.451s
> > >  ------------------------------------------------------------------
> > >
> > >  ------------------------------------------------------------------
> > >  METRIC: System CPU Time (Sys Time) : 1024kB mTHP
> > >  ------------------------------------------------------------------
> > >                Baseline mm-unstable   v4 zswap compress batching
> > >                               (sec)            (sec)
> > >  ------------------------------------------------------------------
> > >  Total Samples    :             10                10
> > >  Mean Value       :       1,577.22          1,535.55
> > >  Std Deviation    :          45.13             43.79
> > >  CoV (Variance)   :          2.86%             2.85%
> > >  ------------------------------------------------------------------
> > >  METRIC: Per-Process Throughput : 1024kB mTHP
> > >  ------------------------------------------------------------------
> > >                Baseline mm-unstable   v4 zswap compress batching
> > >                              (KB/s)           (KB/s)
> > >  ------------------------------------------------------------------
> > >  Total Samples    :            300               300
> > >  Mean Value       :        289,904           291,114
> > >  Std Deviation    :         15,385            14,553
> > >  CoV (Variance)   :          5.31%             5.00%
> > >  ------------------------------------------------------------------
> > >
> > >  3) 64kB mTHP:
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > >  ------------------------------------------------------------------
> > >  64kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
> > >  ------------------------------------------------------------------
> > >                Baseline mm-unstable   v4 zswap compress batching
> > >                               (sec)        (sec)
> > >  ------------------------------------------------------------------
> > >  [Run 1/10]  Sys Time:    1914.525s    1878.483s
> > >  [Run 2/10]  Sys Time:    1869.412s    1863.177s
> > >  [Run 3/10]  Sys Time:    1944.049s    1863.502s
> > >  [Run 4/10]  Sys Time:    1942.757s    1900.144s
> > >  [Run 5/10]  Sys Time:    1866.505s    1887.285s
> > >  [Run 6/10]  Sys Time:    1877.716s    1861.668s
> > >  [Run 7/10]  Sys Time:    1861.741s    1868.788s
> > >  [Run 8/10]  Sys Time:    1904.735s    1816.372s
> > >  [Run 9/10]  Sys Time:    1891.074s    1850.435s
> > >  [Run 10/10] Sys Time:    1893.366s    1849.747s
> > >  ------------------------------------------------------------------
> > >
> > >  ------------------------------------------------------------------
> > >  METRIC: System CPU Time (Sys Time) : 64kB mTHP
> > >  ------------------------------------------------------------------
> > >                Baseline mm-unstable   v4 zswap compress batching
> > >                               (sec)            (sec)
> > >  ------------------------------------------------------------------
> > >  Total Samples    :              10               10
> > >  Mean Value       :        1,896.59         1,863.96
> > >  Std Deviation    :           29.86            22.96
> > >  CoV (Variance)   :           1.57%            1.23%
> > >  ------------------------------------------------------------------
> > >  METRIC: Per-Process Throughput : 64kB mTHP
> > >  ------------------------------------------------------------------
> > >                Baseline mm-unstable   v4 zswap compress batching
> > >                              (KB/s)           (KB/s)
> > >  ------------------------------------------------------------------
> > >  Total Samples    :            300               300
> > >  Mean Value       :        239,114           242,254
> > >  Std Deviation    :          9,090             6,419
> > >  CoV (Variance)   :          3.80%             2.65%
> > >  ------------------------------------------------------------------
> >
> > The numbers look nice, but what's the zswap setup here? What's the
> > compressor? And how much of the win comes from this patch v.s the last
> > patch?
> >
> > This patch series, and this patch in particular, seem like a lot of
> > complexity. I'd like to understand better the win before adding all
> > this complexity to the codebase.
>
> Hi Nhat,
>
> ZSTD is the zswap compressor. My apologies for forgetting to mention
> this in the performance testing section.
>
> All reclaim and zswap parameters are the defaults in the kernel build
> (I also configure ZSTD as my default zswap compressor when I build the
> kernel):
>
> vm.swappiness =3D 60
> /sys/module/zswap/parameters/max_pool_percent: 20
> /sys/module/zswap/parameters/shrinker_enabled: N
>
> /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled: [always]
> inherit madvise never
> /sys/kernel/mm/transparent_hugepage/enabled: [always] madvise never
> /sys/kernel/mm/transparent_hugepage/defrag: always defer defer+madvise
> [madvise] never
>
> I just shared my analysis based on bpftrace data in response to your
> cover letter comments, to try and explain the wins with zswap store
> batching alone (patches 6-7) and then with zswap compress batching
> (patch 8). Please do let me know if you have follow-up
> questions/comments.
>
> I will also gather and post usemem30 numbers before/after patch 8.

These are the data summaries/details with v4's zswap store batching
only (patches 6-7), and with zswap compress batching added in patch 8,
to help us better understand the wins.

Batch compression of PMD THP with ZSTD yields an additional 6.56% Sys
time savings and additional 1.12% Throughput improvement over zswap
store batching.
As expected, PMD THP demonstrates the most gains overall with
store+compress batching.

As mentioned in the cover letter, as other kernel components related
to mTHP become more efficient, the net realized performance benefit
can only be better with patch 8 than without.

usemem30 ZSTD Benchmarking Summary:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 ------------------------------------------------------------------
    Improvement over mm-unstable with v4 zswap store batching only
 ------------------------------------------------------------------
  mTHP enabled:       2048kB     1024kB       64kB
 ------------------------------------------------------------------
      Sys time:      -7.31%      +2.86%     -2.05%
    Throughput:      +2.73%      +0.96%     +2.03%
 ------------------------------------------------------------------

 ------------------------------------------------------------------
    Improvement over mm-unstable with v4 zswap store batching
                                  and v4 zswap compress batching
 ------------------------------------------------------------------
  mTHP enabled:       2048kB     1024kB       64kB
 ------------------------------------------------------------------
      Sys time:      -13.87%     -2.64%     -1.72%
    Throughput:       +3.85%     +0.42%     +1.31%
 ------------------------------------------------------------------

Detailed usemem30 ZSTD benchmarking data:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 1) 2048kB mTHP:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 ------------------------------------------------------------------------
 2048kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
 ------------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap store   v4 zswap compress
                              (sec)   batching (sec)   batching (sec)
 ------------------------------------------------------------------------
 [Run 1/10]  Sys Time:    1581.414s       1479.949s       1356.252s
 [Run 2/10]  Sys Time:    1642.874s       1436.926s       1478.929s
 [Run 3/10]  Sys Time:    1594.458s       1502.354s       1411.252s
 [Run 4/10]  Sys Time:    1580.988s       1466.870s       1380.959s
 [Run 5/10]  Sys Time:    1579.654s       1567.244s       1380.609s
 [Run 6/10]  Sys Time:    1627.765s       1471.919s       1345.582s
 [Run 7/10]  Sys Time:    1593.872s       1581.152s       1334.485s
 [Run 8/10]  Sys Time:    1623.189s       1440.385s       1405.471s
 [Run 9/10]  Sys Time:    1661.954s       1485.601s       1433.365s
 [Run 10/10] Sys Time:    1602.098s       1480.110s       1329.813s
 ------------------------------------------------------------------------

 ------------------------------------------------------------------------
 METRIC: System CPU Time (Sys Time) : 2048kB mTHP
 ------------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap store   v4 zswap compress
                              (sec)   batching (sec)   batching (sec)
 ------------------------------------------------------------------------
 Total Samples    :              10               10                10
 Mean Value       :        1,608.83         1,491.25          1,385.67
 Std Deviation    :           28.67            48.04             47.47
 CoV (Variance)   :           1.78%            3.22%             3.43%
 ------------------------------------------------------------------------
 METRIC: Per-Process Throughput : 2048kB mTHP
 ------------------------------------------------------------------------
               Baseline mm-unstable    v4 zswap store   v4 zswap compress
                             (KB/s)   batching (KB/s)   batching (KB/s)
 ------------------------------------------------------------------------
 Total Samples    :             300               300               300
 Mean Value       :         292,261           300,233           303,508
 Std Deviation    :          12,946            14,777            20,806
 CoV (Variance)   :           4.42%             4.92%             6.86%
 ------------------------------------------------------------------------


 2) 1024kB mTHP:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 ------------------------------------------------------------------------
 1024kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
 ------------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap store   v4 zswap compress
                              (sec)   batching (sec)   batching (sec)
 ------------------------------------------------------------------------
 [Run 1/10]  Sys Time:    1567.639s       1608.238s       1594.696s
 [Run 2/10]  Sys Time:    1537.577s       1608.420s       1456.113s
 [Run 3/10]  Sys Time:    1538.562s       1649.323s       1521.887s
 [Run 4/10]  Sys Time:    1626.176s       1618.451s       1531.962s
 [Run 5/10]  Sys Time:    1593.955s       1550.748s       1528.733s
 [Run 6/10]  Sys Time:    1643.519s       1679.910s       1558.482s
 [Run 7/10]  Sys Time:    1510.613s       1607.291s       1480.177s
 [Run 8/10]  Sys Time:    1632.018s       1636.487s       1584.093s
 [Run 9/10]  Sys Time:    1569.424s       1626.656s       1528.915s
 [Run 10/10] Sys Time:    1552.747s       1638.399s       1570.451s
 ------------------------------------------------------------------------

 ------------------------------------------------------------------------
 METRIC: System CPU Time (Sys Time) : 1024kB mTHP
 ------------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap store   v4 zswap compress
                              (sec)   batching (sec)   batching (sec)
 ------------------------------------------------------------------------
 Total Samples    :             10                10                10
 Mean Value       :       1,577.22          1,622.39          1,535.55
 Std Deviation    :          45.13             33.79             43.79
 CoV (Variance)   :          2.86%             2.08%             2.85%
 ------------------------------------------------------------------------
 METRIC: Per-Process Throughput : 1024kB mTHP
 ------------------------------------------------------------------------
               Baseline mm-unstable    v4 zswap store   v4 zswap compress
                             (KB/s)   batching (KB/s)   batching (KB/s)
 ------------------------------------------------------------------------
 Total Samples    :            300                300               300
 Mean Value       :        289,904            292,673           291,114
 Std Deviation    :         15,385             13,727            14,553
 CoV (Variance)   :          5.31%              4.69%             5.00%
 ------------------------------------------------------------------------


 3) 64kB mTHP:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 ------------------------------------------------------------------------
 64kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
 ------------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap store   v4 zswap compress
                              (sec)   batching (sec)   batching (sec)
 ------------------------------------------------------------------------
 [Run 1/10]  Sys Time:    1914.525s       1892.620s       1878.483s
 [Run 2/10]  Sys Time:    1869.412s       1845.021s       1863.177s
 [Run 3/10]  Sys Time:    1944.049s       1874.024s       1863.502s
 [Run 4/10]  Sys Time:    1942.757s       1841.728s       1900.144s
 [Run 5/10]  Sys Time:    1866.505s       1819.562s       1887.285s
 [Run 6/10]  Sys Time:    1877.716s       1885.175s       1861.668s
 [Run 7/10]  Sys Time:    1861.741s       1849.232s       1868.788s
 [Run 8/10]  Sys Time:    1904.735s       1861.398s       1816.372s
 [Run 9/10]  Sys Time:    1891.074s       1887.040s       1850.435s
 [Run 10/10] Sys Time:    1893.366s       1821.599s       1849.747s
 ------------------------------------------------------------------------

 ------------------------------------------------------------------------
 METRIC: System CPU Time (Sys Time) : 64kB mTHP
 ------------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap store   v4 zswap compress
                              (sec)   batching (sec)   batching (sec)
 ------------------------------------------------------------------------
 Total Samples    :              10              10                 10
 Mean Value       :        1,896.59        1,857.74           1,863.96
 Std Deviation    :           29.86           26.58              22.96
 CoV (Variance)   :           1.57%           1.43%              1.23%
 ------------------------------------------------------------------------
 METRIC: Per-Process Throughput : 64kB mTHP
 ------------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap store   v4 zswap compress
                             (KB/s)   batching (KB/s)   batching (KB/s)
 ------------------------------------------------------------------------
 Total Samples    :            300                300               300
 Mean Value       :        239,114            243,970           242,254
 Std Deviation    :          9,090              9,971             6,419
 CoV (Variance)   :          3.80%              4.09%             2.65%
 ------------------------------------------------------------------------

Thanks,
Kanchana
