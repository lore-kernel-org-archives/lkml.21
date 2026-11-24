Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559500;
	b=d4wvoDiMMJGqHXAH97XVHnDJCnUNZNGBePi6vDxdJ53UtTQg8MyJirCX/W6ED0GLySSN
	 +rMPOc4BpxY5yqKXTsQb5blpoR28zmcSFHmIYalITvzUO7Un6luQN6H2oCRyRoxHsIYHG
	 dF4Vqo9V+LgblKcKnFenlkTLG8UwK3qZAfJ5o7jQQfNGxB7HmAx+vLjprNBVjDkwMk8P2
	 GQTwH1W+NHreBwQWG2YNxIpnRcoAoluYu+uV+wAHH4ED60AwgHhYHG1A8QmE3Uy7ZX8uq
	 7RFb9I6QFIjErlQagu8zsMRr+n06DHSZ9VVvDi4p3NJmROk2zVXBu4pqx0dIPTsij5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RsmvyqoxjJQi3Q1huECeOWqRkhasm5OYuNo6XKF5asA=;
	b=PvROIcITJsfxqrqFsn9rvFNn+7yiRmV0DudFA6FYnigS2Ydhlv0NFQsH5X+H38BVgyT3
	 gI+Z2buKsIIiPP5vV4Mx/E4uG6AEp4W3XFJnr76sxFnDLX8q+mhqcljfIjtpUcCyrz+ZO
	 0Kkrjf8P+Ddr6t9BTJ6EFGeCUx2F9dKbrfpi5MPsGB8GLb6vaSC7Z59wIm3+0IMuVQjVC
	 NkoBg/GPKorKLv0yGOC562MrtcnHtC+jFczJeAS2/x2akeH6aOfCg0gXKWJhqRFiyXcql
	 2jl1J6L9zCnD2u7yMtLaqMjVqGNJ/feFRtboE1BF9Hn4LgAIdzFhM4FxSo4eojOBqwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RZT0ZDDf;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69755606A690
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69755606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RZT0ZDDf
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6939778eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559499; x=1796164299; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsmvyqoxjJQi3Q1huECeOWqRkhasm5OYuNo6XKF5asA=;
        b=RZT0ZDDf+dIRaQ3TsIc9Z3ZsTq44ztTg6HVfwKI8Hn5rRmhbtD2fWxsp/Ue2kVVejb
         Gkuog8ZNMeMcIf3e81I/9n6/vK1ddO+PBkmq3xcltmjS9mLA1t0mtqHIBKnbYf0Ajuyl
         H70ppfRCi2xWqJ3W0UNur8PKQ8rtcrXTE/bYwp/an/KXs29TIfitbZzt3MK1U91Rp7K7
         zxC5mw86njmWpl5OlmPfolIVQDvRcSIOk9VHUn6Dij0HCBPHyCfrk4AIbzKTFTLnhTPj
         btYv8aFXilZnIkgm8GqBm7MLBi8Ngc2j3q+3u4tGkp1x1A7oBrXlzFw5fZ5z7yQu8x4+
         JF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559499; x=1796164299;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsmvyqoxjJQi3Q1huECeOWqRkhasm5OYuNo6XKF5asA=;
        b=hzBq1IOG4xQOBNb0G6KURhD4LVnYhHUYtztOV2Q1bCsJfLaSHnfTH02RswoKmVwFKG
         /xWeDL8DD6Op1RMJjmMcZjf0P1YCjndI9Sz/g3R6niTBHQemdGuzRtM/325op1QicYi6
         07rYZFplLK+Ar390r3wV5zPz1mWfccOrjLFNfhZWrdtzVXqDHQs70hRA2B+IaGcQfbhz
         /lCiMhKbVvOItloYVh8712mifX0zneuwtx0i1GasQhtt7I3IAwx+N7ochso5NUQhvtso
         dKbDRuikmC7CDVnglOG/s97Ep9pCcYPCvfa3mK0SIUM9XNc4S58Bxob3f7jwAaWB1kCC
         0nLg==
