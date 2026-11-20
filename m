Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795218918;
	b=iYD3hpDzWn0czmaTQXbOW2v59kDqhBnf1YjOL8rKxCbIy2cTZTa2yMBu8giQo/DR4iSP
	 tg9MwWLe+awnundlDYOdnncOkG01jEGe7lCzp1A52IgTNot7ArhvPEr7NUnUYJ5ZmRgCd
	 8JCEfUDhvIwECdzx/blnSVf83Ln7p9lTGOkpSsTosJWf42JB+vWILgX1HyJv3p8VKE0nO
	 xiZ2wgDw50FyUwMddRzD/3JL3V81Xppl8dPz/Ff3EYMSlKItTjxjHKUDBw6RY9hOU9AWZ
	 KO32Vj3L6dGUSJyC4x0UTcnArg236vHdsXbxMyJCMTlZThFkpS0VyvHTOt6W1CFOg+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YsHal6o5nRWNnSKiS+O4IM67tsy/StPXyCl5eMW8G3Q=;
	b=qUffM2K2KrWVQPtT1UKVurGQYlI0mthtrDF+8h8lzEMuC+k8kTgx3q4PmtG8+1cGuhOV
	 Q1daZyp1T7BTVy5tyMGJNsfBorOMTkOl3Q6QNj8FsAPZzFOtSF5m5C+ArMldrHW5nOSRO
	 zQv5Pp37CO1PKtnMm+Kl9EytALGFc776YI3O2Pm01yi5o5k9tG3swwYuSs7smXyojS5Ab
	 PIYoFUT/bvwPgoKr6eMhNj5kIhrtZQceoMYe9gpAC8Lfi9evhoUTa6ci+xHipBqO29OBH
	 CPMcOAUgf9sn6X6C892SV5EGjz9fU95bCoSEf2IxvDjueL7NhnUdKUi5gELeUREnzPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Csm9Tg3j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142E060A2603
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 142E060A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Csm9Tg3j
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491971ac844so1275487f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795218915; cv=none;
        d=google.com; s=arc-20260327;
        b=CjTm0ONqeiiNXLUyPEOnta23f6MMC2ujccsG+OsyJ00uZzqpIBWZ+Z9aLctSbkuKaF
         ShjNALS7SoPju9sp/O8el9WKCu9iAUBDlRjeYS88b91Iat1w3JxnnB/iAtag5MToUyA5
         RWdZrZDvTb8pB2bbcvCEVSjq5iRO9WQt/DMENTbaDfcpywlsLm0P1lVoAIzMpg+ciyJc
         lmmXi/ctgnYGozMb6J7/zS709aCkLdvg0N6tPX1sPT9bWcC+doMSvjbwsDAIhOV+nNyo
         e1UU9YHtvv8z/NgFE10NLBY1ZBi78c2/XdixQDh+Zsa6Xao7Zwu+sbCKgBYix/rCaCU3
         J8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YsHal6o5nRWNnSKiS+O4IM67tsy/StPXyCl5eMW8G3Q=;
        fh=7c2Pg4VOyfZQnb1pFpOskwN2QDQmGpUTYEYUIfTnVvM=;
        b=iies9flK2aDaYhTpHBY64F+HyJMxNHMWe+idFPiKEkmReoNTAP+pPnOvR8D/ZUoGb7
         +E/dvIlkygSZut4inZbfipUPHmCI6+5uxixOj1jencNyXoAWK2Xr1uJwoOhyVSUqPRTq
         Zd+LnGRHRm7JThbHO/7mp+cD8u+tpWK/7b7fvFWA/e2gnRnOT9K1dE+8jxnxDSznoK8q
         gBsBjjVob0cqaHctA+hemetLNkCu/HD+NhAd8BGHywlPA86hsCYZcWqm0ki3cQnQKJHM
         aCec3ED+JF03uravpxrqLoBsW/ctP/mvVBCmjRgrP0o17AZTKtqAPjkRqzhQuqEhYdUT
         Qz6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218915; x=1795823715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YsHal6o5nRWNnSKiS+O4IM67tsy/StPXyCl5eMW8G3Q=;
        b=Csm9Tg3jGKy/kxu9G1xVa2paK9LVdqHbfFCRxAEKE5jp4PMccjLCHg7IbtHA+WpxRL
         pV0jrZCbSwYEzQ3W1qZkNsFJ1/7H6s/bnOJV1Ud95MXgq6XmTYbJay6f/kLz1L9mAFTM
         k0Gm/4eGOaA65yofqRaA1h+XOuUwbKN6odRZR7Pf7ePl6D9Grh6uQ1P/4IcOvcb3n6KI
         9PQQh1xjBfvzi7S8yiPoyE6kNS7GscEpceAtH75w/uIc5hLRPxazc/oZYkCee1cROJ2j
         KmGz+pwqfINMnd8wn6V6wp0CM5XAc4qwEiDQBGJwyXhT8XyTv8hYvXmuZM5B7G7dzGga
         yqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218915; x=1795823715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsHal6o5nRWNnSKiS+O4IM67tsy/StPXyCl5eMW8G3Q=;
        b=2aT9IenG4wqcaJT3YzA9GDIa8zG5H+g489S7PzAEGt+na6y3RWp3TZg104qUYzLJ3Q
         LBBwby3v1l7iSiZNFpUFvA92gBDMEwv7FBeRSdceg/B87I4ETCu8BOsP50B1DAtEeGmq
         h1QLoVA2JoG3kwEp6Alc3Zl1vAgz7a4gt8mwoGhZ8oualCqcRqlgi1A0RiYd/UNhgKDp
         Nqa2eI3Hy81XMJrsJHi6LMERqQMUOg8gx8ElRpT6WnlaJx8Or5KDbRMUWjbN3DlHt9Vc
         X1TE7W/4VU7otTFiAbdlWr9upifx+mkocBUPudkDuY36lRIh+fj3ruWe97ezCnGZtDhe
         VFSw==
