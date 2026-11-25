Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567919;
	b=oWlaSTWgwFLOFHMfgVwylXnSeXuOd/rMMGIlQwyZS5nJK/F4YkbK04jY7bSiQ3Ie5NYD
	 flzTQcafhH/s4Oa9srRXQlbjXfSq0cJNePJobSFouBjlMEVejAt2FEk0Cq4beuOPuSt4t
	 LFF922LnH9NgIY8ACDu8GWFD0RFLnlWnZDrKi6YBQUNOy8+EPxoz00GQ1grHgXuPWz5Oo
	 qjt04y2XDa6hP5VAPjOpLbrZrvSCZT8RL794AAL9qqBj4md9EEl3I4V0pTGyTeNwMp+I3
	 1XNfQ0beHyJrlObp2GaAvpMvWX8FSLPvmM9ck9oW7nmpq7n/oj4kJ/Iq1C9/BtJ+d1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=QndkiIz5ZF/DqfpSqKPFQigqx23qy3mxXJ1/LTwGGQo=;
	b=JoC7i3+bBRFeqLuSq0bElklAZav3l/5Op3ve2MPtI1HiVD6CQytNNhU6C7HnlT/w6igV
	 7ke65casJlL4+yeBLu6SXdAFfLF4cuUlZ9VgXgBNv8tZh4mIoiVdOaV2w953g8vNJAh9b
	 OWSFitLJJlJi8+sVblTdV7xEijN6XoDQimfdjkgKleITSyOpBcbOjGp/MXxQiafLUwEci
	 1uccIgb5N1PY1BZHYx/uTmcPOuM2X1u3n4E7XiwDKVqU6/H9XGAVzgtHO3gldxTMHTKb7
	 SF/2ubXPuCq+TdXdldUzV9yZ+clt+ENx4sNFKGZIHBWTEEoC24vy6DzlcYLJ0DoNO+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KNdnbE1E;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3119160A5BCE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3119160A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KNdnbE1E
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so3585345c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567918; x=1796172718; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QndkiIz5ZF/DqfpSqKPFQigqx23qy3mxXJ1/LTwGGQo=;
        b=KNdnbE1ExdySZuGqrwqe2FC3574CWxy9MJ5xNym9RKykz4xYefLApvWpMwq30e9Obt
         JubsrcEOfqIF9YndR6+HhnzA3fYPyWUpfDmdiM1RTsjr2HJPi+Axg0QtEVKqiYMnaHbK
         AFekKJBSDhkwR+E/jOqbfG7PdPGHScobcUnT/i3E7fQTCBdlposd0rUt8aMor7b7ljYN
         Dez5/VkOx8W8oNAxfdrQxPnGFuJEFBCIN7FyoQNJ73iPKzOt999cVtPyTWn5Ok36i1Dd
         W41A0BlPcCTRL8stZMuBy4WrHDwUmdhuIvk0Sp2yVwWVx2M+O7Ctu1HreeHBwEdWk/3l
         iuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567918; x=1796172718;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QndkiIz5ZF/DqfpSqKPFQigqx23qy3mxXJ1/LTwGGQo=;
        b=xKq6YGXjBDhMeAPlLYRFtGO/1aOJrUGrn3vopAgsxZek4Ih79g5PqKyZBRH4nSPBKs
         5Q52W50BriK5I44fSppKDwlKU9kE21Bbc99icM2RzSoKV9XvYkDIaYi6Imga2GhIgE3L
         L5v1ezWyy9hfmZIA15LL4SMfypAxvqAF1B4KyTIt5NHlinUGcf8RdTWg+CEjySPuaAGC
         rfkE2GV7L699KRKj3BMSzDBmNbZNSOYp49RWeCf492JywdqNThBjzGxwAQMDv0t4gzH0
         9v8PYNFU721UPEaAXwkDUYyGBnzcn+AvFn4C+dn8mD/5ceCDld523925Lf3HLI/X49rO
         o3DA==
X-Forwarded-Encrypted: i=1; AL+hErGYFRE2ob/tlxE+c0qcnddLkd9gg6Lab6x/DFewPzSe8pB5eFmM6waU7iJyrVhDAubwiydxbD1yFnTtBS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6OSG0xpJIhS7wswtcmPvzNRfJZ7p+cY97DoqXx61ZykNeeCht
	zJqKnhmJ3KWNXYhAqEqU2oyW8GwaoEG6EZmSeMsn2hOKBq+1gNt7WgWC/J6aVN8p2vHK+3qcOka
	LN0Sl/u2ghA==
