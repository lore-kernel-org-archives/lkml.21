Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567898;
	b=fiwCfwiea5aUbrAIGi4EwqgNODEYn8nl2sQ7+j80dBQgVDDLSKsCj2VfGpkSRPJ81mPx
	 bn78OFInbn7nu3hyEbLxw2NwCuxxkRl0teAUvVB2bgSjrD833sIx7GK9mCxRSQALYukBi
	 O+tdsaiujwr7z0f+s7IIHuK2Db9lLSdH2dgB6IZvfP6oKgVpGQ1mayU0fzqRqNs5+ADi+
	 4EdrAV8LouTcn/mixPaqHkyrAmJJLHgkOgc9WCjxbNwwfLkIh0iBk0nf698g1E8P4Yh2u
	 oQ5TJhWoYB0uYmeONQvIJu+YrDOwQDrBmq+zNJ/X08nE+LzJhOn6KBijCLdF+tDLikA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hxdvay7U0/BBeZfYl/Gpe4NfIxkEt+dQD8AyywWI8jk=;
	b=Eh3geB8CsuJ2UfYud+ayeiX3c3nwN68OokStNVif9WoMH3FqVK79U5wL0cVy8VXsH568
	 2tyU5IMyh+XA6oRxw7Dkmtko9dtinIY2Yzh5IdOx9VFBPV27LwUrjddovpAiuq5thVo4B
	 X3KjmmIA8wg5DY/1Ayrmw1XdSa7h29cu9a1a5xZqtxP/nE5Xv/deH9keAOHS32h3wh7Bt
	 Y/rfVMRf/07KcHm6rehh9V8fXBkBCl2O2XJ1DY2vNGsGWl3W9iTVj/a0XuKBcNzUtR4NW
	 KGNlgLLoCepvPIUH2DkZSpjClcJI9bstUO8L/83ef17WRCM4WJzYNU8IiNHjAvi1pjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nADbDIYA;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028F6606A6AA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 028F6606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nADbDIYA
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso8844850eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567897; x=1796172697; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxdvay7U0/BBeZfYl/Gpe4NfIxkEt+dQD8AyywWI8jk=;
        b=nADbDIYApLD3nFr+tiy67fOqxsGbBgsz1VwKTgR6NVC06Al7KSWlNVBQNwE07/HC5W
         42e6JzVGKOuBz8h9fo6RO3dP3spzLZWqjwM2aeIizD7w+Quf32gQMvL8H9yTmJm8mUQb
         kL6CIccM6AvXNTAH8jRjhjZfxCeuxZ/lNSc91o6g1NEtFZNsTxnfOsRycfujmbd/oKzv
         UYGvyUAdu4KhSTRfkbBjVSQp9k8NQaLeIKkDZKz8MO3daLJGCSkzrgrYuudqJAbsfhBK
         qImQ9TQAbM4FLHxAlHnHuFO+rK0oSri/O6NPHXMKPx4vau3A1PV99Jv9XD4sx3kzcRXf
         jI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567897; x=1796172697;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxdvay7U0/BBeZfYl/Gpe4NfIxkEt+dQD8AyywWI8jk=;
        b=xYpoTIln1/4ptqhpP1ZH2Isiodm7U8WVWadgbPrDVpyIfXaT2yfZud8jdu6ku/pRK2
         y3FZWKY/Syhpcfib4arZqUYLge92NKV4m8zQQvW4h2hk62cYhMghWeaPV4aehvGWo6Fa
         6e6QqFSPN/wBIWERYSf3Yd3o75ORCCPqGYPQJ4GXUdRL7gwLHuoOwKpnU9JPkVZ+auOu
         q6SRnKWi29JOhtp06M6utmcX/BbwuJs0qkhi2HIQki4OYrPEeQCVMsVfzYLKzFa6xHSC
         ceX8NSXfURDjZb7B+Gwks+xhzdj9otX8JwIY+PKz6TomCVHTg3qDA6I1PMvKiSSQloNF
         dM5w==
X-Forwarded-Encrypted: i=1; AL+hErF1CgcvF5la93YXccSb3+/ji/hCA9FdWwmDVYZJK77N0V5RGe1gkMIZ3L1+MxMl83sqsSasjPznEjU77FM=@vger.kernel.org
X-Gm-Message-State: APuU4Z85ubJFt69PAV/siAyMIWPsyK2xRIY0idtjVonaLJJrDbGEmsXT
	WX802XdOQ1iKNPov7CJcDL8gNIBQSOEYe/j4J+U+w1NzKdqdYEqs6earybxPSa3lTqq4/i5AsIZ
	+vcdJGQns5Q==
