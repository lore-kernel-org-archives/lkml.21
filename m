Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795306145;
	b=BozXDOTJ/2cT3dqQC0pQVvDINwNTYn2uTZypS8fHuibKcGVgA1yKBaTfSVosT1a+YHkc
	 6u4xDQ/XL9rSqKdAuwSUrXCam2g2HsCKrfIarY2HzbguUKi28x+N01yoxEx6x6WG8k9p0
	 nX3tLhwA/larUqzXsN5+jadFI/CAIVp2wS9Wx2+GmFh/6b8SNIOm+auNQJ4p2QCFuOPtv
	 e89y0NfWAEOjctwWlourlEiLQhw/zrHVoX4qDVQX3ImybkXnsPsiA0RXVK1BBlsxhAyYi
	 tJYS9U2ZV/UpqStUcBTFCZ6Aexn7Kx+1Trr1GKh4f5iTeKmVVDOKowxGgIIaOVKuMZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795306145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type;
	bh=eZ/C0MjLctzDUF6Twskdb3vgozRB4N9gCenz5ZATy2M=;
	b=MTSctulcUFD38jQKHZPeyQ33BXHozVyJmAUOGJe4hHbI9KFtSZzm2rd0iQk2zxO+aHO5
	 olirlBhYXsVPDMezeLYbt0yAUnKyXuJWFRju0uGbMU5ATglyQdIEIdKDTaHs89JwF+fiq
	 BK9SJkynSq406gBaGDrMwDvenp9UPn7vEncI51bE2z0eljyPigNgdOUhwEpjA9x7zNUgJ
	 g/RMp/rs95xpSDhaQWzDgCYlO2RLT8O3XQtUQq1oF+fCqEsq0Z/6wrDRznnpjbP2M5TMG
	 b8N6ZKetCeEFZWsj+Uoe5UbC/sHPvw5HYAJADA/PhpfiV+ftQvrk40Au196pRAS6U+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EDxdxi24;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FDF606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18FDF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EDxdxi24
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f048bc09d7so49885ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795306144; x=1795910944; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZ/C0MjLctzDUF6Twskdb3vgozRB4N9gCenz5ZATy2M=;
        b=EDxdxi24ThVqNVfH3JIG3HRtgJaKi8lN0uof83CA/rIc2+QWIWBrmpJudcbNnPErub
         Pd+Z+MXpx+xVpjf30dBH1outipTtwxFeIlFYPyS/vi2vxwshvwAuUer7+FFlxVM+W5Fq
         Hq6AQYyskZfZof+fTNqxxWm2AmDctAWspZh2lskez1Fsiruy2Jcb1kofKE/sI8ovVYjk
         PJ9wDOeF7nR0OMBHnry7l9swsxUDQgH2x6JschZRTCEH2lo7ZJJE5imDhRVgQEOD8ln1
         xcL6IyJ5z019V1P8XTonJhYzRVL7qogI92BKw1lfgSKnZkU8srbWnHLYVTB0L4WF20h4
         ATZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795306144; x=1795910944;
        h=content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eZ/C0MjLctzDUF6Twskdb3vgozRB4N9gCenz5ZATy2M=;
        b=tqBi4KpSHE8L3FNu6rrEKKezlqGGbb7nyyfyO1/o9U0XYdBw3vh1ZsrayAM66CD5GH
         m1KhAPvG6xgod5jnoO2DDOS1sfJgIAsBxHuZzgfqQdz2Hw06RvL/3ysjFk/9My7asvnp
         ZJS63bkUDaY7OLRAZV7/2BZH8ctOA4Vwr8dWFaEfxfoAe2VossEc6cVQCeWvyopSYqeA
         lMBLB+xeJqT3soUvuvyQ2xz0E+IdNeX2N5Ni1HPR+vSRJbSIq5FYfAzDr3hWPUPdgo2U
         zti+9NoZtP5RXwJjdRYON2m6OIbq2aHcpiA7c5CAzlcRT/MCD6Qi/MuTQFSkXkUfIHhC
         1kuQ==
