Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148371;
	b=HE4wz27NpIdlDf7l84cmHlqkob1SjVlxDp5xL46YLAA4yA8jM3T/ZLqOD5i67FdC0lCP
	 g8jmh7sAMYX4Sb51yCL70j+vJLGzCe6+JyXedN7B7t4lkXxNfOHVmcut0w/CwFFGZxuDu
	 1qgvhrhofxeviI++VQWxSQwlhIWT/J4RehUlX06TP788IlzyDMm9vly1TPyamlIElmvIJ
	 0rivxXNfmwZ5kqp1hLvHjhp9fFLu5i1evT90WwmP/vzXeU/P4woK117F7mhvv2xrHI6jh
	 0yXJ/9xgCO0YUsHTm4ipF4Ll03M6jCZFTvwUqbLvND27A3zfqgPQdMj6qRDaPu1dNkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=da7OrhAq7QYAeNXvztg2BtB9oO6LjhE1tm8Pj5zbN5M=;
	b=Zy/MFhzRpwcrGbVG7ap+EOw7Qe7Xs6A6San04aj9Jlhr/pxgQrTw32tHkIDvkIq+y/OF
	 /ozN1FZoenvxj/h0PWCVldk8eoEVeJwi4YQV1y8jEkucNYAur/ZG8/zKR79mQ/WxeQLFj
	 H80/Vy8hjo4lBun5P875MRFTWUbro0dfcMpaAGsXJxgbZUG4s7xCL4MoGICGZbHUN1u8D
	 UHzpnd3OeImXXi/SumIGNQB5UJmu1b0C+vI8E5ngJLMJqA7mQ9pqR0M9ZTuusA7KfWJXk
	 TtZFm1dw20ilP1VqGQKAAlXGY0BUqFybSq/3mbEYQNfyfp+60HWi0tIgnGY8ExEwoPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxhMdPYG;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6140360A2610
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6140360A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxhMdPYG
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2af4c8d00so976549c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795148370; x=1795753170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=da7OrhAq7QYAeNXvztg2BtB9oO6LjhE1tm8Pj5zbN5M=;
        b=qxhMdPYG/RFbD2PIzUbBwHcBCsdv1/pLQ9mGtr+2q9CRSuikpnEoqYdi76mfaot8vx
         jf02DhH0oV7nFDj5CYN+sBIENHJ51r++JzVVMtPsoCQYOsNaNNm1N1J+BM9fo9tendfK
         KiQvNRujjOF5w9MGSrgf6X9Ux/aeYG1Bgk94hFLD1pms4gGPVB87+TFwAJW+wDG5sP2J
         bGI09pT07WkVjYyZNj1dq2nlu3BM0tpjviSEsqfJjMKtBTksQz/3I/NAt+go+UM56o7Q
         GHt6ei2Q3ghKtpbgr6lW+i7Pq+dj3/ZvkSvwjGrvbFD8GgTrSMK+tsX/NOQASe3vP6RD
         BkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795148370; x=1795753170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=da7OrhAq7QYAeNXvztg2BtB9oO6LjhE1tm8Pj5zbN5M=;
        b=tAXgwsIpsUSotyFfM5YkoSVUvIYN9COzDilvg22Y6mcVynPkVOISjMaoyfOTbTKkrE
         rQniUc83hn3T4OwXfL+Xk995vSXifUVIXgyqeMp/facg8qvJghfi7NfsMGS3f32Dw+li
         epVPkw6lZxHzSOFVtYw+aA1KtmCR5MQ47yMLYr8i9Q/gu372Prdc+3UBbWI6ejOHRTq1
         Dd5hgDLWM2useM4WJ5QRkPKNEmRKLT64C9jyP9F4HopARqzCFU7Q/LdLiU6GFJQ1sTba
         P24Y1ATJ7wAwaQag6YxkdetgwmBOVFGl3CeD2fGs/Jg8b8BLUMJbCqnE40RE44kI1/6A
         A09Q==
X-Forwarded-Encrypted: i=1; AL+hErGJMVK+Ft7/hVXYijLZMXCrCaSXQBSjgUZISk59I4JavqU1H3x8YEJRcAJ4i9Wf1f96AyKEKKJT9IDlS/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z87G4ALQZEEK9dwfv1L4Xmt022D0LlcaOzDhlbkqaI4i48xcRiX
	cenkqAxSJJypv2HnM7ifjFxN76Pvi6Z6gCNEiwWz4WL5HMmz3ZQKXKi39urFlduX
