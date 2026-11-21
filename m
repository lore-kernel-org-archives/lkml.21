Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245432;
	b=qGDptFIEpE7RSfruglW6018AiWBADEqpN+SHojedq0BXz7YSTiFVfVrTRmGFGkL252El
	 9zk9gWDgBtxPYgFbtyUCReBabaKnIRjHLlevExXShJhxEehGKQ8nETkNYly4UGYTbSSln
	 EuqSWVDvEA5b49r4LbKEM4Q2Xwq7kPmmmTulP744bD3TqnvN/ohRRP2e95XkMkc8y6m7C
	 Xsd3ogiI+7nmGrcUNIml4T5+V5MM4QO4EpY/xrcRxfMR2ZEZPK6vV3rzytakF7i/eTkWP
	 zqNlakdTBEg31JcnvH0xEOYhujqxiSmliLcOX0t0phcRe8i+VB6wn436T0yRTRUqCdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=XAIqqGBBDiE/hdKiCDXcGKfHzjplxqX5+5nOjXl5VHM=;
	b=bLtYnWawtKxDB6a5jc+Kt8iOKJco8q2WZ8RGXPPCPVhVxBrCmjqs+5obzM2W+chSvMnY
	 WjrDWvsGzRiMA3wAysaNAna8HkHxSo0KrY1usP5dTOHFqQHLA92CZmHfpMeGoSVEkbrst
	 G82Uh8IlSxS13rhbg0yAzWstGPVLfhxTMOB5vpgDKyTezykK7J0RqAtuXANlz8EEv1PDF
	 gubb/fpwcj4ace8Ypj+m/OB739/bKutgd9zgzBwsEfbndHwDA5CqtfYdgsw549D0eC6f8
	 cDrQoLicdBdibpeRTYyYfpmxJ9GXQOaHkTquBFdASxwB7Ibf9FEkUK4iAXtaG99GVZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ex8NBhwW;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE912606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE912606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ex8NBhwW
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so2506706eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795245431; x=1795850231; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAIqqGBBDiE/hdKiCDXcGKfHzjplxqX5+5nOjXl5VHM=;
        b=ex8NBhwWxy6jLfCwkhLmDDhUrCDUClueYPjl5B5K2SOTH/ba6ChrRjfaFw+ilS5sE4
         pqyZ0rKNeZJHC+NjQVF2l3+UAWv5QLzZou2QuQGhkZ59aNatvMg7GTkogIIfCaYMqJXk
         rnvKinsBWgiTRbmC3ReuqyD4NCRtFGP8X5DWQg2CTpCxe6WnsTfXJLRpKKsrc2o99MmO
         BqQ2PIoOdYxFuwKgtMK1iwhdoW5Exu0fAoUdXxzE5Ba09xJ9LG5mR0Nbz0zBN+PSWfWD
         8a00c46gSeTuQvyFz6l4djOqJPFHkuJCr4TkT7qUYQymvKjUJs6Kk4+ZKVBzgUlFRADu
         F8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245431; x=1795850231;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAIqqGBBDiE/hdKiCDXcGKfHzjplxqX5+5nOjXl5VHM=;
        b=JrbQ4F98Vxw7A+rqUmlNH4qimkMCxsZURqLJNiIsER59SXT9rUFVmSUYPh9Ik+B8fp
         CjuQAD3HZGOfops92wGztKservQ6GOtszQJjBDFY/rq3QPTlpIqG3FFmkv3esIXcFLDV
         uIhDFQIn12/KqMfnfSYECSbxoUc2LQNZ9soquxZvVegxDGauU1ZgoAVv8YUCmUHwE29U
         QQ3KQ/MBWagQXM6zOPdQp9xsSuNzcGzcPQ91k43VDQvzRRRNvfVLU8MtW87lqsFgKhZr
         b2GWfbavjzrST3z2rRHBHRZqs+x1HOIe6/2dj+hkdT8W2HRiMwFnB0Ni5/bx+Nj7B/Uh
         GNyg==
