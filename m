Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795557161;
	b=vGiI8Wi8JOr+c3BS46aTCba0aiAhQhZEBr+IXichG93dN4tef9BjIv5mRSMn9SL6+4P7
	 GugAccaM+IBnx3S/jeaKemFYUPi8mMOQSlHwaUk2ZzvSoguKZs21IaoJFuMsZSIjc92ig
	 4Nkp+WC/NGNgFYAy+17Oo55bEzDeJ33V3KaytXDt9ZDAM9/nmhDwVM2glY1dEXiuvuIjH
	 /UZvFN5T+8w3Qtnw8CoC+blBlEyYQ9mEzsFAs4TFNXNyikcHk25Dif/ZCgfz78lor0pju
	 P1XapAop5m3Xy2j3QmMS/oPql0DlggNYEMqCTKzoUMYZXA9W8taXiL6g64mgM/6lUZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JpyjFKSMwkjcx41RVuzlrbKMavoMvN+HJXNIGpdwKzQ=;
	b=COZ+5ykHPN0+l2+uUSf6q59AYoh0sJWv2b9/G1TDHVf6vs3jdgAKOcenXrrciIrwnkNJ
	 UrJrEl82CPCqCOvH55bxxnXgILEd5NdXdwFavMKaRyT1j8wy8oZgs+xeddPXdW2qnLIxg
	 RiCuQfcnMeJiAKHqFmYfbMRIH4vx9HiwiaA/LXVwuI9zrnMHjcIC5FL2+yLiliFf47KMt
	 oxn51+7s7bYRq+b/LkHcyqHTxsFVr9ent/ULkstPT5IBMTVjN4+7ruuTTod8PRtOrsbtY
	 rj3hGGuNGKIzMILFd2OyuM0/42zxM+JfnKInc4ivETj7TAstihSC3WPaw5MUJduTKxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lezf0COD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AB0606A6A3
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8AB0606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lezf0COD
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533202fe429so1070481cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:52:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795557160; cv=none;
        d=google.com; s=arc-20260327;
        b=Xszyi2xdF4BejHI7wOaQ4xUqOSZ5u0IDxftfT5POMhZpMIGz0pEqavepbJvr5uQVcP
         eGyh1xoimtjcrb8koWklMXPVfRVoxJ+gUO0GUihLKockJO+2JJxR+3xS5Cm3aX24iYSD
         K+QX85MtfPXZxaYCFYPVtlSEYme3xWRg8szedUCwCVBWQFbEbxtX+cdvpg4VTp0PlY1W
         AEu7zl7V9vJHQQrbEF8JihdOJ/FY2VEPYwSnMV6KMzkXFUaQVW7ThIKWS5wlsAGY8kfu
         WzeW5IxJEenXPpN3mygz81XHIU8i8qevvrHxpy2FTakBgyJmu2cljR1b8jMC9Prz28qw
         4nCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JpyjFKSMwkjcx41RVuzlrbKMavoMvN+HJXNIGpdwKzQ=;
        fh=F9sLfyLST75gWE52LhEbnRa5wbF2pTY4hSF2rn52m2o=;
        b=lEmB/lfJFnFdDDosokcb3MpTL8FBEatt7VMK33IrYbC1h4CNpJ1k6zixz7IklrhfsL
         gELUvg2+TmsKR+0EVQ+ZqmDWKnlOEjPNVL6pkV16tNaU0KNZLWhFNpEUAdvMv5lqun02
         k+DiMtIzPuboOjnV0W+JERYemsGQjthIRPFC8caMATWuQUaxJbsr80yDksqpot5zsqmI
         i+zrSxCYTh/WjZ3uvhxrQo1YIedkPBa3q1SEWrCyyglR/EfLLziyFCDGc81IJ2p0W9nt
         xGSTBkjA1oYI0FKwPmqa31H8yZcDQEGItQV5AEw1JdhF2IELannaTsFwrGxRdKyJmP2Z
         2bPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795557160; x=1796161960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JpyjFKSMwkjcx41RVuzlrbKMavoMvN+HJXNIGpdwKzQ=;
        b=Lezf0CODIa1dN25ZggrWjCbhYVBJMXsZu5R7WATeS4xcozO2zog/Z3H/fjWE867ZyY
         h0Nn93XA0VnwoTc4VOOBbYVpywSyvoGHKiLGAquIhYxb/dNogFxHCP90/NXbmLOFIbs3
         U0pTjrFo5ZRfevn0rlfUC3CAYkftLtUKKscRsyklU4nd6Y2nMUyQOqmP3EoRkEQmjpqK
         cJZg0HWuZILjJHIVLVjRLRP9Z8/3ttP3OcO7CuflsYklPdIG8ldebae40P/ptj7ysOn2
         malZGHsiitpstbF6dJd0+4Z5W3tcW192RCgaSn8n+d0E90vdHdhRR/nfqWrEhmWr2tVE
         d8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557160; x=1796161960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JpyjFKSMwkjcx41RVuzlrbKMavoMvN+HJXNIGpdwKzQ=;
        b=B+LoEmAOLZEhQrG9FQTMenUTCn7/eZvY3S28tHOBEGRoTIUXACLyADKg6pjFN6MNQz
         bxp+sag8vkdPaKVTVtA+vVAhP0SZCgJBoIjxJvZTMK7y3+ULcO+ee+1ZXOZsjL/djYm4
         R8yfH8AUz0hA/AHjX4JKT18bD2QNbv/zdF+f1UkuKOgcuqyuQfTDUVZu08A8OmmQeACw
         lYGnXiMqfOAuJczdDUn4l3WZm1oxZYB4nlOmAYrK4ZQflZuR4O17FV1EVsj5qdth9an6
         Ne9vKI2Ulf8bPj+T44dF3xprb3jM9tPBYiAn+H4A/0Wjsyi25CCg3dwlBwhZjCiVDqsn
         q1yQ==