X-Gm-Gg: AYBFou0K9GY5qAWh7vbrvWbClrWCspKByl827emBgh76UQ3PgAtW581BYC4QbWSRRpK
	D/VA4cEOK+yACr8Prtr/YDR3Lvhhr2olIWUoH0QT3H9uhJFRfYnqqGHYClIyCn+eKiTJcKqMt0w
	02q0B1lIvDsZuRb0rIi/JJF4Kj7fjoH1NKBHhxKAMvX2m0Ks+WRw5KLznBrDmuN+Uk/Pip9JoAT
	Ic2/Um9QTM1I//HWU/taG8d83ki5cKB1QqZ9vaR2UmQpKTWojRMHn+aFqsmtFDqrsj9SvEhpPmw
	g54HxXVWFDWcp9OSy4IhGuPXHRXJSVu69TvvNC/Qj22BQvuTS1nVaKqsRXws1kK6vbU1je38d4Z
	qirpT4de3l/Z5ViGhO3jQqs8p35gZbJxiNqPB42E/RMbY/z8AF6YdfKyg3yzWLhQccntAINAOAq
	++jSovLVS1AZtXmHvwaZFUaYoyua8iByhG056gpUNZD4i2kjeMLCkWMjdWPVZ9VopW9ngTtKdDS
	dHVfRxT0rpmiB0JqGRGbDWT3yqFUIwfSjBrMS5bp6hvRgMvrlgvOEONXlG+zqL+QFsevAcB3+dT
	1JoX9D9wvFOwe14H6ErC5eFtS0hiar94yD0dd/QRTbzCPD14Rwl1/myZGF0pfS0=
X-Received: by 2002:a05:7022:1583:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5568c0198mr1790025c88.25.1795148369362;
        Thu, 19 Nov 2026 20:19:29 -0800 (PST)
Received: from penguin.lxd ([12.187.136.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm3124341c88.7.2026.11.19.20.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:19:28 -0800 (PST)
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
To: hannes@cmpxchg.org,
	yosry@kernel.org,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org,
	kanchanapsridhar2026@gmail.com,
	linux-kernel@vger.kernel.org
Cc: rientjes@google.com,
	willy@infradead.org,
	senozhatsky@chromium.org
Subject: [PATCH v4 8/8] mm: zswap: Batched zswap_compress() for storing large folios in batches.
Date: Thu, 19 Nov 2026 20:19:06 -0800
Message-Id: <20261120041906.5785-9-kanchanapsridhar2026@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com>
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A new batching implementation of zswap_compress() is provided for
compressors that do and do not support batching. This eliminates code
duplication and facilitates code maintainability with the introduction
of compress batching.

The vectorized implementation of calling the earlier zswap_compress()
sequentially, one page at a time in zswap_store_pages(), is replaced
with this new version of zswap_compress() that accepts multiple pages to
compress as a batch.

When the crypto_acomp is used to set up the per-CPU acomp_ctx
during CPU onlining, the compressor's batch_size is obtained by calling:

  crypto_acomp_batch_size(acomp_ctx->acomp)

This is bounded by ZSWAP_MAX_BATCH_SIZE to limit the memory
overhead and to reflect the store batch constraint of max # of pages in
a batch. The clamped batch_size is stored in the per-CPU
acomp_ctx->comp.compr_batch_size.

As noted in previous commits in this series, ZSWAP_MAX_BATCH_SIZE
per-CPU compression buffers are available for sequential and batching
compression algorithms.

Regardless of compression batching, we always process large folios in
batches of ZSWAP_MAX_BATCH_SIZE.

If the compressor does not support batching, each page in the batch is
compressed sequentially. For batching compressors, up to
acomp_ctx->comp.compr_batch_size pages in the batch are compressed per
call to crypto_acomp_compress(). The first phase of zswap_compress()
thus only calls crypto_acomp_compress() until all pages in the batch
have been compressed. When this finishes, the compressed buffers and
compressed lengths for the batch are available in the
acomp_ctx->comp.sg_table->sgl scatterlists.

A new zswap_update_entries() then iterates through the (up to)
ZSWAP_MAX_BATCH_SIZE SG lists in acomp_ctx->comp.sg_table->sgl,
allocates zsmalloc memory and copies all compressed buffers to
the compressed pool. All existing functionality on zswap
writeback_enabled (or not) fallbacks under various error conditions
denoted by the crypto_acomp_compress() return value [and with this
commit, also stored in the individual acomp_ctx->comp.sg_table->sgl
sg->lengths in the crypto_acomp_compress() fast path], is essentially
preserved.

A significant zswap architectural change is that the batched
zswap_compress() incorporates Herbert's suggestion for SG lists to
represent the batch's inputs/outputs to interface with the crypto API
[1].

The introduction of zswap_update_entries() presents an opportunity to
optimize the task of storing a batch of compressed buffers. Subsequent
patch series will be submitted to optimize this phase by replacing
zsmalloc with the SLUB allocator to improve zswap_store()/zswap_load()
latencies.

The batching framework introduced in this series improves zswap_store()
latency by a lot.

Performance testing: usemem30 with 100% over-commit:
=====================================================
Validation was done with mm-unstable as of 11-17-2026 (Baseline: commit
866f761fd414) and with this patch series.

v4 was validated on an Intel Xeon Sapphire Rapids bare-metal instance with
48 cores.

 Bare-metal instance specs:
 --------------------------
 - 48 physical cores
 - 190G RAM
 - 200G SWAP disk partition

 Workload: 30 concurrent usemem processes, each allocates 10G:
 -------------------------------------------------------------
 The vm-scalability "usemem" test (unmodified version) was run in a
 cgroup with memory.high fixed at 150G. There is no swap limit set for the
 cgroup.

 To quantify the performance benefit of zswap compress batching at scale,
 30 usemem processes were run ("usemem30"), each allocating and writing 10G of
 memory, and sleeping for 10 sec before exiting.

  usemem -w -O -b 5 -s 10 -n 30 10g
  echo 0 > /sys/module/zswap/parameters/shrinker_enabled

 Performance validation methodology:
 -----------------------------------
 These settings were used to minimize variation:

 - All cores were fixed to run at 2.4GHz with "performance" scaling governor.
 - Turbo boost was disabled.
 - CPU power-saving C-states restricted with:

     GRUB_CMDLINE_LINUX_DEFAULT="intel_idle.max_cstate=1 processor.max_cstate=1"

 The usemem30 experiments were run with the baseline mm-unstable as of
 11-17-2026 (commit 866f761fd414) and with this patch-series.

 After booting into each kernel:

  1) Constrain the cgroup's memory.high to 150G.

  2) Run 2 warm-up iterations of usemem30. Don't use this data for benchmarking
     since sys time typically skews higher for initial runs.

  3) Next, run 10 benchmarking iterations of usemem30:
     - Log these high-level metrics: Sys time and individual usemem throughput.

  4) Sys time and Throughput metrics were gathered for three mTHP settings:

     - 2048kB
     - 1024kB
     - 64kB

  5) Benchmark summary data includes Sys time and Throughput components from the
     10 iterations of usemem30:

     - Total Samples
     - Mean Value
     - Std Deviation
     - CoV (Variance): Coefficient of variation (relative standard
       deviation) measures spread relative to the mean rather than
       statistical variance.

 An LLM was used to help generate the benchmarking and data processing scripts.

