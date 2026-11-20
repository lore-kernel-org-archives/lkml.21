Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212884;
	b=FtZyH9SulqPYYlZ1ZRJUuuXJYqQ/kZOZQ2FV+NLgEhtoEkzY2iSagYFzXaKBJg3Sp5WH
	 qhiEL59twMzfrX/vI9NEYEbJTMEnAXvJ7Z/klxQ7wSyZMcTJKTg9yXeCWEZGmNa03qept
	 jX++CqgzwCrKavMIq64CCor/5M/dSVXuzkCN8cB5AHb0YkHSqp1HgEAP/Dm8Fm8kHXn1o
	 IxHJKiTT4JdztQyZmyXoYSabHCsCyczvBHQNFwP0Mn1A1ZbZP8ZvsVuGV09cICSE5vFub
	 i421yhxZmiYWizJ89bcjS9MtPC3cSyfSCEgn1IA1/XFno2y4upDbivccvnPS2aTnVXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6loZ6ysSmx3Fk3ckOW1hwxkVlfFlF7Hzh9OnNhaH8CI=;
	b=aYmTYUHDZexD9OSJNlh7lk5C+EC0LTgWbYgeNseuxt6fit/csGfwezG1Qo5DNurn74qp
	 KiBJRTs5dfE8r2uL9k1qIK3zVNE8FgY9TrMLefcfjqVkEt0UTWFmGSOYFKbQfFxKY2VPH
	 GyX+YCT4/tv7I1kYBE1uQWbQ5M4k1wonyvbq7GIxhgglwR/awXYeLv/SShNLynqF4YZ3r
	 wtadlgVVPy3x22Td1UFBHIa4/X5W7GqLzM+fw+vQncF3/1sLH2AkAKTIHjupb5hywH26s
	 t11kim8fV1dfvNJxiIRFu2ORYlssV8OKluN09jztJHr9LqJfQLLgNk9kmfhRVrnKksQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KKSMBLvh;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EBE606A69B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9EBE606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KKSMBLvh
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383165e9b0fso1526564eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795212878; x=1795817678; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6loZ6ysSmx3Fk3ckOW1hwxkVlfFlF7Hzh9OnNhaH8CI=;
        b=KKSMBLvhGsgqPka4qA4G8ZNnd2xcJyvuKfJBQGGbdXky8ikZBoPZoxxddPaPnuXPIJ
         AYsn0IQVZ0OorqOZ3toIu/aGDRK/z4a5gJ3q4UVnbYq45LAoCBOM1AGI82HTdGsOkuHV
         Q2uyf9CyhhDtXqqkxjAIrHCoQjy2yqeKssCT/A1ZXv3yXmicLd/lYr70Y2OVagO1FLPG
         fCQ02kA48c+CdVta6keva22QA6TlUammkQPVTgzhsjPVuE6qJr4FLg+Ym8Hxo5WBOk8a
         JLF9Hcq8NoU2CvlMFs7m858TlThW/LDohbHqnmCdWJ6GIAVEAUsvtm0jn3SYpRJtBmQN
         zMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212878; x=1795817678;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6loZ6ysSmx3Fk3ckOW1hwxkVlfFlF7Hzh9OnNhaH8CI=;
        b=UsMvltFEc3EROLNgV43RjE+rcgrH/9gosiYSLkuXGuTKL8okv8StzHdSHRJUXbYQfm
         3dn+dv/ezHcV+3jh8bzIx+ahuhMawZVUHoDhoJ9LWhb3TKko5RZj1Dz60tThccTdd0qU
         OUiXyo1rutPG3Rf+gVZwLLQxXpEHrMFhhpEiNQ8pfPkBlG1qWRSicb+GsaVjloMpS69U
         aHNJMAExeLI5Kgy6nolYMThTfoJxC+LJ+01dVkFVpcfzyP3t7TtEwV1TPVjVJOsMvaug
         /qImuLZq1oKrGX1Okc1kmeblMTSqpXG/1X0JlmHzm1tQmY2e0tXx7M1fjC/r+CpvXGSV
         PowQ==
X-Forwarded-Encrypted: i=1; AL+hErH8sUWbs/0InqblZ/jXBdgva4YQ71Pr+reFa5nTxMi04XQCAE/V+++tJZFb+6XhciZvBhFwhYoVjY1mKDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z92P+9z9W2WPYvPrwo5zhaeqpheHz+dHTVio8s4Idx8DDhHqPP+
	Ev+0vXgMnkmzBATkmpwm+cmXg/FCpZM25bITeV7Ztf0CAbCxZuewy1YCiWvYRvMpWiQHTneXSjR
	5y//3gdWOWQ==