X-Received: from dycph1.prod.google.com ([2002:a05:7300:dd41:b0:36a:ead:4dcc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e60c:b0:386:636f:c25e
 with SMTP id 5a478bee46e88-386636fc6f9mr19390158eec.12.1795567896675; Tue, 24
 Nov 2026 16:51:36 -0800 (PST)
Date: Tue, 24 Nov 2026 16:50:57 -0800
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
Message-ID: <20261125005108.1020003-9-irogers@google.com>
Subject: [PATCH v4 08/19] perf session: Avoid double byte-swapping re-parsed
 deferred samples
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

When perf_session__deliver_event() processes a cross-endian sample,
__evsel__parse_sample() is invoked with needs_swap=true and byte-swaps
payload regions such as PERF_SAMPLE_RAW, PERF_SAMPLE_BRANCH_STACK, and
PERF_SAMPLE_AUX in-place in the event buffer.

If the sample has a deferred callchain and merge_deferred_callchains is
enabled, machines__deliver_event() copies that already-parsed event into
de->event. Later, evlist__deliver_deferred_callchain() (potentially on
multiple iterations before finding a matching tid) and
session__flush_deferred_samples() re-parse de->event via
evlist__parse_sample(), which runs __evsel__parse_sample() again with
evsel->needs_swap still true, double-swapping in-place fields. Meanwhile,
pyrf_event__copy() re-parses copied events with needs_swap=false, which
misses PERF_SAMPLE_TID, PERF_SAMPLE_CPU, and PERF_SAMPLE_RAW's size word
because they were only unswapped into local variables.

Finish unswapping PERF_SAMPLE_TID, PERF_SAMPLE_CPU, and PERF_SAMPLE_RAW's
size prefix in-place during the initial cross-endian parse so the entire
sample buffer is in host layout afterwards, filter deferred samples by
stored tid before re-parsing, and re-parse de->event via
evlist__parse_sample_unswapped().

Fixes: 9b4525fd089d ("perf tools: Merge deferred user callchains")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evlist.c  | 38 +++++++++++++++++++++++++++++---------
 tools/perf/util/evlist.h  |  2 ++
 tools/perf/util/evsel.c   | 10 +++++++++-
 tools/perf/util/session.c | 14 +++++++-------
 4 files changed, 47 insertions(+), 17 deletions(-)

diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
index c2402e4791b6..ec665828d4e3 100644
--- a/tools/perf/util/evlist.c
+++ b/tools/perf/util/evlist.c
@@ -1935,17 +1935,12 @@ void evlist__cancel_workload(struct evlist *evlist)
 	}
 }
 