X-Forwarded-Encrypted: i=1; AL+hErEzrV0JZtYs3C7jWnhUeGYAcn7hk2+PS2loEddYA7o5cxNDz0aKk5njbqmB9nSpnjqm9y4s0uXI9YK9NI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/15gquWABbz3B7WvuDzsaDeCdACOaC5Lcc5uWk05KzTBqVvbEt
	dBjx6mlAZfZ1P5i+ZRcOSEJHj0pKGyTCyuhIJV3jXnoY9rCkAEXFhBr/L5CG3b39MpJ4mT02gzE
	fiFItUPf7boyU9kLr9/ZU9RoDPSRxqQ0CNduVC6cDDqJle28uWi7o00cuhHM=
X-Gm-Gg: AZFdTZczRklQaEZnz4e9x++vJu8tbBrdl4PX2ChsVWDHRX6gZicJMqZcXRIEi/nK1rG
	imnKZI6GnO0Ef2y3FSbEbnekisfstTwD6OKc2QXTsIVrP83o5KgBx05cak1jSS5i1v53Ud7fiek
	Vose2M8ed1DOQhgHH+mRVeKLdEDHrP4Q6e6ZHfxwB7yvUfwzoGQ4o15FBrjnD4rth3V+sCP0jlz
	lOtactLATNZ3OX9KC64KNY1Cw9ABntjVIcmTpA8xF1Sohd70tA6CD3Cc9r/lJHy0ouepsGJ7YWa
	xSxgNqPJm/FuiHY3gFopGiPkiUZylCOZd5QB4t4ykVqLGUqqFbWlInD6K+n3wd/rLhYhLjV6db2
	SdXtlDkIHhU0NSYvlvSdvZl6e4yWkxyp2zqIkLKnt6Xz+eV3xJduMpHYtyweXYSM4uB78
X-Received: by 2002:a05:622a:124a:b0:535:bb33:6351 with SMTP id
 d75a77b69052e-55d87fcff29mr71826261cf.1.1795557159257; Tue, 24 Nov 2026
 13:52:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116070038.2968725-1-irogers@google.com>
In-Reply-To: <20261116070038.2968725-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 24 Nov 2026 13:52:27 -0800
X-Gm-Features: Aa3M54rYRZBKT1foMXt2hASolNTM_CvbdeVAXxgHLAXXAYapg70_UNTO0Lvi-AE
Message-ID: <CAP-5=fU9C5BTqgHXLvXMzo90a2+LA6PmXbvUkXsrjJ2A_mMyWg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] perf jevents: Block-indexed string compression
 and default JEVENTS_ARCH=all
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 11:00=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> Compiled-in PMU event and metric tables (pmu-events-in.o) currently
> store ~6.9 MiB of uncompressed string data in .rodata on x86 alone,
> causing JEVENTS_ARCH to default to $(SRCARCH) rather than all and
> preventing out-of-the-box cross-architecture perf.data event/metric
> resolution unless explicitly built with JEVENTS_ARCH=3Dall.
>
> Compressing big_c_string as a single whole-table stream would force perf
> to allocate and decompress megabytes of unused CPU models' strings on
> startup just to resolve a single event, whereas compressing individual
> short strings suffers from poor compression ratios and per-string
> framing overhead.
>
> Instead, this series introduces "block-indexed string compression":
> sorted, suffix-folded event and metric byte records are packed into
> ~8 KiB blocks without splitting records across block boundaries, each
> block is compressed independently (sharing a single preset or trained
> dictionary across blocks so ~8 KiB blocks retain high compression
> ratios), and every uint32_t string offset is encoded as
> (block_id << 16) | sub_offset. An ~8 KiB target block size sits at the
> knee of the compression vs. random-access curve (smaller 1-4 KiB blocks
> pay 22-128% more .rodata for per-block entropy headers and index
> entries, while larger 16-64 KiB blocks yield <15% extra savings at 2-8x
> higher decompression and page-fault cost per binary-search probe). At
> runtime, pmu_events__get_string() uses a lock-free atomic block pointer
> cache to decompress only the touched ~8 KiB blocks on demand, leaving
> untouched CPU models' and non-host architectures' blocks compressed in
> .rodata at zero runtime CPU or heap cost.
>
> The series starts with a standalone BigCString raw-byte fix for
> describe_metricgroup() binary-search ordering, prepares the string and
> PMU table layout, adds the zlib, lzma, and zstd block compression
> backends, and switches the default JEVENTS_ARCH to all:
>
> - Bug fix, string layout, and hot-path isolation (Patches 1-4):
>   - Patch 1 stores raw NUL-delimited UTF-8 bytes in BigCString instead
>     of C-escaped strings, fixing suffix folding and describe_metricgroup(=
)
>     binary-search ordering on prefix-overlapping names (such as "Bad" vs
>     "BadSpec"; Fixes: 66c6e0c10027) without changing empty-pmu-events.c
>     so it can be cherry-picked standalone.
>   - Patch 2 partitions non-folded BigCString event strings before metric
>     strings and sorts entries lexicographically by their raw UTF-8 byte
>     sequence within each partition so identically prefixed event names,
>     encodings, descriptions, and metric expressions cluster into
>     adjacent ~8 KiB blocks, improving block compression ratios by
>     ~20-23%.
>   - Patch 3 stores PMU names directly as const char *pmu_name string
>     literals in struct pmu_table_entry (only 68 unique PMU names / 536 B
>     across ~443 rows across all architectures, already in .data.rel.ro)
>     so the compiler/linker merge them in .rodata.str1.1 and hot PMU
>     wildcard scans never touch big_c_string or trigger block
>     decompression.
>   - Patch 4 encapsulates big_c_string offset lookups behind
>     pmu_events__get_string(uint32_t offset) across pmu-events.c and
>     pmu-events-string.c.
> - On-demand block decompression backends (Patches 5-8):
>   - Patch 5 packs big_c_string into ~8 KiB record-aligned blocks indexed
>     by (block_id << 16) | sub_offset, adds lock-free thread-safe atomic
>     per-block decompression on demand, and adds --compress=3Dzlib using
>     raw Deflate with a <=3D 32 KiB preset dictionary.
>   - Patch 6 adds --compress=3Dlzma using raw LZMA2 per block with a 64 Ki=
B
>     dictionary window.
>   - Patch 7 adds --compress=3Dzstd using ZSTD_decompress_usingDDict() per
>     block with a once-digested shared 64 KiB ZSTD_DDict (~26% smaller
>     .rodata than dictionary-free ~8 KiB zstd blocks).
>   - Patch 8 wires JEVENTS_COMPRESS into Makefile.perf and
>     pmu-events/Build, preferring zstd, then zlib, then lzma, and falling
>     back to none.
> - Testing and JEVENTS_ARCH=3Dall default (Patches 9-10):
>   - Patch 9 adds prefix-overlapping metricgroups.json test coverage and
>     an 8-thread concurrent event/metric/metricgroup stress test in
>     perf test pmu-events.
>   - Patch 10 switches the default JEVENTS_ARCH to all. Bundling all
>     architectures (x86, arm64, powerpc, riscv, s390, nds32) with zstd
>     shrinks pmu-events-in.o from 7.16 MiB (x86 + none) to 1.11 MiB
>     (all + zstd, -84.5%) and cuts the stripped perf binary from
>     13.32 MiB to 7.28 MiB (-45.4%), with ~3 ms median wall-clock
>     overhead on 'perf stat true'.

Ping. Sashiko reviewed the patches, and they are clean:
https://sashiko.dev/#/patchset/20261116070038.2968725-1-irogers%40google.co=
m
The series adds a small decompression cost but yields much smaller
binaries and cross-architecture JSON event/metric support (still
optional but defaulted on given the cost is now minimal).

Thanks,
Ian