X-Received: from dybqy9.prod.google.com ([2002:a05:7300:d709:b0:381:e4bb:7fb7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:50c4:b0:386:121c:c275
 with SMTP id 5a478bee46e88-386121cc3c8mr2817152eec.10.1795212877531; Fri, 20
 Nov 2026 14:14:37 -0800 (PST)
Date: Fri, 20 Nov 2026 14:13:13 -0800
In-Reply-To: <20261120221332.2245191-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120221332.2245191-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120221332.2245191-13-irogers@google.com>
Subject: [PATCH v3 12/30] perf pmu-events: Pass e_machine to find_core_*_table()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

find_core_events_table() and find_core_metrics_table() found tables by
an architecture name, such as from perf_env__arch(), that has to match
the pmu-events architecture directory name, for example "riscv" rather
than the "riscv64" from uname.

Instead find tables by the ELF machine of the CPUID's architecture,
using the e_machine recorded in struct pmu_events_map. The test and
common tables are found with EM_NONE.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/empty-pmu-events.c | 10 ++++++----
 tools/perf/pmu-events/jevents.py         | 10 ++++++----
 tools/perf/pmu-events/pmu-events.h       |  9 +++++++--
 tools/perf/tests/expand-cgroup.c         |  3 ++-
 tools/perf/tests/parse-metric.c          |  3 ++-
 tools/perf/tests/pmu-events.c            |  7 ++++---
 tools/perf/util/tool_pmu.c               |  3 ++-
 7 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
index 7428ffd4d70c..eba5446520c4 100644
--- a/tools/perf/pmu-events/empty-pmu-events.c
+++ b/tools/perf/pmu-events/empty-pmu-events.c
@@ -5927,23 +5927,25 @@ const struct pmu_metrics_table *pmu_metrics_table__default(void)
 	return NULL;
 }
 
-const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
+const struct pmu_events_table *find_core_events_table(uint16_t e_machine, const char *cpuid)
 {
 	for (const struct pmu_events_map *tables = &pmu_events_map[0];
 	     tables->arch;
 	     tables++) {
-		if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
+		if (pmu_events_map__e_machine_matches(tables, e_machine) &&
+		    !strcmp_cpuid_str(tables->cpuid, cpuid))
 			return &tables->event_table;
 	}
 	return NULL;
 }
 
-const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid)
+const struct pmu_metrics_table *find_core_metrics_table(uint16_t e_machine, const char *cpuid)
 {
 	for (const struct pmu_events_map *tables = &pmu_events_map[0];
 	     tables->arch;
 	     tables++) {
-		if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
+		if (pmu_events_map__e_machine_matches(tables, e_machine) &&
+		    !strcmp_cpuid_str(tables->cpuid, cpuid))
 			return &tables->metric_table;
 	}
 	return NULL;
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index db1b4749aec3..fc3de5fbda27 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -1345,23 +1345,25 @@ const struct pmu_metrics_table *pmu_metrics_table__default(void)
 \treturn NULL;
 }
 
-const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
+const struct pmu_events_table *find_core_events_table(uint16_t e_machine, const char *cpuid)
 {
 \tfor (const struct pmu_events_map *tables = &pmu_events_map[0];
 \t     tables->arch;
 \t     tables++) {
-\t\tif (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
+\t\tif (pmu_events_map__e_machine_matches(tables, e_machine) &&
+\t\t    !strcmp_cpuid_str(tables->cpuid, cpuid))
 \t\t\treturn &tables->event_table;
 \t}
 \treturn NULL;
 }
 
-const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid)
+const struct pmu_metrics_table *find_core_metrics_table(uint16_t e_machine, const char *cpuid)
 {
 \tfor (const struct pmu_events_map *tables = &pmu_events_map[0];
 \t     tables->arch;
 \t     tables++) {
-\t\tif (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
+\t\tif (pmu_events_map__e_machine_matches(tables, e_machine) &&
+\t\t    !strcmp_cpuid_str(tables->cpuid, cpuid))
 \t\t\treturn &tables->metric_table;
 \t}
 \treturn NULL;
diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
index cb55c9fbca43..c3f645c97ccd 100644
--- a/tools/perf/pmu-events/pmu-events.h
+++ b/tools/perf/pmu-events/pmu-events.h
@@ -4,6 +4,7 @@
 
 #include <stdbool.h>
 #include <stddef.h>
+#include <stdint.h>
 
 struct perf_pmu;
 
@@ -134,8 +135,12 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
 const struct pmu_events_table *perf_pmu__default_core_events_table(void);
 const struct pmu_metrics_table *pmu_metrics_table__find(void);
 const struct pmu_metrics_table *pmu_metrics_table__default(void);
-const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid);
-const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid);
+/*
+ * Find the core events or metrics table for a CPUID of the architecture with
+ * ELF machine @e_machine. The test and common tables use EM_NONE.
+ */
+const struct pmu_events_table *find_core_events_table(uint16_t e_machine, const char *cpuid);
+const struct pmu_metrics_table *find_core_metrics_table(uint16_t e_machine, const char *cpuid);
 int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data);
 int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data);
 
diff --git a/tools/perf/tests/expand-cgroup.c b/tools/perf/tests/expand-cgroup.c
index 04d62611766a..f5e092e8bb48 100644
--- a/tools/perf/tests/expand-cgroup.c
+++ b/tools/perf/tests/expand-cgroup.c
@@ -10,6 +10,7 @@
 #include "pfm.h"
 #include "target.h"
 #include <subcmd/parse-options.h>
+#include <elf.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -178,7 +179,7 @@ static int expand_metric_events(void)
 	evlist = evlist__new();
 	TEST_ASSERT_VAL("failed to get evlist", evlist);
 
-	pme_test = find_core_metrics_table("testarch", "testcpu");
+	pme_test = find_core_metrics_table(EM_NONE, "testcpu");
 	ret = metricgroup__parse_groups_test(evlist, pme_test, metric_str,
 					     /*cputype_filter=*/false);
 	if (ret < 0) {
diff --git a/tools/perf/tests/parse-metric.c b/tools/perf/tests/parse-metric.c
index 872d9a7aa72f..6f91e64a4123 100644
--- a/tools/perf/tests/parse-metric.c
+++ b/tools/perf/tests/parse-metric.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/compiler.h>
+#include <elf.h>
 #include <errno.h>
 #include <string.h>
 #include <perf/cpumap.h>
@@ -91,7 +92,7 @@ static int __compute_metric(const char *name, struct value *vals,
 	perf_evlist__set_maps(evlist__core(evlist), cpus, NULL);
 
 	/* Parse the metric into metric_events list. */
-	pme_test = find_core_metrics_table("testarch", "testcpu");
+	pme_test = find_core_metrics_table(EM_NONE, "testcpu");
 	err = metricgroup__parse_groups_test(evlist, pme_test, name,
 					     /*cputype_filter=*/false);
 	if (err)
diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index cb0c2b05c1e8..8e82f7af2aa6 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -4,6 +4,7 @@
 #include "pmu.h"
 #include "pmus.h"
 #include "tests.h"
+#include <elf.h>
 #include <errno.h>
 #include <stdio.h>
 #include <linux/kernel.h>
@@ -449,7 +450,7 @@ static int test__pmu_event_table(struct test_suite *test __maybe_unused,
 {
 	const struct pmu_events_table *sys_event_table =
 		find_sys_events_table("pmu_events__test_soc_sys");
-	const struct pmu_events_table *table = find_core_events_table("testarch", "testcpu");
+	const struct pmu_events_table *table = find_core_events_table(EM_NONE, "testcpu");
 	int map_events = 0, expected_events, err;
 
 	/* ignore 3x sentinels */
@@ -504,7 +505,7 @@ static int __test_core_pmu_event_aliases(const char *pmu_name, int *count)
 	struct perf_pmu_test_event const **test_event_table;
 	struct perf_pmu *pmu;
 	int res = 0;
-	const struct pmu_events_table *table = find_core_events_table("testarch", "testcpu");
+	const struct pmu_events_table *table = find_core_events_table(EM_NONE, "testcpu");
 
 	if (!table)
 		return -1;
@@ -559,7 +560,7 @@ static int __test_uncore_pmu_event_aliases(struct perf_pmu_test_pmu *test_pmu)
 	const struct pmu_events_table *events_table;
 	int res = 0;
 
-	events_table = find_core_events_table("testarch", "testcpu");
+	events_table = find_core_events_table(EM_NONE, "testcpu");
 	if (!events_table)
 		return -1;
 
diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
index 6054d5d5aece..d09361999b82 100644
--- a/tools/perf/util/tool_pmu.c
+++ b/tools/perf/util/tool_pmu.c
@@ -14,6 +14,7 @@
 #include <api/io.h>
 #include <internal/threadmap.h>
 #include <perf/threadmap.h>
+#include <elf.h>
 #include <fcntl.h>
 #include <strings.h>
 
@@ -718,6 +719,6 @@ struct perf_pmu *tool_pmu__new(void)
 		perf_pmu__delete(tool);
 		return NULL;
 	}
-	tool->events_table = find_core_events_table("common", "common");
+	tool->events_table = find_core_events_table(EM_NONE, "common");
 	return tool;
 }
-- 
2.56.1.750.gf70dc682cf-goog