X-Received: from dlgj1-n1.prod.google.com ([2002:a05:7023:e41:10b0:1a7:2bf1:46cc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b0c8:b0:1b2:6855:998a
 with SMTP id a92af1059eb24-1b556911007mr14552250c88.34.1795567917876; Tue, 24
 Nov 2026 16:51:57 -0800 (PST)
Date: Tue, 24 Nov 2026 16:51:07 -0800
In-Reply-To: <20261125005108.1020003-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125005108.1020003-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125005108.1020003-19-irogers@google.com>
Subject: [PATCH v4 18/19] perf test: Add BUILD_ID_OFFSET C unit tests
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Leo Yan <leo.yan@linux.dev>, Dmitry Vyukov <dvyukov@google.com>, 
	"Steinar H . Gunderson" <sesse@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add C unit test coverage for PERF_SAMPLE_BUILD_ID_OFFSET and
PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET:
- sample-parsing: round-trip synthesis and parsing
- mmap-thread-lookup: map lookup by build ID and DSO file offset
- bid-offset: sys_perf_event_open() attribute probing

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/Build                |  1 +
 tools/perf/tests/bid-offset.c         | 61 +++++++++++++++++++++++++++
 tools/perf/tests/builtin-test.c       |  1 +
 tools/perf/tests/mmap-thread-lookup.c | 49 ++++++++++++++++++++-
 tools/perf/tests/sample-parsing.c     | 60 +++++++++++++++++++++++++-
 tools/perf/tests/tests.h              |  1 +
 6 files changed, 170 insertions(+), 3 deletions(-)
 create mode 100644 tools/perf/tests/bid-offset.c

diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
index 5eebb2ec5dde..d6fe1ba57a79 100644
--- a/tools/perf/tests/Build
+++ b/tools/perf/tests/Build
@@ -66,6 +66,7 @@ perf-test-y += expand-cgroup.o
 perf-test-y += perf-time-to-tsc.o
 perf-test-y += dlfilter-test.o
 perf-test-y += sigtrap.o
+perf-test-y += bid-offset.o
 perf-test-y += event_groups.o
 perf-test-y += hybrid-merge.o
 perf-test-y += symbols.o
diff --git a/tools/perf/tests/bid-offset.c b/tools/perf/tests/bid-offset.c
new file mode 100644
index 000000000000..0cf52caae047
--- /dev/null
+++ b/tools/perf/tests/bid-offset.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "tests.h"
+#include "debug.h"
+#include "evlist.h"
+#include "evsel.h"
+#include <linux/hw_breakpoint.h>
+#include <linux/perf_event.h>
+#include <sys/syscall.h>
+#include <unistd.h>
+#include <errno.h>
+#include "../perf-sys.h"
+
+static int test__bid_offset(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
+{
+	struct perf_event_attr attr = {
+		.type		= PERF_TYPE_SOFTWARE,
+		.config		= PERF_COUNT_SW_DUMMY,
+		.size		= sizeof(attr),
+		.sample_type	= PERF_SAMPLE_BUILD_ID_OFFSET,
+		.exclude_kernel = 1,
+		.exclude_hv     = 1,
+	};
+	int fd;
+
+	fd = sys_perf_event_open(&attr, /*pid=*/0, /*cpu=*/-1, /*group_fd=*/-1, /*flags=*/0);
+	if (fd < 0) {
+		pr_debug("sys_perf_event_open failed with %d\n", errno);
+		if (errno == EINVAL || errno == EACCES || errno == EPERM) {
+			pr_debug("Kernel does not support or permit PERF_SAMPLE_BUILD_ID_OFFSET\n");
+			return TEST_SKIP;
+		}
+		return TEST_FAIL;
+	}
+	close(fd);
+
+	attr.sample_type = PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET;
+	attr.exclude_callchain_kernel = 1;
+	fd = sys_perf_event_open(&attr, /*pid=*/0, /*cpu=*/-1, /*group_fd=*/-1, /*flags=*/0);
+	if (fd < 0) {
+		pr_debug("sys_perf_event_open with callchain failed with %d\n", errno);
+		if (errno == EINVAL || errno == EACCES || errno == EPERM) {
+			pr_debug("Kernel does not support or permit PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET\n");
+			return TEST_SKIP;
+		}
+		return TEST_FAIL;
+	}
+	close(fd);
+
+	return TEST_OK;
+}
+
+static struct test_case bid_offset_tests[] = {
+	TEST_CASE_REASON("Test PERF_SAMPLE_BUILD_ID_OFFSET", bid_offset,
+			 "not supported by kernel"),
+	{ .name = NULL, }
+};
+
+struct test_suite suite__bid_offset = {
+	.desc = "Test PERF_SAMPLE_BUILD_ID_OFFSET",
+	.test_cases = bid_offset_tests,
+};
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index 01c78ef20b97..b880ed7aa37f 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -186,6 +186,7 @@ static struct test_suite *generic_tests[] = {
 	&suite__perf_time_to_tsc,
 	&suite__dlfilter,
 	&suite__sigtrap,
+	&suite__bid_offset,
 	&suite__event_groups,
 	&suite__hybrid_merge,
 	&suite__symbols,
diff --git a/tools/perf/tests/mmap-thread-lookup.c b/tools/perf/tests/mmap-thread-lookup.c
index dca8bbfe780a..7e312d5a1ba3 100644
--- a/tools/perf/tests/mmap-thread-lookup.c
+++ b/tools/perf/tests/mmap-thread-lookup.c
@@ -7,6 +7,7 @@
 #include <pthread.h>
 #include <stdlib.h>
 #include <stdio.h>
+#include <string.h>
 #include "debug.h"
 #include "env.h"
 #include "event.h"
@@ -17,7 +18,10 @@
 #include "symbol.h"
 #include "util/synthetic-events.h"
 #include "thread.h"
+#include "dso.h"
+#include "build-id.h"
 #include <internal/lib.h> // page_size
+#include <internal/rc_check.h>
 
 #define THREADS 4
 
@@ -200,17 +204,58 @@ static int mmap_events(synth_cb synth)
 					.ip = (unsigned long) (td->map + 1),
 				 }, &al);
 
-		thread__put(thread);
-
 		if (!al.map) {
 			pr_debug("failed, couldn't find map\n");
 			err = -1;
+			thread__put(thread);
 			addr_location__exit(&al);
 			break;
 		}
 
 		pr_debug("map %p, addr %" PRIx64 "\n", al.map, map__start(al.map));
 
+		/* Verify lookup by build ID and offset */
+		{
+			struct build_id test_bid = {
+				.data = { [0] = i + 1 },
+				.size = BUILD_ID_SIZE,
+			};
+			struct dso *dso = dso__new("test_dso");
+			struct addr_location al2;
+			struct perf_build_id pbid = { .size = test_bid.size };
+			u64 offset = map__dso_map_ip(al.map,
+						     (unsigned long)(td->map + 1));
+
+			if (!dso) {
+				pr_debug("failed to create test dso\n");
+				err = -1;
+				thread__put(thread);
+				addr_location__exit(&al);
+				break;
+			}
+			dso__set_build_id(dso, &test_bid);
+			dso__put(map__dso(al.map));
+			map__set_dso(al.map, dso);
+
+			memcpy(pbid.data, test_bid.data, test_bid.size);
+			addr_location__init(&al2);
+			thread__find_map(thread, &(struct perf_sample){
+						.cpumode = PERF_RECORD_MISC_USER,
+						.ip = 0,
+						.bid = {
+							.bid = &pbid,
+							.offset = offset,
+						},
+					 }, &al2);
+
+			if (!RC_CHK_EQUAL(al2.map, al.map) || al2.addr != offset) {
+				pr_debug("failed, couldn't find map by build id and offset\n");
+				err = -1;
+			}
+			addr_location__exit(&al2);
+		}
+
+		thread__put(thread);
 		addr_location__exit(&al);
 		if (err)
 			break;
diff --git a/tools/perf/tests/sample-parsing.c b/tools/perf/tests/sample-parsing.c
index bd30f6d4c31b..40945e499c83 100644
--- a/tools/perf/tests/sample-parsing.c
+++ b/tools/perf/tests/sample-parsing.c
@@ -209,6 +209,33 @@ static bool samples_same(struct perf_sample *s1,
 	if (type & PERF_SAMPLE_CODE_PAGE_SIZE)
 		COMP(code_page_size);
 
+	if (type & PERF_SAMPLE_BUILD_ID_OFFSET) {
+		if (!s1->bid.bid || !s2->bid.bid ||
+		    memcmp(s1->bid.bid, s2->bid.bid, sizeof(*s1->bid.bid))) {
+			pr_debug("Samples differ at 'bid.bid'\n");
+			return false;
+		}
+		COMP(bid.offset);
+	}
+
+	if (type & PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET) {
+		COMP(callchain_bid.nr_build_ids);
+		COMP(callchain_bid.nr_offsets);
+		COMP(callchain_bid.build_ids_len);
+		if (!s1->callchain_bid.build_ids || !s2->callchain_bid.build_ids ||
+		    memcmp(s1->callchain_bid.build_ids, s2->callchain_bid.build_ids,
+			   s1->callchain_bid.build_ids_len)) {
+			pr_debug("Samples differ at 'callchain_bid.build_ids'\n");
+			return false;
+		}
+		if (!s1->callchain_bid.offsets || !s2->callchain_bid.offsets ||
+		    memcmp(s1->callchain_bid.offsets, s2->callchain_bid.offsets,
+			   s1->callchain_bid.nr_offsets * sizeof(u64))) {
+			pr_debug("Samples differ at 'callchain_bid.offsets'\n");
+			return false;
+		}
+	}
+
 	if (type & PERF_SAMPLE_AUX) {
 		COMP(aux_sample.size);
 		if (memcmp(s1->aux_sample.data, s2->aux_sample.data,
@@ -247,6 +274,26 @@ static int do_test(u64 sample_type, u64 sample_regs, u64 read_format)
 	const u32 raw_data[] = {0x12345678, 0x0a0b0c0d, 0x11020304, 0x05060708, 0 };
 	const u64 data[] = {0x2211443366558877ULL, 0, 0xaabbccddeeff4321ULL};
 	const u64 aux_data[] = {0xa55a, 0, 0xeeddee, 0x0282028202820282};
+	const struct perf_build_id bid = {
+		.size = 20,
+		.data = {
+			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
+			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
+		}
+	};
+	const u8 callchain_build_ids[48] = {
+		20,
+		'9', '8', '7', '6', '5', '4', '3', '2', '1', '0',
+		'9', '8', '7', '6', '5', '4', '3', '2', '1', '0',
+		20,
+		'a', 'b', 'c', 'd', 'e', 'f', 'a', 'b', 'c', 'd',
+		'e', 'f', 'a', 'b', 'c', 'd', 'e', 'f', 'a', 'b',
+	};
+	const u64 callchain_offsets[] = {
+		(1ULL << 56) | 201,
+		(2ULL << 56) | 202,
+		(1ULL << 56) | 203,
+	};
 	struct regs_dump user_regs = {
 		.abi	= PERF_SAMPLE_REGS_ABI_64,
 		.mask	= sample_regs,
@@ -291,6 +338,17 @@ static int do_test(u64 sample_type, u64 sample_regs, u64 read_format)
 		.code_page_size = 116,
 		.ins_lat	= 117,
 		.weight3	= 118,
+		.bid		= {
+			.bid = (struct perf_build_id *)&bid,
+			.offset = 119,
+		},
+		.callchain_bid	= {
+			.nr_build_ids = 2,
+			.nr_offsets = ARRAY_SIZE(callchain_offsets),
+			.build_ids_len = sizeof(callchain_build_ids),
+			.build_ids = (u8 *)callchain_build_ids,
+			.offsets = (u64 *)callchain_offsets,
+		},
 		.aux_sample	= {
 			.size	= sizeof(aux_data),
 			.data	= (void *)aux_data,
@@ -547,7 +605,7 @@ static int test__sample_parsing(struct test_suite *test __maybe_unused, int subt
 	 * were added.  Please actually update the test rather than just change
 	 * the condition below.
 	 */
-	if (PERF_SAMPLE_MAX > PERF_SAMPLE_WEIGHT_STRUCT << 1) {
+	if (PERF_SAMPLE_WEIGHT_STRUCT << 3 < PERF_SAMPLE_MAX) {
 		pr_debug("sample format has changed, some new PERF_SAMPLE_ bit was introduced - test needs updating\n");
 		return -1;
 	}
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index af822885890d..a65d209b649f 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -196,6 +196,7 @@ DECLARE_SUITE(expand_cgroup_events);
 DECLARE_SUITE(perf_time_to_tsc);
 DECLARE_SUITE(dlfilter);
 DECLARE_SUITE(sigtrap);
+DECLARE_SUITE(bid_offset);
 DECLARE_SUITE(event_groups);
 DECLARE_SUITE(hybrid_merge);
 DECLARE_SUITE(symbols);
-- 
2.56.1.831.g720f3f5937-goog