usemem30 Benchmarking Summary:
==============================

 ---------------------------------------------------
    Improvement with v4 zswap compress batching
 ---------------------------------------------------
  mTHP enabled:       2048kB     1024kB       64kB
 ---------------------------------------------------
      Sys time:      -13.87%     -2.64%     -1.72%
    Throughput:       +3.85%     +0.42%     +1.31%
 ---------------------------------------------------

Detailed usemem30 benchmarking data:
====================================

 1) 2048kB mTHP:
 ===============

 ------------------------------------------------------------------
 2048kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
 ------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap compress batching
                              (sec)        (sec)
 ------------------------------------------------------------------
 [Run 1/10]  Sys Time:    1581.414s    1356.252s
 [Run 2/10]  Sys Time:    1642.874s    1478.929s
 [Run 3/10]  Sys Time:    1594.458s    1411.252s
 [Run 4/10]  Sys Time:    1580.988s    1380.959s
 [Run 5/10]  Sys Time:    1579.654s    1380.609s
 [Run 6/10]  Sys Time:    1627.765s    1345.582s
 [Run 7/10]  Sys Time:    1593.872s    1334.485s
 [Run 8/10]  Sys Time:    1623.189s    1405.471s
 [Run 9/10]  Sys Time:    1661.954s    1433.365s
 [Run 10/10] Sys Time:    1602.098s    1329.813s
 ------------------------------------------------------------------

 ------------------------------------------------------------------
 METRIC: System CPU Time (Sys Time) : 2048kB mTHP
 ------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap compress batching
                              (sec)            (sec)
 ------------------------------------------------------------------
 Total Samples    :              10               10
 Mean Value       :        1,608.83         1,385.67
 Std Deviation    :           28.67            47.47
 CoV (Variance)   :           1.78%            3.43%
 ------------------------------------------------------------------
 METRIC: Per-Process Throughput : 2048kB mTHP
 ------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap compress batching
                             (KB/s)           (KB/s)
 ------------------------------------------------------------------
 Total Samples    :             300              300
 Mean Value       :         292,261          303,508
 Std Deviation    :          12,946           20,806
 CoV (Variance)   :           4.42%            6.86%
 ------------------------------------------------------------------

 2) 1024kB mTHP:
 ===============

 ------------------------------------------------------------------
 1024kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
 ------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap compress batching
                              (sec)        (sec)
 ------------------------------------------------------------------
 [Run 1/10]  Sys Time:    1567.639s    1594.696s
 [Run 2/10]  Sys Time:    1537.577s    1456.113s
 [Run 3/10]  Sys Time:    1538.562s    1521.887s
 [Run 4/10]  Sys Time:    1626.176s    1531.962s
 [Run 5/10]  Sys Time:    1593.955s    1528.733s
 [Run 6/10]  Sys Time:    1643.519s    1558.482s
 [Run 7/10]  Sys Time:    1510.613s    1480.177s
 [Run 8/10]  Sys Time:    1632.018s    1584.093s
 [Run 9/10]  Sys Time:    1569.424s    1528.915s
 [Run 10/10] Sys Time:    1552.747s    1570.451s
 ------------------------------------------------------------------

 ------------------------------------------------------------------
 METRIC: System CPU Time (Sys Time) : 1024kB mTHP
 ------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap compress batching
                              (sec)            (sec)
 ------------------------------------------------------------------
 Total Samples    :             10                10
 Mean Value       :       1,577.22          1,535.55
 Std Deviation    :          45.13             43.79
 CoV (Variance)   :          2.86%             2.85%
 ------------------------------------------------------------------
 METRIC: Per-Process Throughput : 1024kB mTHP
 ------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap compress batching
                             (KB/s)           (KB/s)
 ------------------------------------------------------------------
 Total Samples    :            300               300
 Mean Value       :        289,904           291,114
 Std Deviation    :         15,385            14,553
 CoV (Variance)   :          5.31%             5.00%
 ------------------------------------------------------------------

 3) 64kB mTHP:
 =============

 ------------------------------------------------------------------
 64kB mTHP usemem30 benchmark suite: 10 runs (Limit: 150G).
 ------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap compress batching
                              (sec)        (sec)
 ------------------------------------------------------------------
 [Run 1/10]  Sys Time:    1914.525s    1878.483s
 [Run 2/10]  Sys Time:    1869.412s    1863.177s
 [Run 3/10]  Sys Time:    1944.049s    1863.502s
 [Run 4/10]  Sys Time:    1942.757s    1900.144s
 [Run 5/10]  Sys Time:    1866.505s    1887.285s
 [Run 6/10]  Sys Time:    1877.716s    1861.668s
 [Run 7/10]  Sys Time:    1861.741s    1868.788s
 [Run 8/10]  Sys Time:    1904.735s    1816.372s
 [Run 9/10]  Sys Time:    1891.074s    1850.435s
 [Run 10/10] Sys Time:    1893.366s    1849.747s
 ------------------------------------------------------------------

 ------------------------------------------------------------------
 METRIC: System CPU Time (Sys Time) : 64kB mTHP
 ------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap compress batching
                              (sec)            (sec)
 ------------------------------------------------------------------
 Total Samples    :              10               10
 Mean Value       :        1,896.59         1,863.96
 Std Deviation    :           29.86            22.96
 CoV (Variance)   :           1.57%            1.23%
 ------------------------------------------------------------------
 METRIC: Per-Process Throughput : 64kB mTHP
 ------------------------------------------------------------------
               Baseline mm-unstable   v4 zswap compress batching
                             (KB/s)           (KB/s)
 ------------------------------------------------------------------
 Total Samples    :            300               300
 Mean Value       :        239,114           242,254
 Std Deviation    :          9,090             6,419
 CoV (Variance)   :          3.80%             2.65%
 ------------------------------------------------------------------

Conclusions based on the data:
==============================

 v3 demonstrated that the batching of zswap_store() phases and compress
 batching optimizations benefit zswap_store() and
 zswap_compress_per_page() median and tail latencies for PMD folios and
 base 4K folios.

 v4 demonstrates how these low-level bptrace savings obtained in v3
 translate to performance improvements at the system level and workload
 level. v4's performance validation is done at scale with 30 concurrent
 usemem processes, with Sys time and Throughput being the key high-level
 metrics. We further study this for PMD THP, 1024kB and 64kB folios.

 Sys time measured across 10 consecutive iterations of usemem30 improves
 significantly with zswap compress batching, -13.87% lower than
 mm-unstable for PMD THP. Per-process Throughput increases by 3.85% for
 PMD folios. As this patch-series impacts batching within folios, the
 Sys time savings reduces for lower order folios.

 The immediate benefit of zswap compress batching is saving CPU compute
 cycles, that can imply lower power consumption and existing kernel
 optimizations with reduced CPU compute cycles spent in critical
 paths. There are also modest throughput improvements that this
 patch-series delivers.

 As other kernel components related to mTHP become more efficient, the
 net realized performance benefit can only be better with this
 patch-series than without, given the significant Sys time reduction
 with zswap store and compress batching.

 The batching framework established in this series allows us to make
 locking and bulk-processing improvements in each stage of
 zswap_store(). One of the ideas that has shown very promising results
 is to replace zsmalloc with SLUB compressed caches and will be
 submitted separately. This is expected to resolve the p50 batch
 compress latency issue seen in v3's bpftrace data, since it will be
 directly optimizing zswap_update_entries(), where compressed buffers
 can be binned based on size and bulk allocated from SLUB.

 The speedup with zswap store batching of large folios has a propelling
 effect on other parts of mm, especially, by enabling large folios to be
 swapped out without splitting, as the higher-order folio vmstat v4 data
 shows. This enables other mm components that are optimized for large
 folios, such as munmap(), folio refcounts/mapcounts updates, PTE
 invalidation upon freeing memory, zswap_invalidate(); which benefit
 from xarray offsets/range continuity. As a result, subsequent large
 folio swapouts are more likely to find contiguous swap slots, there are
 fewer large folio splits during reclaim and the cycle continues. As the
 data demonstrates, this directly contributes to more memory over-commit
 opportunity.

 The benefits are attributable to the store batching framework added in
 patches 6-7, that is fully utilized to improve zswap_compress() latency
 by giving it a batch of pages to be compressed. As the bpftrace data
 shows, patches 6-7 alone are not sufficient for the gains. Batch
 compression added in patch 8 benefits latency significantly, for these
 reasons:

  1) Per-CPU sg_table with ZSWAP_MAX_BATCH_SIZE scatterlists that are
     statically mapped to compression dst buffers for that CPU, thereby
     minimizing local SG lists initialization, and using compact new
     crypto_acomp API introduced in patches 1-4 that set up an
     acomp_req's src/dst to be SG lists.

  2) Patch 6 allocates ZSWAP_MAX_BATCH_SIZE destination buffers in the
     per-CPU acomp_ctx, for an added memory overhead of ~12 KB
     per-CPU. The trade-off pays off in significant latency improvements
     which can potentially be used to drive higher memory over-commit in
     data center setups.

  3) A one-shot zswap_update_entries() does all the zsmalloc handle
     allocation and copying for the batch. The key concept driving
     efficiency is that the working set is kept focused on batch-centric
     data pertaining to a handful of operations on the batch, to
     minimize cache evictions and benefit from cache locality.

  4) By making zswap_compress() more efficient, we are able to lock the
     comp mutex per batch of ZSWAP_MAX_BATCH_SIZE (4) pages instead of
     per-page.

 The exceptions are p50/p95 batch compress latencies (normalized
 per-page), even though the p99 batch compress latency improves
 significantly, by 15% over mm-unstable. Batch compress latency can be
 optimized further in subsequent patches.

Architectural considerations for the zswap batching framework:
==============================================================
The zswap batching framework is designed to be hardware-agnostic.
It can be leveraged by any hardware accelerator or software-based
compressor.

Potential future clients of the batching framework:
===================================================
This patch-series demonstrates the performance benefits of compression
batching when used in zswap_store() of large folios. Compression
batching can be used for other use cases such as batching compression in
zram, batch compression of different folios during reclaim, kcompressd,
file systems, etc. Decompression batching can be used to improve
efficiency of zswap writeback (Thanks Nhat for this idea), batching
decompressions in zram, etc.

[1]: https://lore.kernel.org/all/aJ7Fk6RpNc815Ivd@gondor.apana.org.au/T/#m99aea2ce3d284e6c5a3253061d97b08c4752a798

Signed-off-by: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
---
 mm/zswap.c | 288 +++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 215 insertions(+), 73 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 5e1fb5624ffb..56354a568bad 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -149,9 +149,14 @@ struct zswap_acomp_req {
 
 /*
  * The compression mutex also protects the output buffer(s).
+ *
+ * @compr_batch_size: The max batch size of the compression algorithm,
+ *                    bounded by ZSWAP_MAX_BATCH_SIZE.
  */
 struct zswap_comp_ctx {
 	struct zswap_acomp_req areq;
+	u8 compr_batch_size;
+	struct sg_table *sg_table;
 	u8 **buffers;
 };
 
@@ -238,6 +243,8 @@ struct zswap_store_context {
 	bool wb_enabled;
 	int nid;
 	u8 nr_pages;
+	struct zs_pool *zs_pool;
+	struct zswap_comp_ctx *comp_ctx;
 	struct zswap_entry *entries[ZSWAP_MAX_BATCH_SIZE];
 };
 
@@ -325,6 +332,13 @@ static void acomp_ctx_free(struct crypto_acomp_ctx *acomp_ctx)
 		kfree(acomp_ctx->comp.buffers);
 	}
 	acomp_ctx->comp.buffers = NULL;
+	acomp_ctx->comp.compr_batch_size = 0;
+
+	if (acomp_ctx->comp.sg_table) {
+		sg_free_table(acomp_ctx->comp.sg_table);
+		kfree(acomp_ctx->comp.sg_table);
+	}
+	acomp_ctx->comp.sg_table = NULL;
 }
 
 static struct zswap_pool *zswap_pool_create(char *compressor)
@@ -903,6 +917,7 @@ static int zswap_cpu_comp_prepare(unsigned int cpu, struct hlist_node *node)
 	struct zswap_pool *pool = hlist_entry(node, struct zswap_pool, node);
 	struct crypto_acomp_ctx *acomp_ctx = per_cpu_ptr(pool->acomp_ctx, cpu);
 	int nid = cpu_to_node(cpu);
+	struct scatterlist *sg;
 	int ret = -ENOMEM;
 	u8 i;
 
@@ -927,6 +942,13 @@ static int zswap_cpu_comp_prepare(unsigned int cpu, struct hlist_node *node)
 		goto fail;
 	}
 
+	/*
+	 * Constrain the crypto algorithm's batch size by ZSWAP_MAX_BATCH_SIZE,
+	 * store this in the per-CPU zswap_comp_ctx's @compr_batch_size.
+	 */
+	acomp_ctx->comp.compr_batch_size = min(ZSWAP_MAX_BATCH_SIZE,
+					       crypto_acomp_batch_size(acomp_ctx->acomp));
+
 	ret = zswap_acomp_req_init(&acomp_ctx->comp.areq, acomp_ctx->acomp);
 	if (ret)
 		goto req_fail;
@@ -949,6 +971,26 @@ static int zswap_cpu_comp_prepare(unsigned int cpu, struct hlist_node *node)
 		}
 	}
 