-int evlist__parse_sample(struct evlist *evlist, union perf_event *event, struct perf_sample *sample)
+static int __evlist__parse_sample(struct evlist *evlist, struct evsel *evsel,
+				  union perf_event *event,
+				  struct perf_sample *sample, bool needs_swap)
 {
-	struct evsel *evsel = evlist__event2evsel(evlist, event);
-	int ret;
+	int ret = __evsel__parse_sample(evsel, event, sample, needs_swap);
 
-	if (!evsel) {
-		/* Ensure the sample is okay for perf_sample__exit. */
-		perf_sample__init(sample, /*all=*/false);
-		return -EFAULT;
-	}
-	ret = evsel__parse_sample(evsel, event, sample);
 	if (ret)
 		return ret;
 	if (perf_guest && sample->id) {
@@ -1959,6 +1954,31 @@ int evlist__parse_sample(struct evlist *evlist, union perf_event *event, struct
 	return 0;
 }
 
+int evlist__parse_sample(struct evlist *evlist, union perf_event *event, struct perf_sample *sample)
+{
+	struct evsel *evsel = evlist__event2evsel(evlist, event);
+
+	if (!evsel) {
+		/* Ensure the sample is okay for perf_sample__exit. */
+		perf_sample__init(sample, /*all=*/false);
+		return -EFAULT;
+	}
+	return __evlist__parse_sample(evlist, evsel, event, sample, evsel->needs_swap);
+}
+
+int evlist__parse_sample_unswapped(struct evlist *evlist, union perf_event *event,
+				   struct perf_sample *sample)
+{
+	struct evsel *evsel = evlist__event2evsel(evlist, event);
+
+	if (!evsel) {
+		/* Ensure the sample is okay for perf_sample__exit. */
+		perf_sample__init(sample, /*all=*/false);
+		return -EFAULT;
+	}
+	return __evlist__parse_sample(evlist, evsel, event, sample, /*needs_swap=*/false);
+}
+
 int evlist__parse_sample_timestamp(struct evlist *evlist, union perf_event *event, u64 *timestamp)
 {
 	struct evsel *evsel = evlist__event2evsel(evlist, event);
diff --git a/tools/perf/util/evlist.h b/tools/perf/util/evlist.h
index 0f380421e03d..e42d590d4732 100644
--- a/tools/perf/util/evlist.h
+++ b/tools/perf/util/evlist.h
@@ -450,6 +450,8 @@ bool evlist__sample_id_all(struct evlist *evlist);
 u16 evlist__id_hdr_size(struct evlist *evlist);
 
 int evlist__parse_sample(struct evlist *evlist, union perf_event *event, struct perf_sample *sample);
+int evlist__parse_sample_unswapped(struct evlist *evlist, union perf_event *event,
+				   struct perf_sample *sample);
 int evlist__parse_sample_timestamp(struct evlist *evlist, union perf_event *event, u64 *timestamp);
 
 bool evlist__valid_sample_type(struct evlist *evlist);
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 737a8680aaae..322582bb4f40 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -3520,6 +3520,7 @@ int __evsel__parse_sample(struct evsel *evsel, union perf_event *event,
 			u.val64 = bswap_64(u.val64);
 			u.val32[0] = bswap_32(u.val32[0]);
 			u.val32[1] = bswap_32(u.val32[1]);
+			*(__u64 *)array = u.val64;
 		}
 
 		data->pid = u.val32[0];
@@ -3554,6 +3555,8 @@ int __evsel__parse_sample(struct evsel *evsel, union perf_event *event,
 			/* undo swap of u64, then swap on individual u32s */
 			u.val64 = bswap_64(u.val64);
 			u.val32[0] = bswap_32(u.val32[0]);
+			u.val32[1] = bswap_32(u.val32[1]);
+			*(__u64 *)array = u.val64;
 		}
 
 		data->cpu = u.val32[0];
@@ -3665,7 +3668,12 @@ int __evsel__parse_sample(struct evsel *evsel, union perf_event *event,
 			/* mem_bswap_64() accesses complete 64-bit words. */
 			sz = roundup((u64)data->raw_size, sizeof(u64));
 			OVERFLOW_CHECK(raw, sz, max_size);
-			mem_bswap_64((void *)raw, data->raw_size);
+			if (data->raw_size) {
+				mem_bswap_64((void *)raw, data->raw_size);
+				*(u32 *)raw = data->raw_size;
+			} else {
+				*(__u64 *)raw = u.val64;
+			}
 		}
 		data->raw_data = (void *)array;
 		array = (void *)array + data->raw_size;
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 4e11eabbbe6f..07e1befb5feb 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -1933,6 +1933,7 @@ struct deferred_event {
 	struct list_head list;
 	union perf_event *event;
 	u64 file_offset;
+	u32 tid;
 };
 
 /*
@@ -1964,8 +1965,11 @@ static int evlist__deliver_deferred_callchain(struct evlist *evlist,
 		struct perf_sample orig_sample;
 		struct evsel *new_evsel;
 
+		if (sample->tid != de->tid)
+			continue;
+
 		perf_sample__init(&orig_sample, /*all=*/false);
-		ret = evlist__parse_sample(evlist, de->event, &orig_sample);
+		ret = evlist__parse_sample_unswapped(evlist, de->event, &orig_sample);
 		if (ret < 0) {
 			pr_err("failed to parse original sample\n");
 			perf_sample__exit(&orig_sample);
@@ -1973,11 +1977,6 @@ static int evlist__deliver_deferred_callchain(struct evlist *evlist,
 		}
 		orig_sample.file_offset = de->file_offset;
 
-		if (sample->tid != orig_sample.tid) {
-			perf_sample__exit(&orig_sample);
-			continue;
-		}
-
 		if (event->callchain_deferred.cookie == orig_sample.deferred_cookie)
 			sample__merge_deferred_callchain(&orig_sample, sample);
 		else
@@ -2027,7 +2026,7 @@ static int session__flush_deferred_samples(struct perf_session *session,
 		}
 
 		perf_sample__init(&sample, /*all=*/false);
-		ret = evlist__parse_sample(evlist, de->event, &sample);
+		ret = evlist__parse_sample_unswapped(evlist, de->event, &sample);
 		if (ret < 0) {
 			pr_err("failed to parse original sample\n");
 			perf_sample__exit(&sample);
@@ -2120,6 +2119,7 @@ static int machines__deliver_event(struct machines *machines,
 			}
 			memcpy(de->event, event, sz);
 			de->file_offset = sample->file_offset;
+			de->tid = sample->tid;
 			list_add_tail(&de->list, evlist__deferred_samples(evlist));
 			return 0;
 		}
-- 
2.56.1.831.g720f3f5937-goog