X-Forwarded-Encrypted: i=1; AL+hErFTTFizM9tLxSf5eYlxBg3q2pDR7WNEYMBxPKtExMNvEXWYhsXyfjrUpw4YH1TxyHN3x6hQqEnaguUTx+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DijsBMPU7XQ9hKdslTR6FVUlBskt8MyoOmS8zem6HEj2UgW6H
	p6d3aLN362OAav2itE+xSwj1zOdzKcQh3fOKxrz+Ha0iS2SaTg2rLGRJkc27uza3Gg==
X-Gm-Gg: AZFdTZdIquNskgOohizLJBKoElQj+s1PSZFANcRD87OatPCcWC4MJ6XLddwO7s3aTk1
	7RB60yB1Aa8pIEdB2gAv3vt3wlzIl0gdY5eQZ5uyxvvzg6GLRpIUfTqDfqwSdlNYOUNcTP+U4Gj
	vSzs1dfKJXlmYrTLM7sfbVXPW7sw0m4WpdfCoLMhN3CDbXVpXuRiZi0lLjPB+GMq8qcHAWz+9ki
	6I2Pm/qBoge3bHiGsi7QZwzQMGEIjn2tGADkAYxYdA11uontHedFakWKqxsUP0FqTIbejxXgqLE
	L/crC6hyRGrp8Z1+Jc8uY/w41kn3n1oUO2ZUXtuEdzqbYDZ6mWaMjoqqvEec9OxFHRc6dknYs2y
	qChfIEE91wf1W1V56Lkk9+6ApIvQrV1RxwQn5isyNrXZih9grrQTEErncStENOHMI1OVGXxzqD3
	6Edxnqj+Nw7dGKF4JeqMk35jrY5Jb/JInyN6ZsDyTQv4lMaBdd9k1J7Y9s8fgCB5fDtFPGbXOtm
	PBT4ist3H80qJ2cyr7CUZcJCSIoyjUbcTF0WKpfJZioePwzxMnL6xCuqZfJBabqQGg3KCS85Gx5
	U0qlNE/dhWjt7R7I7hqRs2tllSqsHUqaK9U5UR2tBNXYfy8xPs23M3khd5n+mv2CabpXRp0OxdO
	GnR/kHPCn1BEZrTn5TaU+bbrZAcgyIhiLgqHEjjiUXjmQqUh03XPktyQ4rTCswWi6oGouv5FLqz
	6CwB7ofKge3UBGeIShp2SgEPZn7iaZjfE1obKVXwex6WE=
X-Received: by 2002:a17:903:fad:b0:2e6:23e5:4934 with SMTP id d9443c01a7336-2f0666ca266mr2919995ad.14.1795306143466;
        Sat, 21 Nov 2026 16:09:03 -0800 (PST)
Received: from [2a00:79e0:2eb4:9:575c:af4:36d9:d404] ([2a00:79e0:2eb4:9:575c:af4:36d9:d404])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm12953309a91.17.2026.11.21.16.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:09:02 -0800 (PST)
Date: Sat, 21 Nov 2026 16:09:01 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
    "David Hildenbrand (Arm)" <david@kernel.org>
cc: Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
    Sarthak Sharma <sarthak.sharma@arm.com>, 
    Johannes Weiner <hannes@cmpxchg.org>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
    Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, 
    Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: [patch 1/2] mm: page_alloc_kunit: add synthetic benchmark for the
 page allocator
Message-ID: <c872d827-76c8-f765-0634-c84c7d9ce853@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Christoph Lameter <cl@gentwo.org>

Add a synthetic benchmark that can be used to measure performance of the
page allocator.  This is used to analyze any improvements or regressions
in the allocation and free paths, which are among the hottest paths in MM.

This is the second of three tests that measure the execution times of
critical MM functions anticipated to be used by developers to measure the
impact of any core changes that would end up causing workload performance
issues.  Google has carried these tests internally and kept them updated
since Christoph posted them back in 2009 for this purpose.

This can also be used to detect regressions over time, from kernel
version to kernel version, independent of development use cases.

The benchmark covers, for each page order:

 - allocating a batch of pages and then freeing them, from a single thread
 - allocating and immediately freeing a page, from a single thread
 - both of the above concurrently on all online CPUs
 - allocating pages on all CPUs but one and freeing them all from that
   one CPU (remote free)

