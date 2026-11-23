Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418431;
	b=fDVOSR9DMJplfcAczENELuC5oBxN3hhLNZD08Gh8t/qKEuq6aJxPIRy+df/jYS03jYFZ
	 wfeBqqO98GGXBoO+L55OBbUqgqu59MqzlpG390hC4UaGQakaFd4fqaXReHJ8Sx+pqFzLw
	 vYbE6UrAkwoK/vqQRijLMH2Y5PRWe0hE0CFLl/t8eaYYWfZtzzf6xmD6Oyt0LUZup0iXd
	 ATHO8TLZj2QPclK7AkPojgfZ0Kv2Q1qy+Wota/r9OOE5KmOfRbAFWpbD+2NGsduMhrXDf
	 NiInjeCFFPMTjaGdly2HHLmOAvKq329pQKbbVDU9b61+BRdYveB2dbCKNAEwv4k/Z5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=I7D/3DpE8G8dsmnSj5nDtghWamd39YsS2s0awEB1CqQ=;
	b=uvVDym/S+4+w30kR8nqC4T4zrLlRhXTQ74Duk2T7yz9hdxrhFYFdoA8pDB1SW9Zs1cdy
	 PkjMUXNZ1VU5d/Lt94s57ATQwmml5N1RUV2KdCUplakG6Zz56CX0kIXOpMoYou/eWk4r8
	 ALqDzktij051Va4eMw9mYHScuIxBEDplFBsPH9F/1SN2Il09BTc3eM3iQEVhpahkY3z9N
	 0+teLKRdTwqyRZNrL9H88lfn/kGfw045yC5k5N88+059DkUg88IJMpS85L4mgBRv5Iecm
	 m7N40UhUsqvquctcbGOR+A0v4TMXpR0cQUSKY6agwkW0m7JXxMRo5P15D0pE73sG36Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9Hn9Kgw;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21DC606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E21DC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9Hn9Kgw
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3385500eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795418430; x=1796023230; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I7D/3DpE8G8dsmnSj5nDtghWamd39YsS2s0awEB1CqQ=;
        b=V9Hn9KgwC6tA0HZaU/7ADZDRNrIuYckw/FOl9Ri8EokdES317Ae35PUQaQm/SnSZNN
         wonjS6wXMRDSE02IUWOSwaGmDJBLUmmCbjZvoBRpUj63klsP6fxb6ourr6piHRGhCuO3
         hpoJ8fQG7MYG0v1l6KasDhRXf0fWF4kbLAYRSaRorjJZP2CYrY7qpIJSOMxXoQWG2RYV
         262wIs+5dlsxAjG7KrXjeo0nYAIL5/67WAzXuB4ysvXVRuDgS93vjAfZLBnZKG8t1rPC
         CD/EuUGOj3ZNea4u2Sy6qydKRu/sRA96VWBMsaH7014trL/jFQ+6YPq1XLBkg0vabFFY
         diSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418430; x=1796023230;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7D/3DpE8G8dsmnSj5nDtghWamd39YsS2s0awEB1CqQ=;
        b=qOQq9RDhMmsCtwkYc4HkuorjTtbF9ARVxJRwXCBFh4QFWtuRf3/mKctymhvl8MoJTV
         D6nf0ksyJvyk62wgHDaoeqaxP1tHYNiGm3dx0lJqVFHigX1tl0arkw6GoVSSpwXyaOkd
         YKY9we0yn/0km2ea1XoM0KOMlfXczmr0wnYq1PbS/Ziq/BX4af0i5JCPr7tPzpHskSGb
         a0B5KmKuy53XSWalb12haP4XosaLCNYLWI+ioIaOvI+Z9MTv7YygmtXoY1SrZfQW1NV4
         XTvE+obAglkhB55k5Ry01eaREOFWaYEEFlgfflhKk8g1rv3yynH1LIwnjuXevqpkB1ym
         Bq/g==
X-Forwarded-Encrypted: i=1; AL+hErE23GeApWKZiuMyVEt9eB4dh9LMhVV2v7QCFPw3O+sTr8A0571Y34r3aGSx6GYrrMbiKDNQyUz6q9Emk/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TQlzTvGRsYA3eMcEohqR4HYxr/yZVFxpX6ip2kNoHwiXyb/Lj
	WI2AU8B6lAVdVV5rXil4Kpfc2wDhU4mmEH+XbimnjdCPO5C8xyLSNR36rDYkrNB9+YD5e5i4hcI
	N984KZNtuUw==
