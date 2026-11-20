Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795216606;
	b=HG1PliVt0SFUpGmb2l5/ltHh1RggS7Oa520L9aFloxvCLS3/9CWC1mKsMonHQrNo/HUJ
	 BxvKcW82Bz7k2+e7Tp7TdAyE2n7czlHCjhql7lRznMCCqxEzQ9Ube7TKBsg/EJy1tILb7
	 u3ekLSLwr3Q1ZQgoAY68fLq9DCetZ8rpiRW4svq0nLrZ4xSxbV/ks0V8vvx1tUerjFymL
	 LwxPHlUapMtKQD23gmNLP6IVf30bfiLaxciU5ixn4yPRInstPiSNfzQAo0+ZET7iE/TwH
	 0ny6EO2x2d4YM5/ZD7sGud9CMwxY+CN5fRgOy6+Rjk86fN8infCvTYwnb7F8v4RYW5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=903vcvaogj9vIydiu/9sjTQzb/qPcKkDK3/+mqHxV6A=;
	b=G9RUXUAzoAgH+FNSOCleWCExKq51V3l2xN4PcJxgKUxd18BkGaNP1gKVrcMfE6imF6pC
	 YZeuO0tvzDTNfHgtXppaHSq+QnNL2d4/55RXBL4sBnDTfRp8re2VGLisT7X2GaurjeldK
	 qnr/l/ToA9o3Avz7avTLnZw2BqkVXeq9dJqjbNGapQVOlWSzqHZo/r1zSuxPKPWaSc84W
	 lxzj5dxWYFbzkdMKy4pzC0vmj8KMHrI95BIOHlTV4EB6A64zvKXn4tbSiq72BDsjD5aSA
	 H/0zM+9gjiNVaTamSlzVIQFdUdc7S54oWH/oukmoNGGrFiC8RIoHYrKQYT8oSawhKNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGHK6HkC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64697606A68F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64697606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGHK6HkC
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso11743365e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:16:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795216605; cv=none;
        d=google.com; s=arc-20260327;
        b=s1zEU+WoeHYJlvMJPih3jm3HR+XGlS57e9yO0jE5HoKPET1eIZZBju+pyUZ7TJsZ7W
         Tj85ixOfVbW4rjX0Z6hh0rOdJjT3f4y55rGdimkNMsk5zjLu/KqOUfmVsnSK7q7g8GEz
         iG7eq+Y1fe/iA/slM8IPqBhpiG1kebX0wYG1WS6NYwDOZYuT4Kmd96Cyb/QrJHiYj4dX
         Pik2vO8xMsaPnJSEykobvAc19ZtpL+NjLf28ZExsBHnCk9f+SNDU87hwOYnF35+WJ4eY
         qmuKMRDVcPav05otZGcxuPJLbM4K5+eA6yCazagLlPZEuhLL5PgJ6xWqRheruZ/50Ufy
         no8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=903vcvaogj9vIydiu/9sjTQzb/qPcKkDK3/+mqHxV6A=;
        fh=PB3DmzOFdcVXimJyNTdJHdZ9IWoQfu9PeexAwRdHjpY=;
        b=NYNKts1oLp4c16jpj67ZISUnN/cxEjxeAICEWesQVoUFnGIkELqC5/SxjqjeTSrghO
         DTZk9/CJo9CYrasPmJioieXaH5asVlSBRnLQ93Qi2/QhObD+o6CIaqGxfSpWjlAGNKzi
         47bYNpCbHjyjA6CQ5uckDjLqgP7VnNrTWL+QVNry90zxM6YxgeTpR0k7JiD//MuYy5fe
         Ht3+oA/wKKrYt+YAolPYNDW5AqCfc5gcIYdY/akiuGzeJItTZzZMVU3cKE8942HV37Qg
         PoToycTq2vAQglei9uKn+LXSkSv9tXAJllqltBzUukA+Zbr84mnotdqxabx9+MiZzcpa
         yG2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795216605; x=1795821405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=903vcvaogj9vIydiu/9sjTQzb/qPcKkDK3/+mqHxV6A=;
        b=mGHK6HkCbSVQ39UCpesRtbsGfQNIK83yzGTreb091TXMOf4FPM1COKmFg0cjrJPs4G
         1flQTelx/F2UydcKnpCSZ41r3mz6hlsvSMHKy5kl0YL/lgx13KbFUgmHhIGji1LGTVWX
         35zhtgZaGrBrurStYi2nwFpANzq3eDhX6fecisyyDdKCc4SbOGpbYrbx7hFKPl6YUIu2
         IYWQNuOSsxOsC1+SwZRYcXV4iChxGXYpHuM9uiDmJHeKsW7sBcvTv3SGmPTyovnMD/sk
         /y18nNdkdOILxdAIpU7p1j2EAvyi8EkWa41skgvdUt+Zrbasyx0DBkOLDZ08iR/ePzlx
         KfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216605; x=1795821405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=903vcvaogj9vIydiu/9sjTQzb/qPcKkDK3/+mqHxV6A=;
        b=1IAGptjsc7wTYjKlUICd8dq2Cl0GCQvT0f8n3mwtoxibGLW8kMNSiHn/KOjzARElv4
         tRsIn5GI8yGnyrTmNB7gYEpJLfazgFmgu1Vh2aJzIApuPpepVPQ6ZhrXEdXzi4i2r2Wz
         SaUYXIzrYXUvwlnryT8ZMoVF7dGeDdU4cHBQ5zgTq1EhvJ+Ngo1K5mXUGp0B3gS+9LEt
         H9Rnnd+AEW+RPyuulYtyv2WmuQAHyPVQxmETOR8z2qmeXVFA2ELIoY6XiS2Or4haApxk
         na7VaoR34cFDAmR13rdy8z3JmgAmKiaTC7VpYYuXyStmTrwJfArPkU5KjyftiUtfSM5Y
         SETA==