Allocations use __GFP_NORETRY | __GFP_NOWARN so that the benchmark does not
invoke the oom killer on small systems; if memory runs out, the results
are reported for the pages that could be allocated.

The test is run by KUnit or doing modprobe page_alloc_kunit directly.

Sample output (abbreviated):
 KTAP version 1
 1..1
     KTAP version 1
     # Subtest: page_alloc
     # module: page_alloc_kunit
     1..5
     # page_alloc_test_alloc_then_free: order 0: 1000 ops: alloc_pages -> 4074 cycles (1008 ns/op), __free_pages -> 1240 cycles (298 ns/op)
     ...
     ok 1 page_alloc_test_alloc_then_free
     # page_alloc_test_alloc_free_pair: order 0: 1000 ops: alloc/free pair -> 3036 cycles (746 ns/op)
     ...
     ok 2 page_alloc_test_alloc_free_pair
     # page_alloc_test_concurrent_alloc_then_free: order 0: 4 cpus, 4000 ops: alloc_pages -> 4880 cycles (1208 ns/op), __free_pages -> 4832 cycles (1171 ns/op)
     ...
     ok 3 page_alloc_test_concurrent_alloc_then_free
     # page_alloc_test_concurrent_alloc_free_pair: order 0: 4 cpus, 4000 ops: alloc/free pair -> 3695 cycles (892 ns/op)
     ...
     ok 4 page_alloc_test_concurrent_alloc_free_pair
     # page_alloc_test_remote_free: order 0: 4 cpus, 3000 ops: alloc_pages -> 5763 cycles (1442 ns/op), remote __free_pages -> 1707 cycles (414 ns/op)
     ...
     ok 5 page_alloc_test_remote_free
 # page_alloc: pass:5 fail:0 skip:0 total:5
 # Totals: pass:5 fail:0 skip:0 total:5
 ok 1 page_alloc

Signed-off-by: Christoph Lameter <cl@gentwo.org>
Signed-off-by: David Rientjes <rientjes@google.com>
---
 MAINTAINERS                 |   1 +
 mm/Kconfig                  |  12 +
 mm/Makefile                 |   1 +
 mm/tests/page_alloc_kunit.c | 490 ++++++++++++++++++++++++++++++++++++
 4 files changed, 504 insertions(+)
 create mode 100644 mm/tests/page_alloc_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cc8e9dc4c98f..8747eff14532 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17927,6 +17927,7 @@ F:	mm/page_reporting.h
 F:	mm/show_mem.c
 F:	mm/shuffle.c
 F:	mm/shuffle.h
+F:	mm/tests/page_alloc_kunit.c
 F:	scripts/gdb/linux/page_owner.py
 F:	tools/mm/page_owner_filter.c
 F:	tools/mm/page_owner_sort.c
diff --git a/mm/Kconfig b/mm/Kconfig
index d6131fb7c1e6..1fa0c824fbe9 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1492,6 +1492,18 @@ config VMSTAT_KUNIT_TEST
 
 	  If unsure, say N.
 
+config PAGE_ALLOC_KUNIT_TEST
+	tristate "KUnit test for the page allocator" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to test and benchmark the performance of the
+	  page allocator: allocating and freeing pages of each order from a
+	  single thread, concurrently on all CPUs, and freeing pages on a
+	  different CPU than the one that allocated them.
+
+	  If unsure, say N.
+
 config ARCH_HAS_CHECK_WX
 	bool
 
diff --git a/mm/Makefile b/mm/Makefile
index f49994e61b03..9e0c4c6c6cbb 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -150,4 +150,5 @@ obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
 obj-$(CONFIG_VMSTAT_KUNIT_TEST) += tests/vmstat_kunit.o
+obj-$(CONFIG_PAGE_ALLOC_KUNIT_TEST) += tests/page_alloc_kunit.o
 obj-$(CONFIG_MEM_ALLOC_PROFILING) += alloc_tag.o