X-Received: from dybnj5.prod.google.com ([2002:a05:7300:d085:b0:384:5243:f41d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:42cb:b0:386:b621:d8ec
 with SMTP id 5a478bee46e88-386b621dc16mr945943eec.19.1795418429634; Sun, 22
 Nov 2026 23:20:29 -0800 (PST)
Date: Sun, 22 Nov 2026 23:19:13 -0800
In-Reply-To: <20261123071913.653315-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123071913.653315-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123071913.653315-14-irogers@google.com>
Subject: [PATCH v1 13/13] perf parse-events: Route non-field tracepoint filter
 terms to BPF filter
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Song Liu <songliubraving@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 466db4275edd ("perf parse-events: Add parse_uid_filter helper")
only checked strstr(str, "uid") when routing tracepoint --filter strings
to evsel->bpf_filters, missing gid/tid/pid/time/cgroup BPF terms,
matching "uid" inside quoted strings or tracepoint field names, and
silently mis-evaluating tracepoint fields named "pid" when mixed with a
BPF term.

Route a tracepoint --filter to the BPF filter when it references one of
the BPF tracepoint filter terms (uid, gid, tid, pid, time, cgroup) that
is not a field of the tracepoint, looking up fields with evsel__field()
or, when built without libtraceevent, from the tracefs format file via
tp_pmu__has_field() (retaining evsel->tp_sys and evsel->tp_name
regardless of HAVE_LIBTRACEEVENT). Ignore words inside quoted string
literals, keep "cpu" as a generic ftrace field filter when used alone,
and reject filters that mix BPF terms with tracepoint fields of the same
name.

Before:
  # perf record -e kmem:mm_page_alloc --filter 'uid == 0' -- true
  libbpf: prog 'perf_sample_filter': failed to attach to perf_event FD 3: Invalid argument
  Failed to attach perf sample-filter program
  failed to set filter "BPF" on event kmem:mm_page_alloc with 22 (Invalid argument)

After:
  # perf record -e kmem:mm_page_alloc --filter 'uid == 0' -- true
  [ perf record: Woken up 1 times to write data ]
  [ perf record: Captured and wrote 0.024 MB perf.data (42 samples) ]

Fixes: 466db4275edd ("perf parse-events: Add parse_uid_filter helper")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/perf-record.txt |  14 +-
 tools/perf/util/evsel.c                  |   8 +-
 tools/perf/util/evsel.h                  |   2 +-
 tools/perf/util/parse-events.c           | 155 +++++++++++++++++++++--
 tools/perf/util/tp_pmu.c                 |  55 ++++++++
 tools/perf/util/tp_pmu.h                 |   1 +
 6 files changed, 216 insertions(+), 19 deletions(-)

diff --git a/tools/perf/Documentation/perf-record.txt b/tools/perf/Documentation/perf-record.txt
index 2351f7b4f5fc..e92672f45494 100644
--- a/tools/perf/Documentation/perf-record.txt
+++ b/tools/perf/Documentation/perf-record.txt
@@ -173,7 +173,19 @@ OPTIONS
 
 	A BPF filter can access the sample data and make a decision based on the
 	data.  Users need to set an appropriate sample type to use the BPF
-	filter.  BPF filters need root privilege.
+	filter.  BPF filters need CAP_BPF and CAP_PERFMON (or CAP_SYS_ADMIN, or
+	a pinned BPF filter for non-tracepoint events).  On tracepoint events,
+	BPF filters support context-independent terms ('uid', 'gid', 'tid',
+	'pid', 'cpu', 'time', 'cgroup') by attaching a
+	'BPF_PROG_TYPE_TRACEPOINT' program to the tracepoint's shared
+	'trace_event_call->prog_array', which filters the tracepoint before
+	'perf_tp_event()' runs across concurrent perf_event listeners on that
+	tracepoint.  A tracepoint filter is only treated as a BPF filter when
+	it uses one of these terms that is not a field of the tracepoint (a
+	filter only using 'cpu' remains an ftrace filter on the generic 'cpu'
+	field).  Filters mixing such BPF terms with tracepoint fields of the
+	same name (e.g. 'pid' on sched:sched_wakeup) are rejected; use separate
+	--filter options instead.
 
 	The sample data field can be specified in lower case letter.  Multiple
 	filters can be separated with comma.  For example,
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index f36c9b746c84..7be14596982c 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -589,7 +589,6 @@ struct evsel *evsel__clone(struct evsel *orig)
 			goto out_err;
 	}
 	evsel->cgrp = cgroup__get(orig->cgrp);
-#ifdef HAVE_LIBTRACEEVENT
 	if (orig->tp_sys) {
 		evsel->tp_sys = strdup(orig->tp_sys);
 		if (evsel->tp_sys == NULL)
@@ -600,6 +599,7 @@ struct evsel *evsel__clone(struct evsel *orig)
 		if (evsel->tp_name == NULL)
 			goto out_err;
 	}
+#ifdef HAVE_LIBTRACEEVENT
 	evsel->tp_format = orig->tp_format;
 #endif
 	evsel->handler = orig->handler;
@@ -670,7 +670,6 @@ struct evsel *evsel__newtp_idx(const char *sys, const char *name, int idx, bool
 	if (asprintf(&evsel->name, "%s:%s", sys, name) < 0)
 		goto out_free;
 
-#ifdef HAVE_LIBTRACEEVENT
 	evsel->tp_sys = strdup(sys);
 	if (!evsel->tp_sys)
 		goto out_free;
@@ -678,7 +677,6 @@ struct evsel *evsel__newtp_idx(const char *sys, const char *name, int idx, bool
 	evsel->tp_name = strdup(name);
 	if (!evsel->tp_name)
 		goto out_free;
-#endif
 
 	event_attr_init(&attr);
 
@@ -696,10 +694,8 @@ struct evsel *evsel__newtp_idx(const char *sys, const char *name, int idx, bool
 
 out_free:
 	zfree(&evsel->name);
-#ifdef HAVE_LIBTRACEEVENT
 	zfree(&evsel->tp_sys);
 	zfree(&evsel->tp_name);
-#endif
 	free(evsel);
 out_err:
 	return ERR_PTR(err);
@@ -2146,10 +2142,8 @@ static void evsel__exit(struct evsel *evsel)
 	perf_evsel__exit(&evsel->core);
 	zfree(&evsel->group_name);
 	zfree(&evsel->name);
-#ifdef HAVE_LIBTRACEEVENT
 	zfree(&evsel->tp_sys);
 	zfree(&evsel->tp_name);
-#endif
 	zfree(&evsel->filter);
 	zfree(&evsel->group_pmu_name);
 	zfree(&evsel->unit);
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index 53f3641b66e1..87b9373e7a51 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -64,9 +64,9 @@ struct evsel {
 		char			*name;
 		char			*group_name;
 		const char		*group_pmu_name;
-#ifdef HAVE_LIBTRACEEVENT
 		char			*tp_sys;
 		char			*tp_name;
+#ifdef HAVE_LIBTRACEEVENT
 		struct tep_event	*tp_format;
 #endif
 		char			*filter;
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index ba3e5015058c..5b284feccb08 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -4,7 +4,9 @@
 #include <linux/err.h>
 #include <linux/list_sort.h>
 #include <linux/zalloc.h>
+#include <ctype.h>
 #include <dirent.h>
+#include <string.h>
 #include <sys/ioctl.h>
 #include <sys/param.h>
 #include "cpumap.h"
@@ -2624,10 +2626,131 @@ foreach_evsel_in_last_glob(struct evlist *evlist,
 	return 0;
 }
 
-/* Will a tracepoint filter work for str or should a BPF filter be used? */
-static bool is_possible_tp_filter(const char *str)
+static bool is_filter_word_char(char c)
 {
-	return strstr(str, "uid") == NULL;
+	return isalnum((unsigned char)c) || c == '_';
+}
+
+/*
+ * Does str contain the identifier word, ignoring occurrences inside quoted
+ * string literals (e.g. prev_comm == "cpu"), cgroup path operands, and
+ * predicate argument lists?
+ */
+static bool has_filter_word(const char *str, const char *word)
+{
+	size_t len = strlen(word);
+	const char *p = str;
+
+	while (*p) {
+		const char *start, *q;
+		size_t tok_len;
+
+		if (*p == '"' || *p == '\'') {
+			char quote = *p++;
+
+			while (*p && *p != quote) {
+				if (*p == '\\' && p[1])
+					p++;
+				p++;
+			}
+			if (*p)
+				p++;
+			continue;
+		}
+		if (!is_filter_word_char(*p)) {
+			p++;
+			continue;
+		}
+		start = p;
+		while (is_filter_word_char(*p))
+			p++;
+		tok_len = (size_t)(p - start);
+		if (tok_len == len && !strncmp(start, word, len))
+			return true;
+
+		/* Skip unquoted cgroup path operands (e.g. cgroup == /test-pid). */
+		if (tok_len == 6 && !strncmp(start, "cgroup", 6)) {
+			q = p;
+			while (*q == ' ' || *q == '\t')
+				q++;
+			if (!strncmp(q, "==", 2) || !strncmp(q, "!=", 2)) {
+				q += 2;
+				while (*q == ' ' || *q == '\t')
+					q++;
+				if (*q && *q != '"' && *q != '\'') {
+					while (*q && !strchr(" \t\n,()!=>&|<", *q))
+						q++;
+					p = q;
+				}
+			}
+			continue;
+		}
+
+		/* Skip predicate argument lists (e.g. lock_held(pid)). */
+		q = p;
+		while (*q == ' ' || *q == '\t')
+			q++;
+		if (*q == '(') {
+			p = q + 1;
+			while (*p && *p != ')')
+				p++;
+			if (*p == ')')
+				p++;
+		}
+	}
+	return false;
+}
+
+static bool tp_evsel_has_field(struct evsel *evsel, const char *name)
+{
+#ifdef HAVE_LIBTRACEEVENT
+	if (evsel__field(evsel, name))
+		return true;
+#endif
+	if (evsel->tp_sys && evsel->tp_name)
+		return tp_pmu__has_field(evsel->tp_sys, evsel->tp_name, name);
+	return false;
+}
+
+/*
+ * Will a tracepoint filter work for str or should a BPF filter be used?
+ * Returns 1 for a tracepoint (ftrace) filter, 0 for a BPF filter, or a
+ * negative error when str mixes BPF-only terms with tracepoint fields that
+ * share a BPF term name (such as "pid" on sched:sched_wakeup), which a BPF
+ * filter would otherwise silently evaluate against the current task.
+ */
+static int is_possible_tp_filter(struct evsel *evsel, const char *str)
+{
+	/*
+	 * BPF terms evaluated by perf_tp_sample_filter. "cpu" is omitted as
+	 * ftrace provides a generic "cpu" field for all tracepoints (see
+	 * trace_define_generic_fields()).
+	 */
+	static const char *const bpf_tp_terms[] = {
+		"uid", "gid", "tid", "pid", "time", "cgroup",
+	};
+	const char *bpf_term = NULL, *tp_field = NULL;
+
+	for (size_t i = 0; i < ARRAY_SIZE(bpf_tp_terms); i++) {
+		if (!has_filter_word(str, bpf_tp_terms[i]))
+			continue;
+		if (tp_evsel_has_field(evsel, bpf_tp_terms[i]))
+			tp_field = bpf_tp_terms[i];
+		else if (!bpf_term)
+			bpf_term = bpf_tp_terms[i];
+	}
+	if (!bpf_term)
+		return 1;
+	if (!tp_field && has_filter_word(str, "cpu") &&
+	    tp_evsel_has_field(evsel, "cpu"))
+		tp_field = "cpu";
+	if (tp_field) {
+		pr_err("Error: filter '%s' on %s mixes BPF term '%s' with tracepoint field '%s'.\n"
+		       "Hint: use separate --filter options for tracepoint fields and BPF terms.\n",
+		       str, evsel__name(evsel), bpf_term, tp_field);
+		return -EINVAL;
+	}
+	return 0;
 }
 
 static int set_filter(struct evsel *evsel, const void *arg)
@@ -2635,6 +2758,7 @@ static int set_filter(struct evsel *evsel, const void *arg)
 	const char *str = arg;
 	int nr_addr_filters = 0;
 	struct perf_pmu *pmu;
+	int tp_filter = 0;
 
 	if (evsel == NULL) {
 		fprintf(stderr,
@@ -2642,7 +2766,12 @@ static int set_filter(struct evsel *evsel, const void *arg)
 		return -1;
 	}
 
-	if (evsel->core.attr.type == PERF_TYPE_TRACEPOINT && is_possible_tp_filter(str)) {
+	if (evsel->core.attr.type == PERF_TYPE_TRACEPOINT) {
+		tp_filter = is_possible_tp_filter(evsel, str);
+		if (tp_filter < 0)
+			return -1;
+	}
+	if (tp_filter) {
 		if (evsel__append_tp_filter(evsel, str) < 0) {
 			fprintf(stderr,
 				"not enough memory to hold filter string\n");
@@ -2680,14 +2809,20 @@ int parse_filter(const struct option *opt, const char *str,
 
 int parse_uid_filter(struct evlist *evlist, uid_t uid)
 {
-	struct option opt = {
-		.value = &evlist,
-	};
+	struct evsel *evsel;
 	char buf[128];
-	int ret;
+	int ret = 0;
 
-	snprintf(buf, sizeof(buf), "uid == %d", uid);
-	ret = parse_filter(&opt, buf, /*unset=*/0);
+	if (!evlist || evlist__nr_entries(evlist) == 0) {
+		ret = -EINVAL;
+	} else {
+		snprintf(buf, sizeof(buf), "uid == %d", uid);
+		evlist__for_each_entry(evlist, evsel) {
+			ret = perf_bpf_filter__parse(&evsel->bpf_filters, buf);
+			if (ret)
+				break;
+		}
+	}
 	if (ret) {
 		if (use_browser >= 1) {
 			/*
diff --git a/tools/perf/util/tp_pmu.c b/tools/perf/util/tp_pmu.c
index 5ac732e06841..fb3ff9435fa0 100644
--- a/tools/perf/util/tp_pmu.c
+++ b/tools/perf/util/tp_pmu.c
@@ -6,6 +6,7 @@
 #include <api/io_dir.h>
 #include <linux/kernel.h>
 #include <errno.h>
+#include <stdlib.h>
 #include <string.h>
 
 int tp_pmu__id(const char *sys, const char *name)
@@ -26,6 +27,60 @@ int tp_pmu__id(const char *sys, const char *name)
 	return id;
 }
 
+/*
+ * Does the tracefs format file of tracepoint sys:name declare a field called
+ * field? Format lines are of the form "\tfield:<type> <name>[<len>];\t...".
+ * Works without libtraceevent.
+ */
+bool tp_pmu__has_field(const char *sys, const char *name, const char *field)
+{
+	char *tp_dir = get_events_file(sys);
+	char path[PATH_MAX];
+	char *format = NULL, *line, *saveptr = NULL;
+	size_t format_size, field_len = strlen(field);
+	bool found = false;
+
+	if (!tp_dir)
+		return false;
+
+	scnprintf(path, sizeof(path), "%s/%s/format", tp_dir, name);
+	put_events_file(tp_dir);
+	if (filename__read_str(path, &format, &format_size))
+		return false;
+
+	for (line = strtok_r(format, "\n", &saveptr); line && !found;
+	     line = strtok_r(NULL, "\n", &saveptr)) {
+		char *decl = strstr(line, "field:"), *end;
+
+		if (!decl)
+			continue;
+		decl += strlen("field:");
+		end = strchr(decl, ';');
+		if (!end)
+			continue;
+		/*
+		 * Drop a trailing array suffix, e.g. "char prev_comm[16]", but
+		 * not the "[]" in the type of "__data_loc char[] name".
+		 */
+		while (end > decl && end[-1] == ' ')
+			end--;
+		if (end > decl && end[-1] == ']') {
+			while (end > decl && *end != '[')
+				end--;
+		}
+		/* The field name is the last token of the declaration. */
+		while (end > decl && end[-1] == ' ')
+			end--;
+		if ((size_t)(end - decl) >= field_len &&
+		    !strncmp(end - field_len, field, field_len) &&
+		    (end - field_len == decl || *(end - field_len - 1) == ' ' ||
+		     *(end - field_len - 1) == '*'))
+			found = true;
+	}
+	free(format);
+	return found;
+}
+
 
 int tp_pmu__for_each_tp_event(const char *sys, void *state, tp_event_callback cb)
 {
diff --git a/tools/perf/util/tp_pmu.h b/tools/perf/util/tp_pmu.h
index 30456bd6943d..a60ec0e8a176 100644
--- a/tools/perf/util/tp_pmu.h
+++ b/tools/perf/util/tp_pmu.h
@@ -8,6 +8,7 @@ typedef int (*tp_sys_callback)(void *state, const char *sys_name);
 typedef int (*tp_event_callback)(void *state, const char *sys_name, const char *evt_name);
 
 int tp_pmu__id(const char *sys, const char *name);
+bool tp_pmu__has_field(const char *sys, const char *name, const char *field);
 int tp_pmu__for_each_tp_event(const char *sys, void *state, tp_event_callback cb);
 int tp_pmu__for_each_tp_sys(void *state, tp_sys_callback cb);
 
-- 
2.56.1.750.gf70dc682cf-goog