X-Forwarded-Encrypted: i=1; AL+hErFSd1ab+lXt1oeNXAO8auhqJGR2o5L4itWRzFu8yqtNMp+Y15Jwl5p11TYTJdxHmm7DpeO+6tPwXMSVn0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dNVjvjt3J0rSqKxq0dJ2Nhc5LJ1injt6QL/eFTiEhkvD5DQ7D
	+C6HjPzwchJGt5ACwOEsGr461C6+cNf174dCD7tMzE97E1d/TDgFbYICA7UjpIsYJgHhzL4uP/3
	HzXTz0DWXg9S1iQ8rgeUhE7Azn5pOSzk=
X-Gm-Gg: AYBFou0ifApgleBV7AgCq5+kjJ5lFq0If+xPAXiYLRrvd58p8E5gI5XbNnWGHIAz3Bg
	OqAVvNv5TU/sgFMNadplYk7Urhc1uRTRVm6he1sVobYb10Tcx/+PyXdYi+gj84prMdeNFIo70PP
	bvKp/N8/AGB2fepBS6Lj+jeX9RxD/PV9hLSb8J0kFWoV+ZyteYk2fk5CuZObfQC57a9NWp8uXw0
	yP+vv56bysSvYg0wACR7jfk6eHESUgftsaDZ/IgGnNNMLHnkNUoO70/Bwp53mXwfxe1ad/D4G/+
	Tkq6aPdlOyRRABxTDfgjIEW90biONWzMJrorI8RmAgXdNgqXsRecLsvgKy6AhSwQsXYqScfL0wS
	C+yavX6GehkZafobSpFT/0iJqOl/0SAI8kcxETeiPkr+GLnoQHVRWN7UGDlyfu+FK8Ne/DiTdPK
	1WyGMTMs7UC1uryCalPkstF0ChHJCn15WfwCa/jB8XWYLWUaa8/XyaDt4=
X-Received: by 2002:a05:600c:4f0d:b0:4bb:5c97:f4b1 with SMTP id
 5b1f17b1804b1-4bb8881941bmr114007855e9.24.1795216604602; Fri, 20 Nov 2026
 15:16:44 -0800 (PST)
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
In-Reply-To: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 20 Nov 2026 15:16:32 -0800
X-Gm-Features: Aa3M54qb-VRfw4aqDAJTkRsfWHOO2NSgtOCHUwUBMLX8ioDWk9vsNXzApVwB4Q0
Message-ID: <CAKEwX=MLrDn55wmVKKba5=PcU+qFpkEbMmN2SjGTfTBiFKX8cw@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Batched zswap_store() framework with compression batching
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
>
> v4: Batched zswap_store() framework with compression batching
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> This series is a spin-off of "v14: zswap compression batching with optimi=
zed
> iaa_crypto driver" [1], and focuses on the generic crypto_acomp and zswap
> compression batching enablers. Resuming work on this series following a g=
ap
> since v14 (January 2026). Please note that my email address and affiliati=
on have
> changed from kanchana.p.sridhar@intel.com to kanchanapsridhar2026@gmail.c=
om. I
> have retained the original Intel sign-offs on prior patches for historica=
l
> attribution while signing off v4 of this series with my current address.
>
> The main focus of v4 was to establish a performance measurement methodolo=
gy to
> quantify the benefits to high level metrics by using zswap compression
> batching. This was done using an Intel Sapphire Rapids bare-metal instanc=
e with
> 48 physical cores and by running "usemem30", i.e., 30 concurrent usemem
> processes, each of which allocates 10G, in a 150G memory.high contrained =
cgroup,
> for 10 iterations. The environment was set up to minimize performance jit=
ter so
> we can understand the system-level/workload-level advantages of zswap
> compression batching when running workloads at scale.
>
> To summarize the main contribution of this patch series: Batching is intr=
oduced
> in zswap_store() of large folios: we carve out a large folio into batches=
 of
> ZSWAP_MAX_BATCH_SIZE (4 pages) for software compressors, and store each
> batch. Moving the fundamental operations that need to be happen to store =
a page
> to now work at the granularity of a batch offers opportunities to optimiz=
e them
> from these perspectives:
>
> 1) Utilize existing kernel API that minimize obtaining locks for bulk
>    operations, e.g. kmem_cache_alloc_bulk()/kmem_cache_free_bulk().
>
> 2) We keep the working set for each of the core store functionalities
>    (alloc/initialize zswap entries, compress pages, store pages in zsmall=
oc,
>    pool/objcg reference increments, objcg charging) to be focused on a
>    batch, thereby minimizing cache evictions and benefiting from cache
>    locality.
>
> 3) Along the lines of (1), the main zswap_compress() batching routine obt=
ains
>    the comp_ctx mutex lock once per batch, and releases it after it has
>    processed all pages in that batch.
>
> 4) Any zswap store functionality that works on a batch can potentially be
>    optimized via bulk-processing/parallelized as a next step, to further =
improve
>    performance.
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
>      - CoV (Variance): Coefficient of variation (relative standard deviat=
ion)
>        measures spread relative to the mean rather than statistical varia=
nce.
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

Have you tried perf-ing the store path to see what was the overhead
source (before and after this optimization)? I'm curious.

Mostly LGTM - still taking a look...