diff --git a/mm/tests/page_alloc_kunit.c b/mm/tests/page_alloc_kunit.c
new file mode 100644
index 000000000000..3cb78514c060
--- /dev/null
+++ b/mm/tests/page_alloc_kunit.c
@@ -0,0 +1,490 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * KUnit synthetic performance benchmark for the page allocator.
+ *
+ * (C) 2009 Linux Foundation, Christoph Lameter <cl@gentwo.org>
+ * (C) 2026 Google LLC, David Rientjes <rientjes@google.com>
+ */
+#include <kunit/test.h>
+#include <linux/completion.h>
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/err.h>
+#include <linux/gfp.h>
+#include <linux/kthread.h>
+#include <linux/ktime.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
+#include <linux/mm.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/timex.h>
+#include <linux/topology.h>
+
+#define TEST_COUNT 1000
+
+/* Highest order used by the concurrent tests, which allocate on every CPU. */
+#define CONCURRENT_MAX_ORDER min(5, MAX_PAGE_ORDER)
+
+/*
+ * This is a benchmark, not a stress test: fail the allocation rather than
+ * retry hard or invoke the oom killer if the system is short on memory.
+ */
+#define TEST_GFP (GFP_KERNEL | __GFP_COMP | __GFP_NOWARN | __GFP_NORETRY)
+
+#define BENCH_FMT_LEN 48
+
+struct bench_stat {
+	cycles_t start_cycles;
+	u64 start_ns;
+	u64 cycles;
+	u64 ns;
+	u64 ops;
+};
+
+static void bench_start(struct bench_stat *stat)
+{
+	stat->start_cycles = get_cycles();
+	stat->start_ns = ktime_get_ns();
+}
+
+static void bench_stop(struct bench_stat *stat, u64 ops)
+{
+	u64 stop_ns = ktime_get_ns();
+	cycles_t stop_cycles = get_cycles();
+
+	stat->cycles = (cycles_t)(stop_cycles - stat->start_cycles);
+	stat->ns = stop_ns - stat->start_ns;
+	stat->ops = ops;
+}
+
+static void bench_add(struct bench_stat *sum, const struct bench_stat *stat)
+{
+	sum->cycles += stat->cycles;
+	sum->ns += stat->ns;
+	sum->ops += stat->ops;
+}
+
+/* Format the average cost of an operation; not all arches have get_cycles() */
+static const char *bench_fmt(char *buf, const struct bench_stat *stat)
+{
+	u64 ops = max(stat->ops, 1);
+	u64 cycles = div64_u64(stat->cycles, ops);
+	u64 ns = div64_u64(stat->ns, ops);
+
+	if (cycles)
+		scnprintf(buf, BENCH_FMT_LEN, "%llu cycles (%llu ns/op)", cycles, ns);
+	else
+		scnprintf(buf, BENCH_FMT_LEN, "%llu ns/op", ns);
+	return buf;
+}
+
+/*
+ * Test 1: Allocate TEST_COUNT pages of each order, then free them all.
+ */
+static void page_alloc_test_alloc_then_free(struct kunit *test)
+{
+	char alloc_buf[BENCH_FMT_LEN], free_buf[BENCH_FMT_LEN];
+	struct bench_stat alloc, free;
+	struct page **pages;
+	unsigned int order;
+	unsigned int nr, i;
+
+	pages = kunit_kcalloc(test, TEST_COUNT, sizeof(*pages), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pages);
+
+	for (order = 0; order <= MAX_PAGE_ORDER; order++) {
+		bench_start(&alloc);
+		for (nr = 0; nr < TEST_COUNT; nr++) {
+			struct page *page = alloc_pages(TEST_GFP, order);
+
+			if (!page)
+				break;
+
+			/* Touch page */
+			memset(page_address(page), 22, 4);
+			pages[nr] = page;
+		}
+		bench_stop(&alloc, nr);
+
+		bench_start(&free);
+		for (i = 0; i < nr; i++)
+			__free_pages(pages[i], order);
+		bench_stop(&free, nr);
+
+		if (!nr) {
+			kunit_info(test, "order %u: unable to allocate pages\n", order);
+			continue;
+		}
+
+		kunit_info(test, "order %u: %u ops: alloc_pages -> %s, __free_pages -> %s\n",
+			   order, nr, bench_fmt(alloc_buf, &alloc),
+			   bench_fmt(free_buf, &free));
+	}
+}
+
+/*
+ * Test 2: Allocate a page of each order and immediately free it, TEST_COUNT
+ * times.
+ */
+static void page_alloc_test_alloc_free_pair(struct kunit *test)
+{
+	char buf[BENCH_FMT_LEN];
+	struct bench_stat pair;
+	unsigned int order;
+	unsigned int nr;
+
+	for (order = 0; order <= MAX_PAGE_ORDER; order++) {
+		bench_start(&pair);
+		for (nr = 0; nr < TEST_COUNT; nr++) {
+			struct page *page = alloc_pages(TEST_GFP, order);
+
+			if (!page)
+				break;
+			__free_pages(page, order);
+		}
+		bench_stop(&pair, nr);
+
+		if (!nr) {
+			kunit_info(test, "order %u: unable to allocate pages\n", order);
+			continue;
+		}
+
+		kunit_info(test, "order %u: %u ops: alloc/free pair -> %s\n",
+			   order, nr, bench_fmt(buf, &pair));
+	}
+}
+
+/*
+ * Concurrent tests: one kthread is bound to each online CPU.  All threads
+ * run phase 1 at the same time and, once every thread has completed it, run
+ * phase 2 at the same time.
+ */
+struct page_alloc_ctx;
+
+struct page_alloc_thread {
+	struct page_alloc_ctx *ctx;
+	struct task_struct *task;
+	unsigned int cpu;
+	struct page **pages;
+	struct bench_stat alloc;
+	struct bench_stat free;
+};
+
+struct page_alloc_ctx {
+	struct page_alloc_thread *threads;	/* indexed by CPU */
+	void (*phase1)(struct page_alloc_thread *t);
+	void (*phase2)(struct page_alloc_thread *t);
+	unsigned int order;
+	unsigned int free_cpu;	/* CPU doing the frees for remote free */
+	struct completion ready;
+	struct completion start1;
+	struct completion done1;
+	struct completion start2;
+};
+
+/*
+ * Allocate TEST_COUNT pages and later free them all again.
+ */
+static void alloc_then_free_phase1(struct page_alloc_thread *t)
+{
+	unsigned int nr;
+
+	bench_start(&t->alloc);
+	for (nr = 0; nr < TEST_COUNT; nr++) {
+		struct page *page = alloc_pages(TEST_GFP, t->ctx->order);
+
+		if (!page)
+			break;
+
+		/* Touch page */
+		memset(page_address(page), 14, 4);
+		t->pages[nr] = page;
+	}
+	bench_stop(&t->alloc, nr);
+}
+
+static void alloc_then_free_phase2(struct page_alloc_thread *t)
+{
+	unsigned int nr = t->alloc.ops;
+	unsigned int i;
+
+	bench_start(&t->free);
+	for (i = 0; i < nr; i++)
+		__free_pages(t->pages[i], t->ctx->order);
+	bench_stop(&t->free, nr);
+}
+
+/*
+ * Allocate a page and immediately free it, TEST_COUNT times.
+ */
+static void alloc_free_pair_phase1(struct page_alloc_thread *t)
+{
+	unsigned int nr;
+
+	bench_start(&t->alloc);
+	for (nr = 0; nr < TEST_COUNT; nr++) {
+		struct page *page = alloc_pages(TEST_GFP, t->ctx->order);
+
+		if (!page)
+			break;
+
+		/* Touch page */
+		memset(page_address(page), 12, 4);
+		__free_pages(page, t->ctx->order);
+	}
+	bench_stop(&t->alloc, nr);
+}
+
+/*
+ * Allocate TEST_COUNT pages on every CPU except one, and then free all of the
+ * pages from that one CPU.
+ */
+static void remote_free_phase1(struct page_alloc_thread *t)
+{
+	/* Perform no allocations on the freeing CPU */
+	if (t->cpu == t->ctx->free_cpu)
+		return;
+
+	alloc_then_free_phase1(t);
+}
+
+static void remote_free_phase2(struct page_alloc_thread *t)
+{
+	struct page_alloc_ctx *ctx = t->ctx;
+	unsigned int nr = 0;
+	unsigned int cpu, i;
+
+	/* All frees are completed on a single CPU */
+	if (t->cpu != ctx->free_cpu)
+		return;
+
+	bench_start(&t->free);
+	for_each_online_cpu(cpu) {
+		struct page_alloc_thread *remote = &ctx->threads[cpu];
+
+		for (i = 0; i < remote->alloc.ops; i++)
+			__free_pages(remote->pages[i], ctx->order);
+		nr += remote->alloc.ops;
+	}
+	bench_stop(&t->free, nr);
+}
+
+static int page_alloc_thread_fn(void *data)
+{
+	struct page_alloc_thread *t = data;
+	struct page_alloc_ctx *ctx = t->ctx;
+
+	complete(&ctx->ready);
+	wait_for_completion(&ctx->start1);
+	ctx->phase1(t);
+	complete(&ctx->done1);
+	wait_for_completion(&ctx->start2);
+	if (ctx->phase2)
+		ctx->phase2(t);
+
+	set_current_state(TASK_INTERRUPTIBLE);
+	while (!kthread_should_stop()) {
+		schedule();
+		set_current_state(TASK_INTERRUPTIBLE);
+	}
+	__set_current_state(TASK_RUNNING);
+	return 0;
+}
+
+/*
+ * Run @phase1 and then the optional @phase2 concurrently on all online CPUs
+ * and sum up the results.
+ *
+ * Returns the number of CPUs that the test ran on, or -errno if the test
+ * could not be run.
+ */
+static int page_alloc_run_concurrent(void (*phase1)(struct page_alloc_thread *t),
+				     void (*phase2)(struct page_alloc_thread *t),
+				     unsigned int order,
+				     struct bench_stat *alloc,
+				     struct bench_stat *free)
+{
+	struct page_alloc_ctx ctx = {
+		.phase1 = phase1,
+		.phase2 = phase2,
+		.order = order,
+	};
+	struct page_alloc_thread *t;
+	unsigned int nr_threads = 0;
+	unsigned int cpu, i;
+	int ret = 0;
+
+	memset(alloc, 0, sizeof(*alloc));
+	memset(free, 0, sizeof(*free));
+
+	init_completion(&ctx.ready);
+	init_completion(&ctx.start1);
+	init_completion(&ctx.done1);
+	init_completion(&ctx.start2);
+
+	ctx.threads = kcalloc(nr_cpu_ids, sizeof(*ctx.threads), GFP_KERNEL);
+	if (!ctx.threads)
+		return -ENOMEM;
+
+	/* Keep the set of online CPUs stable while the test is running */
+	cpus_read_lock();
+	ctx.free_cpu = cpumask_first(cpu_online_mask);
+
+	for_each_online_cpu(cpu) {
+		t = &ctx.threads[cpu];
+		t->ctx = &ctx;
+		t->cpu = cpu;
+		t->pages = kvcalloc_node(TEST_COUNT, sizeof(*t->pages),
+					 GFP_KERNEL, cpu_to_node(cpu));
+		if (!t->pages) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		t->task = kthread_create_on_node(page_alloc_thread_fn, t,
+						 cpu_to_node(cpu),
+						 "pa_kunit/%u", cpu);
+		if (IS_ERR(t->task)) {
+			ret = PTR_ERR(t->task);
+			t->task = NULL;
+			goto out;
+		}
+		kthread_bind(t->task, cpu);
+		nr_threads++;
+	}
+
+	for_each_online_cpu(cpu)
+		wake_up_process(ctx.threads[cpu].task);
+
+	/* Wait until all threads are running */
+	for (i = 0; i < nr_threads; i++)
+		wait_for_completion(&ctx.ready);
+	complete_all(&ctx.start1);
+
+	/* Wait until all threads have completed phase 1 */
+	for (i = 0; i < nr_threads; i++)
+		wait_for_completion(&ctx.done1);
+	complete_all(&ctx.start2);
+
+out:
+	/* Threads exit once they have completed phase 2 */
+	for_each_online_cpu(cpu) {
+		t = &ctx.threads[cpu];
+		if (t->task)
+			kthread_stop(t->task);
+		kvfree(t->pages);
+
+		bench_add(alloc, &t->alloc);
+		bench_add(free, &t->free);
+	}
+	cpus_read_unlock();
+	kfree(ctx.threads);
+
+	return ret ? ret : nr_threads;
+}
+
+/*
+ * Test 3: Concurrently allocate TEST_COUNT pages on all CPUs, then
+ * concurrently free them.
+ */
+static void page_alloc_test_concurrent_alloc_then_free(struct kunit *test)
+{
+	char alloc_buf[BENCH_FMT_LEN], free_buf[BENCH_FMT_LEN];
+	struct bench_stat alloc, free;
+	unsigned int order;
+	int cpus;
+
+	for (order = 0; order <= CONCURRENT_MAX_ORDER; order++) {
+		cpus = page_alloc_run_concurrent(alloc_then_free_phase1,
+						 alloc_then_free_phase2,
+						 order, &alloc, &free);
+		KUNIT_ASSERT_GT(test, cpus, 0);
+
+		if (!alloc.ops) {
+			kunit_info(test, "order %u: unable to allocate pages\n", order);
+			continue;
+		}
+
+		kunit_info(test, "order %u: %d cpus, %llu ops: alloc_pages -> %s, __free_pages -> %s\n",
+			   order, cpus, alloc.ops, bench_fmt(alloc_buf, &alloc),
+			   bench_fmt(free_buf, &free));
+	}
+}
+
+/*
+ * Test 4: Concurrently allocate and immediately free pages on all CPUs.
+ */
+static void page_alloc_test_concurrent_alloc_free_pair(struct kunit *test)
+{
+	struct bench_stat pair, unused;
+	char buf[BENCH_FMT_LEN];
+	unsigned int order;
+	int cpus;
+
+	for (order = 0; order <= CONCURRENT_MAX_ORDER; order++) {
+		cpus = page_alloc_run_concurrent(alloc_free_pair_phase1, NULL,
+						 order, &pair, &unused);
+		KUNIT_ASSERT_GT(test, cpus, 0);
+
+		if (!pair.ops) {
+			kunit_info(test, "order %u: unable to allocate pages\n", order);
+			continue;
+		}
+
+		kunit_info(test, "order %u: %d cpus, %llu ops: alloc/free pair -> %s\n",
+			   order, cpus, pair.ops, bench_fmt(buf, &pair));
+	}
+}
+
+/*
+ * Test 5: Concurrently allocate TEST_COUNT pages on all CPUs but one, then
+ * free all of the pages from that one CPU.
+ */
+static void page_alloc_test_remote_free(struct kunit *test)
+{
+	char alloc_buf[BENCH_FMT_LEN], free_buf[BENCH_FMT_LEN];
+	struct bench_stat alloc, free;
+	unsigned int order;
+	int cpus;
+
+	if (num_online_cpus() < 2)
+		kunit_skip(test, "remote free requires at least 2 online CPUs");
+
+	for (order = 0; order <= CONCURRENT_MAX_ORDER; order++) {
+		cpus = page_alloc_run_concurrent(remote_free_phase1,
+						 remote_free_phase2,
+						 order, &alloc, &free);
+		KUNIT_ASSERT_GT(test, cpus, 0);
+
+		if (!alloc.ops) {
+			kunit_info(test, "order %u: unable to allocate pages\n", order);
+			continue;
+		}
+
+		kunit_info(test, "order %u: %d cpus, %llu ops: alloc_pages -> %s, remote __free_pages -> %s\n",
+			   order, cpus, alloc.ops, bench_fmt(alloc_buf, &alloc),
+			   bench_fmt(free_buf, &free));
+	}
+}
+
+static struct kunit_case page_alloc_test_cases[] = {
+	KUNIT_CASE(page_alloc_test_alloc_then_free),
+	KUNIT_CASE(page_alloc_test_alloc_free_pair),
+	KUNIT_CASE(page_alloc_test_concurrent_alloc_then_free),
+	KUNIT_CASE(page_alloc_test_concurrent_alloc_free_pair),
+	KUNIT_CASE(page_alloc_test_remote_free),
+	{}
+};
+
+static struct kunit_suite page_alloc_test_suite = {
+	.name = "page_alloc",
+	.test_cases = page_alloc_test_cases,
+};
+kunit_test_suite(page_alloc_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christoph Lameter <cl@gentwo.org>");
+MODULE_AUTHOR("David Rientjes <rientjes@google.com>");
+MODULE_DESCRIPTION("KUnit benchmark test for the page allocator");