X-Forwarded-Encrypted: i=1; AL+hErENl8EU7ZPYpkzgH7MYGzaku4NhWSvHdV2+tjGNwY/tChJC/CVqLpQzSm3WNRjOmZ+LUlX8Xaqie7NKaWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yq5KNtpPq3BZRoxzOJVZ7MEF+o0SKOv5UlAITqWbJltxiNHw4
	l4OeSlVl2tPhBW15defRRF+98aWW4vmDOo+h7khFO4pyjm9QlFCwaVy7RDBthMUUzUbAaa1pptK
	5FdA585me1A==
X-Received: from dlea6-n2.prod.google.com ([2002:a05:701b:4206:20b0:15f:5ef4:b896])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:45a7:b0:1b5:4eec:14e5
 with SMTP id a92af1059eb24-1b55687f18fmr22474342c88.6.1795559497649; Tue, 24
 Nov 2026 14:31:37 -0800 (PST)
Date: Tue, 24 Nov 2026 14:31:09 -0800
In-Reply-To: <20261124223109.820609-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124223109.820609-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124223109.820609-13-irogers@google.com>
Subject: [PATCH v10 12/12] perf test symbols: Add session allocation wrapper
 and lock contention tests
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add test_session_alloc_shrink() to tools/perf/tests/symbols.c verifying:
- machine__session() and dso__session() back-pointer resolution.
- perf_session__malloc(), zalloc(), calloc(), realloc(), and strdup()
  allocation wrappers and perf_session__shrink() eviction.
- Multithreaded contention between dso__find_binary_type()
  (dso__data_open_lock -> dso__lock(dso)) and perf_session__shrink() under
  dso__lock(dso), plus perf_session__e_machine() shard iteration.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/symbols.c | 162 +++++++++++++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/tools/perf/tests/symbols.c b/tools/perf/tests/symbols.c
index 66756d988a5d..48d89cea88bf 100644
--- a/tools/perf/tests/symbols.c
+++ b/tools/perf/tests/symbols.c
@@ -8,6 +8,8 @@
 #include <errno.h>
 #include <inttypes.h>
 #include <limits.h>
+#include <pthread.h>
+#include <stdatomic.h>
 #include <stdbool.h>
 #include <stddef.h>
 #include <stdio.h>
@@ -19,6 +21,7 @@
 #include "dso.h"
 #include "env.h"
 #include "machine.h"
+#include "session.h"
 #include "srcline.h"
 #include "thread.h"
 #include "symbol.h"
@@ -320,6 +323,161 @@ static int test_dsos_shrink(void)
 	return ret;
 }
 