X-Forwarded-Encrypted: i=1; AL+hErFvFyG5hvZdrqp02LfVs9CcLnPS0FMcwCn895fw4DxUTe4oZl+U5tFgu0ev6MaXqs6G99qpaK8FAZSxHx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oAaIjL5MLUv4VNa1f/DR9dtD8J1V5nNsKrnPCoBb46pEe3dL6
	B1WSPN4ZfL7xvoHKm+7X1Mah8VQRFN1g0Kqc1oy52q7/F87dbj8rOGHhrq981Wa0lksXF8a4d1s
	/OsaXlmZ/wQ==
X-Received: from dly1-n1.prod.google.com ([2002:a05:701b:2041:10b0:1b5:43fc:8107])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:db86:b0:36e:2b8b:a098
 with SMTP id 5a478bee46e88-3857025c736mr5013309eec.31.1795245430513; Fri, 20
 Nov 2026 23:17:10 -0800 (PST)
Date: Fri, 20 Nov 2026 23:16:41 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121071651.67118-1-irogers@google.com>
Subject: [PATCH v7 00/10] perf symbol: Sorted arrays, DSO-owned lifetimes, and
 memory shrinking
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When profiling large binaries or long-running workloads with many DSOs and
threads, symbol and DSO tables frequently dominate perf's memory footprint
and startup latency. Currently `struct symbol` still has several structural
limitations:

1. Every `struct symbol` embeds a 24-byte `struct rb_node` for the
   `dso->symbols` address rbtree, scattering lookups across non-contiguous
   heap nodes.
2. `dso__symbols()` has no internal synchronization against concurrent
   readers/writers, and unreferenced DSOs and auxiliary symbol/debuginfo
   buffers cannot yet be reclaimed under memory pressure.
3. Sorting `dso->symbols` with `qsort()` does not take advantage of
   pre-ordered ascending runs in ELF symbol tables, and `first_ending_after()`
   in `struct maps` runs a full binary search even for ascending
   `/proc/pid/maps` synthesis.

Thirteen preparatory fixes, benchmarks, `dso_symbol` lifetime conversions,
`symbol_conf.priv_size` removal, and ELF header caching patches from v4-v6
have landed in `perf-tools-next`. The remaining 10 patches convert symbol
iteration to callbacks, replace the `dso->symbols` rbtree with a sorted
pointer array, stage natural-run merge sort and incremental symbol
insertion, and add memory shrinking APIs and unit tests:

- **Preparatory fix, `maps` tail fast-path, and symbol iteration (Patches 1-4)**:
  - Patch 1 fixes an `alloc_func_regex` leak on error returns in
    `builtin-kmem.c`'s `build_alloc_func_list()`.
  - Patch 2 adds an O(1) tail fast-path check in `first_ending_after()` for
    ascending map insertions.
  - Patch 3 converts `symbols__for_each_entry()`, `dso__for_each_symbol()`,
    and `map__for_each_symbol()` to callback-based iteration and updates
    existing callers.
  - Patch 4 converts open-coded `dso__first_symbol()` / `dso__next_symbol()`,
    `rb_first_cached()`, and `dso__symbol_names()` loops to callback
    helpers and removes `dso__{first,last,next}_symbol()`.
- **Sorted symbol arrays and staged sorting optimizations (Patches 5-7)**:
  - Patch 5 replaces `dso->symbols` (`rb_root_cached`) and
    `dso->symbol_names` with a `rw_semaphore`-protected `struct symbols`
    container backed by sorted pointer arrays, removing `struct rb_node`
    from `struct symbol` (shrinking `sizeof(struct symbol)` from 48 to 24
    bytes, or 16 bytes net per symbol after accounting for the array
    pointer).
  - Patch 6 replaces `qsort()` on `struct symbols` with a stable
    natural-run merge sort.
  - Patch 7 optimizes incremental dynamic symbol insertions
    (`dso__insert_symbol()`) and small appends using `@sorted_cnt` and a
    sorted tail buffer with amortized `sqrt(N)` merge.