X-Forwarded-Encrypted: i=1; AL+hErHt9Y9QdNM9Y3yC237dPWOlBABt3fKeQwXz6OoHtbK/io/yCCw/yiGE6JRekX6ekrZWNwNjjJsVXpnThI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EiRklBDvg7djaIA3xSiDT5ysVbt9dSiGW5LombmrHMJrRlY37
	gKuiuHz2C+vxTnPbxTdniRn+WrN33ehzcQtMcs6gSxJFE8p6sOxRCkLGHHHcckHdBtAaUnEh8Dj
	oo/0oiIFoIksBtxnSW1y01N+RWArFI7Q=
X-Gm-Gg: AZFdTZeQOmyCyjk1JhRMB2twc63QZCjIVOFsnj9DkLh8BMGOTgSI6UgJ4xFqzZM5RWI
	kLdS+Czs2yvV0vAj0hEwmA4fkn60DLXkgoJ2HyIzUv2YHCD8Z6ydAVZQ04HELtVldcUmUNkCzow
	B7W32/L+j/yCQ1berGj2N1sMkUOYKn6rVmo6YjmNzocKwaR6x7f81wCPCMK4OGpIezD/pgqt3OL
	KdHNq1jMoMLhzLG+Wr3ICCUVAeRAyZaz8+kamqr04X7mK2DCUaeUQFy4UOZkxBAgDkeretMkhVw
	9/8VU9na6uU+x5oJejwFYTOK+XoXI9QLFc/zjFBAjmAinbeY2k3PIUdwIz0yLuJxPDgq8J1iowD
	KlEyO907EJosk8Pjm8ZCuBEwRNBcFw+T5t6UapVHtIGPoWfkB8/hIzFVhGLuTaYGv7FzyYb0Erc
	cceaeLjcRuQYJyo5lmC6k42SCGO0rRGgi+PTyeUSPr1pFPvHjLbJ1tc5E=
X-Received: by 2002:a05:6000:4381:b0:4a6:ed6f:7a6d with SMTP id
 ffacd0b85a97d-4abb1d93c3emr9288838f8f.28.1795218915387; Fri, 20 Nov 2026
 15:55:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com> <20261120041906.5785-9-kanchanapsridhar2026@gmail.com>
In-Reply-To: <20261120041906.5785-9-kanchanapsridhar2026@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 20 Nov 2026 15:55:04 -0800
X-Gm-Features: Aa3M54oUDY9bCyxtNFZ-ITKxLcqccLM_og5aWM-IgYq9zskwWDXgegX58dgm7ho
Message-ID: <CAKEwX=NtUEd7+Q2rW79LtObnjHT5uNFAUKfkRJJN1Wppe4Yc6g@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] mm: zswap: Batched zswap_compress() for storing
 large folios in batches.
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
> A new batching implementation of zswap_compress() is provided for
> compressors that do and do not support batching. This eliminates code
> duplication and facilitates code maintainability with the introduction
> of compress batching.
>
> The vectorized implementation of calling the earlier zswap_compress()
> sequentially, one page at a time in zswap_store_pages(), is replaced
> with this new version of zswap_compress() that accepts multiple pages to
> compress as a batch.
>
> When the crypto_acomp is used to set up the per-CPU acomp_ctx
> during CPU onlining, the compressor's batch_size is obtained by calling:
>
>   crypto_acomp_batch_size(acomp_ctx->acomp)
>
> This is bounded by ZSWAP_MAX_BATCH_SIZE to limit the memory
> overhead and to reflect the store batch constraint of max # of pages in
> a batch. The clamped batch_size is stored in the per-CPU
> acomp_ctx->comp.compr_batch_size.
>
> As noted in previous commits in this series, ZSWAP_MAX_BATCH_SIZE
> per-CPU compression buffers are available for sequential and batching
> compression algorithms.
>
> Regardless of compression batching, we always process large folios in
> batches of ZSWAP_MAX_BATCH_SIZE.
>
> If the compressor does not support batching, each page in the batch is
> compressed sequentially. For batching compressors, up to
> acomp_ctx->comp.compr_batch_size pages in the batch are compressed per
> call to crypto_acomp_compress(). The first phase of zswap_compress()
> thus only calls crypto_acomp_compress() until all pages in the batch
> have been compressed. When this finishes, the compressed buffers and
> compressed lengths for the batch are available in the
> acomp_ctx->comp.sg_table->sgl scatterlists.
>
> A new zswap_update_entries() then iterates through the (up to)
> ZSWAP_MAX_BATCH_SIZE SG lists in acomp_ctx->comp.sg_table->sgl,
> allocates zsmalloc memory and copies all compressed buffers to
> the compressed pool. All existing functionality on zswap
> writeback_enabled (or not) fallbacks under various error conditions
> denoted by the crypto_acomp_compress() return value [and with this
> commit, also stored in the individual acomp_ctx->comp.sg_table->sgl
> sg->lengths in the crypto_acomp_compress() fast path], is essentially
> preserved.
>
> A significant zswap architectural change is that the batched
> zswap_compress() incorporates Herbert's suggestion for SG lists to
> represent the batch's inputs/outputs to interface with the crypto API
> [1].
>
> The introduction of zswap_update_entries() presents an opportunity to
> optimize the task of storing a batch of compressed buffers. Subsequent
> patch series will be submitted to optimize this phase by replacing
> zsmalloc with the SLUB allocator to improve zswap_store()/zswap_load()
> latencies.
>
> The batching framework introduced in this series improves zswap_store()
> latency by a lot.
>
> Performance testing: usemem30 with 100% over-commit:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> Validation was done with mm-unstable as of 11-17-2026 (Baseline: commit
> 866f761fd414) and with this patch series.
>
> v4 was validated on an Intel Xeon Sapphire Rapids bare-metal instance wit=
h
> 48 cores.
>
>  Bare-metal instance specs:
>  --------------------------
>  - 48 physical cores
>  - 190G RAM
>  - 200G SWAP disk partition
>
>  Workload: 30 concurrent usemem processes, each allocates 10G:
>  -------------------------------------------------------------
>  The vm-scalability "usemem" test (unmodified version) was run in a
>  cgroup with memory.high fixed at 150G. There is no swap limit set for th=
e
>  cgroup.
>
>  To quantify the performance benefit of zswap compress batching at scale,
>  30 usemem processes were run ("usemem30"), each allocating and writing 1=
0G of
>  memory, and sleeping for 10 sec before exiting.
>
>   usemem -w -O -b 5 -s 10 -n 30 10g
>   echo 0 > /sys/module/zswap/parameters/shrinker_enabled
>
>  Performance validation methodology:
>  -----------------------------------
>  These settings were used to minimize variation:
>
>  - All cores were fixed to run at 2.4GHz with "performance" scaling gover=
nor.
>  - Turbo boost was disabled.
>  - CPU power-saving C-states restricted with:
>
>      GRUB_CMDLINE_LINUX_DEFAULT=3D"intel_idle.max_cstate=3D1 processor.ma=
x_cstate=3D1"
>
>  The usemem30 experiments were run with the baseline mm-unstable as of
>  11-17-2026 (commit 866f761fd414) and with this patch-series.
>
>  After booting into each kernel:
>
>   1) Constrain the cgroup's memory.high to 150G.
>
>   2) Run 2 warm-up iterations of usemem30. Don't use this data for benchm=
arking
>      since sys time typically skews higher for initial runs.
>
>   3) Next, run 10 benchmarking iterations of usemem30:
>      - Log these high-level metrics: Sys time and individual usemem throu=
ghput.
>
>   4) Sys time and Throughput metrics were gathered for three mTHP setting=
s:
>
>      - 2048kB
>      - 1024kB
>      - 64kB
>
>   5) Benchmark summary data includes Sys time and Throughput components f=
rom the
>      10 iterations of usemem30:
>
>      - Total Samples
>      - Mean Value
>      - Std Deviation
>      - CoV (Variance): Coefficient of variation (relative standard
>        deviation) measures spread relative to the mean rather than
>        statistical variance.
>
>  An LLM was used to help generate the benchmarking and data processing sc=
ripts.
>
> usemem30 Benchmarking Summary:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>
>  ---------------------------------------------------
>     Improvement with v4 zswap compress batching
>  ---------------------------------------------------
>   mTHP enabled:       2048kB     1024kB       64kB
>  ---------------------------------------------------
>       Sys time:      -13.87%     -2.64%     -1.72%
>     Throughput:       +3.85%     +0.42%     +1.31%
>  ---------------------------------------------------
>
> Detailed usemem30 benchmarking data:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  1) 2048kB mTHP:
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  ------------------------------------------------------------------
>  2048kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
>  ------------------------------------------------------------------
>                Baseline mm-unstable   v4 zswap compress batching
>                               (sec)        (sec)
>  ------------------------------------------------------------------
>  [Run 1/10]  Sys Time:    1581.414s    1356.252s
>  [Run 2/10]  Sys Time:    1642.874s    1478.929s
>  [Run 3/10]  Sys Time:    1594.458s    1411.252s
>  [Run 4/10]  Sys Time:    1580.988s    1380.959s
>  [Run 5/10]  Sys Time:    1579.654s    1380.609s
>  [Run 6/10]  Sys Time:    1627.765s    1345.582s
>  [Run 7/10]  Sys Time:    1593.872s    1334.485s
>  [Run 8/10]  Sys Time:    1623.189s    1405.471s
>  [Run 9/10]  Sys Time:    1661.954s    1433.365s
>  [Run 10/10] Sys Time:    1602.098s    1329.813s
>  ------------------------------------------------------------------
>
>  ------------------------------------------------------------------
>  METRIC: System CPU Time (Sys Time) : 2048kB mTHP
>  ------------------------------------------------------------------
>                Baseline mm-unstable   v4 zswap compress batching
>                               (sec)            (sec)
>  ------------------------------------------------------------------
>  Total Samples    :              10               10
>  Mean Value       :        1,608.83         1,385.67
>  Std Deviation    :           28.67            47.47
>  CoV (Variance)   :           1.78%            3.43%
>  ------------------------------------------------------------------
>  METRIC: Per-Process Throughput : 2048kB mTHP
>  ------------------------------------------------------------------
>                Baseline mm-unstable   v4 zswap compress batching
>                              (KB/s)           (KB/s)
>  ------------------------------------------------------------------
>  Total Samples    :             300              300
>  Mean Value       :         292,261          303,508
>  Std Deviation    :          12,946           20,806
>  CoV (Variance)   :           4.42%            6.86%
>  ------------------------------------------------------------------
>
>  2) 1024kB mTHP:
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  ------------------------------------------------------------------
>  1024kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
>  ------------------------------------------------------------------
>                Baseline mm-unstable   v4 zswap compress batching
>                               (sec)        (sec)
>  ------------------------------------------------------------------
>  [Run 1/10]  Sys Time:    1567.639s    1594.696s
>  [Run 2/10]  Sys Time:    1537.577s    1456.113s
>  [Run 3/10]  Sys Time:    1538.562s    1521.887s
>  [Run 4/10]  Sys Time:    1626.176s    1531.962s
>  [Run 5/10]  Sys Time:    1593.955s    1528.733s
>  [Run 6/10]  Sys Time:    1643.519s    1558.482s
>  [Run 7/10]  Sys Time:    1510.613s    1480.177s
>  [Run 8/10]  Sys Time:    1632.018s    1584.093s
>  [Run 9/10]  Sys Time:    1569.424s    1528.915s
>  [Run 10/10] Sys Time:    1552.747s    1570.451s
>  ------------------------------------------------------------------
>
>  ------------------------------------------------------------------
>  METRIC: System CPU Time (Sys Time) : 1024kB mTHP
>  ------------------------------------------------------------------
>                Baseline mm-unstable   v4 zswap compress batching
>                               (sec)            (sec)
>  ------------------------------------------------------------------
>  Total Samples    :             10                10
>  Mean Value       :       1,577.22          1,535.55
>  Std Deviation    :          45.13             43.79
>  CoV (Variance)   :          2.86%             2.85%
>  ------------------------------------------------------------------
>  METRIC: Per-Process Throughput : 1024kB mTHP
>  ------------------------------------------------------------------
>                Baseline mm-unstable   v4 zswap compress batching
>                              (KB/s)           (KB/s)
>  ------------------------------------------------------------------
>  Total Samples    :            300               300
>  Mean Value       :        289,904           291,114
>  Std Deviation    :         15,385            14,553
>  CoV (Variance)   :          5.31%             5.00%
>  ------------------------------------------------------------------
>
>  3) 64kB mTHP:
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  ------------------------------------------------------------------
>  64kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
>  ------------------------------------------------------------------
>                Baseline mm-unstable   v4 zswap compress batching
>                               (sec)        (sec)
>  ------------------------------------------------------------------
>  [Run 1/10]  Sys Time:    1914.525s    1878.483s
>  [Run 2/10]  Sys Time:    1869.412s    1863.177s
>  [Run 3/10]  Sys Time:    1944.049s    1863.502s
>  [Run 4/10]  Sys Time:    1942.757s    1900.144s
>  [Run 5/10]  Sys Time:    1866.505s    1887.285s
>  [Run 6/10]  Sys Time:    1877.716s    1861.668s
>  [Run 7/10]  Sys Time:    1861.741s    1868.788s
>  [Run 8/10]  Sys Time:    1904.735s    1816.372s
>  [Run 9/10]  Sys Time:    1891.074s    1850.435s
>  [Run 10/10] Sys Time:    1893.366s    1849.747s
>  ------------------------------------------------------------------
>
>  ------------------------------------------------------------------
>  METRIC: System CPU Time (Sys Time) : 64kB mTHP
>  ------------------------------------------------------------------
>                Baseline mm-unstable   v4 zswap compress batching
>                               (sec)            (sec)
>  ------------------------------------------------------------------
>  Total Samples    :              10               10
>  Mean Value       :        1,896.59         1,863.96
>  Std Deviation    :           29.86            22.96
>  CoV (Variance)   :           1.57%            1.23%
>  ------------------------------------------------------------------
>  METRIC: Per-Process Throughput : 64kB mTHP
>  ------------------------------------------------------------------
>                Baseline mm-unstable   v4 zswap compress batching
>                              (KB/s)           (KB/s)
>  ------------------------------------------------------------------
>  Total Samples    :            300               300
>  Mean Value       :        239,114           242,254
>  Std Deviation    :          9,090             6,419
>  CoV (Variance)   :          3.80%             2.65%
>  ------------------------------------------------------------------

The numbers look nice, but what's the zswap setup here? What's the
compressor? And how much of the win comes from this patch v.s the last
patch?

This patch series, and this patch in particular, seem like a lot of
complexity. I'd like to understand better the win before adding all
this complexity to the codebase.