+	acomp_ctx->comp.sg_table = kmalloc(sizeof(*acomp_ctx->comp.sg_table),
+					   GFP_KERNEL);
+	if (!acomp_ctx->comp.sg_table) {
+		ret = -ENOMEM;
+		goto req_fail;
+	}
+
+	if (sg_alloc_table(acomp_ctx->comp.sg_table, ZSWAP_MAX_BATCH_SIZE,
+			   GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto req_fail;
+	}
+
+	/*
+	 * Statically map the per-CPU destination buffers to the per-CPU
+	 * SG lists; crucial for performance.
+	 */
+	for_each_sg(acomp_ctx->comp.sg_table->sgl, sg, ZSWAP_MAX_BATCH_SIZE, i)
+		sg_set_buf(sg, acomp_ctx->comp.buffers[i], PAGE_SIZE);
+
 	/* Skip the per-CPU request when decompression can use the stack. */
 	if (acomp_is_async(acomp_ctx->acomp)) {
 		ret = zswap_acomp_req_init(&acomp_ctx->decomp, acomp_ctx->acomp);
@@ -965,88 +1007,179 @@ static int zswap_cpu_comp_prepare(unsigned int cpu, struct hlist_node *node)
 	return ret;
 }
 
-static bool zswap_compress(struct folio *folio, long index,
-			   struct zswap_entry *entry, struct zswap_pool *pool,
-			   bool wb_enabled)
+/*
+ * zswap_update_entries() is called only when all pages in a store batch have
+ * been successfully compressed (subsumes the writeback_enabled fallback in case
+ * of compress errors). The only error that can occur in this phase is zs_malloc
+ * allocation failure, upon which an error status is returned to
+ * zswap_store_pages().
+ */
+static inline bool zswap_update_entries(struct zswap_store_context *zc)
 {
-	struct zswap_comp_ctx *comp_ctx;
-	struct scatterlist input, output;
-	int comp_ret = 0, alloc_ret = 0;
-	unsigned int dlen = PAGE_SIZE;
-	gfp_t gfp;
-	u8 *dst;
-	bool mapped = false;
+	gfp_t gfp = GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_MOVABLE;
+	struct zswap_entry *entry;
+	struct scatterlist *sg;
+	unsigned int dlen;
+	u8 batch_iter;
+	u8 *buf;
+	int err;
+
+	/* Called should ensure that each dst sg->length is > 0. */
+	for_each_sg(zc->comp_ctx->sg_table->sgl, sg, zc->nr_pages, batch_iter) {
+		entry = zc->entries[batch_iter];
+		dlen = sg->length;
+
+		prefetchw(entry);
+
+		if (unlikely(dlen == PAGE_SIZE)) {
+			buf = kmap_local_folio(zc->folio,
+					(zc->folio_start + batch_iter) * PAGE_SIZE);
+			err = zs_store(zc->zs_pool, &entry->handle, buf, dlen, gfp, zc->nid);
+			kunmap_local(buf);
+		} else {
+			buf = zc->comp_ctx->buffers[batch_iter];
+			err = zs_store(zc->zs_pool, &entry->handle, buf, dlen, gfp, zc->nid);
+		}
 
-	comp_ctx = &raw_cpu_ptr(pool->acomp_ctx)->comp;
-	mutex_lock(&comp_ctx->areq.mutex);
+		if (unlikely(err)) {
+			if (err == -ENOSPC)
+				zswap_reject_compress_poor++;
+			else
+				zswap_reject_alloc_fail++;
 
-	dst = comp_ctx->buffers[0];
-	sg_init_table(&input, 1);
-	sg_set_folio(&input, folio, PAGE_SIZE, index * PAGE_SIZE);
+			return false;
+		}
+
+		entry->length = dlen;
+	}
 
-	sg_init_one(&output, dst, PAGE_SIZE);
-	acomp_request_set_params(comp_ctx->areq.req, &input, &output,
-				 PAGE_SIZE, dlen);
+	return true;
+}
+
+/*
+ * zswap_compress() batching implementation for sequential and batching
+ * compressors.
+ *
+ * Description:
+ * ============
+ * Compress multiple @zc->nr_pages in @zc->folio starting from the
+ * @zc->folio_start index in batches of @nr_batch_pages; the latter
+ * representing the lesser of the @zc->nr_pages to be batch compressed and the
+ * compressor's batch size.
+ *
+ * @zc->nr_pages can be in (1, ZSWAP_MAX_BATCH_SIZE] even if the compressor does
+ * not support batching.
+ *
+ * If @nr_batch_pages is 1, each page is compressed sequentially.
+ *
+ * If @nr_batch_pages is > 1, the compressor may use batching to optimize
+ * compression.
+ *
+ * In all cases, the store processing that needs to happen post-compression
+ * occurs in batches of @zc->nr_pages. Error handling is minimal, mostly to
+ * update zswap statistics, with catch-all cleanup for the batch occuring in the
+ * @store_pages_failed label in zswap_store_pages().
+ */
+static bool zswap_compress(struct zswap_store_context *zc)
+{
+	u8 nr_batch_pages, batch_start, comp_batch_iter;
+	struct scatterlist *sg, *dst_sg;
+	unsigned int slen;
+	int err;
 
 	/*
-	 * it maybe looks a little bit silly that we send an asynchronous request,
-	 * then wait for its completion synchronously. This makes the process look
-	 * synchronous in fact.
-	 * Theoretically, acomp supports users send multiple acomp requests in one
-	 * acomp instance, then get those requests done simultaneously. but in this
-	 * case, zswap actually does store and load page by page, there is no
-	 * existing method to send the second page before the first page is done
-	 * in one thread doing zswap.
-	 * but in different threads running on different cpu, we have different
-	 * acomp instance, and compression and decompression use separate
-	 * requests, so multiple threads can do (de)compression in parallel.
+	 * @nr_batch_pages is constrained by the per-CPU comp_ctx's compressor
+	 * batch size and the @zc->nr_pages in this store batch. @slen indicates
+	 * the total source length bytes for @nr_batch_pages.
 	 */
-	comp_ret = crypto_wait_req(crypto_acomp_compress(comp_ctx->areq.req),
-				   &comp_ctx->areq.wait);
-	dlen = comp_ctx->areq.req->dlen;
-	if (!comp_ret) {
-		if (dlen == PAGE_SIZE)
-			comp_ret = -ENOSPC;
-		else if (WARN_ON_ONCE(!dlen || dlen > PAGE_SIZE))
-			comp_ret = -EINVAL;
-	}
+	nr_batch_pages = min(zc->comp_ctx->compr_batch_size, zc->nr_pages);
 
 	/*
-	 * If a page cannot be compressed into a size smaller than PAGE_SIZE,
-	 * save the content as is without a compression, to keep the LRU order
-	 * of writebacks.  If writeback is disabled, reject the page since it
-	 * only adds metadata overhead.  swap_writeout() will put the page back
-	 * to the active LRU list in the case.
+	 * Compress the @nr_pages in @folio starting at index @folio_start
+	 * in batches of @nr_batch_pages.
 	 */
-	if (comp_ret) {
-		if (!wb_enabled)
-			goto unlock;
-		comp_ret = 0;
-		dlen = PAGE_SIZE;
-		dst = kmap_local_folio(folio, index * PAGE_SIZE);
-		mapped = true;
+	for (batch_start = 0; batch_start < zc->nr_pages;
+	     batch_start += nr_batch_pages) {
+		/*
+		 * Clamp the last iteration's batch size if the compressor's
+		 * batch_size does not evenly divide @zc->nr_pages.
+		 */
+		nr_batch_pages = min(nr_batch_pages, zc->nr_pages - batch_start);
+		slen = nr_batch_pages * PAGE_SIZE;
+
+		/*
+		 * Send @nr_batch_pages to crypto_acomp for compression:
+		 *
+		 * These pages are in @zc->folio's range of indices in the
+		 * interval:
+		 *     [@zc->folio_start + @batch_start,
+		 *      @zc->folio_start + @batch_start + @nr_batch_pages).
+		 *
+		 * The source folio pages in the batch are directly submitted to
+		 * crypto_acomp via acomp_request_set_src_folio().
+		 */
+		acomp_request_set_src_folio(zc->comp_ctx->areq.req, zc->folio,
+				(zc->folio_start + batch_start) * PAGE_SIZE,
+				slen);
+
+		dst_sg = zc->comp_ctx->sg_table->sgl + batch_start;
+		dst_sg->length = slen;
+
+		/*
+		 * The per-CPU @zc->comp_ctx->sg_table scatterlists are statically
+		 * mapped to the per-CPU dst @buffers at pool creation time.
+		 * There are ZSWAP_MAX_BATCH_SIZE per-CPU SG lists and dst
+		 * buffers allocated for all compressors.
+		 */
+		acomp_request_set_dst_sg(zc->comp_ctx->areq.req, dst_sg, slen);
+
+		err = crypto_wait_req(crypto_acomp_compress(zc->comp_ctx->areq.req),
+				      &zc->comp_ctx->areq.wait);
+
+		/*
+		 * If a page cannot be compressed into a size smaller than
+		 * PAGE_SIZE, save the content as is without a compression, to
+		 * keep the LRU order of writebacks.  If writeback is disabled,
+		 * reject the page since it only adds metadata overhead.
+		 * swap_writeout() will put the page back to the active LRU list
+		 * in the case.
+		 */
+		if (err && !zc->wb_enabled)
+			goto compress_error;
+
+		/*
+		 * For each output SG list in @acomp_ctx->req->sg_table->sgl,
+		 * the @sg->length should be set to either the page's compressed
+		 * length (success), or it's negative value compression error.
+		 */
+		for_each_sg(dst_sg, sg, nr_batch_pages, comp_batch_iter) {
+			if (((int)sg->length <= 0) || (sg->length >= PAGE_SIZE)) {
+				if (!zc->wb_enabled) {
+					if (sg->length == PAGE_SIZE)
+						sg->length = -ENOSPC;
+					else if (WARN_ON_ONCE(!sg->length || sg->length > PAGE_SIZE))
+						sg->length = -EINVAL;
+					goto compress_error;
+				}
+
+				sg->length = PAGE_SIZE;
+			}
+		}
 	}
 
-	gfp = GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_MOVABLE;
-	alloc_ret = zs_store(pool->zs_pool, &entry->handle, dst, dlen, gfp,
-			     folio_nid(folio));
-	if (alloc_ret)
-		goto unlock;
+	return zswap_update_entries(zc);
 
-	entry->length = dlen;
+compress_error:
+	for_each_sg(dst_sg, sg, nr_batch_pages, comp_batch_iter) {
+		if ((int)sg->length < 0) {
+			if ((int)sg->length == -ENOSPC)
+				zswap_reject_compress_poor++;
+			else
+				zswap_reject_compress_fail++;
+		}
+	}
 
-unlock:
-	if (mapped)
-		kunmap_local(dst);
-	if (comp_ret == -ENOSPC || alloc_ret == -ENOSPC)
-		zswap_reject_compress_poor++;
-	else if (comp_ret)
-		zswap_reject_compress_fail++;
-	else if (alloc_ret)
-		zswap_reject_alloc_fail++;
-
-	mutex_unlock(&comp_ctx->areq.mutex);
-	return comp_ret == 0 && alloc_ret == 0;
+	return false;
 }
 
 static bool __zswap_decompress(struct zswap_entry *entry,
@@ -1763,11 +1896,19 @@ static bool zswap_store_pages(struct zswap_store_context *zc,
 
 	zswap_init_entries(zc, pool, objcg);
 
-	for (i = 0; i < zc->nr_pages; ++i) {
-		if (!zswap_compress(zc->folio, zc->folio_start + i,
-				    zc->entries[i], pool, zc->wb_enabled))
-			goto store_pages_failed;
-	}
+	/*
+	 * Locking the comp_ctx mutex once per store batch results in better
+	 * performance as compared to locking per compress batch.
+	 */
+	zc->comp_ctx = &raw_cpu_ptr(pool->acomp_ctx)->comp;
+	mutex_lock(&zc->comp_ctx->areq.mutex);
+
+	ret = zswap_compress(zc);
+
+	mutex_unlock(&zc->comp_ctx->areq.mutex);
+
+	if (unlikely(!ret))
+		goto store_pages_failed;
 
 	ret = zswap_tree_stores(zc, pool, objcg);
 
@@ -1833,6 +1974,7 @@ bool zswap_store(struct folio *folio)
 		mem_cgroup_put(memcg);
 	}
 
+	zc.zs_pool = pool->zs_pool;
 	rcu_read_lock();
 	zc.wb_enabled = mem_cgroup_zswap_writeback_enabled(folio_memcg(folio));
 	rcu_read_unlock();
-- 
2.39.5