- **Memory shrinking APIs and unit tests (Patches 8-10)**:
  - Patch 8 adds `symbols__shrink()`, `dso__shrink()`, `dsos__shrink()`,
    `machine__shrink()`, `machines__shrink()`, and `perf_session__shrink()`
    to reclaim `symbols_by_name`, excess array capacity, cached DSO file
    descriptors/data/DWARF state, and unreferenced user DSOs (`refcnt == 1`
    with no annotated symbols), with transparent on-demand reload via
    `dso__load()`.
  - Patch 9 adds `dso__session()` and `perf_session__malloc()` /
    `zalloc()` / `calloc()` / `realloc()` / `strdup()` wrappers (leaving
    production caller wiring for follow-up once lazy symbol loading is
    evaluated).
  - Patch 10 adds unit tests in `perf test symbols` covering sorted symbol
    insertion, equal-start aliases, symbol/DSO shrinking, `dso_symbol`
    lifetime pinning, inline frame/srcline cleanup ordering,
    `symbols_by_name` on-demand rebuild, transparent DSO reload, and session
    allocation wrappers.

Changes in v7:
- Rebase onto `perf-tools-next` (`bb27ddbaee56`), dropping the 3 patches
  from v6 that have been applied upstream.
- Drop `nr_addr_sorted` and `nr_name_sorted` incremental partial-sort state
  from `struct maps`, keeping only the `first_ending_after()` tail
  fast-path check (`Patch 2`) (Namhyung Kim).
- Split out the `alloc_func_regex` leak fix in `builtin-kmem.c` (`Patch 1`),
  the `map__for_each_symbol()` callback conversion (`Patch 3`), and the
  conversion of open-coded symbol loops (`Patch 4`) ahead of the `rbtree`
  to `struct symbols` array conversion (`Patch 5`) (Namhyung Kim).
- Split symbol sorting optimization into a simple natural-run merge sort
  patch without galloping (`Patch 6`) followed by incremental dynamic
  symbol insertion with a sorted tail (`Patch 7`) (Namhyung Kim).

Changes in v6:
- Fix `symbols__find()` when `sorted_cnt < cnt` so that if the slice
  (sorted prefix or unmerged sorted tail) with the higher `start <= ip`
  group ends before `ip`, `symbols__find()` returns `NULL` rather than
  falling back to an earlier outer symbol in the other slice, matching
  post-merge behavior, and add unmerged-vs-merged prefix/tail overlap and
  equal-start alias unit tests (Sashiko).
- Use positive `ENOMEM` rather than `-ENOMEM` on `symbol__annotation()`
  failure in `symbol__annotate()`, `symbol__annotate2()`, and
  `__hist_entry__tui_annotate()` to match `symbol__strerror_disassemble()`,
  check `symbol__annotate() != 0` in `hist_entry__get_data_type()`, and
  guard against `NULL` `notes` / `notes->src` in `find_disasm_line()`
  (Sashiko).

Changes in v5:
- Rebase onto `perf-tools-next` (`b7ff10b9ddec`), dropping the 10 patches
  from v4 that have been applied upstream.
- Defer `perf_singlethreaded` removal, `rwsem` trylock helpers, and wiring
  `perf_session__*` allocation wrappers into symbol/DSO/thread/hist callers
  to follow-up work while keeping the shrinking APIs and unit tests
  (Namhyung Kim).
- Drop the mechanical `struct symbol` field-accessor refactoring patch and
  add kernel-doc comments on `struct dso_symbol` and `struct map_symbol`
  explaining the DSO-owned symbol lifetime connection.
- Drop `SYMBOL_FLAG_ANNOTATED` from `struct symbol::flags` and check the
  `annotations` hashmap under `annotations_lock` with an atomic
  `nr_annotations` fast path, and return `NULL` on allocation failure in
  `symbol__annotation()` (Namhyung Kim, Alireza Haghdoost, Sashiko).
- Avoid `_dso__data_open_lock` <-> `dso__lock` lock inversion in
  `dsos__shrink()` / `dso__shrink()` and add a concurrent regression test
  in `perf test symbols` (Sashiko).