+struct shrink_lock_race_args {
+	struct dso *dso;
+	atomic_bool stop;
+};
+
+static void *shrink_lock_race_worker(void *arg)
+{
+	struct shrink_lock_race_args *args = arg;
+
+	while (!atomic_load_explicit(&args->stop, memory_order_relaxed))
+		dso__find_binary_type(args->dso);
+
+	return NULL;
+}
+
+static int test_session_alloc_shrink(void)
+{
+	struct perf_session *session = zalloc(sizeof(*session));
+	struct dso *dso;
+	struct thread *th;
+	pid_t pid = getpid();
+	char *p1 = NULL, *p2 = NULL, *p3 = NULL, *s = NULL, *tmp;
+	int ret = TEST_FAIL;
+
+	if (!session)
+		return TEST_FAIL;
+
+	perf_env__init(&session->header.env);
+	if (machines__init(&session->machines, session))
+		goto out;
+	session->machines.host.env = &session->header.env;
+	if (machine__session(&session->machines.host) != session) {
+		pr_debug("machine__session did not return owning session!\n");
+		goto out;
+	}
+
+	dso = machine__findnew_dso(&session->machines.host, "/tmp/perf_test_session_dso");
+	if (!dso)
+		goto out;
+	if (dso__session(dso) != session) {
+		pr_debug("dso__session did not return owning session!\n");
+		dso__put(dso);
+		goto out;
+	}
+	dso__put(dso);
+
+	p1 = perf_session__malloc(session, 64);
+	p2 = perf_session__zalloc(session, 64);
+	p3 = perf_session__calloc(session, 4, 16);
+	s = perf_session__strdup(session, "perf_session_alloc_test");
+	if (!p1 || !p2 || !p3 || !s || strcmp(s, "perf_session_alloc_test") != 0) {
+		pr_debug("perf_session allocation wrappers failed!\n");
+		goto out;
+	}
+
+	tmp = perf_session__realloc(session, p1, 128);
+	if (!tmp) {
+		pr_debug("perf_session__realloc failed!\n");
+		goto out;
+	}
+	p1 = tmp;
+
+	if (perf_session__shrink(session) == 0) {
+		pr_debug("perf_session__shrink failed to evict unreferenced DSO!\n");
+		goto out;
+	}
+	down_read(&session->machines.host.dsos.lock);
+	if (session->machines.host.dsos.cnt != 0) {
+		up_read(&session->machines.host.dsos.lock);
+		pr_debug("perf_session__shrink failed to evict unreferenced DSO!\n");
+		goto out;
+	}
+	up_read(&session->machines.host.dsos.lock);
+
+	/*
+	 * Regression test for AB-BA lock inversion between dso__lock(dso_A)
+	 * (held by dso__load() when calling perf_session__shrink() to evict
+	 * unreferenced dso_B) and dso__data_open_lock (acquired before
+	 * dso__lock(dso_A) by dso__find_binary_type()).
+	 */
+	dso = machine__findnew_dso(&session->machines.host, "/tmp/perf_test_contended_dso");
+	if (!dso)
+		goto out;
+	{
+		bool was_singlethreaded = perf_singlethreaded;
+		struct shrink_lock_race_args race_args = {
+			.dso = dso,
+			.stop = false,
+		};
+		pthread_t worker;
+
+		perf_set_multithreaded();
+		if (pthread_create(&worker, NULL, shrink_lock_race_worker, &race_args) != 0) {
+			if (was_singlethreaded)
+				perf_set_singlethreaded();
+			dso__put(dso);
+			goto out;
+		}
+		for (int i = 0; i < 200; i++) {
+			struct dso *evict = machine__findnew_dso(&session->machines.host,
+								 "/tmp/perf_test_evict_dso");
+
+			dso__put(evict);
+			mutex_lock(dso__lock(dso));
+			RC_CHK_ACCESS(dso)->bintype_searched = 0;
+			perf_session__shrink(session);
+			mutex_unlock(dso__lock(dso));
+		}
+		atomic_store_explicit(&race_args.stop, true, memory_order_relaxed);
+		pthread_join(worker, NULL);
+		if (was_singlethreaded)
+			perf_set_singlethreaded();
+	}
+	dso__put(dso);
+	perf_session__shrink(session);
+
+	/*
+	 * Verify perf_session__e_machine() -> threads__for_each_thread() does
+	 * not self-deadlock on table->lock when a non-leader thread looks up or
+	 * creates its leader thread in the same shard.
+	 */
+	{
+		bool was_singlethreaded = perf_singlethreaded;
+		uint16_t e_machine;
+
+		perf_set_multithreaded();
+		th = machine__findnew_thread(&session->machines.host, pid,
+					     pid + THREADS__TABLE_SIZE);
+		if (!th) {
+			if (was_singlethreaded)
+				perf_set_singlethreaded();
+			goto out;
+		}
+		thread__put(th);
+		e_machine = perf_session__e_machine(session, NULL);
+		if (was_singlethreaded)
+			perf_set_singlethreaded();
+		if (e_machine == EM_NONE) {
+			pr_debug("perf_session__e_machine failed!\n");
+			goto out;
+		}
+	}
+
+	ret = TEST_OK;
+out:
+	free(p1);
+	free(p2);
+	free(p3);
+	free(s);
+	machines__exit(&session->machines);
+	perf_env__exit(&session->header.env);
+	free(session);
+	return ret;
+}
+
 struct shrink_reload_find_args {
 	struct symbol *kept;
 	u64 first_start;
@@ -822,6 +980,10 @@ static int test__symbols(struct test_suite *test __maybe_unused, int subtest __m
 	if (ret != TEST_OK)
 		return ret;
 
+	ret = test_session_alloc_shrink();
+	if (ret != TEST_OK)
+		return ret;
+
 	ret = init_test_info(&ti);
 	if (ret != TEST_OK)
 		return ret;
-- 
2.56.1.831.g720f3f5937-goog