v6: https://lore.kernel.org/linux-perf-users/20261117185305.108003-1-irogers@google.com/
v5: https://lore.kernel.org/linux-perf-users/20261116063435.2817923-1-irogers@google.com/
v4: https://lore.kernel.org/linux-perf-users/20261113171734.2188066-1-irogers@google.com/
v3: https://lore.kernel.org/linux-perf-users/20261110220803.2503416-1-irogers@google.com/
v2: https://lore.kernel.org/linux-perf-users/20261027231513.816148-1-irogers@google.com/
v1: https://lore.kernel.org/lkml/20260928075237.3055101-1-irogers@google.com/

AI Assistance Disclosure (per Documentation/process/coding-assistants.rst
and Documentation/process/generated-content.rst):
- Tools used: Google Antigravity / Jetski coding assistant and Sashiko
  automated patch review (sashiko.dev and internal Sashiko).
- Summary of prompts and assistance: Interactive pair-programming session to
  replace per-symbol refcounting with `struct dso_symbol` DSO-borrowed
  lifetimes, split symbol callback iteration and staged natural-run merge
  sort / incremental insertion patches, and address LKML reviewer and
  Sashiko feedback across `kmem`, `dso`, `map`, `maps`, `symbol`, and
  `tests/symbols.c`.
- Testing performed: Built each commit (`[1/10]` through `[10/10]`) with
  Clang (`-Wthread-safety`), AddressSanitizer, LeakSanitizer, and `DEBUG=1`
  (`REFCNT_CHECKING=1`); ran `perf test` (including `Symbols`, `Maps`, `DSO
  data`, `hists`, `thread`, and `annotate` suites), `perf bench internals`
  (`symbols` and `maps`), and `scripts/checkpatch.pl`.

Ian Rogers (10):
  perf kmem: Fix alloc_func_regex leak on error in
    build_alloc_func_list()
  perf maps: Add tail fast-path check in first_ending_after()
  perf symbol: Convert map__for_each_symbol() to callback-based
    iteration
  perf symbol: Use callback iteration instead of open-coded symbol loops
  perf symbol: Switch backing storage from rbtree to struct symbols
    array
  perf symbol: Replace qsort() with natural-run merge sort
  perf symbol: Optimize incremental symbol insertion with sorted tail
  perf symbol: Add memory shrinking for symbols, DSOs, and machines
  perf session: Add dso__session() and session-scoped allocation
    wrappers
  perf test symbols: Add tests for symbol shrinking and session alloc
    wrappers

 tools/perf/arch/powerpc/util/sym-handling.c |   34 +-
 tools/perf/builtin-annotate.c               |   11 -
 tools/perf/builtin-kmem.c                   |   51 +-
 tools/perf/tests/hists_common.c             |    5 +-
 tools/perf/tests/maps.c                     |   46 +
 tools/perf/tests/symbols.c                  |  840 ++++++++++++++-
 tools/perf/tests/vmlinux-kallsyms.c         |  181 ++--
 tools/perf/ui/browser.c                     |    3 +
 tools/perf/ui/browsers/hists.c              |    3 +-
 tools/perf/ui/browsers/map.c                |   62 +-
 tools/perf/util/auxtrace.c                  |  109 +-
 tools/perf/util/db-export.c                 |    4 +-
 tools/perf/util/dso.c                       |  368 ++++++-
 tools/perf/util/dso.h                       |   84 +-
 tools/perf/util/dsos.c                      |   51 +
 tools/perf/util/dsos.h                      |    3 +
 tools/perf/util/intel-pt.c                  |   74 +-
 tools/perf/util/libbfd.c                    |    3 +-
 tools/perf/util/machine.c                   |   60 +-
 tools/perf/util/machine.h                   |    8 +
 tools/perf/util/map.c                       |   36 +-
 tools/perf/util/map.h                       |    8 +-
 tools/perf/util/maps.c                      |    4 +
 tools/perf/util/probe-event.c               |   98 +-
 tools/perf/util/session.c                   |   78 ++
 tools/perf/util/session.h                   |    8 +
 tools/perf/util/symbol-elf.c                |   12 +-
 tools/perf/util/symbol.c                    | 1031 +++++++++++++++----
 tools/perf/util/symbol.h                    |   84 +-
 tools/perf/util/symbol_fprintf.c            |   25 +-
 30 files changed, 2711 insertions(+), 673 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog

